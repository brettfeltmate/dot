-- Made with 'mini.colors' module of https://github.com/echasnovski/mini.nvim

if vim.g.colors_name ~= nil then vim.cmd('highlight clear') end
vim.g.colors_name = "murk"

-- Highlight groups
local hi = vim.api.nvim_set_hl

hi(0, "@NeogitDiffDeleteHighlight", { bg = "#151515", fg = "#513f3a" })
hi(0, "@annotation", { fg = "#a8786b" })
hi(0, "@attribute", { fg = "#9c7789" })
hi(0, "@attribute.builtin", { link = "Special" })
hi(0, "@character", { fg = "#9b919e" })
hi(0, "@character.special", { link = "SpecialChar" })
hi(0, "@comment", { fg = "#5a443e" })
hi(0, "@comment.danger", { bg = "#9b9b9b", fg = "#060606" })
hi(0, "@comment.error", { link = "DiagnosticError" })
hi(0, "@comment.note", { bg = "#888888", fg = "#060606" })
hi(0, "@comment.todo", { bg = "#a3a3a3", fg = "#281f1d" })
hi(0, "@comment.warning", { bg = "#838383", fg = "#060606" })
hi(0, "@constant", { fg = "#9b919e" })
hi(0, "@constant.builtin", { fg = "#777672" })
hi(0, "@constant.macro", { fg = "#9b919e" })
hi(0, "@constructor", { fg = "#996786" })
hi(0, "@definition", { sp = "#7d7983", underline = true })
hi(0, "@diff.delta", { fg = "#513f3a" })
hi(0, "@diff.minus", { fg = "#a98095" })
hi(0, "@diff.plus", { fg = "#52797b" })
hi(0, "@error", { fg = "#9b919e" })
hi(0, "@function", { fg = "#84a1a3" })
hi(0, "@function.builtin", { fg = "#84a1a3" })
hi(0, "@function.call", { fg = "#84a1a3" })
hi(0, "@function.call.r", { fg = "#84a1a3" })
hi(0, "@function.macro", { fg = "#9b919e" })
hi(0, "@function.method", { fg = "#84a1a3" })
hi(0, "@function.method.call", { fg = "#84a1a3" })
hi(0, "@ibl.scope.underline.1", { bg = "#151515" })
hi(0, "@ibl.scope.underline.2", { bg = "#151515" })
hi(0, "@ibl.scope.underline.3", { bg = "#151515" })
hi(0, "@ibl.scope.underline.4", { bg = "#151515" })
hi(0, "@ibl.scope.underline.5", { bg = "#151515" })
hi(0, "@ibl.scope.underline.6", { bg = "#151515" })
hi(0, "@ibl.scope.underline.7", { bg = "#151515" })
hi(0, "@keyword", { fg = "#9090a2" })
hi(0, "@keyword.conditional", { fg = "#9090a2" })
hi(0, "@keyword.conditional.ternary", { fg = "#9090a2" })
hi(0, "@keyword.directive", { fg = "#9c7789" })
hi(0, "@keyword.directive.define", { fg = "#9090a2" })
hi(0, "@keyword.exception", { fg = "#9b919e" })
hi(0, "@keyword.function", { fg = "#777672" })
hi(0, "@keyword.import", { link = "Include" })
hi(0, "@keyword.operator", { fg = "#9090a2" })
hi(0, "@keyword.repeat", { fg = "#9c7789" })
hi(0, "@keyword.return", { fg = "#9090a2" })
hi(0, "@keyword.storage", { fg = "#9c7789" })
hi(0, "@lsp.mod.deprecated", { link = "DiagnosticDeprecated" })
hi(0, "@lsp.type.class", { link = "@type" })
hi(0, "@lsp.type.comment", { link = "@comment" })
hi(0, "@lsp.type.decorator", { link = "@attribute" })
hi(0, "@lsp.type.enum", { link = "@type" })
hi(0, "@lsp.type.enumMember", { link = "@constant" })
hi(0, "@lsp.type.event", { link = "@type" })
hi(0, "@lsp.type.function", { link = "@function" })
hi(0, "@lsp.type.interface", { link = "@type" })
hi(0, "@lsp.type.keyword", { link = "@keyword" })
hi(0, "@lsp.type.macro", { link = "@constant.macro" })
hi(0, "@lsp.type.method", { link = "@function.method" })
hi(0, "@lsp.type.modifier", { link = "@type.qualifier" })
hi(0, "@lsp.type.namespace", { link = "@module" })
hi(0, "@lsp.type.number", { link = "@number" })
hi(0, "@lsp.type.operator", { link = "@operator" })
hi(0, "@lsp.type.parameter", { link = "@variable.parameter" })
hi(0, "@lsp.type.property", { link = "@property" })
hi(0, "@lsp.type.regexp", { link = "@string.regexp" })
hi(0, "@lsp.type.string", { link = "@string" })
hi(0, "@lsp.type.struct", { link = "@type" })
hi(0, "@lsp.type.type", { link = "@type" })
hi(0, "@lsp.type.typeParameter", { link = "@type.definition" })
hi(0, "@lsp.type.variable", { link = "@variable" })
hi(0, "@markup.heading", { fg = "#84a1a3" })
hi(0, "@markup.heading.1.delimiter.vimdoc", { bg = "#0c0c0c", fg = "#010101", nocombine = true, sp = "#beb8c5", underdouble = true })
hi(0, "@markup.heading.1.markdown", { fg = "#686868" })
hi(0, "@markup.heading.2.delimiter.vimdoc", { bg = "#0c0c0c", fg = "#010101", nocombine = true, sp = "#beb8c5", underline = true })
hi(0, "@markup.heading.2.markdown", { fg = "#626262" })
hi(0, "@markup.heading.3.markdown", { fg = "#a8786b" })
hi(0, "@markup.heading.4.markdown", { fg = "#9b919e" })
hi(0, "@markup.heading.5.markdown", { fg = "#959595" })
hi(0, "@markup.heading.6.markdown", { fg = "#a0a0a0" })
hi(0, "@markup.link", { fg = "#9b919e" })
hi(0, "@markup.link.label", { fg = "#996786" })
hi(0, "@markup.link.url", { fg = "#777672", underline = true })
hi(0, "@markup.list", { fg = "#9b919e" })
hi(0, "@markup.quote", { bg = "#151515" })
hi(0, "@markup.raw", { fg = "#777672" })
hi(0, "@module", { fg = "#9b919e" })
hi(0, "@module.builtin", { link = "Special" })
hi(0, "@number", { fg = "#777672" })
hi(0, "@number.float", { fg = "#777672" })
hi(0, "@operator", { fg = "#a1a2a5" })
hi(0, "@property", { fg = "#9b919e" })
hi(0, "@punctuation.bracket", { fg = "#989898" })
hi(0, "@punctuation.delimiter", { fg = "#989898" })
hi(0, "@punctuation.special", { link = "Special" })
hi(0, "@reference", { fg = "#a0a0a0" })
hi(0, "@scope", { bold = true })
hi(0, "@string", { fg = "#9e9fa2" })
hi(0, "@string.escape", { fg = "#996786" })
hi(0, "@string.regex", { fg = "#996786" })
hi(0, "@string.regexp", { link = "@string.special" })
hi(0, "@string.special", { link = "SpecialChar" })
hi(0, "@string.special.url", { link = "Underlined" })
hi(0, "@symbol", { fg = "#9e9fa2" })
hi(0, "@tag", { fg = "#9c7789" })
hi(0, "@tag.attribute", { fg = "#9b919e" })
hi(0, "@tag.builtin", { link = "Special" })
hi(0, "@tag.delimiter", { fg = "#a8786b" })
hi(0, "@text", { fg = "#a0a0a0" })
hi(0, "@text.emphasis", { fg = "#777672" })
hi(0, "@text.strike", { fg = "#a8786b", strikethrough = true })
hi(0, "@type.builtin", { fg = "#9c7789" })
hi(0, "@variable", { fg = "#9b919e" })
hi(0, "@variable.builtin", { fg = "#828282" })
hi(0, "@variable.member", { fg = "#9b919e" })
hi(0, "@variable.member.key", { fg = "#9b919e" })
hi(0, "@variable.member.r", { fg = "#958899" })
hi(0, "@variable.parameter", { fg = "#9b919e" })
hi(0, "@variable.parameter.builtin", { link = "Special" })
hi(0, "@variable.parameter.r", { fg = "#a398b9" })
hi(0, "@variable.r", { fg = "#a19aa2" })
hi(0, "Added", { fg = "#9495b3" })
hi(0, "AvanteAnnotation", { link = "Comment" })
hi(0, "AvanteConflictAncestor", { bg = "#543023", bold = true })
hi(0, "AvanteConflictAncestorLabel", { bg = "#91553e" })
hi(0, "AvanteConflictCurrent", { bg = "#151515", bold = true })
hi(0, "AvanteConflictCurrentLabel", { bg = "#282828" })
hi(0, "AvanteConflictIncoming", { bg = "#1e1e1e", bold = true })
hi(0, "AvanteConflictIncomingLabel", { bg = "#373737" })
hi(0, "AvanteInlineHint", { link = "Keyword" })
hi(0, "AvantePopupHint", { link = "NormalFloat" })
hi(0, "AvanteReversedSubtitle", { bg = "#151515", fg = "#666451" })
hi(0, "AvanteReversedThirdTitle", { fg = "#9b919e" })
hi(0, "AvanteReversedTitle", { bg = "#151515", fg = "#73888b" })
hi(0, "AvanteSubtitle", { bg = "#6f6f6f", fg = "#060606" })
hi(0, "AvanteSuggestion", { link = "Comment" })
hi(0, "AvanteThirdTitle", { bg = "#a3a3a3", fg = "#060606" })
hi(0, "AvanteTitle", { bg = "#919191", fg = "#060606" })
hi(0, "AvanteToBeDeleted", { bg = "#d7c8d1", strikethrough = true })
hi(0, "Bold", { bold = true })
hi(0, "Boolean", { fg = "#777672" })
hi(0, "Changed", { fg = "#b39581" })
hi(0, "Character", { fg = "#9b919e" })
hi(0, "CmpBorder", { fg = "#2e221e" })
hi(0, "CmpDoc", { bg = "#141414" })
hi(0, "CmpDocBorder", { fg = "#2e221e" })
hi(0, "CmpItemAbbr", { fg = "#9b919e" })
hi(0, "CmpItemAbbrMatch", { bold = true, fg = "#7e7c6e" })
hi(0, "CmpItemKindClass", { fg = "#6da2ab" })
hi(0, "CmpItemKindCodeium", { fg = "#73888b" })
hi(0, "CmpItemKindColor", { fg = "#9b919e" })
hi(0, "CmpItemKindConstant", { fg = "#777672" })
hi(0, "CmpItemKindConstructor", { fg = "#7e7c6e" })
hi(0, "CmpItemKindCopilot", { fg = "#52797b" })
hi(0, "CmpItemKindEnum", { fg = "#7e7c6e" })
hi(0, "CmpItemKindEnumMember", { fg = "#b39581" })
hi(0, "CmpItemKindEvent", { fg = "#9495b3" })
hi(0, "CmpItemKindField", { fg = "#9b919e" })
hi(0, "CmpItemKindFile", { fg = "#959595" })
hi(0, "CmpItemKindFolder", { fg = "#959595" })
hi(0, "CmpItemKindFunction", { fg = "#84a1a3" })
hi(0, "CmpItemKindIdentifier", { fg = "#9b919e" })
hi(0, "CmpItemKindInterface", { fg = "#52797b" })
hi(0, "CmpItemKindKeyword", { fg = "#959595" })
hi(0, "CmpItemKindMethod", { fg = "#84a1a3" })
hi(0, "CmpItemKindModule", { fg = "#9c7789" })
hi(0, "CmpItemKindOperator", { fg = "#a0a0a0" })
hi(0, "CmpItemKindProperty", { fg = "#9b919e" })
hi(0, "CmpItemKindReference", { fg = "#a0a0a0" })
hi(0, "CmpItemKindSnippet", { fg = "#a98095" })
hi(0, "CmpItemKindStruct", { fg = "#9090a2" })
hi(0, "CmpItemKindStructure", { fg = "#9090a2" })
hi(0, "CmpItemKindSuperMaven", { fg = "#9495b3" })
hi(0, "CmpItemKindTabNine", { fg = "#9c7789" })
hi(0, "CmpItemKindText", { fg = "#9e9fa2" })
hi(0, "CmpItemKindType", { fg = "#9c7789" })
hi(0, "CmpItemKindTypeParameter", { fg = "#9b919e" })
hi(0, "CmpItemKindUnit", { fg = "#9090a2" })
hi(0, "CmpItemKindValue", { fg = "#62a29a" })
hi(0, "CmpItemKindVariable", { fg = "#9090a2" })
hi(0, "CmpPmenu", { bg = "#141414" })
hi(0, "CmpSel", { bg = "#232323", bold = true, fg = "#a398b9" })
hi(0, "ColorColumn", { bg = "#151515" })
hi(0, "Comment", { bold = true, fg = "#513f3a", italic = true })
hi(0, "Conceal", vim.empty_dict())
hi(0, "Conditional", { fg = "#9090a2" })
hi(0, "Constant", { fg = "#9b919e" })
hi(0, "CurSearch", { bg = "#a8a8a8", bold = true, fg = "#060606" })
hi(0, "Cursor", { bg = "#adadad", fg = "#010101" })
hi(0, "CursorColumn", { bg = "#0f0f0f" })
hi(0, "CursorLine", { bg = "#101010" })
hi(0, "CursorLineNr", { fg = "#9b919e" })
hi(0, "DAPUIScope", { fg = "#62a29a" })
hi(0, "DAPUIType", { fg = "#ab7a58" })
hi(0, "DAPUIValue", { fg = "#62a29a" })
hi(0, "DAPUIVariable", { fg = "#9b919e" })
hi(0, "DapBreakPointRejected", { fg = "#a398b9" })
hi(0, "DapBreakpoint", { fg = "#a98095" })
hi(0, "DapBreakpointCondition", { fg = "#9495b3" })
hi(0, "DapLogPoint", { fg = "#62a29a" })
hi(0, "DapStopped", { fg = "#9c7789" })
hi(0, "DapUIBreakPointsCurrentLine", { bold = true, fg = "#52797b" })
hi(0, "DapUIBreakpointsDisabledLine", { fg = "#372722" })
hi(0, "DapUIBreakpointsInfo", { fg = "#52797b" })
hi(0, "DapUIBreakpointsPath", { fg = "#62a29a" })
hi(0, "DapUIDecoration", { fg = "#62a29a" })
hi(0, "DapUIFloatBorder", { fg = "#62a29a" })
hi(0, "DapUILineNumber", { fg = "#62a29a" })
hi(0, "DapUIModifiedValue", { fg = "#a398b9" })
hi(0, "DapUINormalNC", { bg = "#0c0c0c", fg = "#a0a0a0" })
hi(0, "DapUIPlayPause", { fg = "#52797b" })
hi(0, "DapUIPlayPauseNC", { fg = "#52797b" })
hi(0, "DapUIRestart", { fg = "#52797b" })
hi(0, "DapUIRestartNC", { fg = "#52797b" })
hi(0, "DapUIStepBack", { fg = "#7e7c6e" })
hi(0, "DapUIStepBackNC", { fg = "#7e7c6e" })
hi(0, "DapUIStepInto", { fg = "#7e7c6e" })
hi(0, "DapUIStepIntoNC", { fg = "#7e7c6e" })
hi(0, "DapUIStepOut", { fg = "#7e7c6e" })
hi(0, "DapUIStepOutNC", { fg = "#7e7c6e" })
hi(0, "DapUIStepOver", { fg = "#7e7c6e" })
hi(0, "DapUIStepOverNC", { fg = "#7e7c6e" })
hi(0, "DapUIStop", { fg = "#a98095" })
hi(0, "DapUIStopNC", { fg = "#a98095" })
hi(0, "DapUIStoppedThread", { fg = "#62a29a" })
hi(0, "DapUIThread", { fg = "#52797b" })
hi(0, "DapUIUnavailable", { fg = "#2e221e" })
hi(0, "DapUIUnavailableNC", { fg = "#2e221e" })
hi(0, "DapUIWatchesEmpty", { fg = "#9c7789" })
hi(0, "DapUIWatchesError", { fg = "#9c7789" })
hi(0, "DapUIWatchesValue", { fg = "#52797b" })
hi(0, "DapUIWinSelect", { bold = true, ctermfg = 14, fg = "#8fcaac" })
hi(0, "Debug", { fg = "#9b919e" })
hi(0, "Define", { fg = "#9090a2" })
hi(0, "Delimiter", { fg = "#a8786b" })
hi(0, "DiagnosticDeprecated", { sp = "#f1c0e6", strikethrough = true })
hi(0, "DiagnosticError", { fg = "#a98095" })
hi(0, "DiagnosticHint", { fg = "#b39581" })
hi(0, "DiagnosticInfo", { fg = "#52797b" })
hi(0, "DiagnosticOk", { ctermfg = 10, fg = "#87d5e3" })
hi(0, "DiagnosticUnderlineError", { sp = "#f1c0e6", underline = true })
hi(0, "DiagnosticUnderlineHint", { sp = "#cbdca5", underline = true })
hi(0, "DiagnosticUnderlineInfo", { sp = "#a1f8d3", underline = true })
hi(0, "DiagnosticUnderlineOk", { sp = "#a2f2ff", underline = true })
hi(0, "DiagnosticUnderlineWarn", { sp = "#d5e2ff", underline = true })
hi(0, "DiagnosticWarn", { fg = "#9495b3" })
hi(0, "DiffAdd", { bg = "#1e1e1e", fg = "#52797b" })
hi(0, "DiffAdded", { bg = "#1e1e1e", fg = "#52797b" })
hi(0, "DiffChange", { bg = "#191919", fg = "#513f3a" })
hi(0, "DiffChangeDelete", { bg = "#212121", fg = "#a98095" })
hi(0, "DiffDelete", { bg = "#212121", fg = "#a98095" })
hi(0, "DiffModified", { bg = "#232323", fg = "#a398b9" })
hi(0, "DiffRemoved", { bg = "#212121", fg = "#a98095" })
hi(0, "DiffText", { bg = "#151515", fg = "#9b919e" })
hi(0, "DiffviewDiffAddAsDelete", { bg = "#282828" })
hi(0, "DiffviewDiffDeleteDim", { bg = "#282828" })
hi(0, "Directory", { fg = "#84a1a3" })
hi(0, "DressingSelectIdx", { link = "Special" })
hi(0, "Error", { bg = "#a3a3a3", fg = "#010101" })
hi(0, "ErrorMsg", { bg = "#0c0c0c", fg = "#9b919e" })
hi(0, "Exception", { fg = "#9b919e" })
hi(0, "FlashCurrent", { bg = "#7e7e7e", fg = "#060606" })
hi(0, "FlashLabel", { bold = true, fg = "#9b919e" })
hi(0, "FlashMatch", { bg = "#888888", fg = "#060606" })
hi(0, "Float", { fg = "#7f7f7f" })
hi(0, "FloatBorder", { fg = "#62a29a" })
hi(0, "FloatShadow", { bg = "#464646", blend = 80, ctermbg = 0 })
hi(0, "FloatShadowThrough", { bg = "#464646", blend = 100, ctermbg = 0 })
hi(0, "FloatTitle", { bg = "#2d2d2d", fg = "#9b919e" })
hi(0, "FoldColumn", vim.empty_dict())
hi(0, "Folded", { bg = "#151515", fg = "#513f3a" })
hi(0, "Function", { fg = "#84a1a3" })
hi(0, "FzfLuaBackdrop", { bg = "#000000" })
hi(0, "FzfLuaBufFlagAlt", { fg = "#b7cec0" })
hi(0, "FzfLuaBufFlagCur", { fg = "#af489f" })
hi(0, "FzfLuaBufNr", { fg = "#d1d1d1" })
hi(0, "FzfLuaHeaderBind", { fg = "#d1d1d1" })
hi(0, "FzfLuaHeaderText", { fg = "#af489f" })
hi(0, "FzfLuaLivePrompt", { fg = "#c8748d" })
hi(0, "FzfLuaLiveSym", { fg = "#c8748d" })
hi(0, "FzfLuaPathColNr", { fg = "#b7cec0" })
hi(0, "FzfLuaPathLineNr", { fg = "#00cdf0" })
hi(0, "FzfLuaPreviewNormal", { bg = "#111111" })
hi(0, "FzfLuaTabMarker", { bold = true, fg = "#d1d1d1" })
hi(0, "FzfLuaTabTitle", { bold = true, fg = "#bcbfba" })
hi(0, "GitSignsStagedAdd", { fg = "#414142" })
hi(0, "GitSignsStagedAddCul", { fg = "#414142" })
hi(0, "GitSignsStagedAddLn", { bg = "#1e1e1e", fg = "#2e2e2e" })
hi(0, "GitSignsStagedAddNr", { fg = "#414142" })
hi(0, "GitSignsStagedChange", { fg = "#533d2d" })
hi(0, "GitSignsStagedChangeCul", { fg = "#533d2d" })
hi(0, "GitSignsStagedChangeLn", { bg = "#191919", fg = "#151515" })
hi(0, "GitSignsStagedChangeNr", { fg = "#533d2d" })
hi(0, "GitSignsStagedChangedelete", { fg = "#533d2d" })
hi(0, "GitSignsStagedChangedeleteCul", { fg = "#533d2d" })
hi(0, "GitSignsStagedChangedeleteLn", { bg = "#191919", fg = "#151515" })
hi(0, "GitSignsStagedChangedeleteNr", { fg = "#533d2d" })
hi(0, "GitSignsStagedDelete", { fg = "#3d3438" })
hi(0, "GitSignsStagedDeleteCul", { fg = "#3d3438" })
hi(0, "GitSignsStagedDeleteNr", { fg = "#3d3438" })
hi(0, "GitSignsStagedTopdelete", { fg = "#3d3438" })
hi(0, "GitSignsStagedTopdeleteCul", { fg = "#3d3438" })
hi(0, "GitSignsStagedTopdeleteNr", { fg = "#3d3438" })
hi(0, "GitSignsStagedUntracked", { fg = "#414142" })
hi(0, "GitSignsStagedUntrackedCul", { fg = "#414142" })
hi(0, "GitSignsStagedUntrackedLn", { bg = "#1e1e1e", fg = "#2e2e2e" })
hi(0, "GitSignsStagedUntrackedNr", { fg = "#414142" })
hi(0, "IblChar", { fg = "#363636" })
hi(0, "IblScopeChar", { fg = "#281f1d" })
hi(0, "Identifier", { fg = "#9b919e" })
hi(0, "IncSearch", { bg = "#838383", fg = "#020202" })
hi(0, "Include", { fg = "#84a1a3" })
hi(0, "Italic", { italic = true })
hi(0, "Keyword", { fg = "#9090a2" })
hi(0, "Label", { fg = "#9c7789" })
hi(0, "LazyButton", { bg = "#111111", fg = "#72534a" })
hi(0, "LazyButtonActive", { bg = "#282828", bold = true, fg = "#9b919e" })
hi(0, "LazyCommit", { fg = "#52797b" })
hi(0, "LazyCommitIssue", { fg = "#855d71" })
hi(0, "LazyDir", { fg = "#a0a0a0" })
hi(0, "LazyH1", { bg = "#282828", fg = "#9b919e" })
hi(0, "LazyH2", { bold = true, fg = "#7e7c6e", underline = true })
hi(0, "LazyNoCond", { fg = "#a98095" })
hi(0, "LazyOperator", { fg = "#9b919e" })
hi(0, "LazyProgressDone", { fg = "#52797b" })
hi(0, "LazyReasonCmd", { fg = "#9199bf" })
hi(0, "LazyReasonEvent", { fg = "#9495b3" })
hi(0, "LazyReasonFt", { fg = "#b39581" })
hi(0, "LazyReasonImport", { fg = "#9b919e" })
hi(0, "LazyReasonKeys", { fg = "#6da2ab" })
hi(0, "LazyReasonPlugin", { fg = "#a98095" })
hi(0, "LazyReasonRuntime", { fg = "#666451" })
hi(0, "LazyReasonSource", { fg = "#62a29a" })
hi(0, "LazyReasonStart", { fg = "#9b919e" })
hi(0, "LazySpecial", { fg = "#7e7c6e" })
hi(0, "LazyTaskOutput", { fg = "#9b919e" })
hi(0, "LazyUrl", { fg = "#a0a0a0" })
hi(0, "LazyValue", { fg = "#6da2ab" })
hi(0, "LeapBackdrop", { fg = "#2e221e" })
hi(0, "LeapLabel", { bold = true, fg = "#9495b3" })
hi(0, "LeapMatch", { bold = true, fg = "#9495b3" })
hi(0, "LineNr", { fg = "#363636" })
hi(0, "LspInlayHint", { bg = "#151515", fg = "#513f3a" })
hi(0, "LspReferenceRead", { bg = "#151515" })
hi(0, "LspReferenceText", { bg = "#151515" })
hi(0, "LspReferenceWrite", { bg = "#151515" })
hi(0, "LspSignatureActiveParameter", { bg = "#7e7e7e", fg = "#060606" })
hi(0, "Macro", { fg = "#9b919e" })
hi(0, "MarkviewCheckboxStriked", { fg = "#503f3a", strikethrough = true })
hi(0, "MarkviewCode", { bg = "#171717" })
hi(0, "MarkviewCodeFg", { fg = "#0a0a0a" })
hi(0, "MarkviewCodeInfo", { bg = "#171717", fg = "#513f3a" })
hi(0, "MarkviewGradient0", { fg = "#010101" })
hi(0, "MarkviewGradient1", { fg = "#101010" })
hi(0, "MarkviewGradient2", { fg = "#242424" })
hi(0, "MarkviewGradient3", { fg = "#353535" })
hi(0, "MarkviewGradient4", { fg = "#454545" })
hi(0, "MarkviewGradient5", { fg = "#575757" })
hi(0, "MarkviewGradient6", { fg = "#666868" })
hi(0, "MarkviewGradient7", { fg = "#6f7b7c" })
hi(0, "MarkviewGradient8", { fg = "#7a8e90" })
hi(0, "MarkviewGradient9", { fg = "#84a1a3" })
hi(0, "MarkviewIcon0", { bg = "#171717", fg = "#503f3a" })
hi(0, "MarkviewIcon1", { bg = "#171717", fg = "#686868" })
hi(0, "MarkviewIcon2", { bg = "#171717", fg = "#626262" })
hi(0, "MarkviewIcon3", { bg = "#171717", fg = "#a7796b" })
hi(0, "MarkviewIcon4", { bg = "#171717", fg = "#9a919e" })
hi(0, "MarkviewIcon5", { bg = "#171717", fg = "#949494" })
hi(0, "MarkviewIcon6", { bg = "#171717", fg = "#a0a0a0" })
hi(0, "MarkviewInlineCode", { bg = "#222222" })
hi(0, "MarkviewPalette0", { bg = "#151515", fg = "#503f3a" })
hi(0, "MarkviewPalette0Bg", { bg = "#151515" })
hi(0, "MarkviewPalette0Fg", { fg = "#503f3a" })
hi(0, "MarkviewPalette0Sign", { fg = "#503f3a" })
hi(0, "MarkviewPalette1", { bg = "#191919", fg = "#686868" })
hi(0, "MarkviewPalette1Bg", { bg = "#191919" })
hi(0, "MarkviewPalette1Fg", { fg = "#686868" })
hi(0, "MarkviewPalette1Sign", { fg = "#686868" })
hi(0, "MarkviewPalette2", { bg = "#171717", fg = "#626262" })
hi(0, "MarkviewPalette2Bg", { bg = "#171717" })
hi(0, "MarkviewPalette2Fg", { fg = "#626262" })
hi(0, "MarkviewPalette2Sign", { fg = "#626262" })
hi(0, "MarkviewPalette3", { bg = "#1e1e1e", fg = "#a7796b" })
hi(0, "MarkviewPalette3Bg", { bg = "#1e1e1e" })
hi(0, "MarkviewPalette3Fg", { fg = "#a7796b" })
hi(0, "MarkviewPalette3Sign", { fg = "#a7796b" })
hi(0, "MarkviewPalette4", { bg = "#1e1e1e", fg = "#9a919e" })
hi(0, "MarkviewPalette4Bg", { bg = "#1e1e1e" })
hi(0, "MarkviewPalette4Fg", { fg = "#9a919e" })
hi(0, "MarkviewPalette4Sign", { fg = "#9a919e" })
hi(0, "MarkviewPalette5", { bg = "#1f1f1f", fg = "#949494" })
hi(0, "MarkviewPalette5Bg", { bg = "#1f1f1f" })
hi(0, "MarkviewPalette5Fg", { fg = "#949494" })
hi(0, "MarkviewPalette5Sign", { fg = "#949494" })
hi(0, "MarkviewPalette6", { bg = "#202020", fg = "#a0a0a0" })
hi(0, "MarkviewPalette6Bg", { bg = "#202020" })
hi(0, "MarkviewPalette6Fg", { fg = "#a0a0a0" })
hi(0, "MarkviewPalette6Sign", { fg = "#a0a0a0" })
hi(0, "MarkviewPalette7", { bg = "#1e1e1e", fg = "#8e91a3" })
hi(0, "MarkviewPalette7Bg", { bg = "#1e1e1e" })
hi(0, "MarkviewPalette7Fg", { fg = "#8e91a3" })
hi(0, "MarkviewPalette7Sign", { fg = "#8e91a3" })
hi(0, "MasonHeader", { bg = "#9b9b9b", fg = "#060606" })
hi(0, "MasonHeaderSecondary", { link = "MasonHighlightBlock" })
hi(0, "MasonHighlight", { fg = "#7e7c6e" })
hi(0, "MasonHighlightBlock", { bg = "#7e7e7e", fg = "#060606" })
hi(0, "MasonHighlightBlockBold", { link = "MasonHighlightBlock" })
hi(0, "MasonMuted", { fg = "#513f3a" })
hi(0, "MasonMutedBlock", { bg = "#111111", fg = "#513f3a" })
hi(0, "MatchParen", { link = "MatchWord" })
hi(0, "MatchWord", { bg = "#313131", fg = "#9c7789" })
hi(0, "ModeMsg", { fg = "#9e9fa2" })
hi(0, "MoreMsg", { fg = "#9e9fa2" })
hi(0, "NeogitBranch", { bold = true, fg = "#7e7c6e" })
hi(0, "NeogitBranchHead", { bold = true, fg = "#7e7c6e", underline = true })
hi(0, "NeogitChangeAdded", { bg = "#2b2b2b", bold = true, fg = "#52797b", italic = true })
hi(0, "NeogitChangeCopied", { bold = true, fg = "#62a29a", italic = true })
hi(0, "NeogitChangeDeleted", { bold = true, fg = "#a98095", italic = true })
hi(0, "NeogitChangeModified", { bold = true, fg = "#7e7c6e", italic = true })
hi(0, "NeogitChangeNewFile", { bold = true, fg = "#52797b", italic = true })
hi(0, "NeogitChangeRenamed", { bold = true, fg = "#b39581", italic = true })
hi(0, "NeogitChangeUnmerged", { bold = true, fg = "#9495b3", italic = true })
hi(0, "NeogitChangeUpdated", { bold = true, fg = "#a398b9", italic = true })
hi(0, "NeogitCommitViewHeader", { bg = "#161616", fg = "#9b919e" })
hi(0, "NeogitDiffAdd", { bg = "#020202", fg = "#435a5b" })
hi(0, "NeogitDiffAddCursor", { bg = "#313131", fg = "#9cacac" })
hi(0, "NeogitDiffAddHighlight", { bg = "#0d0d0d", fg = "#52797b" })
hi(0, "NeogitDiffAdditions", { fg = "#52797b" })
hi(0, "NeogitDiffContext", { bg = "#0c0c0c", fg = "#281f1d" })
hi(0, "NeogitDiffContextCursor", { bg = "#101010", fg = "#959595" })
hi(0, "NeogitDiffContextHighlight", { bg = "#151515", fg = "#513f3a" })
hi(0, "NeogitDiffDelete", { bg = "#010001", fg = "#87396b" })
hi(0, "NeogitDiffDeleteCursor", { bg = "#1f1f1f", fg = "#b0a1a8" })
hi(0, "NeogitDiffDeleteHighlight", { bg = "#090909", fg = "#9e5981" })
hi(0, "NeogitDiffDeletions", { fg = "#a98095" })
hi(0, "NeogitDiffHeader", { bg = "#151515", bold = true, fg = "#7e7c6e" })
hi(0, "NeogitDiffHeaderHighlight", { bg = "#151515", bold = true, fg = "#a398b9" })
hi(0, "NeogitFilePath", { fg = "#7e7c6e", italic = true })
hi(0, "NeogitFloatHeader", { bg = "#141414", bold = true })
hi(0, "NeogitFloatHeaderHighlight", { bg = "#151515", bold = true, fg = "#62a29a" })
hi(0, "NeogitGraphAuthor", { fg = "#a398b9" })
hi(0, "NeogitGraphBlue", { fg = "#7e7c6e" })
hi(0, "NeogitGraphBoldBlue", { bold = true, fg = "#7e7c6e" })
hi(0, "NeogitGraphBoldCyan", { bold = true, fg = "#62a29a" })
hi(0, "NeogitGraphBoldGray", { bold = true, fg = "#281f1d" })
hi(0, "NeogitGraphBoldGreen", { bold = true, fg = "#52797b" })
hi(0, "NeogitGraphBoldOrange", { bold = true, fg = "#a398b9" })
hi(0, "NeogitGraphBoldPurple", { bold = true, fg = "#b39581" })
hi(0, "NeogitGraphBoldRed", { bold = true, fg = "#a98095" })
hi(0, "NeogitGraphBoldWhite", { bold = true, fg = "#9b919e" })
hi(0, "NeogitGraphBoldYellow", { bold = true, fg = "#9495b3" })
hi(0, "NeogitGraphCyan", { fg = "#62a29a" })
hi(0, "NeogitGraphGray", { fg = "#281f1d" })
hi(0, "NeogitGraphGreen", { fg = "#52797b" })
hi(0, "NeogitGraphOrange", { fg = "#a398b9" })
hi(0, "NeogitGraphPurple", { fg = "#b39581" })
hi(0, "NeogitGraphRed", { fg = "#a98095" })
hi(0, "NeogitGraphWhite", { fg = "#9b919e" })
hi(0, "NeogitGraphYellow", { fg = "#9495b3" })
hi(0, "NeogitHunkHeader", { bg = "#202020", bold = true, fg = "#443d34" })
hi(0, "NeogitHunkHeaderCursor", { bg = "#737373", bold = true, fg = "#292429" })
hi(0, "NeogitHunkHeaderHighlight", { bg = "#6d6d6d", bold = true, fg = "#1a1919" })
hi(0, "NeogitHunkMergeHeader", { bg = "#2d2d2d", bold = true, fg = "#060606" })
hi(0, "NeogitHunkMergeHeaderCursor", { bg = "#93a5a2", bold = true, fg = "#060606" })
hi(0, "NeogitHunkMergeHeaderHighlight", { bg = "#93a5a2", bold = true, fg = "#060606" })
hi(0, "NeogitPopupActionKey", { fg = "#b39581" })
hi(0, "NeogitPopupConfigKey", { fg = "#b39581" })
hi(0, "NeogitPopupOptionKey", { fg = "#b39581" })
hi(0, "NeogitPopupSwitchKey", { fg = "#b39581" })
hi(0, "NeogitRemote", { bold = true, fg = "#52797b" })
hi(0, "NeogitSectionHeader", { bold = true, fg = "#a98095" })
hi(0, "NeogitTagDistance", { fg = "#62a29a" })
hi(0, "NeogitTagName", { fg = "#9495b3" })
hi(0, "NeogitUnmergedInto", { bold = true, fg = "#b39581" })
hi(0, "NeogitUnpulledFrom", { bold = true, fg = "#b39581" })
hi(0, "NeogitUnpushedTo", { bold = true, fg = "#b39581" })
hi(0, "NoiceFormatProgressDone", { bg = "#a3a3a3", fg = "#020202" })
hi(0, "NoiceHiddenCursor", { blend = 100, nocombine = true })
hi(0, "NonText", { fg = "#363636" })
hi(0, "Normal", { bg = "#0c0c0c", fg = "#a0a0a0" })
hi(0, "NormalFloat", { bg = "#111111" })
hi(0, "Number", { fg = "#777672" })
hi(0, "NvChAsciiHeader", { fg = "#7e7c6e" })
hi(0, "NvChHeadbaby_pink", { bg = "#909090", fg = "#060606" })
hi(0, "NvChHeadblue", { bg = "#888888", fg = "#060606" })
hi(0, "NvChHeadcyan", { bg = "#93a5a2", fg = "#060606" })
hi(0, "NvChHeadgreen", { bg = "#7e7e7e", fg = "#060606" })
hi(0, "NvChHeading", { bg = "#888888", bold = true, fg = "#060606" })
hi(0, "NvChHeadorange", { bg = "#acacac", fg = "#060606" })
hi(0, "NvChHeadpurple", { bg = "#a9a9a9", fg = "#060606" })
hi(0, "NvChHeadred", { bg = "#9b9b9b", fg = "#060606" })
hi(0, "NvChHeadteal", { bg = "#a6a6a6", fg = "#060606" })
hi(0, "NvChHeadvibrant_green", { bg = "#919191", fg = "#060606" })
hi(0, "NvChHeadwhite", { bg = "#a3a3a3", fg = "#060606" })
hi(0, "NvChHeadyellow", { bg = "#a6a6a6", fg = "#060606" })
hi(0, "NvChSection", { bg = "#151515" })
hi(0, "NvDashAscii", { fg = "#7e7c6e" })
hi(0, "NvDashButtons", { fg = "#513f3a" })
hi(0, "NvDashFooter", { fg = "#a98095" })
hi(0, "NvimInternalError", { fg = "#a98095" })
hi(0, "NvimTreeCursorLine", { bg = "#141414" })
hi(0, "NvimTreeDiagnosticErrorFileHL", { link = "DiagnosticError" })
hi(0, "NvimTreeDiagnosticErrorFolderHL", { link = "DiagnosticError" })
hi(0, "NvimTreeDiagnosticHintFileHL", { link = "DiagnosticHint" })
hi(0, "NvimTreeDiagnosticHintFolderHL", { link = "DiagnosticHint" })
hi(0, "NvimTreeDiagnosticInfoFileHL", { link = "DiagnosticNormal" })
hi(0, "NvimTreeDiagnosticInfoFolderHL", { link = "DiagnosticNormal" })
hi(0, "NvimTreeDiagnosticWarnFileHL", { link = "DiagnosticWarn" })
hi(0, "NvimTreeDiagnosticWarnFolderHL", { link = "DiagnosticWarn" })
hi(0, "NvimTreeEmptyFolderName", { fg = "#a1a1a8" })
hi(0, "NvimTreeEndOfBuffer", { fg = "#040404" })
hi(0, "NvimTreeFolderArrowClosed", { fg = "#2e221e" })
hi(0, "NvimTreeFolderArrowOpen", { fg = "#a1a1a8" })
hi(0, "NvimTreeFolderIcon", { fg = "#a1a1a8" })
hi(0, "NvimTreeFolderName", { fg = "#a1a1a8" })
hi(0, "NvimTreeGitDeleted", { fg = "#a98095" })
hi(0, "NvimTreeGitDirty", { fg = "#a98095" })
hi(0, "NvimTreeGitIgnored", { fg = "#513f3a" })
hi(0, "NvimTreeGitNew", { fg = "#9495b3" })
hi(0, "NvimTreeIndentMarker", { fg = "#313131" })
hi(0, "NvimTreeNormal", { bg = "#111111" })
hi(0, "NvimTreeNormalNC", { bg = "#111111" })
hi(0, "NvimTreeOpenedFolderName", { fg = "#a1a1a8" })
hi(0, "NvimTreeRootFolder", { bold = true, fg = "#a98095" })
hi(0, "NvimTreeSpecialFile", { bold = true, fg = "#9495b3" })
hi(0, "NvimTreeWinSeparator", { bg = "#111111", fg = "#5a443e" })
hi(0, "NvimTreeWindowPicker", { bg = "#151515", fg = "#a98095" })
hi(0, "ObsidianBlockID", { fg = "#aab9a2", italic = true })
hi(0, "ObsidianBullet", { bold = true, fg = "#aab9a2" })
hi(0, "ObsidianDone", { bold = true, fg = "#aab9a2" })
hi(0, "ObsidianExtLinkIcon", { fg = "#cd7848" })
hi(0, "ObsidianHighlightText", { bg = "#545b6a" })
hi(0, "ObsidianImportant", { bold = true, fg = "#933f8a" })
hi(0, "ObsidianRefText", { fg = "#cd7848", underline = true })
hi(0, "ObsidianRightArrow", { bold = true, fg = "#ae7bb6" })
hi(0, "ObsidianTag", { fg = "#aab9a2", italic = true })
hi(0, "ObsidianTilde", { bold = true, fg = "#bb5191" })
hi(0, "ObsidianTodo", { bold = true, fg = "#ae7bb6" })
hi(0, "Operator", { fg = "#7f7f7f" })
hi(0, "Pmenu", { bg = "#0b0b0b" })
hi(0, "PmenuSbar", { bg = "#111111" })
hi(0, "PmenuSel", { bg = "#232323", bold = true, fg = "#a398b9" })
hi(0, "PmenuThumb", { bg = "#2d2d2d" })
hi(0, "PreProc", { fg = "#9c7789" })
hi(0, "Question", { fg = "#84a1a3" })
hi(0, "QuickFixLine", { bg = "#0f0f0f" })
hi(0, "RedrawDebugClear", { bg = "#414964", ctermbg = 11, ctermfg = 0 })
hi(0, "RedrawDebugComposed", { bg = "#0b424a", ctermbg = 10, ctermfg = 0 })
hi(0, "RedrawDebugRecompose", { bg = "#31142a", ctermbg = 9, ctermfg = 0 })
hi(0, "Removed", { fg = "#9c7789" })
hi(0, "Repeat", { fg = "#9c7789" })
hi(0, "Search", { bg = "#a3a3a3", fg = "#020202" })
hi(0, "SignColumn", { fg = "#363636" })
hi(0, "Special", { fg = "#9b919e" })
hi(0, "SpecialChar", { fg = "#a8786b" })
hi(0, "SpecialKey", { fg = "#363636" })
hi(0, "SpellBad", { sp = "#bca8c1", undercurl = true })
hi(0, "SpellCap", { sp = "#94bfc3", undercurl = true })
hi(0, "SpellLocal", { sp = "#b581a2", undercurl = true })
hi(0, "SpellRare", { sp = "#a9aacc", undercurl = true })
hi(0, "St_CommandMode", { bg = "#7e7e7e", fg = "#060606" })
hi(0, "St_CommandModeSep", { bg = "#141414", fg = "#52797b" })
hi(0, "St_CommandmodeText", { bg = "#111111", fg = "#52797b" })
hi(0, "St_ConfirmMode", { bg = "#a6a6a6", fg = "#060606" })
hi(0, "St_ConfirmModeSep", { bg = "#141414", fg = "#6da2ab" })
hi(0, "St_ConfirmmodeText", { bg = "#111111", fg = "#6da2ab" })
hi(0, "St_EmptySpace", { fg = "#060606" })
hi(0, "St_EmptySpace2", { fg = "#060606" })
hi(0, "St_InsertMode", { bg = "#939393", fg = "#060606" })
hi(0, "St_InsertModeSep", { bg = "#141414", fg = "#ab7a58" })
hi(0, "St_InsertmodeText", { bg = "#111111", fg = "#ab7a58" })
hi(0, "St_Lsp", { fg = "#52797b" })
hi(0, "St_LspHints", { fg = "#b39581" })
hi(0, "St_LspInfo", { fg = "#52797b" })
hi(0, "St_LspMsg", { fg = "#52797b" })
hi(0, "St_NTerminalMode", { bg = "#a6a6a6", fg = "#060606" })
hi(0, "St_NTerminalModeSep", { bg = "#141414", fg = "#9495b3" })
hi(0, "St_NTerminalmodeText", { bg = "#111111", fg = "#9495b3" })
hi(0, "St_NormalMode", { bg = "#888888", fg = "#060606" })
hi(0, "St_NormalModeSep", { bg = "#141414", fg = "#7e7c6e" })
hi(0, "St_NormalmodeText", { bg = "#111111", fg = "#7e7c6e" })
hi(0, "St_Pos_bg", { bg = "#a6a6a6", fg = "#060606" })
hi(0, "St_Pos_sep", { bg = "#141414", fg = "#9495b3" })
hi(0, "St_Pos_txt", { bg = "#111111", fg = "#9495b3" })
hi(0, "St_ReplaceMode", { bg = "#acacac", fg = "#060606" })
hi(0, "St_ReplaceModeSep", { bg = "#141414", fg = "#a398b9" })
hi(0, "St_ReplacemodeText", { bg = "#111111", fg = "#a398b9" })
hi(0, "St_SelectMode", { bg = "#888888", fg = "#060606" })
hi(0, "St_SelectModeSep", { bg = "#141414", fg = "#7e7c6e" })
hi(0, "St_SelectmodeText", { bg = "#111111", fg = "#7e7c6e" })
hi(0, "St_TerminalMode", { bg = "#7e7e7e", fg = "#060606" })
hi(0, "St_TerminalModeSep", { bg = "#141414", fg = "#52797b" })
hi(0, "St_TerminalmodeText", { bg = "#111111", fg = "#52797b" })
hi(0, "St_VisualMode", { bg = "#93a5a2", fg = "#060606" })
hi(0, "St_VisualModeSep", { bg = "#141414", fg = "#62a29a" })
hi(0, "St_VisualmodeText", { bg = "#111111", fg = "#62a29a" })
hi(0, "St_cwd_bg", { bg = "#acacac", fg = "#060606" })
hi(0, "St_cwd_sep", { bg = "#141414", fg = "#a398b9" })
hi(0, "St_cwd_txt", { bg = "#111111", fg = "#a398b9" })
hi(0, "St_file", { fg = "#9b919e" })
hi(0, "St_file_bg", { bg = "#9b9b9b", fg = "#060606" })
hi(0, "St_file_sep", { bg = "#141414", fg = "#a98095" })
hi(0, "St_file_txt", { bg = "#111111", fg = "#a98095" })
hi(0, "St_gitIcons", { bold = true, fg = "#6c4f45" })
hi(0, "St_lspError", { fg = "#a98095" })
hi(0, "St_lspWarning", { fg = "#9495b3" })
hi(0, "St_lsp_bg", { bg = "#7e7e7e", fg = "#060606" })
hi(0, "St_lsp_sep", { bg = "#141414", fg = "#52797b" })
hi(0, "St_lsp_txt", { bg = "#111111", fg = "#52797b" })
hi(0, "St_sep_r", { fg = "#040404" })
hi(0, "Statement", { fg = "#9b919e" })
hi(0, "StatusLine", vim.empty_dict())
hi(0, "StatusLineNC", { bg = "#222222", fg = "#ababab" })
hi(0, "StorageClass", { fg = "#9c7789" })
hi(0, "String", { fg = "#9e9fa2" })
hi(0, "Structure", { fg = "#9090a2" })
hi(0, "Substitute", { bg = "#909090", fg = "#020202" })
hi(0, "TBTabTitle", { bg = "#888888", fg = "#060606" })
hi(0, "Tag", { fg = "#9c7789" })
hi(0, "TbBufOff", { bg = "#151515", fg = "#513f3a" })
hi(0, "TbBufOffClose", { bg = "#151515", fg = "#513f3a" })
hi(0, "TbBufOffModified", { bg = "#151515", fg = "#a98095" })
hi(0, "TbBufOn", { bg = "#141414", fg = "#9b919e" })
hi(0, "TbBufOnClose", { bg = "#141414", fg = "#a98095" })
hi(0, "TbBufOnModified", { bg = "#141414", fg = "#52797b" })
hi(0, "TbCloseAllBufsBtn", { bg = "#9b9b9b", bold = true, fg = "#060606" })
hi(0, "TbFill", { bg = "#151515" })
hi(0, "TbTabCloseBtn", { bg = "#6f6f6f", fg = "#060606" })
hi(0, "TbTabNewBtn", { bg = "#151515", fg = "#9b919e" })
hi(0, "TbTabOff", { bg = "#151515", fg = "#9b919e" })
hi(0, "TbTabOn", { fg = "#a98095" })
hi(0, "TbThemeToggleBtn", { bg = "#151515", bold = true, fg = "#9b919e" })
hi(0, "TelescopeBorder", { bg = "#111111", fg = "#040404" })
hi(0, "TelescopeMatching", { bg = "#111111", fg = "#7e7c6e" })
hi(0, "TelescopeNormal", { bg = "#111111" })
hi(0, "TelescopePreviewTitle", { bg = "#7e7e7e", fg = "#060606" })
hi(0, "TelescopePromptBorder", { bg = "#151515", fg = "#060606" })
hi(0, "TelescopePromptNormal", { bg = "#151515", fg = "#9b919e" })
hi(0, "TelescopePromptPrefix", { bg = "#151515", fg = "#a98095" })
hi(0, "TelescopePromptTitle", { bg = "#9b9b9b", fg = "#060606" })
hi(0, "TelescopeResultsDiffAdd", { fg = "#52797b" })
hi(0, "TelescopeResultsDiffChange", { fg = "#9495b3" })
hi(0, "TelescopeResultsDiffDelete", { fg = "#a98095" })
hi(0, "TelescopeResultsTitle", { bg = "#111111", fg = "#040404" })
hi(0, "TelescopeSelection", { bg = "#151515", fg = "#9b919e" })
hi(0, "TinyInlineDiagnosticVirtualTextArrow", { bg = "#101010", fg = "#363636" })
hi(0, "TinyInlineDiagnosticVirtualTextArrowNoBg", { fg = "#363636" })
hi(0, "TinyInlineDiagnosticVirtualTextBg", { bg = "#101010" })
hi(0, "TinyInlineDiagnosticVirtualTextError", { fg = "#a98095" })
hi(0, "TinyInlineDiagnosticVirtualTextErrorCursorLine", { bg = "#101010", fg = "#a98095" })
hi(0, "TinyInlineDiagnosticVirtualTextErrorMixError", { fg = "#a98095" })
hi(0, "TinyInlineDiagnosticVirtualTextErrorMixHint", { fg = "#a98095" })
hi(0, "TinyInlineDiagnosticVirtualTextErrorMixInfo", { fg = "#a98095" })
hi(0, "TinyInlineDiagnosticVirtualTextErrorMixWarn", { fg = "#a98095" })
hi(0, "TinyInlineDiagnosticVirtualTextHint", { fg = "#b39581" })
hi(0, "TinyInlineDiagnosticVirtualTextHintCursorLine", { bg = "#101010", fg = "#b39581" })
hi(0, "TinyInlineDiagnosticVirtualTextHintMixError", { fg = "#b39581" })
hi(0, "TinyInlineDiagnosticVirtualTextHintMixHint", { fg = "#b39581" })
hi(0, "TinyInlineDiagnosticVirtualTextHintMixInfo", { fg = "#b39581" })
hi(0, "TinyInlineDiagnosticVirtualTextHintMixWarn", { fg = "#b39581" })
hi(0, "TinyInlineDiagnosticVirtualTextInfo", { fg = "#52797b" })
hi(0, "TinyInlineDiagnosticVirtualTextInfoCursorLine", { bg = "#101010", fg = "#52797b" })
hi(0, "TinyInlineDiagnosticVirtualTextInfoMixError", { fg = "#52797b" })
hi(0, "TinyInlineDiagnosticVirtualTextInfoMixHint", { fg = "#52797b" })
hi(0, "TinyInlineDiagnosticVirtualTextInfoMixInfo", { fg = "#52797b" })
hi(0, "TinyInlineDiagnosticVirtualTextInfoMixWarn", { fg = "#52797b" })
hi(0, "TinyInlineDiagnosticVirtualTextWarn", { fg = "#9495b3" })
hi(0, "TinyInlineDiagnosticVirtualTextWarnCursorLine", { bg = "#101010", fg = "#9495b3" })
hi(0, "TinyInlineDiagnosticVirtualTextWarnMixError", { fg = "#9495b3" })
hi(0, "TinyInlineDiagnosticVirtualTextWarnMixHint", { fg = "#9495b3" })
hi(0, "TinyInlineDiagnosticVirtualTextWarnMixInfo", { fg = "#9495b3" })
hi(0, "TinyInlineDiagnosticVirtualTextWarnMixWarn", { fg = "#9495b3" })
hi(0, "TinyInlineInvDiagnosticVirtualTextError", { fg = "#010101" })
hi(0, "TinyInlineInvDiagnosticVirtualTextErrorNoBg", { fg = "#010101" })
hi(0, "TinyInlineInvDiagnosticVirtualTextHint", { fg = "#010101" })
hi(0, "TinyInlineInvDiagnosticVirtualTextHintNoBg", { fg = "#010101" })
hi(0, "TinyInlineInvDiagnosticVirtualTextInfo", { fg = "#010101" })
hi(0, "TinyInlineInvDiagnosticVirtualTextInfoNoBg", { fg = "#010101" })
hi(0, "TinyInlineInvDiagnosticVirtualTextWarn", { fg = "#010101" })
hi(0, "TinyInlineInvDiagnosticVirtualTextWarnNoBg", { fg = "#010101" })
hi(0, "Title", { fg = "#84a1a3" })
hi(0, "Todo", { bg = "#0f0f0f", fg = "#9c7789" })
hi(0, "TodoBgFIX", { bg = "#9b9b9b", bold = true, fg = "#010101" })
hi(0, "TodoBgHACK", { bg = "#a6a6a6", bold = true, fg = "#010101" })
hi(0, "TodoBgNOTE", { bg = "#a9a9a9", bold = true, fg = "#010101" })
hi(0, "TodoBgPERF", { bg = "#a3a3a3", bold = true, fg = "#010101" })
hi(0, "TodoBgTEST", { bg = "#a3a3a3", bold = true, fg = "#010101" })
hi(0, "TodoBgTODO", { bg = "#7e7e7e", bold = true, fg = "#010101" })
hi(0, "TodoBgWARN", { bg = "#a6a6a6", bold = true, fg = "#010101" })
hi(0, "TodoFgFIX", { fg = "#a98095" })
hi(0, "TodoFgHACK", { fg = "#9495b3" })
hi(0, "TodoFgNOTE", { fg = "#b39581" })
hi(0, "TodoFgPERF", { fg = "#9b919e" })
hi(0, "TodoFgTEST", { fg = "#9b919e" })
hi(0, "TodoFgTODO", { fg = "#52797b" })
hi(0, "TodoFgWARN", { fg = "#9495b3" })
hi(0, "TodoSignFIX", { fg = "#a98095" })
hi(0, "TodoSignHACK", { fg = "#9495b3" })
hi(0, "TodoSignNOTE", { fg = "#b39581" })
hi(0, "TodoSignPERF", { fg = "#9b919e" })
hi(0, "TodoSignTEST", { fg = "#9b919e" })
hi(0, "TodoSignTODO", { fg = "#52797b" })
hi(0, "TodoSignWARN", { fg = "#9495b3" })
hi(0, "TooLong", { fg = "#9b919e" })
hi(0, "Type", { fg = "#9c7789" })
hi(0, "Typedef", { fg = "#9c7789" })
hi(0, "Variable", { fg = "#a0a0a0" })
hi(0, "Visual", { bg = "#0f0f0f" })
hi(0, "VisualNOS", { fg = "#9b919e" })
hi(0, "WarningMsg", { fg = "#9b919e" })
hi(0, "WhichKey", { fg = "#7e7c6e" })
hi(0, "WhichKeyDesc", { fg = "#a98095" })
hi(0, "WhichKeyGroup", { fg = "#52797b" })
hi(0, "WhichKeySeparator", { fg = "#513f3a" })
hi(0, "WhichKeyValue", { fg = "#52797b" })
hi(0, "WildMenu", { bg = "#909090", fg = "#9b919e" })
hi(0, "WinBar", { bg = "#131313" })
hi(0, "WinBarNC", { bg = "#131313" })
hi(0, "WinSeparator", { fg = "#363636" })
hi(0, "diffNewFile", { fg = "#7e7c6e" })
hi(0, "diffOldFile", { fg = "#9c7789" })
hi(0, "gitcommitBranch", { bold = true, fg = "#777672" })
hi(0, "gitcommitComment", { fg = "#363636" })
hi(0, "gitcommitDiscarded", { fg = "#363636" })
hi(0, "gitcommitDiscardedFile", { bold = true, fg = "#9b919e" })
hi(0, "gitcommitDiscardedType", { fg = "#84a1a3" })
hi(0, "gitcommitHeader", { fg = "#9090a2" })
hi(0, "gitcommitOverflow", { fg = "#9b919e" })
hi(0, "gitcommitSelected", { fg = "#363636" })
hi(0, "gitcommitSelectedFile", { bold = true, fg = "#9e9fa2" })
hi(0, "gitcommitSelectedType", { fg = "#84a1a3" })
hi(0, "gitcommitSummary", { fg = "#9e9fa2" })
hi(0, "gitcommitUnmergedFile", { bold = true, fg = "#9b919e" })
hi(0, "gitcommitUnmergedType", { fg = "#84a1a3" })
hi(0, "gitcommitUntracked", { fg = "#363636" })
hi(0, "gitcommitUntrackedFile", { fg = "#9c7789" })
hi(0, "healthSuccess", { bg = "#7e7e7e", fg = "#060606" })
hi(0, "lCursor", { bg = "#adadad", fg = "#010101" })

-- Terminal colors
local g = vim.g

g.terminal_color_0 = "#211a18"
g.terminal_color_1 = "#bca8c1"
g.terminal_color_2 = "#b4bacb"
g.terminal_color_3 = "#ba8fa4"
g.terminal_color_4 = "#94bfc3"
g.terminal_color_5 = "#a9aacc"
g.terminal_color_6 = "#b581a2"
g.terminal_color_7 = "#beb8c5"
g.terminal_color_8 = "#49504e"
g.terminal_color_9 = "#bca8c1"
g.terminal_color_10 = "#b4bacb"
g.terminal_color_11 = "#ba8fa4"
g.terminal_color_12 = "#94bfc3"
g.terminal_color_13 = "#a9aacc"
g.terminal_color_14 = "#b581a2"
g.terminal_color_15 = "#b4afa9"
