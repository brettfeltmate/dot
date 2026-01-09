-- Enable csvview if available; also, wait until buffer is read
local has_csvview, csvview = pcall(require, "csvview")
if has_csvview then
    vim.cmd([[CsvViewEnable]])
end
