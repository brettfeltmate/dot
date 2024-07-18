local wezterm = { pane_id_repl = nil, }

function wezterm.exec(args)
  local ret_val = vim.system(
	{ "wezterm", unpack(args) }, { text = true }
  ):wait()

  return ret_val.code == 0, ret_val.stdout, ret_val.stderr
end
local directions = {
}
function wezterm.get_pane_direction(dir)
  local args = {'cli', 'get-pane-direction'}
  
