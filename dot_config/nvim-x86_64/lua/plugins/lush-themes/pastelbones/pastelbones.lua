--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

-- local lush = require('lush')
-- local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
-- local theme = lush(function(injected_functions)
--   local sym = injected_functions.sym
--   return {
-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
-- groups, mostly used for styling UI elements.
-- Comment them out and add your own properties to override the defaults.
-- An empty definition `{}` will clear all styling, leaving elements looking
-- like the 'Normal' group.
-- To be able to link to a group, it must already be defined, so you may have
-- to reorder items as you go.
--
-- See :h highlight-groups
--
-- ColorColumn    { }, -- Columns set with 'colorcolumn'
-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
-- Cursor         { }, -- Character under the cursor
-- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
-- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
-- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
-- Directory      { }, -- Directory names (and other special names in listings)
-- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
-- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
-- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
-- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
-- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
-- TermCursor     { }, -- Cursor in a focused terminal
-- TermCursorNC   { }, -- Cursor in an unfocused terminal
-- ErrorMsg       { }, -- Error messages on the command line
-- VertSplit      { }, -- Column separating vertically split windows
-- Folded         { }, -- Line used for closed folds
-- FoldColumn     { }, -- 'foldcolumn'
-- SignColumn     { }, -- Column where |signs| are displayed
-- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
-- Substitute     { }, -- |:substitute| replacement text highlighting
-- LineNr         { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
-- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
-- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
-- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
-- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
-- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
-- MsgArea        { }, -- Area for messages and cmdline
-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
-- MoreMsg        { }, -- |more-prompt|
-- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
-- Normal         { }, -- Normal text
-- NormalFloat    { }, -- Normal text in floating windows.
-- FloatBorder    { }, -- Border of floating windows.
-- FloatTitle     { }, -- Title of floating windows.
-- NormalNC       { }, -- normal text in non-current windows
-- Pmenu          { }, -- Popup menu: Normal item.
-- PmenuSel       { }, -- Popup menu: Selected item.
-- PmenuKind      { }, -- Popup menu: Normal item "kind"
-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
-- PmenuSbar      { }, -- Popup menu: Scrollbar.
-- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
-- Question       { }, -- |hit-enter| prompt and yes/no questions
-- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
-- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
-- StatusLine     { }, -- Status line of current window
-- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
-- TabLine        { }, -- Tab pages line, not active tab page label
-- TabLineFill    { }, -- Tab pages line, where there are no labels
-- TabLineSel     { }, -- Tab pages line, active tab page label
-- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
-- Visual         { }, -- Visual mode selection
-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
-- WarningMsg     { }, -- Warning messages
-- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
-- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
-- WildMenu       { }, -- Current match in 'wildmenu' completion
-- WinBar         { }, -- Window bar of current window
-- WinBarNC       { }, -- Window bar of not-current windows

-- Common vim syntax groups used for all kinds of code and markup.
-- Commented-out groups should chain up to their preferred (*) group
-- by default.
--
-- See :h group-name
--
-- Uncomment and edit if you want more specific syntax highlighting.

-- Comment        { }, -- Any comment

-- Constant       { }, -- (*) Any constant
-- String         { }, --   A string constant: "this is a string"
-- Character      { }, --   A character constant: 'c', '\n'
-- Number         { }, --   A number constant: 234, 0xff
-- Boolean        { }, --   A boolean constant: TRUE, false
-- Float          { }, --   A floating point constant: 2.3e10

-- Identifier     { }, -- (*) Any variable name
-- Function       { }, --   Function name (also: methods for classes)

-- Statement      { }, -- (*) Any statement
-- Conditional    { }, --   if, then, else, endif, switch, etc.
-- Repeat         { }, --   for, do, while, etc.
-- Label          { }, --   case, default, etc.
-- Operator       { }, --   "sizeof", "+", "*", etc.
-- Keyword        { }, --   any other keyword
-- Exception      { }, --   try, catch, throw

-- PreProc        { }, -- (*) Generic Preprocessor
-- Include        { }, --   Preprocessor #include
-- Define         { }, --   Preprocessor #define
-- Macro          { }, --   Same as Define
-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

-- Type           { }, -- (*) int, long, char, etc.
-- StorageClass   { }, --   static, register, volatile, etc.
-- Structure      { }, --   struct, union, enum, etc.
-- Typedef        { }, --   A typedef

-- Special        { }, -- (*) Any special symbol
-- SpecialChar    { }, --   Special character in a constant
-- Tag            { }, --   You can use CTRL-] on this
-- Delimiter      { }, --   Character that needs attention
-- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
-- Debug          { }, --   Debugging statements

-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
-- Error          { }, -- Any erroneous construct
-- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

-- These groups are for the native LSP client and diagnostic system. Some
-- other LSP clients may use these groups, or use their own. Consult your
-- LSP client's documentation.

-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
--
-- LspReferenceText            { } , -- Used for highlighting "text" references
-- LspReferenceRead            { } , -- Used for highlighting "read" references
-- LspReferenceWrite           { } , -- Used for highlighting "write" references
-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
--
-- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
-- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
-- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
-- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
-- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
-- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
-- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
-- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
-- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
-- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

-- Tree-Sitter syntax groups.
--
-- See :h treesitter-highlight-groups, some groups may not be listed,
-- submit a PR fix to lush-template!
--
-- Tree-Sitter groups are defined with an "@" symbol, which must be
-- specially handled to be valid lua code, we do this via the special
-- sym function. The following are all valid ways to call the sym function,
-- for more details see https://www.lua.org/pil/5.html
--
-- sym("@text.literal")
-- sym('@text.literal')
-- sym"@text.literal"
-- sym'@text.literal'
--
-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

-- sym"@text.literal"      { }, -- Comment
-- sym"@text.reference"    { }, -- Identifier
-- sym"@text.title"        { }, -- Title
-- sym"@text.uri"          { }, -- Underlined
-- sym"@text.underline"    { }, -- Underlined
-- sym"@text.todo"         { }, -- Todo
-- sym"@comment"           { }, -- Comment
-- sym"@punctuation"       { }, -- Delimiter
-- sym"@constant"          { }, -- Constant
-- sym"@constant.builtin"  { }, -- Special
-- sym"@constant.macro"    { }, -- Define
-- sym"@define"            { }, -- Define

-- sym"@string"            { }, -- String
-- sym"@string.escape"     { }, -- SpecialChar
-- sym"@string.special"    { }, -- SpecialChar
-- sym"@character"         { }, -- Character
-- sym"@character.special" { }, -- SpecialChar
-- sym"@number"            { }, -- Number
-- sym"@boolean"           { }, -- Boolean
-- sym"@float"             { }, -- Float
-- sym"@function"          { }, -- Function
-- sym"@function.builtin"  { }, -- Special
-- sym"@function.macro"    { }, -- Macro
-- sym"@parameter"         { }, -- Identifier
-- sym"@method"            { }, -- Function
-- sym"@field"             { }, -- Identifier
-- sym"@property"          { }, -- Identifier
-- sym"@constructor"       { }, -- Special
-- sym"@conditional"       { }, -- Conditional
-- sym"@repeat"            { }, -- Repeat
-- sym"@label"             { }, -- Label
-- sym"@operator"          { }, -- Operator
-- sym"@keyword"           { }, -- Keyword
-- sym"@exception"         { }, -- Exception
-- sym"@variable"          { }, -- Identifier
-- sym"@type"              { }, -- Type
-- sym"@type.definition"   { }, -- Typedef
-- sym"@storageclass"      { }, -- StorageClass
-- sym"@structure"         { }, -- Structure
-- sym"@namespace"         { }, -- Identifier
-- sym"@include"           { }, -- Include
-- sym"@preproc"           { }, -- PreProc
-- sym"@debug"             { }, -- Debug
-- sym"@tag"               { }, -- Tag
-- }
-- end)

-- Return our parsed theme for extension or use elsewhere.
-- return theme

