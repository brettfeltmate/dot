#!/usr/bin/env python3
"""
OpenCode Overlay Kitten with Session Management

Creates a persistent OpenCode overlay window with session resumption.
- If overlay exists and focused: Close it and store session ID
- If overlay exists but not focused: Focus it
- If no overlay exists: Create new one with stored session ID
"""

import os
import tempfile
import re


def main(args):
    pass


def get_session_file():
    """Get the path to the session ID storage file."""
    return os.path.join(tempfile.gettempdir(), 'kitty_opencode_session.txt')


def store_session_id(session_id):
    """Store the OpenCode session ID for later resumption."""
    try:
        with open(get_session_file(), 'w') as f:
            f.write(session_id)
    except Exception:
        pass  # Fail silently if we can't store session


def get_stored_session_id():
    """Retrieve the stored OpenCode session ID."""
    try:
        session_file = get_session_file()
        if os.path.exists(session_file):
            with open(session_file, 'r') as f:
                session_id = f.read().strip()
                if session_id:
                    return session_id
    except Exception:
        pass  # Fail silently if we can't read session
    return None


def extract_session_id_from_window(window):
    """Extract session ID from OpenCode window processes."""
    try:
        if hasattr(window, 'child') and window.child:
            # Check foreground processes for TUI with session ID
            if hasattr(window.child, 'foreground_processes'):
                for proc in window.child.foreground_processes:
                    if hasattr(proc, 'cmdline') and proc.cmdline:
                        for arg in proc.cmdline:
                            if isinstance(arg, str) and arg.startswith('ses_'):
                                return arg
                            # Also check for tui- session IDs in binary names
                            if 'tui-' in arg:
                                match = re.search(r'tui-([a-zA-Z0-9]+)', arg)
                                if match:
                                    return f"ses_{match.group(1)}"
    except Exception:
        pass
    return None


from kittens.tui.handler import result_handler


@result_handler(no_ui=True)
def handle_result(args, result, target_window_id, boss):
    """
    Handle the kitten execution with true toggle functionality:
    - If OpenCode overlay exists AND is focused: Close it
    - If OpenCode overlay exists but NOT focused: Focus it
    - If no OpenCode overlay exists: Create new one
    """
    # Get the current window to determine working directory and focus
    current_window = boss.window_id_map.get(target_window_id)
    if not current_window:
        return

    # Look for existing OpenCode overlay window with multiple detection methods
    opencode_window = None

    # Method 1: Check by exact title match
    for tab in boss.all_tabs:
        for window in tab.windows:
            if window.title == 'OpenCode Overlay':
                opencode_window = window
                break
        if opencode_window:
            break

    # Method 2: Check by title containing "OpenCode"
    if not opencode_window:
        for tab in boss.all_tabs:
            for window in tab.windows:
                if window.title and 'OpenCode' in window.title:
                    opencode_window = window
                    break
            if opencode_window:
                break

    # Method 3: Check by command line (primary cmdline)
    if not opencode_window:
        for tab in boss.all_tabs:
            for window in tab.windows:
                try:
                    if (
                        hasattr(window, 'child')
                        and window.child
                        and hasattr(window.child, 'cmdline')
                        and window.child.cmdline
                        and len(window.child.cmdline) > 0
                        and 'opencode' in window.child.cmdline[0]
                    ):
                        opencode_window = window
                        break
                except (AttributeError, IndexError, TypeError):
                    continue
            if opencode_window:
                break

    # Method 4: Check by foreground processes
    if not opencode_window:
        for tab in boss.all_tabs:
            for window in tab.windows:
                try:
                    if (
                        hasattr(window, 'child')
                        and window.child
                        and hasattr(window.child, 'foreground_cmdline')
                        and window.child.foreground_cmdline
                        and len(window.child.foreground_cmdline) > 0
                        and 'opencode' in window.child.foreground_cmdline[0]
                    ):
                        opencode_window = window
                        break
                except (AttributeError, IndexError, TypeError):
                    continue
            if opencode_window:
                break

    if opencode_window:
        # Check if the OpenCode overlay is currently focused
        active_window = boss.active_window
        is_focused = active_window and active_window.id == opencode_window.id

        if is_focused:
            # OpenCode overlay is focused, close it (toggle off)
            # First, extract and store the session ID for later resumption
            session_id = extract_session_id_from_window(opencode_window)
            if session_id:
                store_session_id(session_id)
            
            # Close the overlay window
            boss.call_remote_control(
                current_window,
                ('close-window', '--match', f'id:{opencode_window.id}'),
            )
        else:
            # OpenCode overlay exists but not focused, focus on it
            boss.set_active_window(opencode_window)
            # Make sure the tab containing the overlay is active
            for tab in boss.all_tabs:
                if opencode_window in tab.windows:
                    boss.set_active_tab(tab)
                    tab.set_active_window(opencode_window)
                    break
    else:
        # No existing OpenCode overlay found, create a new one
        # Check if we have a stored session ID to resume
        stored_session_id = get_stored_session_id()
        
        if stored_session_id:
            # Resume existing session with stored session ID
            boss.call_remote_control(
                current_window,
                (
                    'launch',
                    '--type=overlay-main',
                    '--cwd=current',
                    '--title=OpenCode Overlay',
                    '--copy-env',
                    '--dont-take-focus',
                    '/opt/homebrew/bin/opencode', '--session', stored_session_id
                )
            )
        else:
            # Create new session (no stored session available)
            boss.call_remote_control(
                current_window,
                (
                    'launch',
                    '--type=overlay-main',
                    '--cwd=current',
                    '--title=OpenCode Overlay',
                    '--copy-env',
                    '--dont-take-focus',
                    '/opt/homebrew/bin/opencode'
                )
            )