-- vi:nowrap
-- autogenerated lush spec on Mon  8 Jul 17:30:30 2024
-- Run :Lushify
-- then /Normal to find the Normal group and edit your fg & bg colors
local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		SpecialKey({ fg = "#5d6d78", gui = "italic" }), -- SpecialKey     xxx cterm=italic gui=italic guifg=#5d6d78
		sym("@string.escape.markdown")({ SpecialKey }), -- @string.escape.markdown xxx links to SpecialKey
		NonText({ fg = "#5d6d78" }), -- NonText        xxx guifg=#5d6d78
		EndOfBuffer({ NonText }), -- EndOfBuffer    xxx links to NonText
		Whitespace({ NonText }), -- Whitespace     xxx links to NonText
		Directory({ gui = "bold" }), -- Directory      xxx cterm=bold gui=bold
		MiniFilesDirectory({ Directory }), -- MiniFilesDirectory xxx links to Directory
		MiniPickIconDirectory({ Directory }), -- MiniPickIconDirectory xxx links to Directory
		IncSearch({ bg = "#dfb2c7", fg = "#2c343a", gui = "bold" }), -- IncSearch      xxx cterm=bold gui=bold guifg=#2c343a guibg=#dfb2c7
		CurSearch({ IncSearch }), -- CurSearch      xxx links to IncSearch
		MiniOperatorsExchangeFrom({ IncSearch }), -- MiniOperatorsExchangeFrom xxx links to IncSearch
		MiniPickPreviewRegion({ IncSearch }), -- MiniPickPreviewRegion xxx links to IncSearch
		MiniStatuslineModeOther({ IncSearch }), -- MiniStatuslineModeOther xxx links to IncSearch
		LeapLabelSelected({ IncSearch }), -- LeapLabelSelected xxx links to IncSearch
		FlashCurrent({ IncSearch }), -- FlashCurrent   xxx links to IncSearch
		Search({ bg = "#9e5179", fg = "#e7dcc4" }), -- Search         xxx guifg=#e7dcc4 guibg=#9e5179
		QuickFixLine({ Search }), -- QuickFixLine   xxx links to Search
		Substitute({ Search }), -- Substitute     xxx links to Search
		MatchParen({ Search }), -- MatchParen     xxx links to Search
		RenameMatch({ Search }), -- RenameMatch    xxx links to Search
		SagaSearch({ Search }), -- SagaSearch     xxx links to Search
		CocSearch({ Search }), -- CocSearch      xxx links to Search
		Sneak({ Search }), -- Sneak          xxx links to Search
		FlashMatch({ Search }), -- FlashMatch     xxx links to Search
		MoreMsg({ fg = "#a9c181", gui = "bold" }), -- MoreMsg        xxx cterm=bold gui=bold guifg=#a9c181
		Question({ MoreMsg }), -- Question       xxx links to MoreMsg
		MiniStarterQuery({ MoreMsg }), -- MiniStarterQuery xxx links to MoreMsg
		LineNr({ fg = "#667783" }), -- LineNr         xxx guifg=#667783
		LineNrAbove({ LineNr }), -- LineNrAbove    xxx links to LineNr
		LineNrBelow({ LineNr }), -- LineNrBelow    xxx links to LineNr
		SignColumn({ LineNr }), -- SignColumn     xxx links to LineNr
		LspCodeLens({ LineNr }), -- LspCodeLens    xxx links to LineNr
		NeogitHunkHeader({ LineNr }), -- NeogitHunkHeader xxx links to LineNr
		CocCodeLens({ LineNr }), -- CocCodeLens    xxx links to LineNr
		CursorLineNr({ bg = "#313a41", fg = "#e7dcc4", gui = "bold" }), -- CursorLineNr   xxx cterm=bold gui=bold guifg=#e7dcc4 guibg=#313a41
		CursorLineSign({ bg = "#313a41" }), -- CursorLineSign xxx guibg=#313a41
		StatusLine({ bg = "#3e4850", fg = "#e7dcc4" }), -- StatusLine     xxx guifg=#e7dcc4 guibg=#3e4850
		TabLine({ StatusLine }), -- TabLine        xxx links to StatusLine
		MsgSeparator({ StatusLine }), -- MsgSeparator   xxx links to StatusLine
		WinBar({ StatusLine }), -- WinBar         xxx links to StatusLine
		MiniStatuslineDevinfo({ StatusLine }), -- MiniStatuslineDevinfo xxx links to StatusLine
		MiniStatuslineFileinfo({ StatusLine }), -- MiniStatuslineFileinfo xxx links to StatusLine
		StatusLineNC({ bg = "#353f46", fg = "#ede5d4" }), -- StatusLineNC   xxx guifg=#ede5d4 guibg=#353f46
		TabLineFill({ StatusLineNC }), -- TabLineFill    xxx links to StatusLineNC
		WinBarNC({ StatusLineNC }), -- WinBarNC       xxx links to StatusLineNC
		MiniStatuslineFilename({ StatusLineNC }), -- MiniStatuslineFilename xxx links to StatusLineNC
		MiniStatuslineInactive({ StatusLineNC }), -- MiniStatuslineInactive xxx links to StatusLineNC
		WinSeparator({ fg = "#667783" }), -- WinSeparator   xxx guifg=#667783
		VertSplit({ WinSeparator }), -- VertSplit      xxx links to WinSeparator
		Title({ fg = "#e7dcc4", gui = "bold" }), -- Title          xxx cterm=bold gui=bold guifg=#e7dcc4
		FloatTitle({ Title }), -- FloatTitle     xxx links to Title
		sym("@markup.heading")({ Title }), -- @markup.heading xxx links to Title
		LspInfoTitle({ Title }), -- LspInfoTitle   xxx links to Title
		SagaTitle({ Title }), -- SagaTitle      xxx links to Title
		SagaFolder({ Title }), -- SagaFolder     xxx links to Title
		ActionPreviewTitle({ Title }), -- ActionPreviewTitle xxx links to Title
		MiniMapSymbolLine({ Title }), -- MiniMapSymbolLine xxx links to Title
		MiniStarterFooter({ Title }), -- MiniStarterFooter xxx links to Title
		MiniStarterHeader({ Title }), -- MiniStarterHeader xxx links to Title
		tomlTable({ Title }), -- tomlTable      xxx links to Title
		tomlTableArray({ Title }), -- tomlTableArray xxx links to Title
		Visual({ bg = "#615b51" }), -- Visual         xxx guibg=#615b51
		VisualNOS({ Visual }), -- VisualNOS      xxx links to Visual
		LspSignatureActiveParameter({ Visual }), -- LspSignatureActiveParameter xxx links to Visual
		SnippetTabstop({ Visual }), -- SnippetTabstop xxx links to Visual
		MiniPickMatchMarked({ Visual }), -- MiniPickMatchMarked xxx links to Visual
		UfoPreviewCursorLine({ Visual }), -- UfoPreviewCursorLine xxx links to Visual
		WarningMsg({ fg = "#ddbd7f" }), -- WarningMsg     xxx guifg=#ddbd7f
		DiagnosticWarn({ WarningMsg }), -- DiagnosticWarn xxx links to WarningMsg
		sym("@comment.warning")({ WarningMsg }), -- @comment.warning xxx links to WarningMsg
		MiniStarterItemPrefix({ WarningMsg }), -- MiniStarterItemPrefix xxx links to WarningMsg
		NoiceCmdlineIconSearch({ WarningMsg }), -- NoiceCmdlineIconSearch xxx links to WarningMsg
		NoiceCmdlinePopupBorderSearch({ WarningMsg }), -- NoiceCmdlinePopupBorderSearch xxx links to WarningMsg
		gitcommitOverflow({ WarningMsg }), -- gitcommitOverflow xxx links to WarningMsg
		WildMenu({ bg = "#d69ab7", fg = "#2c343a" }), -- WildMenu       xxx guifg=#2c343a guibg=#d69ab7
		SneakLabel({ WildMenu }), -- SneakLabel     xxx links to WildMenu
		Folded({ bg = "#424d55", fg = "#9cb4c6" }), -- Folded         xxx guifg=#9cb4c6 guibg=#424d55
		FoldColumn({ fg = "#667783", gui = "bold" }), -- FoldColumn     xxx cterm=bold gui=bold guifg=#667783
		CursorLineFold({ FoldColumn }), -- CursorLineFold xxx links to FoldColumn
		DiffAdd({ bg = "#3e482d" }), -- DiffAdd        xxx guibg=#3e482d
		CodeActionNumber({ DiffAdd }), -- CodeActionNumber xxx links to DiffAdd
		MiniDiffOverAdd({ DiffAdd }), -- MiniDiffOverAdd xxx links to DiffAdd
		MiniStatuslineModeVisual({ DiffAdd }), -- MiniStatuslineModeVisual xxx links to DiffAdd
		NeogitDiffAddHighlight({ DiffAdd }), -- NeogitDiffAddHighlight xxx links to DiffAdd
		DiffChange({ bg = "#304946" }), -- DiffChange     xxx guibg=#304946
		MiniDiffOverContext({ DiffChange }), -- MiniDiffOverContext xxx links to DiffChange
		MiniStatuslineModeInsert({ DiffChange }), -- MiniStatuslineModeInsert xxx links to DiffChange
		DiffDelete({ bg = "#643839" }), -- DiffDelete     xxx guibg=#643839
		MiniDiffOverDelete({ DiffDelete }), -- MiniDiffOverDelete xxx links to DiffDelete
		MiniStatuslineModeReplace({ DiffDelete }), -- MiniStatuslineModeReplace xxx links to DiffDelete
		NeogitDiffDeleteHighlight({ DiffDelete }), -- NeogitDiffDeleteHighlight xxx links to DiffDelete
		DiffText({ bg = "#456763", fg = "#e7dcc4" }), -- DiffText       xxx guifg=#e7dcc4 guibg=#456763
		MiniDiffOverChange({ DiffText }), -- MiniDiffOverChange xxx links to DiffText
		MiniStatuslineModeCommand({ DiffText }), -- MiniStatuslineModeCommand xxx links to DiffText
		Conceal({ fg = "#9f9580", gui = "bold,italic" }), -- Conceal        xxx cterm=bold,italic gui=bold,italic guifg=#9f9580
		SpellBad({ fg = "#d48688", gui = "undercurl" }), -- SpellBad       xxx cterm=undercurl gui=undercurl guifg=#d48688
		CocSelectedText({ SpellBad }), -- CocSelectedText xxx links to SpellBad
		SpellCap({ fg = "#d48688", gui = "undercurl" }), -- SpellCap       xxx cterm=undercurl gui=undercurl guifg=#d48688
		SpellLocal({ SpellCap }), -- SpellLocal     xxx links to SpellCap
		SpellRare({ fg = "#d48688", gui = "undercurl" }), -- SpellRare      xxx cterm=undercurl gui=undercurl guifg=#d48688
		Pmenu({ bg = "#3b464e" }), -- Pmenu          xxx guibg=#3b464e
		PmenuKind({ Pmenu }), -- PmenuKind      xxx links to Pmenu
		PmenuExtra({ Pmenu }), -- PmenuExtra     xxx links to Pmenu
		PmenuSel({ bg = "#4e5b65" }), -- PmenuSel       xxx guibg=#4e5b65
		PmenuKindSel({ PmenuSel }), -- PmenuKindSel   xxx links to PmenuSel
		PmenuExtraSel({ PmenuSel }), -- PmenuExtraSel  xxx links to PmenuSel
		PmenuSbar({ bg = "#606f7b" }), -- PmenuSbar      xxx guibg=#606f7b
		UfoPreviewSbar({ PmenuSbar }), -- UfoPreviewSbar xxx links to PmenuSbar
		PmenuThumb({ bg = "#8296a5" }), -- PmenuThumb     xxx guibg=#8296a5
		UfoPreviewThumb({ PmenuThumb }), -- UfoPreviewThumb xxx links to PmenuThumb
		TabLineSel({ gui = "bold" }), -- TabLineSel     xxx cterm=bold gui=bold
		BufferCurrent({ TabLineSel }), -- BufferCurrent  xxx links to TabLineSel
		CursorLine({ bg = "#313a41" }), -- CursorLine     xxx guibg=#313a41
		CursorColumn({ CursorLine }), -- CursorColumn   xxx links to CursorLine
		CodeActionCursorLine({ CursorLine }), -- CodeActionCursorLine xxx links to CursorLine
		MiniFilesCursorLine({ CursorLine }), -- MiniFilesCursorLine xxx links to CursorLine
		MiniPickMatchCurrent({ CursorLine }), -- MiniPickMatchCurrent xxx links to CursorLine
		MiniPickPreviewLine({ CursorLine }), -- MiniPickPreviewLine xxx links to CursorLine
		UfoCursorFoldedLine({ CursorLine }), -- UfoCursorFoldedLine xxx links to CursorLine
		TelescopeSelection({ CursorLine }), -- TelescopeSelection xxx links to CursorLine
		NeogitDiffContextHighlight({ CursorLine }), -- NeogitDiffContextHighlight xxx links to CursorLine
		CocMenuSel({ CursorLine }), -- CocMenuSel     xxx links to CursorLine
		ColorColumn({ bg = "#685a41" }), -- ColorColumn    xxx guibg=#685a41
		LspReferenceRead({ ColorColumn }), -- LspReferenceRead xxx links to ColorColumn
		LspReferenceText({ ColorColumn }), -- LspReferenceText xxx links to ColorColumn
		LspReferenceWrite({ ColorColumn }), -- LspReferenceWrite xxx links to ColorColumn
		NormalFloat({ bg = "#3b464e" }), -- NormalFloat    xxx guibg=#3b464e
		SagaNormal({ NormalFloat }), -- SagaNormal     xxx links to NormalFloat
		MiniAnimateNormalFloat({ NormalFloat }), -- MiniAnimateNormalFloat xxx links to NormalFloat
		MiniNotifyNormal({ NormalFloat }), -- MiniNotifyNormal xxx links to NormalFloat
		MiniClueDescSingle({ NormalFloat }), -- MiniClueDescSingle xxx links to NormalFloat
		MiniFilesNormal({ NormalFloat }), -- MiniFilesNormal xxx links to NormalFloat
		MiniMapNormal({ NormalFloat }), -- MiniMapNormal  xxx links to NormalFloat
		MiniPickNormal({ NormalFloat }), -- MiniPickNormal xxx links to NormalFloat
		CccFloatNormal({ NormalFloat }), -- CccFloatNormal xxx links to NormalFloat
		FloatBorder({ fg = "#798b9a" }), -- FloatBorder    xxx guifg=#798b9a
		SagaBorder({ FloatBorder }), -- SagaBorder     xxx links to FloatBorder
		MiniNotifyBorder({ FloatBorder }), -- MiniNotifyBorder xxx links to FloatBorder
		MiniClueBorder({ FloatBorder }), -- MiniClueBorder xxx links to FloatBorder
		MiniFilesBorder({ FloatBorder }), -- MiniFilesBorder xxx links to FloatBorder
		MiniPickBorder({ FloatBorder }), -- MiniPickBorder xxx links to FloatBorder
		CccFloatBorder({ FloatBorder }), -- CccFloatBorder xxx links to FloatBorder
		Cursor({ bg = "#ebe2cf", fg = "#2c343a" }), -- Cursor         xxx guifg=#2c343a guibg=#ebe2cf
		TermCursor({ Cursor }), -- TermCursor     xxx links to Cursor
		CursorIM({ Cursor }), -- CursorIM       xxx links to Cursor
		MiniStatuslineModeNormal({ Cursor }), -- MiniStatuslineModeNormal xxx links to Cursor
		FlashCursor({ Cursor }), -- FlashCursor    xxx links to Cursor
		RedrawDebugNormal({ gui = "reverse" }), -- RedrawDebugNormal xxx cterm=reverse gui=reverse
		Underlined({ gui = "underline" }), -- Underlined     xxx cterm=underline gui=underline
		sym("@markup.underline")({ Underlined }), -- @markup.underline xxx links to Underlined
		lCursor({ bg = "#978d79", fg = "#2c343a" }), -- lCursor        xxx guifg=#2c343a guibg=#978d79
		TermCursorNC({ lCursor }), -- TermCursorNC   xxx links to lCursor
		Normal({ bg = "#374149", fg = "#937a69" }), -- Normal         xxx guifg=#e7dcc4 guibg=#2c343a
		ModeMsg({ Normal }), -- ModeMsg        xxx links to Normal
		Ignore({ Normal }), -- Ignore         xxx links to Normal
		NvimSpacing({ Normal }), -- NvimSpacing    xxx links to Normal
		MiniStarterItem({ Normal }), -- MiniStarterItem xxx links to Normal
		tomlDotInKey({ Normal }), -- tomlDotInKey   xxx links to Normal
		Constant({ fg = "#ada28b", gui = "italic" }), -- Constant       xxx cterm=italic gui=italic guifg=#ada28b
		Character({ Constant }), -- Character      xxx links to Constant
		Float({ Constant }), -- Float          xxx links to Constant
		sym("@string")({ Constant }), -- @string        xxx links to Constant
		String({ Constant }), -- String         xxx links to Constant
		sym("@string.regexp")({ Constant }), -- @string.regexp xxx links to Constant
		sym("@character")({ Constant }), -- @character     xxx links to Constant
		sym("@markup.link")({ Constant }), -- @markup.link   xxx links to Constant
		SagaConstant({ Constant }), -- SagaConstant   xxx links to Constant
		SagaKey({ Constant }), -- SagaKey        xxx links to Constant
		SagaNull({ Constant }), -- SagaNull       xxx links to Constant
		SagaEvent({ Constant }), -- SagaEvent      xxx links to Constant
		MiniIconsPurple({ Constant }), -- MiniIconsPurple xxx links to Constant
		sym("@markup.raw")({ Constant }), -- @markup.raw    xxx links to Constant
		sym("@markup.link.url")({ Constant }), -- @markup.link.url xxx links to Constant
		WhichKeyValue({ Constant }), -- WhichKeyValue  xxx links to Constant
		helpOption({ Constant }), -- helpOption     xxx links to Constant
		TroubleSource({ Constant }), -- TroubleSource  xxx links to Constant
		tomlDate({ Constant }), -- tomlDate       xxx links to Constant
		Number({ fg = "#e7dcc4", gui = "italic" }), -- Number         xxx cterm=italic gui=italic guifg=#e7dcc4
		Boolean({ Number }), -- Boolean        xxx links to Number
		sym("@variable.builtin")({ Number }), -- @variable.builtin xxx links to Number
		sym("@constant.builtin")({ Number }), -- @constant.builtin xxx links to Number
		sym("@module")({ Number }), -- @module        xxx links to Number
		sym("@boolean")({ Number }), -- @boolean       xxx links to Number
		sym("@number")({ Number }), -- @number        xxx links to Number
		sym("@constant.macro")({ Number }), -- @constant.macro xxx links to Number
		NvimNumber({ Number }), -- NvimNumber     xxx links to Number
		SagaNumber({ Number }), -- SagaNumber     xxx links to Number
		SagaEnumMember({ Number }), -- SagaEnumMember xxx links to Number
		SagaUnit({ Number }), -- SagaUnit       xxx links to Number
		GrugFarResultsLineColumn({ Number }), -- GrugFarResultsLineColumn xxx links to Number
		GrugFarResultsLineNo({ Number }), -- GrugFarResultsLineNo xxx links to Number
		tomlInteger({ Number }), -- tomlInteger    xxx links to Number
		Statement({ fg = "#a9c181", gui = "bold" }), -- Statement      xxx cterm=bold gui=bold guifg=#a9c181
		Conditional({ Statement }), -- Conditional    xxx links to Statement
		Repeat({ Statement }), -- Repeat         xxx links to Statement
		Label({ Statement }), -- Label          xxx links to Statement
		Keyword({ Statement }), -- Keyword        xxx links to Statement
		Exception({ Statement }), -- Exception      xxx links to Statement
		sym("@label")({ Statement }), -- @label         xxx links to Statement
		sym("@operator")({ Statement }), -- @operator      xxx links to Statement
		sym("@lsp.type.keyword")({ Statement }), -- @lsp.type.keyword xxx links to Statement
		SagaSpinner({ Statement }), -- SagaSpinner    xxx links to Statement
		SagaSpinnerTitle({ Statement }), -- SagaSpinnerTitle xxx links to Statement
		RenameNormal({ Statement }), -- RenameNormal   xxx links to Statement
		sym("@keyword.exception")({ Statement }), -- @keyword.exception xxx links to Statement
		sym("@keyword.return")({ Statement }), -- @keyword.return xxx links to Statement
		sym("@keyword.operator")({ Statement }), -- @keyword.operator xxx links to Statement
		WhichKey({ Statement }), -- WhichKey       xxx links to Statement
		sym("@keyword.repeat")({ Statement }), -- @keyword.repeat xxx links to Statement
		sym("@keyword.conditional")({ Statement }), -- @keyword.conditional xxx links to Statement
		sym("@keyword.function")({ Statement }), -- @keyword.function xxx links to Statement
		sym("@lsp.typemod.keyword.injected")({ Statement }), -- @lsp.typemod.keyword.injected xxx links to Statement
		sym("@keyword.coroutine")({ Statement }), -- @keyword.coroutine xxx links to Statement
		sym("@markup.title.markdown")({ Statement }), -- @markup.title.markdown xxx links to Statement
		FzfLuaBufName({ Statement }), -- FzfLuaBufName  xxx links to Statement
		PreProc({ fg = "#83c193" }), -- PreProc        xxx guifg=#83c193
		Include({ PreProc }), -- Include        xxx links to PreProc
		Define({ PreProc }), -- Define         xxx links to PreProc
		Macro({ PreProc }), -- Macro          xxx links to PreProc
		PreCondit({ PreProc }), -- PreCondit      xxx links to PreProc
		sym("@attribute")({ PreProc }), -- @attribute     xxx links to PreProc
		SagaImpIcon({ PreProc }), -- SagaImpIcon    xxx links to PreProc
		sym("@markup.environment")({ PreProc }), -- @markup.environment xxx links to PreProc
		sym("@keyword.import")({ PreProc }), -- @keyword.import xxx links to PreProc
		sym("@keyword.directive")({ PreProc }), -- @keyword.directive xxx links to PreProc
		sym("@function.macro")({ PreProc }), -- @function.macro xxx links to PreProc
		Type({ fg = "#7fbcb4" }), -- Type           xxx guifg=#7fbcb4
		StorageClass({ Type }), -- StorageClass   xxx links to Type
		Structure({ Type }), -- Structure      xxx links to Type
		Typedef({ Type }), -- Typedef        xxx links to Type
		sym("@type")({ Type }), -- @type          xxx links to Type
		NvimNumberPrefix({ Type }), -- NvimNumberPrefix xxx links to Type
		NvimOptionSigil({ Type }), -- NvimOptionSigil xxx links to Type
		LspInfoFiletype({ Type }), -- LspInfoFiletype xxx links to Type
		SagaInterface({ Type }), -- SagaInterface  xxx links to Type
		SagaArray({ Type }), -- SagaArray      xxx links to Type
		SagaObject({ Type }), -- SagaObject     xxx links to Type
		SagaStruct({ Type }), -- SagaStruct     xxx links to Type
		SagaTypeParameter({ Type }), -- SagaTypeParameter xxx links to Type
		SagaTypeAlias({ Type }), -- SagaTypeAlias  xxx links to Type
		markdownCode({ Type }), -- markdownCode   xxx links to Type
		helpSpecial({ Type }), -- helpSpecial    xxx links to Type
		sym("@keyword.storage")({ Type }), -- @keyword.storage xxx links to Type
		sym("@markup.raw.markdown")({ Type }), -- @markup.raw.markdown xxx links to Type
		sym("@variable.parameter.vimdoc")({ Type }), -- @variable.parameter.vimdoc xxx links to Type
		Special({ fg = "#b5aa92", gui = "bold" }), -- Special        xxx cterm=bold gui=bold guifg=#b5aa92
		Tag({ Special }), -- Tag            xxx links to Special
		SpecialChar({ Special }), -- SpecialChar    xxx links to Special
		Debug({ Special }), -- Debug          xxx links to Special
		sym("@string.special")({ Special }), -- @string.special xxx links to Special
		sym("@string.escape")({ Special }), -- @string.escape xxx links to Special
		sym("@character.special")({ Special }), -- @character.special xxx links to Special
		sym("@function.builtin")({ Special }), -- @function.builtin xxx links to Special
		sym("@constructor")({ Special }), -- @constructor   xxx links to Special
		sym("@markup")({ Special }), -- @markup        xxx links to Special
		sym("@tag")({ Special }), -- @tag           xxx links to Special
		MiniMapSymbolCount({ Special }), -- MiniMapSymbolCount xxx links to Special
		sym("@markup.math")({ Special }), -- @markup.math   xxx links to Special
		WhichKeyGroup({ Special }), -- WhichKeyGroup  xxx links to Special
		sym("@keyword.debug")({ Special }), -- @keyword.debug xxx links to Special
		sym("@markup.list")({ Special }), -- @markup.list   xxx links to Special
		sym("@punctuation.special.markdown")({ Special }), -- @punctuation.special.markdown xxx links to Special
		sym("@markup.link.label")({ Special }), -- @markup.link.label xxx links to Special
		FlashPromptIcon({ Special }), -- FlashPromptIcon xxx links to Special
		gitignoreGlob({ Special }), -- gitignoreGlob  xxx links to Special
		gitignoreRange({ Special }), -- gitignoreRange xxx links to Special
		SpecialComment({ fg = "#6e7b85" }), -- SpecialComment xxx guifg=#6e7b85
		markdownUrl({ SpecialComment }), -- markdownUrl    xxx links to SpecialComment
		sym("@markup.link.url.markdown")({ SpecialComment }), -- @markup.link.url.markdown xxx links to SpecialComment
		LspInlayHint({ bg = "#313a41", fg = "#6b8292" }), -- LspInlayHint   xxx guifg=#6b8292 guibg=#313a41
		DiagnosticInfo({ fg = "#7fbcb4" }), -- DiagnosticInfo xxx guifg=#7fbcb4
		DiagnosticFloatingInfo({ DiagnosticInfo }), -- DiagnosticFloatingInfo xxx links to DiagnosticInfo
		sym("@comment.note")({ DiagnosticInfo }), -- @comment.note  xxx links to DiagnosticInfo
		MiniIconsBlue({ DiagnosticInfo }), -- MiniIconsBlue  xxx links to DiagnosticInfo
		NotifyINFOIcon({ DiagnosticInfo }), -- NotifyINFOIcon xxx links to DiagnosticInfo
		NotifyINFOTitle({ DiagnosticInfo }), -- NotifyINFOTitle xxx links to DiagnosticInfo
		NeogitNotificationInfo({ DiagnosticInfo }), -- NeogitNotificationInfo xxx links to DiagnosticInfo
		DiagnosticHint({ fg = "#d69ab7" }), -- DiagnosticHint xxx guifg=#d69ab7
		DiagnosticFloatingHint({ DiagnosticHint }), -- DiagnosticFloatingHint xxx links to DiagnosticHint
		MiniIconsCyan({ DiagnosticHint }), -- MiniIconsCyan  xxx links to DiagnosticHint
		NotifyDEBUGIcon({ DiagnosticHint }), -- NotifyDEBUGIcon xxx links to DiagnosticHint
		NotifyTRACEIcon({ DiagnosticHint }), -- NotifyTRACEIcon xxx links to DiagnosticHint
		NotifyTRACETitle({ DiagnosticHint }), -- NotifyTRACETitle xxx links to DiagnosticHint
		NotifyDEBUGTitle({ DiagnosticHint }), -- NotifyDEBUGTitle xxx links to DiagnosticHint
		DiagnosticOk({ fg = "#a9c181" }), -- DiagnosticOk   xxx guifg=#a9c181
		DiagnosticFloatingOk({ DiagnosticOk }), -- DiagnosticFloatingOk xxx links to DiagnosticOk
		MiniIconsGreen({ DiagnosticOk }), -- MiniIconsGreen xxx links to DiagnosticOk
		DiagnosticVirtualTextError({ bg = "#443939", fg = "#e67c7f" }), -- DiagnosticVirtualTextError xxx guifg=#e67c7f guibg=#443939
		CocErrorVirtualText({ DiagnosticVirtualTextError }), -- CocErrorVirtualText xxx links to DiagnosticVirtualTextError
		DiagnosticVirtualTextWarn({ bg = "#3d3b38", fg = "#ddbd7f" }), -- DiagnosticVirtualTextWarn xxx guifg=#ddbd7f guibg=#3d3b38
		CocWarningVirtualText({ DiagnosticVirtualTextWarn }), -- CocWarningVirtualText xxx links to DiagnosticVirtualTextWarn
		DiagnosticVirtualTextInfo({ bg = "#393c3c", fg = "#7fbcb4" }), -- DiagnosticVirtualTextInfo xxx guifg=#7fbcb4 guibg=#393c3c
		DiagnosticVirtualTextHint({ bg = "#42393d", fg = "#d69ab7" }), -- DiagnosticVirtualTextHint xxx guifg=#d69ab7 guibg=#42393d
		DiagnosticVirtualTextOk({ bg = "#3a3c38", fg = "#a9c181" }), -- DiagnosticVirtualTextOk xxx guifg=#a9c181 guibg=#3a3c38
		DiagnosticSignError({ fg = "#e67c7f" }), -- DiagnosticSignError xxx guifg=#e67c7f
		CocErrorSign({ DiagnosticSignError }), -- CocErrorSign   xxx links to DiagnosticSignError
		DiagnosticSignWarn({ fg = "#ddbd7f" }), -- DiagnosticSignWarn xxx guifg=#ddbd7f
		CocWarningSign({ DiagnosticSignWarn }), -- CocWarningSign xxx links to DiagnosticSignWarn
		DiagnosticSignInfo({ fg = "#7fbcb4" }), -- DiagnosticSignInfo xxx guifg=#7fbcb4
		CocInfoSign({ DiagnosticSignInfo }), -- CocInfoSign    xxx links to DiagnosticSignInfo
		DiagnosticSignHint({ fg = "#d69ab7" }), -- DiagnosticSignHint xxx guifg=#d69ab7
		SagaLightBulb({ DiagnosticSignHint }), -- SagaLightBulb  xxx links to DiagnosticSignHint
		CocHintSign({ DiagnosticSignHint }), -- CocHintSign    xxx links to DiagnosticSignHint
		DiagnosticSignOk({ fg = "#a9c181" }), -- DiagnosticSignOk xxx guifg=#a9c181
		Comment({ fg = "#6e7b85", gui = "italic" }), -- Comment        xxx cterm=italic gui=italic guifg=#6e7b85
		sym("@comment")({ Comment }), -- @comment       xxx links to Comment
		LspInfoTip({ Comment }), -- LspInfoTip     xxx links to Comment
		SagaToggle({ Comment }), -- SagaToggle     xxx links to Comment
		SagaFolderName({ Comment }), -- SagaFolderName xxx links to Comment
		SagaFileName({ Comment }), -- SagaFileName   xxx links to Comment
		SagaSep({ Comment }), -- SagaSep        xxx links to Comment
		SagaDetail({ Comment }), -- SagaDetail     xxx links to Comment
		SagaText({ Comment }), -- SagaText       xxx links to Comment
		MiniStarterInactive({ Comment }), -- MiniStarterInactive xxx links to Comment
		UfoFoldedEllipsis({ Comment }), -- UfoFoldedEllipsis xxx links to Comment
		GrugFarResultsStats({ Comment }), -- GrugFarResultsStats xxx links to Comment
		GrugFarResultsHeader({ Comment }), -- GrugFarResultsHeader xxx links to Comment
		GrugFarInputPlaceholder({ Comment }), -- GrugFarInputPlaceholder xxx links to Comment
		tomlComment({ Comment }), -- tomlComment    xxx links to Comment
		gitignoreComment({ Comment }), -- gitignoreComment xxx links to Comment
		sym("@constant")({ fg = "#c6baa0", gui = "bold" }), -- @constant      xxx cterm=bold gui=bold guifg=#c6baa0
		sym("@lsp.type.enumMember")({ sym("@constant") }), -- @lsp.type.enumMember xxx links to @constant
		sym("@lsp.typemod.variable.static")({ sym("@constant") }), -- @lsp.typemod.variable.static xxx links to @constant
		Identifier({ fg = "#c6baa0" }), -- Identifier     xxx guifg=#c6baa0
		sym("@variable")({ Identifier }), -- @variable      xxx links to Identifier
		sym("@property")({ Identifier }), -- @property      xxx links to Identifier
		NvimIdentifier({ Identifier }), -- NvimIdentifier xxx links to Identifier
		GrugFarInputLabel({ Identifier }), -- GrugFarInputLabel xxx links to Identifier
		sym("@string.special.symbol")({ Identifier }), -- @string.special.symbol xxx links to Identifier
		tomlKey({ Identifier }), -- tomlKey        xxx links to Identifier
		tomlKeyDq({ Identifier }), -- tomlKeyDq      xxx links to Identifier
		tomlKeySq({ Identifier }), -- tomlKeySq      xxx links to Identifier
		Function({ fg = "#e7dcc4" }), -- Function       xxx guifg=#e7dcc4
		sym("@function")({ Function }), -- @function      xxx links to Function
		LspInfoList({ Function }), -- LspInfoList    xxx links to Function
		SagaFinderFname({ Function }), -- SagaFinderFname xxx links to Function
		SagaMethod({ Function }), -- SagaMethod     xxx links to Function
		SagaFunction({ Function }), -- SagaFunction   xxx links to Function
		SagaStaticMethod({ Function }), -- SagaStaticMethod xxx links to Function
		MiniIconsAzure({ Function }), -- MiniIconsAzure xxx links to Function
		TroubleText({ Function }), -- TroubleText    xxx links to Function
		TroubleNormal({ Function }), -- TroubleNormal  xxx links to Function
		Operator({ fg = "nvimlightgrey2" }), -- Operator       xxx guifg=NvimLightGrey2
		NvimAssignment({ Operator }), -- NvimAssignment xxx links to Operator
		NvimOperator({ Operator }), -- NvimOperator   xxx links to Operator
		SagaWinbarSep({ Operator }), -- SagaWinbarSep  xxx links to Operator
		SagaOperator({ Operator }), -- SagaOperator   xxx links to Operator
		Delimiter({ fg = "#7b8e9d" }), -- Delimiter      xxx guifg=#7b8e9d
		sym("@punctuation")({ Delimiter }), -- @punctuation   xxx links to Delimiter
		sym("@punctuation.special")({ Delimiter }), -- @punctuation.special xxx links to Delimiter
		NvimParenthesis({ Delimiter }), -- NvimParenthesis xxx links to Delimiter
		NvimColon({ Delimiter }), -- NvimColon      xxx links to Delimiter
		NvimComma({ Delimiter }), -- NvimComma      xxx links to Delimiter
		NvimArrow({ Delimiter }), -- NvimArrow      xxx links to Delimiter
		MiniIndentscopeSymbol({ Delimiter }), -- MiniIndentscopeSymbol xxx links to Delimiter
		MiniMapSymbolView({ Delimiter }), -- MiniMapSymbolView xxx links to Delimiter
		MiniStarterItemBullet({ Delimiter }), -- MiniStarterItemBullet xxx links to Delimiter
		MiniStarterSection({ Delimiter }), -- MiniStarterSection xxx links to Delimiter
		sym("@punctuation.bracket")({ Delimiter }), -- @punctuation.bracket xxx links to Delimiter
		sym("@punctuation.delimiter")({ Delimiter }), -- @punctuation.delimiter xxx links to Delimiter
		sym("@tag.delimiter")({ Delimiter }), -- @tag.delimiter xxx links to Delimiter
		markdownLinkTextDelimiter({ Delimiter }), -- markdownLinkTextDelimiter xxx links to Delimiter
		gitignoreSeparator({ Delimiter }), -- gitignoreSeparator xxx links to Delimiter
		Todo({ gui = "bold,underline" }), -- Todo           xxx cterm=bold,underline gui=bold,underline
		sym("@comment.todo")({ Todo }), -- @comment.todo  xxx links to Todo
		tomlTodo({ Todo }), -- tomlTodo       xxx links to Todo
		gitignoreTodo({ Todo }), -- gitignoreTodo  xxx links to Todo
		sym("@markup.strikethrough")({ gui = "strikethrough" }), -- @markup.strikethrough xxx cterm=strikethrough gui=strikethrough
		sym("@diff.plus")({ fg = "#a9c181" }), -- @diff.plus     xxx guifg=#a9c181
		Added({ fg = "nvimlightgreen" }), -- Added          xxx ctermfg=10 guifg=NvimLightGreen
		MiniDiffSignAdd({ Added }), -- MiniDiffSignAdd xxx links to Added
		sym("@diff.minus")({ fg = "#e67c7f" }), -- @diff.minus    xxx guifg=#e67c7f
		Removed({ fg = "nvimlightred" }), -- Removed        xxx ctermfg=9 guifg=NvimLightRed
		MiniDiffSignDelete({ Removed }), -- MiniDiffSignDelete xxx links to Removed
		sym("@diff.delta")({ fg = "#7fbcb4" }), -- @diff.delta    xxx guifg=#7fbcb4
		GrugFarResultsMatch({ sym("@diff.delta") }), -- GrugFarResultsMatch xxx links to @diff.delta
		Changed({ fg = "nvimlightcyan" }), -- Changed        xxx ctermfg=14 guifg=NvimLightCyan
		MiniDiffSignChange({ Changed }), -- MiniDiffSignChange xxx links to Changed
		GrugFarResultsChangeIndicator({ Changed }), -- GrugFarResultsChangeIndicator xxx links to Changed
		FloatShadow({ blend = 80, bg = "nvimdarkgrey4" }), -- FloatShadow    xxx ctermbg=0 guibg=NvimDarkGrey4 blend=80
		FloatShadowThrough({ blend = 100, bg = "nvimdarkgrey4" }), -- FloatShadowThrough xxx ctermbg=0 guibg=NvimDarkGrey4 blend=100
		RedrawDebugClear({ bg = "nvimdarkyellow" }), -- RedrawDebugClear xxx ctermfg=0 ctermbg=11 guibg=NvimDarkYellow
		RedrawDebugComposed({ bg = "nvimdarkgreen" }), -- RedrawDebugComposed xxx ctermfg=0 ctermbg=10 guibg=NvimDarkGreen
		RedrawDebugRecompose({ bg = "nvimdarkred" }), -- RedrawDebugRecompose xxx ctermfg=0 ctermbg=9 guibg=NvimDarkRed
		Error({ fg = "#e67c7f" }), -- Error          xxx guifg=#e67c7f
		ErrorMsg({ Error }), -- ErrorMsg       xxx links to Error
		DiagnosticError({ Error }), -- DiagnosticError xxx links to Error
		sym("@comment.error")({ Error }), -- @comment.error xxx links to Error
		NvimInvalid({ Error }), -- NvimInvalid    xxx links to Error
		MiniTrailspace({ Error }), -- MiniTrailspace xxx links to Error
		MasonError({ Error }), -- MasonError     xxx links to Error
		DiagnosticUnderlineError({ sp = "#e67c7f", gui = "undercurl" }), -- DiagnosticUnderlineError xxx cterm=undercurl gui=undercurl guisp=#e67c7f
		CocErrorHighlight({ DiagnosticUnderlineError }), -- CocErrorHighlight xxx links to DiagnosticUnderlineError
		DiagnosticUnderlineWarn({ sp = "#ddbd7f", gui = "undercurl" }), -- DiagnosticUnderlineWarn xxx cterm=undercurl gui=undercurl guisp=#ddbd7f
		CocWarningHighlight({ DiagnosticUnderlineWarn }), -- CocWarningHighlight xxx links to DiagnosticUnderlineWarn
		DiagnosticUnderlineInfo({ sp = "#7fbcb4", gui = "undercurl" }), -- DiagnosticUnderlineInfo xxx cterm=undercurl gui=undercurl guisp=#7fbcb4
		CocInfoHighlight({ DiagnosticUnderlineInfo }), -- CocInfoHighlight xxx links to DiagnosticUnderlineInfo
		DiagnosticUnderlineHint({ sp = "#d69ab7", gui = "undercurl" }), -- DiagnosticUnderlineHint xxx cterm=undercurl gui=undercurl guisp=#d69ab7
		CocHintHighlight({ DiagnosticUnderlineHint }), -- CocHintHighlight xxx links to DiagnosticUnderlineHint
		DiagnosticUnderlineOk({ sp = "#a9c181", gui = "undercurl" }), -- DiagnosticUnderlineOk xxx cterm=undercurl gui=undercurl guisp=#a9c181
		NvimInternalError({ bg = "red", fg = "red" }), -- NvimInternalError xxx ctermfg=9 ctermbg=9 guifg=Red guibg=Red
		NvimFigureBrace({ NvimInternalError }), -- NvimFigureBrace xxx links to NvimInternalError
		NvimSingleQuotedUnknownEscape({ NvimInternalError }), -- NvimSingleQuotedUnknownEscape xxx links to NvimInternalError
		NvimInvalidSingleQuotedUnknownEscape({ NvimInternalError }), -- NvimInvalidSingleQuotedUnknownEscape xxx links to NvimInternalError
		MiniAnimateCursor({ gui = "reverse,nocombine" }), -- MiniAnimateCursor xxx cterm=reverse,nocombine gui=reverse,nocombine
		UfoFoldedBg({ bg = "#424d55" }), -- UfoFoldedBg    xxx guibg=#424d55
		UfoPreviewWinBar({ UfoFoldedBg }), -- UfoPreviewWinBar xxx links to UfoFoldedBg
		UfoFoldedFg({ fg = "#e7dcc4" }), -- UfoFoldedFg    xxx guifg=#e7dcc4
		RainbowDelimiterRed({ fg = "#cc241d" }), -- RainbowDelimiterRed xxx ctermfg=9 guifg=#cc241d
		RainbowDelimiterOrange({ fg = "#d65d0e" }), -- RainbowDelimiterOrange xxx ctermfg=15 guifg=#d65d0e
		RainbowDelimiterYellow({ fg = "#d79921" }), -- RainbowDelimiterYellow xxx ctermfg=11 guifg=#d79921
		RainbowDelimiterGreen({ fg = "#689d6a" }), -- RainbowDelimiterGreen xxx ctermfg=10 guifg=#689d6a
		RainbowDelimiterCyan({ fg = "#a89984" }), -- RainbowDelimiterCyan xxx ctermfg=14 guifg=#a89984
		RainbowDelimiterBlue({ fg = "#458588" }), -- RainbowDelimiterBlue xxx ctermfg=12 guifg=#458588
		RainbowDelimiterViolet({ fg = "#b16286" }), -- RainbowDelimiterViolet xxx ctermfg=13 guifg=#b16286
		Bold({ gui = "bold" }), -- Bold           xxx cterm=bold gui=bold
		sym("@markup.strong")({ Bold }), -- @markup.strong xxx links to Bold
		Italic({ gui = "italic" }), -- Italic         xxx cterm=italic gui=italic
		sym("@markup.italic")({ Italic }), -- @markup.italic xxx links to Italic
		sym("@markup.italic.markdown")({ Italic }), -- @markup.italic.markdown xxx links to Italic
		sym("@markup.quote")({ fg = "#ada28b" }), -- @markup.quote  xxx guifg=#ada28b
		diffAdded({ fg = "#a9c181" }), -- diffAdded      xxx guifg=#a9c181
		NvimTreeGitNew({ diffAdded }), -- NvimTreeGitNew xxx links to diffAdded
		NvimTreeSpecialFile({ fg = "#d69ab7", gui = "underline" }), -- NvimTreeSpecialFile xxx cterm=underline gui=underline guifg=#d69ab7
		NvimTreeSymlink({ fg = "#7fbcb4" }), -- NvimTreeSymlink xxx guifg=#7fbcb4
		NvimTreeRootFolder({ fg = "#7fbcb4", gui = "bold" }), -- NvimTreeRootFolder xxx cterm=bold gui=bold guifg=#7fbcb4
		NvimTreeWinSeparator({ fg = "bg" }), -- NvimTreeWinSeparator xxx guifg=bg
		NnnWinSeparator({ NvimTreeWinSeparator }), -- NnnWinSeparator xxx links to NvimTreeWinSeparator
		IblIndent({ fg = "#394147" }), -- IblIndent      xxx guifg=#394147
		IblScope({ fg = "#515b63" }), -- IblScope       xxx guifg=#515b63
		GitSignsDelete({ fg = "#e67c7f" }), -- GitSignsDelete xxx guifg=#e67c7f
		GitGutterDelete({ GitSignsDelete }), -- GitGutterDelete xxx links to GitSignsDelete
		GitSignsChange({ fg = "#7fbcb4" }), -- GitSignsChange xxx guifg=#7fbcb4
		GitGutterChange({ GitSignsChange }), -- GitGutterChange xxx links to GitSignsChange
		GitSignsAdd({ fg = "#a9c181" }), -- GitSignsAdd    xxx guifg=#a9c181
		GitGutterAdd({ GitSignsAdd }), -- GitGutterAdd   xxx links to GitSignsAdd
		diffRemoved({ fg = "#e67c7f" }), -- diffRemoved    xxx guifg=#e67c7f
		NvimTreeGitDeleted({ diffRemoved }), -- NvimTreeGitDeleted xxx links to diffRemoved
		diffChanged({ fg = "#7fbcb4" }), -- diffChanged    xxx guifg=#7fbcb4
		NvimTreeGitDirty({ diffChanged }), -- NvimTreeGitDirty xxx links to diffChanged
		diffNewFile({ fg = "#a9c181", gui = "italic" }), -- diffNewFile    xxx cterm=italic gui=italic guifg=#a9c181
		diffOldFile({ fg = "#e67c7f", gui = "italic" }), -- diffOldFile    xxx cterm=italic gui=italic guifg=#e67c7f
		CmpItemMenu({ fg = "#9f9580" }), -- CmpItemMenu    xxx guifg=#9f9580
		CmpItemAbbrMatchFuzzy({ fg = "#cfc3a7", gui = "bold" }), -- CmpItemAbbrMatchFuzzy xxx cterm=bold gui=bold guifg=#cfc3a7
		CmpItemAbbrMatch({ fg = "#e7dcc4", gui = "bold" }), -- CmpItemAbbrMatch xxx cterm=bold gui=bold guifg=#e7dcc4
		CmpItemAbbrDeprecated({ fg = "#817967" }), -- CmpItemAbbrDeprecated xxx guifg=#817967
		CmpItemAbbr({ fg = "#c6baa0" }), -- CmpItemAbbr    xxx guifg=#c6baa0
		NvimTreeNormal({ bg = "#2f383f", fg = "#e7dcc4" }), -- NvimTreeNormal xxx guifg=#e7dcc4 guibg=#2f383f
		NnnNormal({ NvimTreeNormal }), -- NnnNormal      xxx links to NvimTreeNormal
		TelescopeSelectionCaret({ bg = "#313a41", fg = "#e67c7f" }), -- TelescopeSelectionCaret xxx guifg=#e67c7f guibg=#313a41
		TelescopeBorder({ fg = "#798b9a" }), -- TelescopeBorder xxx guifg=#798b9a
		NeogitHunkHeaderHighlight({ bg = "#313a41", fg = "#e7dcc4", gui = "bold" }), -- NeogitHunkHeaderHighlight xxx cterm=bold gui=bold guifg=#e7dcc4 guibg=#313a41
		TodoBgWARN({ bg = "#ddbd7f", fg = "#2c343a", gui = "bold" }), -- TodoBgWARN     xxx gui=bold guifg=#2c343a guibg=#ddbd7f
		TodoFgWARN({ fg = "#ddbd7f" }), -- TodoFgWARN     xxx guifg=#ddbd7f
		TodoSignWARN({ fg = "#ddbd7f" }), -- TodoSignWARN   xxx guifg=#ddbd7f
		TodoBgHACK({ bg = "#ddbd7f", fg = "#2c343a", gui = "bold" }), -- TodoBgHACK     xxx gui=bold guifg=#2c343a guibg=#ddbd7f
		TodoFgHACK({ fg = "#ddbd7f" }), -- TodoFgHACK     xxx guifg=#ddbd7f
		TodoSignHACK({ fg = "#ddbd7f" }), -- TodoSignHACK   xxx guifg=#ddbd7f
		TodoBgTEST({ bg = "#c6baa0", fg = "#2c343a", gui = "bold" }), -- TodoBgTEST     xxx gui=bold guifg=#2c343a guibg=#c6baa0
		TodoFgTEST({ fg = "#c6baa0" }), -- TodoFgTEST     xxx guifg=#c6baa0
		TodoSignTEST({ fg = "#c6baa0" }), -- TodoSignTEST   xxx guifg=#c6baa0
		TodoBgTODO({ bg = "#7fbcb4", fg = "#2c343a", gui = "bold" }), -- TodoBgTODO     xxx gui=bold guifg=#2c343a guibg=#7fbcb4
		TodoFgTODO({ fg = "#7fbcb4" }), -- TodoFgTODO     xxx guifg=#7fbcb4
		TodoSignTODO({ fg = "#7fbcb4" }), -- TodoSignTODO   xxx guifg=#7fbcb4
		TodoBgNOTE({ bg = "#d69ab7", fg = "#2c343a", gui = "bold" }), -- TodoBgNOTE     xxx gui=bold guifg=#2c343a guibg=#d69ab7
		TodoFgNOTE({ fg = "#d69ab7" }), -- TodoFgNOTE     xxx guifg=#d69ab7
		TodoSignNOTE({ fg = "#d69ab7" }), -- TodoSignNOTE   xxx guifg=#d69ab7
		TodoBgFIX({ bg = "#e67c7f", fg = "#2c343a", gui = "bold" }), -- TodoBgFIX      xxx gui=bold guifg=#2c343a guibg=#e67c7f
		TodoFgFIX({ fg = "#e67c7f" }), -- TodoFgFIX      xxx guifg=#e67c7f
		TodoSignFIX({ fg = "#e67c7f" }), -- TodoSignFIX    xxx guifg=#e67c7f
		TodoBgPERF({ bg = "#c6baa0", fg = "#2c343a", gui = "bold" }), -- TodoBgPERF     xxx gui=bold guifg=#2c343a guibg=#c6baa0
		TodoFgPERF({ fg = "#c6baa0" }), -- TodoFgPERF     xxx guifg=#c6baa0
		TodoSignPERF({ fg = "#c6baa0" }), -- TodoSignPERF   xxx guifg=#c6baa0
		ModesCopy({ bg = "#f5c359" }), -- ModesCopy      xxx guibg=#f5c359
		ModesDelete({ bg = "#c75c6a" }), -- ModesDelete    xxx guibg=#c75c6a
		ModesOperator({ ModesDelete }), -- ModesOperator  xxx links to ModesDelete
		ModesInsert({ bg = "#78ccc5" }), -- ModesInsert    xxx guibg=#78ccc5
		ModesVisual({ bg = "#9745be" }), -- ModesVisual    xxx guibg=#9745be
		ModesCopyCursorLine({ bg = "#4a493f" }), -- ModesCopyCursorLine xxx guibg=#4a493f
		ModesCopyCursorLineNr({ bg = "#4a493f" }), -- ModesCopyCursorLineNr xxx guibg=#4a493f
		ModesCopyCursorLineSign({ bg = "#4a493f" }), -- ModesCopyCursorLineSign xxx guibg=#4a493f
		ModesCopyCursorLineFold({ bg = "#4a493f" }), -- ModesCopyCursorLineFold xxx guibg=#4a493f
		ModesDeleteCursorLine({ bg = "#433a41" }), -- ModesDeleteCursorLine xxx guibg=#433a41
		ModesDeleteCursorLineNr({ bg = "#433a41" }), -- ModesDeleteCursorLineNr xxx guibg=#433a41
		ModesDeleteCursorLineSign({ bg = "#433a41" }), -- ModesDeleteCursorLineSign xxx guibg=#433a41
		ModesDeleteCursorLineFold({ bg = "#433a41" }), -- ModesDeleteCursorLineFold xxx guibg=#433a41
		ModesInsertCursorLine({ bg = "#374b4f" }), -- ModesInsertCursorLine xxx guibg=#374b4f
		ModesInsertCursorLineNr({ bg = "#374b4f" }), -- ModesInsertCursorLineNr xxx guibg=#374b4f
		ModesInsertCursorLineSign({ bg = "#374b4f" }), -- ModesInsertCursorLineSign xxx guibg=#374b4f
		ModesInsertCursorLineFold({ bg = "#374b4f" }), -- ModesInsertCursorLineFold xxx guibg=#374b4f
		ModesVisualCursorLine({ bg = "#3c374e" }), -- ModesVisualCursorLine xxx guibg=#3c374e
		ModesVisualCursorLineNr({ bg = "#3c374e" }), -- ModesVisualCursorLineNr xxx guibg=#3c374e
		ModesVisualCursorLineSign({ bg = "#3c374e" }), -- ModesVisualCursorLineSign xxx guibg=#3c374e
		ModesVisualCursorLineFold({ bg = "#3c374e" }), -- ModesVisualCursorLineFold xxx guibg=#3c374e
		ModesInsertModeMsg({ fg = "#78ccc5" }), -- ModesInsertModeMsg xxx guifg=#78ccc5
		ModesVisualModeMsg({ fg = "#9745be" }), -- ModesVisualModeMsg xxx guifg=#9745be
		ModesVisualVisual({ bg = "#3c374e" }), -- ModesVisualVisual xxx guibg=#3c374e
		TinyInlineInvDiagnosticVirtualTextWarn({ bg = "#313a41", fg = "#000000" }), -- TinyInlineInvDiagnosticVirtualTextWarn xxx guifg=#000000 guibg=#313a41
		TinyInlineInvDiagnosticVirtualTextError({ bg = "#313a41", fg = "#000000" }), -- TinyInlineInvDiagnosticVirtualTextError xxx guifg=#000000 guibg=#313a41
		TinyInlineDiagnosticVirtualTextArrow({ bg = "#313a41" }), -- TinyInlineDiagnosticVirtualTextArrow xxx guibg=#313a41
		TinyInlineDiagnosticVirtualTextHint({ bg = "#3a2a31", fg = "#d69ab7" }), -- TinyInlineDiagnosticVirtualTextHint xxx guifg=#d69ab7 guibg=#3a2a31
		TinyInlineDiagnosticVirtualTextInfo({ bg = "#223331", fg = "#7fbcb4" }), -- TinyInlineDiagnosticVirtualTextInfo xxx guifg=#7fbcb4 guibg=#223331
		TinyInlineDiagnosticVirtualTextWarn({ bg = "#000000" }), -- TinyInlineDiagnosticVirtualTextWarn xxx guibg=#000000
		TinyInlineDiagnosticVirtualTextError({ bg = "#000000" }), -- TinyInlineDiagnosticVirtualTextError xxx guibg=#000000
		TinyInlineInvDiagnosticVirtualTextHint({ bg = "#313a41", fg = "#3a2a31" }), -- TinyInlineInvDiagnosticVirtualTextHint xxx guifg=#3a2a31 guibg=#313a41
		TinyInlineInvDiagnosticVirtualTextInfo({ bg = "#313a41", fg = "#223331" }), -- TinyInlineInvDiagnosticVirtualTextInfo xxx guifg=#223331 guibg=#313a41
		DevIconDefault({ fg = "#6d8086" }), -- DevIconDefault xxx ctermfg=66 guifg=#6d8086
		DevIconXauthority({ fg = "#e54d18" }), -- DevIconXauthority xxx ctermfg=196 guifg=#e54d18
		DevIconVimrc({ fg = "#019833" }), -- DevIconVimrc   xxx ctermfg=28 guifg=#019833
		DevIconSRCINFO({ fg = "#0f94d2" }), -- DevIconSRCINFO xxx ctermfg=67 guifg=#0f94d2
		DevIconLicense({ fg = "#d0bf41" }), -- DevIconLicense xxx ctermfg=185 guifg=#d0bf41
		DevIconSettingsJson({ fg = "#854cc7" }), -- DevIconSettingsJson xxx ctermfg=98 guifg=#854cc7
		DevIconBrewfile({ fg = "#701516" }), -- DevIconBrewfile xxx ctermfg=52 guifg=#701516
		DevIconAvif({ fg = "#a074c4" }), -- DevIconAvif    xxx ctermfg=140 guifg=#a074c4
		DevIconQt({ fg = "#40cd52" }), -- DevIconQt      xxx ctermfg=77 guifg=#40cd52
		DevIconImage({ fg = "#d0bec8" }), -- DevIconImage   xxx ctermfg=181 guifg=#d0bec8
		DevIconIgs({ fg = "#839463" }), -- DevIconIgs     xxx ctermfg=101 guifg=#839463
		DevIconGTK({ fg = "#ffffff" }), -- DevIconGTK     xxx ctermfg=231 guifg=#ffffff
		DevIconIges({ fg = "#839463" }), -- DevIconIges    xxx ctermfg=101 guifg=#839463
		DevIconGitlabCI({ fg = "#e24329" }), -- DevIconGitlabCI xxx ctermfg=196 guifg=#e24329
		DevIconIge({ fg = "#839463" }), -- DevIconIge     xxx ctermfg=101 guifg=#839463
		DevIconIfc({ fg = "#839463" }), -- DevIconIfc     xxx ctermfg=101 guifg=#839463
		DevIconIfb({ fg = "#2b2e83" }), -- DevIconIfb     xxx ctermfg=18 guifg=#2b2e83
		DevIconEslintIgnore({ fg = "#4b32c3" }), -- DevIconEslintIgnore xxx ctermfg=56 guifg=#4b32c3
		DevIconIcs({ fg = "#2b2e83" }), -- DevIconIcs     xxx ctermfg=18 guifg=#2b2e83
		DevIconIcalendar({ fg = "#2b2e83" }), -- DevIconIcalendar xxx ctermfg=18 guifg=#2b2e83
		DevIconEnv({ fg = "#faf743" }), -- DevIconEnv     xxx ctermfg=227 guifg=#faf743
		DevIconIcal({ fg = "#2b2e83" }), -- DevIconIcal    xxx ctermfg=18 guifg=#2b2e83
		DevIconDownload({ fg = "#44cda8" }), -- DevIconDownload xxx ctermfg=43 guifg=#44cda8
		DevIconDsStore({ fg = "#41535b" }), -- DevIconDsStore xxx ctermfg=239 guifg=#41535b
		DevIconIxx({ fg = "#519aba" }), -- DevIconIxx     xxx ctermfg=74 guifg=#519aba
		DevIconDockerfile({ fg = "#458ee6" }), -- DevIconDockerfile xxx ctermfg=68 guifg=#458ee6
		DevIconQtile({ fg = "#ffffff" }), -- DevIconQtile   xxx ctermfg=231 guifg=#ffffff
		DevIconSub({ fg = "#ffb713" }), -- DevIconSub     xxx ctermfg=214 guifg=#ffb713
		DevIconBackup({ fg = "#6d8086" }), -- DevIconBackup  xxx ctermfg=66 guifg=#6d8086
		DevIconGradleSettings({ fg = "#005f87" }), -- DevIconGradleSettings xxx ctermfg=24 guifg=#005f87
		DevIconGradleBuildScript({ fg = "#005f87" }), -- DevIconGradleBuildScript xxx ctermfg=24 guifg=#005f87
		DevIconi3({ fg = "#e8ebee" }), -- DevIconi3      xxx ctermfg=255 guifg=#e8ebee
		DevIconCobol({ fg = "#005ca5" }), -- DevIconCobol   xxx ctermfg=25 guifg=#005ca5
		DevIconPrisma({ fg = "#5a67d8" }), -- DevIconPrisma  xxx ctermfg=62 guifg=#5a67d8
		DevIconHyprland({ fg = "#00aaae" }), -- DevIconHyprland xxx ctermfg=37 guifg=#00aaae
		DevIconAzureCli({ fg = "#0078d4" }), -- DevIconAzureCli xxx ctermfg=32 guifg=#0078d4
		DevIconFluxbox({ fg = "#555555" }), -- DevIconFluxbox xxx ctermfg=240 guifg=#555555
		DevIconHaml({ fg = "#eaeae1" }), -- DevIconHaml    xxx ctermfg=255 guifg=#eaeae1
		DevIconPp({ fg = "#ffa61a" }), -- DevIconPp      xxx ctermfg=214 guifg=#ffa61a
		DevIconAsc({ fg = "#576d7f" }), -- DevIconAsc     xxx ctermfg=242 guifg=#576d7f
		DevIcondwm({ fg = "#1177aa" }), -- DevIcondwm     xxx ctermfg=31 guifg=#1177aa
		DevIconLocalization({ fg = "#2596be" }), -- DevIconLocalization xxx ctermfg=31 guifg=#2596be
		DevIconApp({ fg = "#9f0500" }), -- DevIconApp     xxx ctermfg=124 guifg=#9f0500
		DevIconapk({ fg = "#34a853" }), -- DevIconapk     xxx ctermfg=35 guifg=#34a853
		DevIconPhp({ fg = "#a074c4" }), -- DevIconPhp     xxx ctermfg=140 guifg=#a074c4
		DevIconMonkeysAudio({ fg = "#00afff" }), -- DevIconMonkeysAudio xxx ctermfg=39 guifg=#00afff
		DevIconAudioInterchangeFileFormat({ fg = "#00afff" }), -- DevIconAudioInterchangeFileFormat xxx ctermfg=39 guifg=#00afff
		DevIcon3DObjectFile({ fg = "#888888" }), -- DevIcon3DObjectFile xxx ctermfg=102 guifg=#888888
		DevIconMakefile({ fg = "#6d8086" }), -- DevIconMakefile xxx ctermfg=66 guifg=#6d8086
		DevIconOrgMode({ fg = "#77aa99" }), -- DevIconOrgMode xxx ctermfg=73 guifg=#77aa99
		DevIconGCode({ fg = "#1471ad" }), -- DevIconGCode   xxx ctermfg=32 guifg=#1471ad
		DevIconXSettingsdConf({ fg = "#e54d18" }), -- DevIconXSettingsdConf xxx ctermfg=196 guifg=#e54d18
		DevIconxmonad({ fg = "#fd4d5d" }), -- DevIconxmonad  xxx ctermfg=203 guifg=#fd4d5d
		DevIconFIGletFontFormat({ fg = "#ececec" }), -- DevIconFIGletFontFormat xxx ctermfg=255 guifg=#ececec
		DevIconFIGletFontControl({ fg = "#ececec" }), -- DevIconFIGletFontControl xxx ctermfg=255 guifg=#ececec
		DevIconVLC({ fg = "#ee7a00" }), -- DevIconVLC     xxx ctermfg=208 guifg=#ee7a00
		DevIconFdmdownload({ fg = "#44cda8" }), -- DevIconFdmdownload xxx ctermfg=43 guifg=#44cda8
		DevIconSml({ fg = "#e37933" }), -- DevIconSml     xxx ctermfg=166 guifg=#e37933
		DevIconAlpine({ fg = "#0d597f" }), -- DevIconAlpine  xxx ctermfg=24 guifg=#0d597f
		DevIconFreeCAD({ fg = "#cb0d0d" }), -- DevIconFreeCAD xxx ctermfg=160 guifg=#cb0d0d
		DevIconNix({ fg = "#7ebae4" }), -- DevIconNix     xxx ctermfg=110 guifg=#7ebae4
		DevIconTailwindConfig({ fg = "#20c2e3" }), -- DevIconTailwindConfig xxx ctermfg=45 guifg=#20c2e3
		DevIconKiCadSymbolTable({ fg = "#ffffff" }), -- DevIconKiCadSymbolTable xxx ctermfg=231 guifg=#ffffff
		DevIconFusion360({ fg = "#839463" }), -- DevIconFusion360 xxx ctermfg=101 guifg=#839463
		DevIconNim({ fg = "#f3d400" }), -- DevIconNim     xxx ctermfg=220 guifg=#f3d400
		DevIconSvelteConfig({ fg = "#ff3e00" }), -- DevIconSvelteConfig xxx ctermfg=196 guifg=#ff3e00
		DevIconRakefile({ fg = "#701516" }), -- DevIconRakefile xxx ctermfg=52 guifg=#701516
		sym("DevIconPy.typed")({ fg = "#ffbc03" }), -- DevIconPy.typed xxx ctermfg=214 guifg=#ffbc03
		DevIconPrusaSlicer({ fg = "#ec6b23" }), -- DevIconPrusaSlicer xxx ctermfg=202 guifg=#ec6b23
		DevIconEmbeddedOpenTypeFont({ fg = "#ececec" }), -- DevIconEmbeddedOpenTypeFont xxx ctermfg=255 guifg=#ececec
		DevIconElisp({ fg = "#8172be" }), -- DevIconElisp   xxx ctermfg=97 guifg=#8172be
		DevIconPlatformio({ fg = "#f6822b" }), -- DevIconPlatformio xxx ctermfg=208 guifg=#f6822b
		DevIconPackageLockJson({ fg = "#7a0d21" }), -- DevIconPackageLockJson xxx ctermfg=52 guifg=#7a0d21
		DevIconEbook({ fg = "#eab16d" }), -- DevIconEbook   xxx ctermfg=215 guifg=#eab16d
		DevIconAutoCADDxf({ fg = "#839463" }), -- DevIconAutoCADDxf xxx ctermfg=101 guifg=#839463
		DevIconAutoCADDwg({ fg = "#839463" }), -- DevIconAutoCADDwg xxx ctermfg=101 guifg=#839463
		DevIconLuau({ fg = "#00a2ff" }), -- DevIconLuau    xxx ctermfg=75 guifg=#00a2ff
		DevIconSass({ fg = "#f55385" }), -- DevIconSass    xxx ctermfg=204 guifg=#f55385
		DevIconLXQtConfigFile({ fg = "#0192d3" }), -- DevIconLXQtConfigFile xxx ctermfg=32 guifg=#0192d3
		DevIconLXDEConfigFile({ fg = "#909090" }), -- DevIconLXDEConfigFile xxx ctermfg=246 guifg=#909090
		DevIconKritarc({ fg = "#f245fb" }), -- DevIconKritarc xxx ctermfg=201 guifg=#f245fb
		DevIconLiquid({ fg = "#95bf47" }), -- DevIconLiquid  xxx ctermfg=106 guifg=#95bf47
		DevIconKritadisplayrc({ fg = "#f245fb" }), -- DevIconKritadisplayrc xxx ctermfg=201 guifg=#f245fb
		DevIconKdenliverc({ fg = "#83b8f2" }), -- DevIconKdenliverc xxx ctermfg=110 guifg=#83b8f2
		DevIconKdenliveLayoutsrc({ fg = "#83b8f2" }), -- DevIconKdenliveLayoutsrc xxx ctermfg=110 guifg=#83b8f2
		DevIconKDEglobals({ fg = "#1c99f3" }), -- DevIconKDEglobals xxx ctermfg=32 guifg=#1c99f3
		DevIconKalgebrarc({ fg = "#1c99f3" }), -- DevIconKalgebrarc xxx ctermfg=32 guifg=#1c99f3
		DevIconJustfile({ fg = "#6d8086" }), -- DevIconJustfile xxx ctermfg=66 guifg=#6d8086
		DevIconCantorrc({ fg = "#1c99f3" }), -- DevIconCantorrc xxx ctermfg=32 guifg=#1c99f3
		DevIconGulpfile({ fg = "#cc3e44" }), -- DevIconGulpfile xxx ctermfg=167 guifg=#cc3e44
		DevIconGruntfile({ fg = "#e37933" }), -- DevIconGruntfile xxx ctermfg=166 guifg=#e37933
		DevIconConfigRu({ fg = "#701516" }), -- DevIconConfigRu xxx ctermfg=52 guifg=#701516
		DevIconGradleWrapperProperties({ fg = "#005f87" }), -- DevIconGradleWrapperProperties xxx ctermfg=24 guifg=#005f87
		DevIconZshrc({ fg = "#89e051" }), -- DevIconZshrc   xxx ctermfg=113 guifg=#89e051
		DevIconXInitrc({ fg = "#e54d18" }), -- DevIconXInitrc xxx ctermfg=196 guifg=#e54d18
		DevIconGradleProperties({ fg = "#005f87" }), -- DevIconGradleProperties xxx ctermfg=24 guifg=#005f87
		DevIconNPMIgnore({ fg = "#e8274b" }), -- DevIconNPMIgnore xxx ctermfg=197 guifg=#e8274b
		DevIconMailmap({ fg = "#41535b" }), -- DevIconMailmap xxx ctermfg=239 guifg=#41535b
		DevIconFreeCADConfig({ fg = "#cb0d0d" }), -- DevIconFreeCADConfig xxx ctermfg=160 guifg=#cb0d0d
		DevIconBashrc({ fg = "#89e051" }), -- DevIconBashrc  xxx ctermfg=113 guifg=#89e051
		DevIconBashProfile({ fg = "#89e051" }), -- DevIconBashProfile xxx ctermfg=113 guifg=#89e051
		DevIconStp({ fg = "#839463" }), -- DevIconStp     xxx ctermfg=101 guifg=#839463
		DevIconXlsx({ fg = "#207245" }), -- DevIconXlsx    xxx ctermfg=29 guifg=#207245
		DevIconXls({ fg = "#207245" }), -- DevIconXls     xxx ctermfg=29 guifg=#207245
		DevIconJava({ fg = "#cc3e44" }), -- DevIconJava    xxx ctermfg=167 guifg=#cc3e44
		DevIconTempl({ fg = "#dbbd30" }), -- DevIconTempl   xxx ctermfg=178 guifg=#dbbd30
		DevIconSsa({ fg = "#ffb713" }), -- DevIconSsa     xxx ctermfg=214 guifg=#ffb713
		DevIconPpt({ fg = "#cb4a32" }), -- DevIconPpt     xxx ctermfg=160 guifg=#cb4a32
		DevIconSrt({ fg = "#ffb713" }), -- DevIconSrt     xxx ctermfg=214 guifg=#ffb713
		DevIconExe({ fg = "#9f0500" }), -- DevIconExe     xxx ctermfg=124 guifg=#9f0500
		DevIconIni({ fg = "#6d8086" }), -- DevIconIni     xxx ctermfg=66 guifg=#6d8086
		DevIconZst({ fg = "#eca517" }), -- DevIconZst     xxx ctermfg=214 guifg=#eca517
		DevIconXz({ fg = "#eca517" }), -- DevIconXz      xxx ctermfg=214 guifg=#eca517
		DevIconTxz({ fg = "#eca517" }), -- DevIconTxz     xxx ctermfg=214 guifg=#eca517
		DevIconTgz({ fg = "#eca517" }), -- DevIconTgz     xxx ctermfg=214 guifg=#eca517
		DevIconRar({ fg = "#eca517" }), -- DevIconRar     xxx ctermfg=214 guifg=#eca517
		DevIconHurl({ fg = "#ff0288" }), -- DevIconHurl    xxx ctermfg=198 guifg=#ff0288
		DevIconBz3({ fg = "#eca517" }), -- DevIconBz3     xxx ctermfg=214 guifg=#eca517
		DevIconBz2({ fg = "#eca517" }), -- DevIconBz2     xxx ctermfg=214 guifg=#eca517
		DevIconBz({ fg = "#eca517" }), -- DevIconBz      xxx ctermfg=214 guifg=#eca517
		DevIcon7z({ fg = "#eca517" }), -- DevIcon7z      xxx ctermfg=214 guifg=#eca517
		DevIconWebp({ fg = "#a074c4" }), -- DevIconWebp    xxx ctermfg=140 guifg=#a074c4
		DevIconPng({ fg = "#a074c4" }), -- DevIconPng     xxx ctermfg=140 guifg=#a074c4
		DevIconJpg({ fg = "#a074c4" }), -- DevIconJpg     xxx ctermfg=140 guifg=#a074c4
		DevIconJpeg({ fg = "#a074c4" }), -- DevIconJpeg    xxx ctermfg=140 guifg=#a074c4
		DevIconGif({ fg = "#a074c4" }), -- DevIconGif     xxx ctermfg=140 guifg=#a074c4
		DevIconBmp({ fg = "#a074c4" }), -- DevIconBmp     xxx ctermfg=140 guifg=#a074c4
		DevIconWindowsMediaAudio({ fg = "#00afff" }), -- DevIconWindowsMediaAudio xxx ctermfg=39 guifg=#00afff
		DevIconWaveformAudioFile({ fg = "#00afff" }), -- DevIconWaveformAudioFile xxx ctermfg=39 guifg=#00afff
		DevIconOggVorbis({ fg = "#0075aa" }), -- DevIconOggVorbis xxx ctermfg=24 guifg=#0075aa
		DevIconMPEGAudioLayerIII({ fg = "#00afff" }), -- DevIconMPEGAudioLayerIII xxx ctermfg=39 guifg=#00afff
		DevIconMPEG4({ fg = "#00afff" }), -- DevIconMPEG4   xxx ctermfg=39 guifg=#00afff
		DevIconFreeLosslessAudioCodec({ fg = "#0075aa" }), -- DevIconFreeLosslessAudioCodec xxx ctermfg=24 guifg=#0075aa
		DevIconAdvancedAudioCoding({ fg = "#00afff" }), -- DevIconAdvancedAudioCoding xxx ctermfg=39 guifg=#00afff
		DevIconNodeModules({ fg = "#e8274b" }), -- DevIconNodeModules xxx ctermfg=197 guifg=#e8274b
		DevIconPackageJson({ fg = "#e8274b" }), -- DevIconPackageJson xxx ctermfg=197 guifg=#e8274b
		DevIconMOV({ fg = "#fd971f" }), -- DevIconMOV     xxx ctermfg=208 guifg=#fd971f
		DevIconMkv({ fg = "#fd971f" }), -- DevIconMkv     xxx ctermfg=208 guifg=#fd971f
		DevIconCMake({ fg = "#6d8086" }), -- DevIconCMake   xxx ctermfg=66 guifg=#6d8086
		DevIcon3gp({ fg = "#fd971f" }), -- DevIcon3gp     xxx ctermfg=208 guifg=#fd971f
		DevIconRs({ fg = "#dea584" }), -- DevIconRs      xxx ctermfg=216 guifg=#dea584
		DevIconTypeScriptReactSpec({ fg = "#1354bf" }), -- DevIconTypeScriptReactSpec xxx ctermfg=26 guifg=#1354bf
		DevIconSolidity({ fg = "#519aba" }), -- DevIconSolidity xxx ctermfg=74 guifg=#519aba
		DevIconRb({ fg = "#701516" }), -- DevIconRb      xxx ctermfg=52 guifg=#701516
		DevIconJavaScriptReactSpec({ fg = "#20c2e3" }), -- DevIconJavaScriptReactSpec xxx ctermfg=45 guifg=#20c2e3
		DevIconPy({ fg = "#ffbc03" }), -- DevIconPy      xxx ctermfg=214 guifg=#ffbc03
		DevIconXresources({ fg = "#e54d18" }), -- DevIconXresources xxx ctermfg=196 guifg=#e54d18
		DevIconClojure({ fg = "#8dc149" }), -- DevIconClojure xxx ctermfg=113 guifg=#8dc149
		DevIconDoc({ fg = "#185abd" }), -- DevIconDoc     xxx ctermfg=26 guifg=#185abd
		DevIconErl({ fg = "#b83998" }), -- DevIconErl     xxx ctermfg=163 guifg=#b83998
		DevIconMl({ fg = "#e37933" }), -- DevIconMl      xxx ctermfg=166 guifg=#e37933
		DevIconMd({ fg = "#dddddd" }), -- DevIconMd      xxx ctermfg=253 guifg=#dddddd
		DevIconKotlin({ fg = "#7f52ff" }), -- DevIconKotlin  xxx ctermfg=99 guifg=#7f52ff
		DevIconJs({ fg = "#cbcb41" }), -- DevIconJs      xxx ctermfg=185 guifg=#cbcb41
		DevIconSolveSpace({ fg = "#839463" }), -- DevIconSolveSpace xxx ctermfg=101 guifg=#839463
		DevIconHtm({ fg = "#e34c26" }), -- DevIconHtm     xxx ctermfg=196 guifg=#e34c26
		DevIconHs({ fg = "#a074c4" }), -- DevIconHs      xxx ctermfg=140 guifg=#a074c4
		DevIconFennel({ fg = "#fff3d7" }), -- DevIconFennel  xxx ctermfg=230 guifg=#fff3d7
		DevIconFortran({ fg = "#734f96" }), -- DevIconFortran xxx ctermfg=97 guifg=#734f96
		DevIconExs({ fg = "#a074c4" }), -- DevIconExs     xxx ctermfg=140 guifg=#a074c4
		DevIconcuda({ fg = "#89e051" }), -- DevIconcuda    xxx ctermfg=113 guifg=#89e051
		DevIconSketchUp({ fg = "#839463" }), -- DevIconSketchUp xxx ctermfg=101 guifg=#839463
		DevIconSha512({ fg = "#8c86af" }), -- DevIconSha512  xxx ctermfg=103 guifg=#8c86af
		DevIconSha384({ fg = "#8c86af" }), -- DevIconSha384  xxx ctermfg=103 guifg=#8c86af
		DevIconSha224({ fg = "#8c86af" }), -- DevIconSha224  xxx ctermfg=103 guifg=#8c86af
		DevIconSha1({ fg = "#8c86af" }), -- DevIconSha1    xxx ctermfg=103 guifg=#8c86af
		DevIconBSPWM({ fg = "#2f2f2f" }), -- DevIconBSPWM   xxx ctermfg=236 guifg=#2f2f2f
		DevIconLib({ fg = "#4d2c0b" }), -- DevIconLib     xxx ctermfg=52 guifg=#4d2c0b
		DevIconXfce({ fg = "#00aadf" }), -- DevIconXfce    xxx ctermfg=74 guifg=#00aadf
		DevIconSha256({ fg = "#8c86af" }), -- DevIconSha256  xxx ctermfg=103 guifg=#8c86af
		DevIconKDEPlasma({ fg = "#1b89f4" }), -- DevIconKDEPlasma xxx ctermfg=33 guifg=#1b89f4
		DevIconMATE({ fg = "#9bda5c" }), -- DevIconMATE    xxx ctermfg=113 guifg=#9bda5c
		DevIconLhs({ fg = "#a074c4" }), -- DevIconLhs     xxx ctermfg=140 guifg=#a074c4
		DevIconD({ fg = "#427819" }), -- DevIconD       xxx ctermfg=28 guifg=#427819
		DevIconLXQt({ fg = "#0191d2" }), -- DevIconLXQt    xxx ctermfg=32 guifg=#0191d2
		DevIconLuaurc({ fg = "#00a2ff" }), -- DevIconLuaurc  xxx ctermfg=75 guifg=#00a2ff
		DevIconGNOME({ fg = "#ffffff" }), -- DevIconGNOME   xxx ctermfg=231 guifg=#ffffff
		DevIconEslintrc({ fg = "#4b32c3" }), -- DevIconEslintrc xxx ctermfg=56 guifg=#4b32c3
		DevIconBabelrc({ fg = "#cbcb41" }), -- DevIconBabelrc xxx ctermfg=185 guifg=#cbcb41
		DevIconPrettierConfig({ fg = "#4285f4" }), -- DevIconPrettierConfig xxx ctermfg=33 guifg=#4285f4
		DevIconBudgie({ fg = "#4e5361" }), -- DevIconBudgie  xxx ctermfg=240 guifg=#4e5361
		DevIconR({ fg = "#2266ba" }), -- DevIconR       xxx ctermfg=25 guifg=#2266ba
		DevIconZorin({ fg = "#14a1e8" }), -- DevIconZorin   xxx ctermfg=39 guifg=#14a1e8
		DevIconIso({ fg = "#d0bec8" }), -- DevIconIso     xxx ctermfg=181 guifg=#d0bec8
		DevIconXeroLinux({ fg = "#888fe2" }), -- DevIconXeroLinux xxx ctermfg=104 guifg=#888fe2
		DevIconVanillaOS({ fg = "#fabd4d" }), -- DevIconVanillaOS xxx ctermfg=214 guifg=#fabd4d
		DevIconCache({ fg = "#ffffff" }), -- DevIconCache   xxx ctermfg=231 guifg=#ffffff
		DevIconTrisquelGNULinux({ fg = "#0f58b6" }), -- DevIconTrisquelGNULinux xxx ctermfg=25 guifg=#0f58b6
		DevIconSharedObject({ fg = "#dcddd6" }), -- DevIconSharedObject xxx ctermfg=253 guifg=#dcddd6
		DevIconDll({ fg = "#4d2c0b" }), -- DevIconDll     xxx ctermfg=52 guifg=#4d2c0b
		DevIconSolus({ fg = "#4b5163" }), -- DevIconSolus   xxx ctermfg=239 guifg=#4b5163
		DevIconSlackware({ fg = "#475fa9" }), -- DevIconSlackware xxx ctermfg=61 guifg=#475fa9
		DevIconSabayon({ fg = "#c6c6c6" }), -- DevIconSabayon xxx ctermfg=251 guifg=#c6c6c6
		DevIconGradleWrapperScript({ fg = "#005f87" }), -- DevIconGradleWrapperScript xxx ctermfg=24 guifg=#005f87
		DevIconRockyLinux({ fg = "#0fb37d" }), -- DevIconRockyLinux xxx ctermfg=36 guifg=#0fb37d
		DevIconHeex({ fg = "#a074c4" }), -- DevIconHeex    xxx ctermfg=140 guifg=#a074c4
		DevIconBazelBuild({ fg = "#89e051" }), -- DevIconBazelBuild xxx ctermfg=113 guifg=#89e051
		DevIconQubesOS({ fg = "#3774d8" }), -- DevIconQubesOS xxx ctermfg=33 guifg=#3774d8
		DevIconHtml({ fg = "#e44d26" }), -- DevIconHtml    xxx ctermfg=196 guifg=#e44d26
		DevIconMarkdown({ fg = "#dddddd" }), -- DevIconMarkdown xxx ctermfg=253 guifg=#dddddd
		DevIconPuppyLinux({ fg = "#a2aeb9" }), -- DevIconPuppyLinux xxx ctermfg=145 guifg=#a2aeb9
		DevIconCxx({ fg = "#519aba" }), -- DevIconCxx     xxx ctermfg=74 guifg=#519aba
		DevIconpostmarketOS({ fg = "#009900" }), -- DevIconpostmarketOS xxx ctermfg=28 guifg=#009900
		DevIconGroovy({ fg = "#4a687c" }), -- DevIconGroovy  xxx ctermfg=24 guifg=#4a687c
		DevIconPop_OS({ fg = "#48b9c7" }), -- DevIconPop_OS  xxx ctermfg=73 guifg=#48b9c7
		DevIconUbuntu({ fg = "#dd4814" }), -- DevIconUbuntu  xxx ctermfg=196 guifg=#dd4814
		DevIconCentos({ fg = "#a2518d" }), -- DevIconCentos  xxx ctermfg=132 guifg=#a2518d
		DevIconParrot({ fg = "#54deff" }), -- DevIconParrot  xxx ctermfg=45 guifg=#54deff
		DevIconYaml({ fg = "#6d8086" }), -- DevIconYaml    xxx ctermfg=66 guifg=#6d8086
		DevIconCPlusPlus({ fg = "#f34b7d" }), -- DevIconCPlusPlus xxx ctermfg=204 guifg=#f34b7d
		DevIconParabolaGNULinuxLibre({ fg = "#797dac" }), -- DevIconParabolaGNULinuxLibre xxx ctermfg=103 guifg=#797dac
		DevIconZig({ fg = "#f69a1b" }), -- DevIconZig     xxx ctermfg=172 guifg=#f69a1b
		DevIconopenSUSE({ fg = "#6fb424" }), -- DevIconopenSUSE xxx ctermfg=70 guifg=#6fb424
		DevIconPatch({ fg = "#41535b" }), -- DevIconPatch   xxx ctermfg=239 guifg=#41535b
		DevIconMXLinux({ fg = "#ffffff" }), -- DevIconMXLinux xxx ctermfg=231 guifg=#ffffff
		DevIconDiff({ fg = "#41535b" }), -- DevIconDiff    xxx ctermfg=239 guifg=#41535b
		DevIconOpenBSD({ fg = "#f2ca30" }), -- DevIconOpenBSD xxx ctermfg=220 guifg=#f2ca30
		DevIconZip({ fg = "#eca517" }), -- DevIconZip     xxx ctermfg=214 guifg=#eca517
		DevIconMageia({ fg = "#2397d4" }), -- DevIconMageia  xxx ctermfg=67 guifg=#2397d4
		DevIconJson({ fg = "#cbcb41" }), -- DevIconJson    xxx ctermfg=185 guifg=#cbcb41
		DevIconVim({ fg = "#019833" }), -- DevIconVim     xxx ctermfg=28 guifg=#019833
		DevIconLXLE({ fg = "#474747" }), -- DevIconLXLE    xxx ctermfg=238 guifg=#474747
		DevIconInfo({ fg = "#ffffcd" }), -- DevIconInfo    xxx ctermfg=230 guifg=#ffffcd
		DevIconLocOS({ fg = "#fab402" }), -- DevIconLocOS   xxx ctermfg=214 guifg=#fab402
		DevIconKubuntu({ fg = "#007ac2" }), -- DevIconKubuntu xxx ctermfg=32 guifg=#007ac2
		DevIconKDEneon({ fg = "#20a6a4" }), -- DevIconKDEneon xxx ctermfg=37 guifg=#20a6a4
		DevIconLua({ fg = "#51a0cf" }), -- DevIconLua     xxx ctermfg=74 guifg=#51a0cf
		DevIconKali({ fg = "#2777ff" }), -- DevIconKali    xxx ctermfg=69 guifg=#2777ff
		DevIconIllumos({ fg = "#ff430f" }), -- DevIconIllumos xxx ctermfg=196 guifg=#ff430f
		DevIconPub({ fg = "#e3c58e" }), -- DevIconPub     xxx ctermfg=222 guifg=#e3c58e
		DevIconHyperbolaGNULinuxLibre({ fg = "#c0c0c0" }), -- DevIconHyperbolaGNULinuxLibre xxx ctermfg=250 guifg=#c0c0c0
		DevIconFish({ fg = "#4d5a5e" }), -- DevIconFish    xxx ctermfg=240 guifg=#4d5a5e
		DevIconGuix({ fg = "#ffcc00" }), -- DevIconGuix    xxx ctermfg=220 guifg=#ffcc00
		DevIconFs({ fg = "#519aba" }), -- DevIconFs      xxx ctermfg=74 guifg=#519aba
		DevIconGarudaLinux({ fg = "#2974e1" }), -- DevIconGarudaLinux xxx ctermfg=33 guifg=#2974e1
		DevIconScalaScript({ fg = "#cc3e44" }), -- DevIconScalaScript xxx ctermfg=167 guifg=#cc3e44
		DevIconElementary({ fg = "#5890c2" }), -- DevIconElementary xxx ctermfg=67 guifg=#5890c2
		DevIconVerilog({ fg = "#019833" }), -- DevIconVerilog xxx ctermfg=28 guifg=#019833
		DevIconTor({ fg = "#519aba" }), -- DevIconTor     xxx ctermfg=74 guifg=#519aba
		DevIconDevuan({ fg = "#404a52" }), -- DevIconDevuan  xxx ctermfg=238 guifg=#404a52
		DevIconElm({ fg = "#519aba" }), -- DevIconElm     xxx ctermfg=74 guifg=#519aba
		DevIconPulseCodeModulation({ fg = "#0075aa" }), -- DevIconPulseCodeModulation xxx ctermfg=24 guifg=#0075aa
		DevIconXml({ fg = "#e37933" }), -- DevIconXml     xxx ctermfg=166 guifg=#e37933
		DevIconC({ fg = "#599eff" }), -- DevIconC       xxx ctermfg=111 guifg=#599eff
		DevIconM3u8({ fg = "#ed95ae" }), -- DevIconM3u8    xxx ctermfg=211 guifg=#ed95ae
		DevIconEx({ fg = "#a074c4" }), -- DevIconEx      xxx ctermfg=140 guifg=#a074c4
		DevIconPl({ fg = "#519aba" }), -- DevIconPl      xxx ctermfg=74 guifg=#519aba
		DevIconTypeScript({ fg = "#519aba" }), -- DevIconTypeScript xxx ctermfg=74 guifg=#519aba
		DevIconPart({ fg = "#44cda8" }), -- DevIconPart    xxx ctermfg=43 guifg=#44cda8
		DevIconNswag({ fg = "#85ea2d" }), -- DevIconNswag   xxx ctermfg=112 guifg=#85ea2d
		DevIconHbs({ fg = "#f0772b" }), -- DevIconHbs     xxx ctermfg=202 guifg=#f0772b
		DevIconNfo({ fg = "#ffffcd" }), -- DevIconNfo     xxx ctermfg=230 guifg=#ffffcd
		DevIconConfiguration({ fg = "#6d8086" }), -- DevIconConfiguration xxx ctermfg=66 guifg=#6d8086
		DevIconPsScriptfile({ fg = "#4273ca" }), -- DevIconPsScriptfile xxx ctermfg=68 guifg=#4273ca
		DevIconGraphQL({ fg = "#e535ab" }), -- DevIconGraphQL xxx ctermfg=199 guifg=#e535ab
		DevIconLinux({ fg = "#fdfdfb" }), -- DevIconLinux   xxx ctermfg=231 guifg=#fdfdfb
		DevIconBin({ fg = "#9f0500" }), -- DevIconBin     xxx ctermfg=124 guifg=#9f0500
		DevIconVala({ fg = "#7239b3" }), -- DevIconVala    xxx ctermfg=91 guifg=#7239b3
		DevIconMobi({ fg = "#eab16d" }), -- DevIconMobi    xxx ctermfg=215 guifg=#eab16d
		DevIconVlang({ fg = "#5d87bf" }), -- DevIconVlang   xxx ctermfg=67 guifg=#5d87bf
		DevIconHrl({ fg = "#b83998" }), -- DevIconHrl     xxx ctermfg=163 guifg=#b83998
		DevIconBicepParameters({ fg = "#9f74b3" }), -- DevIconBicepParameters xxx ctermfg=133 guifg=#9f74b3
		DevIconEpp({ fg = "#ffa61a" }), -- DevIconEpp     xxx ctermfg=214 guifg=#ffa61a
		DevIconDart({ fg = "#03589c" }), -- DevIconDart    xxx ctermfg=25 guifg=#03589c
		DevIconMts({ fg = "#519aba" }), -- DevIconMts     xxx ctermfg=74 guifg=#519aba
		DevIconAi({ fg = "#cbcb41" }), -- DevIconAi      xxx ctermfg=185 guifg=#cbcb41
		DevIconCsv({ fg = "#89e051" }), -- DevIconCsv     xxx ctermfg=113 guifg=#89e051
		DevIconVHDL({ fg = "#019833" }), -- DevIconVHDL    xxx ctermfg=28 guifg=#019833
		DevIconAsciinema({ fg = "#fd971f" }), -- DevIconAsciinema xxx ctermfg=208 guifg=#fd971f
		DevIconMd5({ fg = "#8c86af" }), -- DevIconMd5     xxx ctermfg=103 guifg=#8c86af
		DevIconZsh({ fg = "#89e051" }), -- DevIconZsh     xxx ctermfg=113 guifg=#89e051
		DevIconBat({ fg = "#c1f12e" }), -- DevIconBat     xxx ctermfg=191 guifg=#c1f12e
		DevIconMagnet({ fg = "#a51b16" }), -- DevIconMagnet  xxx ctermfg=124 guifg=#a51b16
		DevIconTwig({ fg = "#8dc149" }), -- DevIconTwig    xxx ctermfg=113 guifg=#8dc149
		DevIconTsx({ fg = "#1354bf" }), -- DevIconTsx     xxx ctermfg=26 guifg=#1354bf
		DevIconcudah({ fg = "#a074c4" }), -- DevIconcudah   xxx ctermfg=140 guifg=#a074c4
		DevIconBlender({ fg = "#ea7600" }), -- DevIconBlender xxx ctermfg=208 guifg=#ea7600
		DevIconSln({ fg = "#854cc7" }), -- DevIconSln     xxx ctermfg=98 guifg=#854cc7
		DevIconRazorPage({ fg = "#512bd4" }), -- DevIconRazorPage xxx ctermfg=56 guifg=#512bd4
		DevIconCxxm({ fg = "#519aba" }), -- DevIconCxxm    xxx ctermfg=74 guifg=#519aba
		DevIconUI({ fg = "#0c306e" }), -- DevIconUI      xxx ctermfg=17 guifg=#0c306e
		DevIconCPlusPlusModule({ fg = "#f34b7d" }), -- DevIconCPlusPlusModule xxx ctermfg=204 guifg=#f34b7d
		DevIconHpp({ fg = "#a074c4" }), -- DevIconHpp     xxx ctermfg=140 guifg=#a074c4
		DevIconBibTeX({ fg = "#cbcb41" }), -- DevIconBibTeX  xxx ctermfg=185 guifg=#cbcb41
		DevIconCpp({ fg = "#519aba" }), -- DevIconCpp     xxx ctermfg=74 guifg=#519aba
		DevIconGodotTextScene({ fg = "#6d8086" }), -- DevIconGodotTextScene xxx ctermfg=66 guifg=#6d8086
		DevIconHh({ fg = "#a074c4" }), -- DevIconHh      xxx ctermfg=140 guifg=#a074c4
		DevIconVoid({ fg = "#295340" }), -- DevIconVoid    xxx ctermfg=23 guifg=#295340
		DevIconFsx({ fg = "#519aba" }), -- DevIconFsx     xxx ctermfg=74 guifg=#519aba
		DevIconSh({ fg = "#4d5a5e" }), -- DevIconSh      xxx ctermfg=240 guifg=#4d5a5e
		DevIconPls({ fg = "#ed95ae" }), -- DevIconPls     xxx ctermfg=211 guifg=#ed95ae
		DevIconAwk({ fg = "#4d5a5e" }), -- DevIconAwk     xxx ctermfg=240 guifg=#4d5a5e
		DevIconKrita({ fg = "#f245fb" }), -- DevIconKrita   xxx ctermfg=201 guifg=#f245fb
		DevIconClojureJS({ fg = "#519aba" }), -- DevIconClojureJS xxx ctermfg=74 guifg=#519aba
		DevIconClojureC({ fg = "#8dc149" }), -- DevIconClojureC xxx ctermfg=113 guifg=#8dc149
		DevIconTerraform({ fg = "#5f43e9" }), -- DevIconTerraform xxx ctermfg=93 guifg=#5f43e9
		DevIconH({ fg = "#a074c4" }), -- DevIconH       xxx ctermfg=140 guifg=#a074c4
		DevIconScheme({ fg = "#eeeeee" }), -- DevIconScheme  xxx ctermfg=255 guifg=#eeeeee
		DevIconRedhat({ fg = "#ee0000" }), -- DevIconRedhat  xxx ctermfg=196 guifg=#ee0000
		DevIconWindows({ fg = "#00a4ef" }), -- DevIconWindows xxx ctermfg=39 guifg=#00a4ef
		DevIconRaspberryPiOS({ fg = "#be1848" }), -- DevIconRaspberryPiOS xxx ctermfg=161 guifg=#be1848
		DevIconSvg({ fg = "#ffb13b" }), -- DevIconSvg     xxx ctermfg=214 guifg=#ffb13b
		DevIconCrystalLinux({ fg = "#a900ff" }), -- DevIconCrystalLinux xxx ctermfg=129 guifg=#a900ff
		DevIconBoundaryRepresentation({ fg = "#839463" }), -- DevIconBoundaryRepresentation xxx ctermfg=101 guifg=#839463
		DevIconNushell({ fg = "#3aa675" }), -- DevIconNushell xxx ctermfg=36 guifg=#3aa675
		DevIconManjaro({ fg = "#33b959" }), -- DevIconManjaro xxx ctermfg=35 guifg=#33b959
		DevIconBazel({ fg = "#89e051" }), -- DevIconBazel   xxx ctermfg=113 guifg=#89e051
		DevIconBlueprint({ fg = "#5796e2" }), -- DevIconBlueprint xxx ctermfg=68 guifg=#5796e2
		DevIconJsx({ fg = "#20c2e3" }), -- DevIconJsx     xxx ctermfg=45 guifg=#20c2e3
		DevIconBigLinux({ fg = "#189fc8" }), -- DevIconBigLinux xxx ctermfg=38 guifg=#189fc8
		DevIconGo({ fg = "#519aba" }), -- DevIconGo      xxx ctermfg=74 guifg=#519aba
		DevIconGentoo({ fg = "#b1abce" }), -- DevIconGentoo  xxx ctermfg=146 guifg=#b1abce
		DevIconErb({ fg = "#701516" }), -- DevIconErb     xxx ctermfg=52 guifg=#701516
		DevIconDot({ fg = "#30638e" }), -- DevIconDot     xxx ctermfg=24 guifg=#30638e
		DevIconFedora({ fg = "#072a5e" }), -- DevIconFedora  xxx ctermfg=17 guifg=#072a5e
		DevIconDebian({ fg = "#a80030" }), -- DevIconDebian  xxx ctermfg=88 guifg=#a80030
		DevIconArcoLinux({ fg = "#6690eb" }), -- DevIconArcoLinux xxx ctermfg=68 guifg=#6690eb
		DevIconAndroid({ fg = "#34a853" }), -- DevIconAndroid xxx ctermfg=35 guifg=#34a853
		DevIconArchlabs({ fg = "#503f42" }), -- DevIconArchlabs xxx ctermfg=238 guifg=#503f42
		DevIconArchcraft({ fg = "#86bba3" }), -- DevIconArchcraft xxx ctermfg=108 guifg=#86bba3
		DevIconTmux({ fg = "#14ba19" }), -- DevIconTmux    xxx ctermfg=34 guifg=#14ba19
		DevIconQuery({ fg = "#90a850" }), -- DevIconQuery   xxx ctermfg=107 guifg=#90a850
		DevIconReScriptInterface({ fg = "#f55385" }), -- DevIconReScriptInterface xxx ctermfg=204 guifg=#f55385
		DevIconAOSC({ fg = "#c00000" }), -- DevIconAOSC    xxx ctermfg=124 guifg=#c00000
		DevIconTcl({ fg = "#1e5cb3" }), -- DevIconTcl     xxx ctermfg=25 guifg=#1e5cb3
		DevIconYml({ fg = "#6d8086" }), -- DevIconYml     xxx ctermfg=66 guifg=#6d8086
		DevIconSystemVerilog({ fg = "#019833" }), -- DevIconSystemVerilog xxx ctermfg=28 guifg=#019833
		DevIconSwift({ fg = "#e37933" }), -- DevIconSwift   xxx ctermfg=166 guifg=#e37933
		DevIconCSharpProject({ fg = "#512bd4" }), -- DevIconCSharpProject xxx ctermfg=56 guifg=#512bd4
		DevIconLess({ fg = "#563d7c" }), -- DevIconLess    xxx ctermfg=54 guifg=#563d7c
		DevIconRss({ fg = "#fb9d3b" }), -- DevIconRss     xxx ctermfg=215 guifg=#fb9d3b
		DevIconXul({ fg = "#e37933" }), -- DevIconXul     xxx ctermfg=166 guifg=#e37933
		DevIconSql({ fg = "#dad8d8" }), -- DevIconSql     xxx ctermfg=188 guifg=#dad8d8
		DevIconCp({ fg = "#519aba" }), -- DevIconCp      xxx ctermfg=74 guifg=#519aba
		DevIconMpp({ fg = "#519aba" }), -- DevIconMpp     xxx ctermfg=74 guifg=#519aba
		DevIconGDScript({ fg = "#6d8086" }), -- DevIconGDScript xxx ctermfg=66 guifg=#6d8086
		DevIconGvimrc({ fg = "#019833" }), -- DevIconGvimrc  xxx ctermfg=28 guifg=#019833
		DevIconDropbox({ fg = "#0061fe" }), -- DevIconDropbox xxx ctermfg=27 guifg=#0061fe
		DevIconDeepin({ fg = "#2ca7f8" }), -- DevIconDeepin  xxx ctermfg=39 guifg=#2ca7f8
		DevIconTerminal({ fg = "#31b53e" }), -- DevIconTerminal xxx ctermfg=34 guifg=#31b53e
		DevIconLock({ fg = "#bbbbbb" }), -- DevIconLock    xxx ctermfg=250 guifg=#bbbbbb
		DevIconClojureDart({ fg = "#519aba" }), -- DevIconClojureDart xxx ctermfg=74 guifg=#519aba
		DevIconPm({ fg = "#519aba" }), -- DevIconPm      xxx ctermfg=74 guifg=#519aba
		DevIconConfig({ fg = "#6d8086" }), -- DevIconConfig  xxx ctermfg=66 guifg=#6d8086
		DevIconIco({ fg = "#cbcb41" }), -- DevIconIco     xxx ctermfg=185 guifg=#cbcb41
		DevIconZigObjectNotation({ fg = "#f69a1b" }), -- DevIconZigObjectNotation xxx ctermfg=172 guifg=#f69a1b
		DevIconHuff({ fg = "#4242c7" }), -- DevIconHuff    xxx ctermfg=56 guifg=#4242c7
		DevIconKbx({ fg = "#737672" }), -- DevIconKbx     xxx ctermfg=243 guifg=#737672
		DevIconScss({ fg = "#f55385" }), -- DevIconScss    xxx ctermfg=204 guifg=#f55385
		DevIconVagrantfile({ fg = "#1563ff" }), -- DevIconVagrantfile xxx ctermfg=27 guifg=#1563ff
		DevIconTex({ fg = "#3d6117" }), -- DevIconTex     xxx ctermfg=22 guifg=#3d6117
		DevIconKdb({ fg = "#529b34" }), -- DevIconKdb     xxx ctermfg=71 guifg=#529b34
		DevIconImg({ fg = "#d0bec8" }), -- DevIconImg     xxx ctermfg=181 guifg=#d0bec8
		DevIconXcLocalization({ fg = "#2596be" }), -- DevIconXcLocalization xxx ctermfg=31 guifg=#2596be
		DevIconMli({ fg = "#e37933" }), -- DevIconMli     xxx ctermfg=166 guifg=#e37933
		DevIconXorgConf({ fg = "#e54d18" }), -- DevIconXorgConf xxx ctermfg=196 guifg=#e54d18
		DevIconPackedResource({ fg = "#6d8086" }), -- DevIconPackedResource xxx ctermfg=66 guifg=#6d8086
		DevIconKdbx({ fg = "#529b34" }), -- DevIconKdbx    xxx ctermfg=71 guifg=#529b34
		DevIconPyo({ fg = "#ffe291" }), -- DevIconPyo     xxx ctermfg=222 guifg=#ffe291
		DevIconRproj({ fg = "#358a5b" }), -- DevIconRproj   xxx ctermfg=29 guifg=#358a5b
		DevIconTypoScriptSetup({ fg = "#ff8700" }), -- DevIconTypoScriptSetup xxx ctermfg=208 guifg=#ff8700
		DevIconKsh({ fg = "#4d5a5e" }), -- DevIconKsh     xxx ctermfg=240 guifg=#4d5a5e
		DevIconZshenv({ fg = "#89e051" }), -- DevIconZshenv  xxx ctermfg=113 guifg=#89e051
		DevIconWebpack({ fg = "#519aba" }), -- DevIconWebpack xxx ctermfg=74 guifg=#519aba
		DevIconFavicon({ fg = "#cbcb41" }), -- DevIconFavicon xxx ctermfg=185 guifg=#cbcb41
		DevIconElf({ fg = "#9f0500" }), -- DevIconElf     xxx ctermfg=124 guifg=#9f0500
		DevIconKiCad({ fg = "#ffffff" }), -- DevIconKiCad   xxx ctermfg=231 guifg=#ffffff
		DevIconKiCadCache({ fg = "#ffffff" }), -- DevIconKiCadCache xxx ctermfg=231 guifg=#ffffff
		DevIconSublime({ fg = "#e37933" }), -- DevIconSublime xxx ctermfg=166 guifg=#e37933
		DevIconHexadecimal({ fg = "#2e63ff" }), -- DevIconHexadecimal xxx ctermfg=27 guifg=#2e63ff
		DevIconMustache({ fg = "#e37933" }), -- DevIconMustache xxx ctermfg=166 guifg=#e37933
		DevIconObjectiveCPlusPlus({ fg = "#519aba" }), -- DevIconObjectiveCPlusPlus xxx ctermfg=74 guifg=#519aba
		DevIconRlib({ fg = "#dea584" }), -- DevIconRlib    xxx ctermfg=216 guifg=#dea584
		DevIconNPMrc({ fg = "#e8274b" }), -- DevIconNPMrc   xxx ctermfg=197 guifg=#e8274b
		DevIconOpenSCAD({ fg = "#f9d72c" }), -- DevIconOpenSCAD xxx ctermfg=220 guifg=#f9d72c
		DevIconTestTs({ fg = "#519aba" }), -- DevIconTestTs  xxx ctermfg=74 guifg=#519aba
		DevIconBlade({ fg = "#f05340" }), -- DevIconBlade   xxx ctermfg=203 guifg=#f05340
		DevIconTails({ fg = "#56347c" }), -- DevIconTails   xxx ctermfg=54 guifg=#56347c
		DevIconLinuxKernelObject({ fg = "#dcddd6" }), -- DevIconLinuxKernelObject xxx ctermfg=253 guifg=#dcddd6
		DevIconSignature({ fg = "#e37933" }), -- DevIconSignature xxx ctermfg=166 guifg=#e37933
		DevIconMojo({ fg = "#ff4c1f" }), -- DevIconMojo    xxx ctermfg=196 guifg=#ff4c1f
		DevIconWebmanifest({ fg = "#f1e05a" }), -- DevIconWebmanifest xxx ctermfg=185 guifg=#f1e05a
		DevIconPyx({ fg = "#5aa7e4" }), -- DevIconPyx     xxx ctermfg=39 guifg=#5aa7e4
		DevIconCs({ fg = "#596706" }), -- DevIconCs      xxx ctermfg=58 guifg=#596706
		DevIconKdenlive({ fg = "#83b8f2" }), -- DevIconKdenlive xxx ctermfg=110 guifg=#83b8f2
		DevIconMp4({ fg = "#fd971f" }), -- DevIconMp4     xxx ctermfg=208 guifg=#fd971f
		DevIconSolidWorksPrt({ fg = "#839463" }), -- DevIconSolidWorksPrt xxx ctermfg=101 guifg=#839463
		DevIconTypoScript({ fg = "#ff8700" }), -- DevIconTypoScript xxx ctermfg=208 guifg=#ff8700
		DevIconScala({ fg = "#cc3e44" }), -- DevIconScala   xxx ctermfg=167 guifg=#cc3e44
		DevIconCrystal({ fg = "#c8c8c8" }), -- DevIconCrystal xxx ctermfg=251 guifg=#c8c8c8
		DevIconDconf({ fg = "#ffffff" }), -- DevIconDconf   xxx ctermfg=231 guifg=#ffffff
		DevIconObjectiveC({ fg = "#599eff" }), -- DevIconObjectiveC xxx ctermfg=111 guifg=#599eff
		DevIconDesktopEntry({ fg = "#563d7c" }), -- DevIconDesktopEntry xxx ctermfg=54 guifg=#563d7c
		DevIconEdn({ fg = "#519aba" }), -- DevIconEdn     xxx ctermfg=74 guifg=#519aba
		DevIconCss({ fg = "#42a5f5" }), -- DevIconCss     xxx ctermfg=75 guifg=#42a5f5
		DevIconDocx({ fg = "#185abd" }), -- DevIconDocx    xxx ctermfg=26 guifg=#185abd
		DevIconMaven({ fg = "#7a0d21" }), -- DevIconMaven   xxx ctermfg=52 guifg=#7a0d21
		DevIconZshprofile({ fg = "#89e051" }), -- DevIconZshprofile xxx ctermfg=113 guifg=#89e051
		DevIconGz({ fg = "#eca517" }), -- DevIconGz      xxx ctermfg=214 guifg=#eca517
		DevIconDb({ fg = "#dad8d8" }), -- DevIconDb      xxx ctermfg=188 guifg=#dad8d8
		DevIconTypeScriptDeclaration({ fg = "#d59855" }), -- DevIconTypeScriptDeclaration xxx ctermfg=172 guifg=#d59855
		DevIconAlmalinux({ fg = "#ff4649" }), -- DevIconAlmalinux xxx ctermfg=203 guifg=#ff4649
		DevIconJl({ fg = "#a270ba" }), -- DevIconJl      xxx ctermfg=133 guifg=#a270ba
		DevIconArtix({ fg = "#41b4d7" }), -- DevIconArtix   xxx ctermfg=38 guifg=#41b4d7
		DevIconArch({ fg = "#0f94d2" }), -- DevIconArch    xxx ctermfg=67 guifg=#0f94d2
		DevIconCinnamon({ fg = "#dc682e" }), -- DevIconCinnamon xxx ctermfg=166 guifg=#dc682e
		DevIconLrc({ fg = "#ffb713" }), -- DevIconLrc     xxx ctermfg=214 guifg=#ffb713
		DevIconTrueTypeFont({ fg = "#ececec" }), -- DevIconTrueTypeFont xxx ctermfg=255 guifg=#ececec
		DevIconLXDE({ fg = "#a4a4a4" }), -- DevIconLXDE    xxx ctermfg=248 guifg=#a4a4a4
		DevIconawesome({ fg = "#535d6c" }), -- DevIconawesome xxx ctermfg=59 guifg=#535d6c
		DevIconJWM({ fg = "#0078cd" }), -- DevIconJWM     xxx ctermfg=32 guifg=#0078cd
		DevIconCts({ fg = "#519aba" }), -- DevIconCts     xxx ctermfg=74 guifg=#519aba
		DevIconEnlightenment({ fg = "#ffffff" }), -- DevIconEnlightenment xxx ctermfg=231 guifg=#ffffff
		DevIconPsScriptModulefile({ fg = "#6975c4" }), -- DevIconPsScriptModulefile xxx ctermfg=68 guifg=#6975c4
		DevIconPsManifestfile({ fg = "#6975c4" }), -- DevIconPsManifestfile xxx ctermfg=68 guifg=#6975c4
		DevIconNotebook({ fg = "#51a0cf" }), -- DevIconNotebook xxx ctermfg=74 guifg=#51a0cf
		DevIconFsi({ fg = "#519aba" }), -- DevIconFsi     xxx ctermfg=74 guifg=#519aba
		DevIconSway({ fg = "#68751c" }), -- DevIconSway    xxx ctermfg=64 guifg=#68751c
		DevIconBash({ fg = "#89e051" }), -- DevIconBash    xxx ctermfg=113 guifg=#89e051
		DevIconXpi({ fg = "#ff1b01" }), -- DevIconXpi     xxx ctermfg=196 guifg=#ff1b01
		DevIconArduino({ fg = "#56b6c2" }), -- DevIconArduino xxx ctermfg=73 guifg=#56b6c2
		DevIconMjs({ fg = "#f1e05a" }), -- DevIconMjs     xxx ctermfg=185 guifg=#f1e05a
		DevIconCjs({ fg = "#cbcb41" }), -- DevIconCjs     xxx ctermfg=185 guifg=#cbcb41
		DevIconGitConfig({ fg = "#f54d27" }), -- DevIconGitConfig xxx ctermfg=196 guifg=#f54d27
		DevIconEndeavour({ fg = "#7b3db9" }), -- DevIconEndeavour xxx ctermfg=91 guifg=#7b3db9
		DevIconGitLogo({ fg = "#f14c28" }), -- DevIconGitLogo xxx ctermfg=196 guifg=#f14c28
		DevIconTFVars({ fg = "#5f43e9" }), -- DevIconTFVars  xxx ctermfg=93 guifg=#5f43e9
		DevIconKotlinScript({ fg = "#7f52ff" }), -- DevIconKotlinScript xxx ctermfg=99 guifg=#7f52ff
		DevIconTxt({ fg = "#89e051" }), -- DevIconTxt     xxx ctermfg=113 guifg=#89e051
		DevIconGIMP({ fg = "#635b46" }), -- DevIconGIMP    xxx ctermfg=240 guifg=#635b46
		DevIconPyi({ fg = "#ffbc03" }), -- DevIconPyi     xxx ctermfg=214 guifg=#ffbc03
		DevIconHxx({ fg = "#a074c4" }), -- DevIconHxx     xxx ctermfg=140 guifg=#a074c4
		DevIconXaml({ fg = "#512bd4" }), -- DevIconXaml    xxx ctermfg=56 guifg=#512bd4
		DevIconCheckhealth({ fg = "#75b4fb" }), -- DevIconCheckhealth xxx ctermfg=75 guifg=#75b4fb
		DevIconStaticLibraryArchive({ fg = "#dcddd6" }), -- DevIconStaticLibraryArchive xxx ctermfg=253 guifg=#dcddd6
		DevIconCppm({ fg = "#519aba" }), -- DevIconCppm    xxx ctermfg=74 guifg=#519aba
		DevIconLogos({ fg = "#599eff" }), -- DevIconLogos   xxx ctermfg=111 guifg=#599eff
		DevIconKiCadFootprintTable({ fg = "#ffffff" }), -- DevIconKiCadFootprintTable xxx ctermfg=231 guifg=#ffffff
		DevIconMint({ fg = "#87c095" }), -- DevIconMint    xxx ctermfg=108 guifg=#87c095
		DevIconVRML({ fg = "#888888" }), -- DevIconVRML    xxx ctermfg=102 guifg=#888888
		DevIconEpub({ fg = "#eab16d" }), -- DevIconEpub    xxx ctermfg=215 guifg=#eab16d
		DevIconWebOpenFontFormat({ fg = "#ececec" }), -- DevIconWebOpenFontFormat xxx ctermfg=255 guifg=#ececec
		DevIconAppleScript({ fg = "#6d8085" }), -- DevIconAppleScript xxx ctermfg=66 guifg=#6d8085
		DevIconM4V({ fg = "#fd971f" }), -- DevIconM4V     xxx ctermfg=208 guifg=#fd971f
		DevIconBicep({ fg = "#519aba" }), -- DevIconBicep   xxx ctermfg=74 guifg=#519aba
		DevIconPxi({ fg = "#5aa7e4" }), -- DevIconPxi     xxx ctermfg=39 guifg=#5aa7e4
		DevIconVue({ fg = "#8dc149" }), -- DevIconVue     xxx ctermfg=113 guifg=#8dc149
		DevIconToml({ fg = "#9c4221" }), -- DevIconToml    xxx ctermfg=124 guifg=#9c4221
		DevIconEex({ fg = "#a074c4" }), -- DevIconEex     xxx ctermfg=140 guifg=#a074c4
		DevIconGodotTextResource({ fg = "#6d8086" }), -- DevIconGodotTextResource xxx ctermfg=66 guifg=#6d8086
		DevIconReScript({ fg = "#cc3e44" }), -- DevIconReScript xxx ctermfg=167 guifg=#cc3e44
		DevIconTSConfig({ fg = "#519aba" }), -- DevIconTSConfig xxx ctermfg=74 guifg=#519aba
		DevIconCoffee({ fg = "#cbcb41" }), -- DevIconCoffee  xxx ctermfg=185 guifg=#cbcb41
		DevIconnode({ fg = "#5fa04e" }), -- DevIconnode    xxx ctermfg=71 guifg=#5fa04e
		DevIconWeston({ fg = "#ffbb01" }), -- DevIconWeston  xxx ctermfg=214 guifg=#ffbb01
		DevIconGv({ fg = "#30638e" }), -- DevIconGv      xxx ctermfg=24 guifg=#30638e
		DevIconPxd({ fg = "#5aa7e4" }), -- DevIconPxd     xxx ctermfg=39 guifg=#5aa7e4
		DevIconSte({ fg = "#839463" }), -- DevIconSte     xxx ctermfg=101 guifg=#839463
		DevIconPdf({ fg = "#b30b00" }), -- DevIconPdf     xxx ctermfg=124 guifg=#b30b00
		DevIconRmd({ fg = "#519aba" }), -- DevIconRmd     xxx ctermfg=74 guifg=#519aba
		DevIconDump({ fg = "#dad8d8" }), -- DevIconDump    xxx ctermfg=188 guifg=#dad8d8
		DevIconVsix({ fg = "#854cc7" }), -- DevIconVsix    xxx ctermfg=98 guifg=#854cc7
		DevIconObjectFile({ fg = "#9f0500" }), -- DevIconObjectFile xxx ctermfg=124 guifg=#9f0500
		DevIconSpecJs({ fg = "#cbcb41" }), -- DevIconSpecJs  xxx ctermfg=185 guifg=#cbcb41
		DevIconJson5({ fg = "#cbcb41" }), -- DevIconJson5   xxx ctermfg=185 guifg=#cbcb41
		DevIconGemspec({ fg = "#701516" }), -- DevIconGemspec xxx ctermfg=52 guifg=#701516
		DevIconRake({ fg = "#701516" }), -- DevIconRake    xxx ctermfg=52 guifg=#701516
		DevIconGitIgnore({ fg = "#f54d27" }), -- DevIconGitIgnore xxx ctermfg=196 guifg=#f54d27
		DevIconGitAttributes({ fg = "#f54d27" }), -- DevIconGitAttributes xxx ctermfg=196 guifg=#f54d27
		DevIconGitModules({ fg = "#f54d27" }), -- DevIconGitModules xxx ctermfg=196 guifg=#f54d27
		DevIconCrdownload({ fg = "#44cda8" }), -- DevIconCrdownload xxx ctermfg=43 guifg=#44cda8
		DevIconLog({ fg = "#dddddd" }), -- DevIconLog     xxx ctermfg=253 guifg=#dddddd
		DevIconJsonc({ fg = "#cbcb41" }), -- DevIconJsonc   xxx ctermfg=185 guifg=#cbcb41
		DevIconM3u({ fg = "#ed95ae" }), -- DevIconM3u     xxx ctermfg=211 guifg=#ed95ae
		DevIconTestJs({ fg = "#cbcb41" }), -- DevIconTestJs  xxx ctermfg=185 guifg=#cbcb41
		DevIconLeex({ fg = "#a074c4" }), -- DevIconLeex    xxx ctermfg=140 guifg=#a074c4
		DevIconPKGBUILD({ fg = "#0f94d2" }), -- DevIconPKGBUILD xxx ctermfg=67 guifg=#0f94d2
		DevIconJavaScriptReactTest({ fg = "#20c2e3" }), -- DevIconJavaScriptReactTest xxx ctermfg=45 guifg=#20c2e3
		DevIconEjs({ fg = "#cbcb41" }), -- DevIconEjs     xxx ctermfg=185 guifg=#cbcb41
		DevIconAstro({ fg = "#e23f67" }), -- DevIconAstro   xxx ctermfg=197 guifg=#e23f67
		DevIconApple({ fg = "#a2aaad" }), -- DevIconApple   xxx ctermfg=248 guifg=#a2aaad
		DevIconSpecTs({ fg = "#519aba" }), -- DevIconSpecTs  xxx ctermfg=74 guifg=#519aba
		DevIconTypeScriptReactTest({ fg = "#1354bf" }), -- DevIconTypeScriptReactTest xxx ctermfg=26 guifg=#1354bf
		DevIconTypoScriptConfig({ fg = "#ff8700" }), -- DevIconTypoScriptConfig xxx ctermfg=208 guifg=#ff8700
		DevIconNixOS({ fg = "#7ab1db" }), -- DevIconNixOS   xxx ctermfg=110 guifg=#7ab1db
		DevIconMixLock({ fg = "#a074c4" }), -- DevIconMixLock xxx ctermfg=140 guifg=#a074c4
		DevIconBzl({ fg = "#89e051" }), -- DevIconBzl     xxx ctermfg=113 guifg=#89e051
		DevIconEditorConfig({ fg = "#fff2f2" }), -- DevIconEditorConfig xxx ctermfg=255 guifg=#fff2f2
		DevIconTorrent({ fg = "#44cda8" }), -- DevIconTorrent xxx ctermfg=43 guifg=#44cda8
		DevIconProlog({ fg = "#e4b854" }), -- DevIconProlog  xxx ctermfg=179 guifg=#e4b854
		DevIconBazelWorkspace({ fg = "#89e051" }), -- DevIconBazelWorkspace xxx ctermfg=113 guifg=#89e051
		DevIconCue({ fg = "#ed95ae" }), -- DevIconCue     xxx ctermfg=211 guifg=#ed95ae
		DevIconMpv({ fg = "#3b1342" }), -- DevIconMpv     xxx ctermfg=53 guifg=#3b1342
		DevIconsbt({ fg = "#cc3e44" }), -- DevIconsbt     xxx ctermfg=167 guifg=#cc3e44
		DevIconMotoko({ fg = "#9772fb" }), -- DevIconMotoko  xxx ctermfg=135 guifg=#9772fb
		DevIconSvelte({ fg = "#ff3e00" }), -- DevIconSvelte  xxx ctermfg=196 guifg=#ff3e00
		DevIconSolidWorksAsm({ fg = "#839463" }), -- DevIconSolidWorksAsm xxx ctermfg=101 guifg=#839463
		DevIconStyl({ fg = "#8dc149" }), -- DevIconStyl    xxx ctermfg=113 guifg=#8dc149
		DevIconConf({ fg = "#6d8086" }), -- DevIconConf    xxx ctermfg=66 guifg=#6d8086
		DevIconSig({ fg = "#e37933" }), -- DevIconSig     xxx ctermfg=166 guifg=#e37933
		DevIconLibrecadFontFile({ fg = "#ececec" }), -- DevIconLibrecadFontFile xxx ctermfg=255 guifg=#ececec
		DevIconCsh({ fg = "#4d5a5e" }), -- DevIconCsh     xxx ctermfg=240 guifg=#4d5a5e
		DevIconAss({ fg = "#ffb713" }), -- DevIconAss     xxx ctermfg=214 guifg=#ffb713
		DevIconGemfile({ fg = "#701516" }), -- DevIconGemfile xxx ctermfg=52 guifg=#701516
		DevIconCson({ fg = "#cbcb41" }), -- DevIconCson    xxx ctermfg=185 guifg=#cbcb41
		DevIconFsharp({ fg = "#519aba" }), -- DevIconFsharp  xxx ctermfg=74 guifg=#519aba
		DevIconGitCommit({ fg = "#f54d27" }), -- DevIconGitCommit xxx ctermfg=196 guifg=#f54d27
		DevIconPsb({ fg = "#519aba" }), -- DevIconPsb     xxx ctermfg=74 guifg=#519aba
		DevIconPsd({ fg = "#519aba" }), -- DevIconPsd     xxx ctermfg=74 guifg=#519aba
		DevIconStep({ fg = "#839463" }), -- DevIconStep    xxx ctermfg=101 guifg=#839463
		DevIconSuo({ fg = "#854cc7" }), -- DevIconSuo     xxx ctermfg=98 guifg=#854cc7
		DevIconWasm({ fg = "#5c4cdb" }), -- DevIconWasm    xxx ctermfg=62 guifg=#5c4cdb
		DevIconXcPlayground({ fg = "#e37933" }), -- DevIconXcPlayground xxx ctermfg=166 guifg=#e37933
		DevIconOut({ fg = "#9f0500" }), -- DevIconOut     xxx ctermfg=124 guifg=#9f0500
		DevIconSlim({ fg = "#e34c26" }), -- DevIconSlim    xxx ctermfg=196 guifg=#e34c26
		DevIconPyd({ fg = "#ffe291" }), -- DevIconPyd     xxx ctermfg=222 guifg=#ffe291
		DevIconPyc({ fg = "#ffe291" }), -- DevIconPyc     xxx ctermfg=222 guifg=#ffe291
		DevIconProcfile({ fg = "#a074c4" }), -- DevIconProcfile xxx ctermfg=140 guifg=#a074c4
		DevIconOpenTypeFont({ fg = "#ececec" }), -- DevIconOpenTypeFont xxx ctermfg=255 guifg=#ececec
		DevIconOpusAudioFile({ fg = "#0075aa" }), -- DevIconOpusAudioFile xxx ctermfg=24 guifg=#0075aa
		DevIconCMakeLists({ fg = "#6d8086" }), -- DevIconCMakeLists xxx ctermfg=66 guifg=#6d8086
		DevIconMdx({ fg = "#519aba" }), -- DevIconMdx     xxx ctermfg=74 guifg=#519aba
		DevIconMaterial({ fg = "#b83998" }), -- DevIconMaterial xxx ctermfg=163 guifg=#b83998
		DevIconFreeBSD({ fg = "#c90f02" }), -- DevIconFreeBSD xxx ctermfg=160 guifg=#c90f02
		DevIconJpegXl({ fg = "#a074c4" }), -- DevIconJpegXl  xxx ctermfg=140 guifg=#a074c4
		DevIconImportConfiguration({ fg = "#ececec" }), -- DevIconImportConfiguration xxx ctermfg=255 guifg=#ececec
		DevIconHaxe({ fg = "#ea8220" }), -- DevIconHaxe    xxx ctermfg=208 guifg=#ea8220
		DevIconWebm({ fg = "#fd971f" }), -- DevIconWebm    xxx ctermfg=208 guifg=#fd971f
		DevIconGodotProject({ fg = "#6d8086" }), -- DevIconGodotProject xxx ctermfg=66 guifg=#6d8086
		DevIconBinaryGLTF({ fg = "#ffb13b" }), -- DevIconBinaryGLTF xxx ctermfg=214 guifg=#ffb13b
		DevIconFsscript({ fg = "#519aba" }), -- DevIconFsscript xxx ctermfg=74 guifg=#519aba
		DevIconXsession({ fg = "#e54d18" }), -- DevIconXsession xxx ctermfg=196 guifg=#e54d18
		DevIconDrools({ fg = "#ffafaf" }), -- DevIconDrools  xxx ctermfg=217 guifg=#ffafaf
		DevIconThunderbird({ fg = "#137be1" }), -- DevIconThunderbird xxx ctermfg=33 guifg=#137be1
		BufferVisible({ fg = "#ede5d4" }), -- BufferVisible  xxx guifg=#ede5d4
		BufferVisibleIndex({ fg = "#ede5d4" }), -- BufferVisibleIndex xxx guifg=#ede5d4
		BufferVisibleSign({ fg = "#ede5d4" }), -- BufferVisibleSign xxx guifg=#ede5d4
		CmpItemKind({ fg = "#ada28b" }), -- CmpItemKind    xxx guifg=#ada28b
		CocMarkdownLink({ fg = "#83c193", gui = "underline" }), -- CocMarkdownLink xxx cterm=underline gui=underline guifg=#83c193
		HopNextKey({ fg = "#d69ab7", gui = "bold,underline" }), -- HopNextKey     xxx cterm=bold,underline gui=bold,underline guifg=#d69ab7
		HopNextKey1({ fg = "#83c193", gui = "bold,underline" }), -- HopNextKey1    xxx cterm=bold,underline gui=bold,underline guifg=#83c193
		HopNextKey2({ fg = "#7fbcb4" }), -- HopNextKey2    xxx guifg=#7fbcb4
		HopUnmatched({ fg = "#6e7b85" }), -- HopUnmatched   xxx guifg=#6e7b85
		LeapLabelPrimary({ bg = "#9e5179", fg = "#e7dcc4", gui = "bold,nocombine" }), -- LeapLabelPrimary xxx cterm=bold,nocombine gui=bold,nocombine guifg=#e7dcc4 guibg=#9e5179
		LeapLabelSecondary({ bg = "#456763", fg = "#e7dcc4", gui = "bold,nocombine" }), -- LeapLabelSecondary xxx cterm=bold,nocombine gui=bold,nocombine guifg=#e7dcc4 guibg=#456763
		LeapMatch({ gui = "bold,underline,nocombine" }), -- LeapMatch      xxx cterm=bold,underline,nocombine gui=bold,underline,nocombine
		MasonHeader({ bg = "#ddbd7f", fg = "#2c343a", gui = "bold" }), -- MasonHeader    xxx cterm=bold gui=bold guifg=#2c343a guibg=#ddbd7f
		MasonHighlight({ fg = "#7fbcb4" }), -- MasonHighlight xxx guifg=#7fbcb4
		MasonHighlightBlock({ bg = "#7fbcb4", fg = "#2c343a" }), -- MasonHighlightBlock xxx guifg=#2c343a guibg=#7fbcb4
		MasonHighlightBlockBold({ bg = "#7fbcb4", fg = "#2c343a", gui = "bold" }), -- MasonHighlightBlockBold xxx cterm=bold gui=bold guifg=#2c343a guibg=#7fbcb4
		MasonHighlightBlockBoldSecondary({ bg = "#ddbd7f", fg = "#2c343a", gui = "bold" }), -- MasonHighlightBlockBoldSecondary xxx cterm=bold gui=bold guifg=#2c343a guibg=#ddbd7f
		MasonHighlightBlockSecondary({ bg = "#ddbd7f", fg = "#2c343a" }), -- MasonHighlightBlockSecondary xxx guifg=#2c343a guibg=#ddbd7f
		MasonHighlightSecondary({ fg = "#ddbd7f" }), -- MasonHighlightSecondary xxx guifg=#ddbd7f
		MasonMuted({ fg = "#ada28b" }), -- MasonMuted     xxx guifg=#ada28b
		MasonMutedBlock({ bg = "#ada28b", fg = "#2c343a" }), -- MasonMutedBlock xxx guifg=#2c343a guibg=#ada28b
		MasonMutedBlockBold({ bg = "#ada28b", fg = "#2c343a", gui = "bold" }), -- MasonMutedBlockBold xxx cterm=bold gui=bold guifg=#2c343a guibg=#ada28b
		NoiceCmdlineIcon({ fg = "#7fbcb4" }), -- NoiceCmdlineIcon xxx guifg=#7fbcb4
		NoiceCmdlinePopupBorder({ NoiceCmdlineIcon }), -- NoiceCmdlinePopupBorder xxx links to NoiceCmdlineIcon
		NoiceCmdlinePopupTitle({ NoiceCmdlineIcon }), -- NoiceCmdlinePopupTitle xxx links to NoiceCmdlineIcon
		NoiceConfirmBorder({ NoiceCmdlineIcon }), -- NoiceConfirmBorder xxx links to NoiceCmdlineIcon
		NoiceCompletionItemKindDefault({ fg = "#ada28b" }), -- NoiceCompletionItemKindDefault xxx guifg=#ada28b
		TelescopeMatching({ fg = "#d69ab7", gui = "bold" }), -- TelescopeMatching xxx cterm=bold gui=bold guifg=#d69ab7
		WhichKeySeparator({ fg = "#667783" }), -- WhichKeySeparator xxx guifg=#667783
		diffFile({ fg = "#ddbd7f", gui = "bold" }), -- diffFile       xxx cterm=bold gui=bold guifg=#ddbd7f
		diffLine({ fg = "#d69ab7", gui = "bold" }), -- diffLine       xxx cterm=bold gui=bold guifg=#d69ab7
		markdownLinkText({ fg = "#c6baa0", gui = "underline" }), -- markdownLinkText xxx cterm=underline gui=underline guifg=#c6baa0
		FzfLuaHeaderBind({ fg = "#a9c181" }), -- FzfLuaHeaderBind xxx guifg=#a9c181
		helpHyperTextJump({ fg = "#c6baa0", gui = "underline" }), -- helpHyperTextJump xxx cterm=underline gui=underline guifg=#c6baa0
		helpHyperTextEntry({ fg = "#90a6b7", gui = "bold" }), -- helpHyperTextEntry xxx cterm=bold gui=bold guifg=#90a6b7
		diffIndexLine({ fg = "#ddbd7f" }), -- diffIndexLine  xxx guifg=#ddbd7f
		sym("@lsp.type.unresolvedReference")({ sp = "#e67c7f", gui = "undercurl" }), -- @lsp.type.unresolvedReference xxx cterm=undercurl gui=undercurl guisp=#e67c7f
		sym("@label.vimdoc")({ fg = "#90a6b7", gui = "bold" }), -- @label.vimdoc  xxx cterm=bold gui=bold guifg=#90a6b7
		NvimTreeCursorLine({ bg = "#353f46" }), -- NvimTreeCursorLine xxx guibg=#353f46
		NvimTreeCursorColumn({ NvimTreeCursorLine }), -- NvimTreeCursorColumn xxx links to NvimTreeCursorLine
		SneakLabelMask({ bg = "#d69ab7", fg = "#d69ab7" }), -- SneakLabelMask xxx guifg=#d69ab7 guibg=#d69ab7
		FzfLuaLiveSym({ fg = "#ddbd7f" }), -- FzfLuaLiveSym  xxx guifg=#ddbd7f
		FzfLuaTabMarker({ fg = "#a9c181" }), -- FzfLuaTabMarker xxx guifg=#a9c181
		FzfLuaTabTitle({ fg = "#83c193" }), -- FzfLuaTabTitle xxx guifg=#83c193
		FzfLuaBufFlagAlt({ fg = "#7fbcb4" }), -- FzfLuaBufFlagAlt xxx guifg=#7fbcb4
		FzfLuaBufFlagCur({ fg = "#ddbd7f" }), -- FzfLuaBufFlagCur xxx guifg=#ddbd7f
		FzfLuaBufNr({ fg = "#a9c181" }), -- FzfLuaBufNr    xxx guifg=#a9c181
		FzfLuaPathColNr({ fg = "#90a6b7", gui = "bold" }), -- FzfLuaPathColNr xxx cterm=bold gui=bold guifg=#90a6b7
		FzfLuaPathLineNr({ FzfLuaPathColNr }), -- FzfLuaPathLineNr xxx links to FzfLuaPathColNr
		sym("@markup.link.markdown")({ fg = "#c6baa0", gui = "underline" }), -- @markup.link.markdown xxx cterm=underline gui=underline guifg=#c6baa0
		FzfLuaHeaderText({ fg = "#ddbd7f" }), -- FzfLuaHeaderText xxx guifg=#ddbd7f
		sym("@markup.link.vimdoc")({ fg = "#c6baa0", gui = "underline" }), -- @markup.link.vimdoc xxx cterm=underline gui=underline guifg=#c6baa0
		FlashBackdrop({ fg = "#6e7b85" }), -- FlashBackdrop  xxx guifg=#6e7b85
		FlashLabel({ bg = "#4b726d", fg = "#e7dcc4" }), -- FlashLabel     xxx guifg=#e7dcc4 guibg=#4b726d
		fg5d6d78({ fg = "#5d6d78" }), -- nvim-highlight-colors-fg5d6d78 xxx guifg=#5d6d78
		fgdfb2c7({ fg = "#dfb2c7" }), -- nvim-highlight-colors-fgdfb2c7 xxx guifg=#dfb2c7
		fg2c343a({ fg = "#2c343a" }), -- nvim-highlight-colors-fg2c343a xxx guifg=#2c343a
		fg9e5179({ fg = "#9e5179" }), -- nvim-highlight-colors-fg9e5179 xxx guifg=#9e5179
		fge7dcc4({ fg = "#e7dcc4" }), -- nvim-highlight-colors-fge7dcc4 xxx guifg=#e7dcc4
		fga9c181({ fg = "#a9c181" }), -- nvim-highlight-colors-fga9c181 xxx guifg=#a9c181
		fg667783({ fg = "#667783" }), -- nvim-highlight-colors-fg667783 xxx guifg=#667783
		fg313a41({ fg = "#313a41" }), -- nvim-highlight-colors-fg313a41 xxx guifg=#313a41
		fg3e4850({ fg = "#3e4850" }), -- nvim-highlight-colors-fg3e4850 xxx guifg=#3e4850
		fg353f46({ fg = "#353f46" }), -- nvim-highlight-colors-fg353f46 xxx guifg=#353f46
		fgede5d4({ fg = "#ede5d4" }), -- nvim-highlight-colors-fgede5d4 xxx guifg=#ede5d4
		fgf0f0f0({ fg = "#f0f0f0" }), -- nvim-highlight-colors-fgf0f0f0 xxx guifg=#f0f0f0
		fg386cb0({ fg = "#386cb0" }), -- nvim-highlight-colors-fg386cb0 xxx guifg=#386cb0
		fgf87f01({ fg = "#f87f01" }), -- nvim-highlight-colors-fgf87f01 xxx guifg=#f87f01
		fg7fc97f({ fg = "#7fc97f" }), -- nvim-highlight-colors-fg7fc97f xxx guifg=#7fc97f
		fgef3b2c({ fg = "#ef3b2c" }), -- nvim-highlight-colors-fgef3b2c xxx guifg=#ef3b2c
		fgfeca01({ fg = "#feca01" }), -- nvim-highlight-colors-fgfeca01 xxx guifg=#feca01
		fga6cee3({ fg = "#a6cee3" }), -- nvim-highlight-colors-fga6cee3 xxx guifg=#a6cee3
		fgfb9a99({ fg = "#fb9a99" }), -- nvim-highlight-colors-fgfb9a99 xxx guifg=#fb9a99
		fg984ea3({ fg = "#984ea3" }), -- nvim-highlight-colors-fg984ea3 xxx guifg=#984ea3
		fg8C591D({ fg = "#8c591d" }), -- nvim-highlight-colors-fg8C591D xxx guifg=#8c591d
		fgblack({ fg = "#000000" }), -- nvim-highlight-colors-fgblack xxx guifg=#000000
		fg000000({ fg = "#000000" }), -- nvim-highlight-colors-fg000000 xxx guifg=#000000
		fg376bb0({ fg = "#376bb0" }), -- nvim-highlight-colors-fg376bb0 xxx guifg=#376bb0
		fgf77e00({ fg = "#f77e00" }), -- nvim-highlight-colors-fgf77e00 xxx guifg=#f77e00
		fg7ec87e({ fg = "#7ec87e" }), -- nvim-highlight-colors-fg7ec87e xxx guifg=#7ec87e
		fgef3b2b({ fg = "#ef3b2b" }), -- nvim-highlight-colors-fgef3b2b xxx guifg=#ef3b2b
		fgfeca00({ fg = "#feca00" }), -- nvim-highlight-colors-fgfeca00 xxx guifg=#feca00
		fga6cde3({ fg = "#a6cde3" }), -- nvim-highlight-colors-fga6cde3 xxx guifg=#a6cde3
		fgfa9999({ fg = "#fa9999" }), -- nvim-highlight-colors-fgfa9999 xxx guifg=#fa9999
		fg984ea2({ fg = "#984ea2" }), -- nvim-highlight-colors-fg984ea2 xxx guifg=#984ea2
		fg8b581c({ fg = "#8b581c" }), -- nvim-highlight-colors-fg8b581c xxx guifg=#8b581c
		fgffffb3({ fg = "#ffffb3" }), -- nvim-highlight-colors-fgffffb3 xxx guifg=#ffffb3
		fg333333({ fg = "#333333" }), -- nvim-highlight-colors-fg333333 xxx guifg=#333333
		fg252525({ fg = "#252525" }), -- nvim-highlight-colors-fg252525 xxx guifg=#252525
		fgffffff({ fg = "#ffffff" }), -- nvim-highlight-colors-fgffffff xxx guifg=#ffffff
		fgb3b3b3({ fg = "#b3b3b3" }), -- nvim-highlight-colors-fgb3b3b3 xxx guifg=#b3b3b3
		fg2d3a4b({ fg = "#2d3a4b" }), -- nvim-highlight-colors-fg2d3a4b xxx guifg=#2d3a4b
		fgfab4ae({ fg = "#fab4ae" }), -- nvim-highlight-colors-fgfab4ae xxx guifg=#fab4ae
		fgb3cce3({ fg = "#b3cce3" }), -- nvim-highlight-colors-fgb3cce3 xxx guifg=#b3cce3
		fgccebc4({ fg = "#ccebc4" }), -- nvim-highlight-colors-fgccebc4 xxx guifg=#ccebc4
		fgdecbe3({ fg = "#decbe3" }), -- nvim-highlight-colors-fgdecbe3 xxx guifg=#decbe3
		fgfed9a6({ fg = "#fed9a6" }), -- nvim-highlight-colors-fgfed9a6 xxx guifg=#fed9a6
		fgffffcc({ fg = "#ffffcc" }), -- nvim-highlight-colors-fgffffcc xxx guifg=#ffffcc
		fge4d8bd({ fg = "#e4d8bd" }), -- nvim-highlight-colors-fge4d8bd xxx guifg=#e4d8bd
		fgfdd9ec({ fg = "#fdd9ec" }), -- nvim-highlight-colors-fgfdd9ec xxx guifg=#fdd9ec
		fgf1f1f1({ fg = "#f1f1f1" }), -- nvim-highlight-colors-fgf1f1f1 xxx guifg=#f1f1f1
		fg282b33({ fg = "#282b33" }), -- nvim-highlight-colors-fg282b33 xxx guifg=#282b33
		fg333740({ fg = "#333740" }), -- nvim-highlight-colors-fg333740 xxx guifg=#333740
	}
end)
