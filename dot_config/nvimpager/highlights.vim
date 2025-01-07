highlight SpecialKey guifg=#49504f
highlight link EndOfBuffer NonText
highlight NonText guifg=#49504f
highlight Directory guifg=#9fbfaa
highlight ErrorMsg guifg=#c8a89d guibg=#221d23
highlight IncSearch guifg=#292429 guibg=#8a909b
highlight Search guifg=#292429 guibg=#c8a89d
highlight CurSearch cterm=bold gui=bold guifg=#241f24 guibg=#ceb27d
highlight MoreMsg guifg=#c0baa9
highlight ModeMsg guifg=#c0baa9
highlight LineNr guifg=#504452
highlight link LineNrAbove LineNr
highlight link LineNrBelow LineNr
highlight CursorLineNr guifg=#c8a89d guibg=#413542
highlight CursorLineSign guibg=#413542
highlight link CursorLineFold FoldColumn
highlight Question guifg=#9fbfaa

highlight StatusLineNC cterm=bold,underline guifg=NvimLightGrey3 guibg=NvimDarkGrey3
highlight WinSeparator guifg=#2a3240
highlight link VertSplit WinSeparator
highlight Title guifg=#9fbfaa
highlight Visual guibg=#302831

highlight WarningMsg guifg=#c8a89d
highlight WildMenu guifg=#c8a89d guibg=#bf8f94
highlight Folded guifg=#88748a guibg=#241f24

highlight DiffAdd guifg=#8996ab
highlight DiffChange guifg=#88748a
highlight DiffDelete guifg=#d1969c
highlight DiffText guifg=#c8a89d guibg=#241f24
highlight SignColumn guifg=#49504f

highlight SpellBad cterm=undercurl gui=undercurl guisp=#c8a89d
highlight SpellCap cterm=undercurl gui=undercurl guisp=#9fbfaa
highlight SpellRare cterm=undercurl gui=undercurl guisp=#bfaa8c
highlight SpellLocal cterm=undercurl gui=undercurl guisp=#bf8080
highlight CursorColumn guibg=#292429
highlight CursorLine guibg=#413542
highlight ColorColumn guibg=#241f24
highlight QuickFixLine guibg=#292429
highlight link Whitespace NonText

highlight link MsgSeparator StatusLine
highlight NormalFloat guibg=#1d1d22

highlight FloatBorder guifg=#899e91


highlight Cursor guifg=#221d23 guibg=#c5b8b0
highlight FloatTitle guifg=#c8a89d guibg=#504452
highlight link FloatFooter FloatTitle
highlight link StatusLineTerm StatusLine
highlight link StatusLineTermNC StatusLineNC
highlight RedrawDebugNormal cterm=reverse gui=reverse
highlight Underlined cterm=underline gui=underline
highlight lCursor guifg=bg guibg=fg
highlight link CursorIM Cursor
highlight Substitute guifg=#292429 guibg=#bf8f94
highlight VisualNOS guifg=#c8a89d
highlight Normal guifg=#c5b8b0 guibg=none
highlight Character guifg=#c8a89d
highlight Constant guifg=#c8a89d
highlight Number guifg=#8a909b
highlight Boolean guifg=#8a909b
highlight Float guifg=#949b9f
highlight Conditional guifg=#bfaa8c
highlight Statement guifg=#c8a89d
highlight Repeat guifg=#bf8f94
highlight Label guifg=#bf8f94
highlight Keyword guifg=#bfaa8c
highlight Exception guifg=#c8a89d
highlight Include guifg=#9fbfaa
highlight PreProc guifg=#bf8f94
highlight Define guifg=#bfaa8c
highlight Macro guifg=#c8a89d
highlight link PreCondit PreProc
highlight StorageClass guifg=#bf8f94
highlight Type guifg=#bf8f94
highlight Structure guifg=#bfaa8c
highlight Typedef guifg=#bf8f94
highlight Tag guifg=#bf8f94
highlight Special guifg=#bf8080
highlight SpecialChar guifg=#906d93
highlight link SpecialComment Special
highlight Debug guifg=#c8a89d
highlight link Ignore Normal
highlight Comment cterm=bold,italic gui=bold,italic guifg=#6c5c6e
highlight @variable guifg=#c8a89d
highlight @variable.builtin guifg=#979da6
highlight @variable.parameter guifg=#c8a89d
highlight link @variable.parameter.builtin Special
highlight @constant guifg=#c8a89d
highlight @constant.builtin guifg=#8a909b
highlight @module guifg=#c8a89d
highlight link @module.builtin Special
highlight link @label Label
highlight @string guifg=#c0baa9
highlight String guifg=#c0baa9
highlight link @string.regexp @string.special
highlight link @string.special SpecialChar
highlight @string.escape guifg=#bf8080
highlight link @string.special.url Underlined
highlight @character guifg=#c8a89d
highlight link @character.special SpecialChar
highlight link @boolean Boolean
highlight @number guifg=#8a909b
highlight @number.float guifg=#8a909b
highlight link @type Type
highlight @type.builtin guifg=#bf8f94
highlight @attribute guifg=#bf8f94
highlight link @attribute.builtin Special
highlight @property guifg=#c8a89d
highlight Identifier guifg=#c8a89d
highlight @function guifg=#9fbfaa
highlight Function guifg=#9fbfaa
highlight @function.builtin guifg=#9fbfaa
highlight @constructor guifg=#bf8080
highlight @operator guifg=#a1a7ab
highlight Operator guifg=#949b9f
highlight @keyword guifg=#bfaa8c
highlight link @punctuation Delimiter
highlight Delimiter guifg=#906d93
highlight link @punctuation.special Special
highlight @comment guifg=#6c5c6e
highlight link @comment.error DiagnosticError
highlight @comment.warning guifg=#241f24 guibg=#8a909b
highlight @comment.note guifg=#292429 guibg=#8996ab
highlight @comment.todo guifg=#504452 guibg=#c8a89d
highlight Todo guifg=#bf8f94 guibg=#292429
highlight link @markup Special
highlight @markup.strong cterm=bold gui=bold
highlight @markup.italic cterm=italic gui=italic
highlight @markup.strikethrough cterm=strikethrough gui=strikethrough
highlight @markup.underline cterm=underline gui=underline
highlight @markup.heading guifg=#9fbfaa
highlight @markup.link guifg=#c8a89d

highlight @diff.plus guifg=#66987c
highlight Added guifg=#cbae85
highlight @diff.minus guifg=#d1969c
highlight Removed guifg=#bf8f94
highlight @diff.delta guifg=#88748a
highlight Changed guifg=#a68aa9
highlight @tag guifg=#bf8f94
highlight link @tag.builtin Special
highlight @markup.heading.1.delimiter.vimdoc cterm=underdouble,nocombine gui=underdouble,nocombine guifg=bg guibg=bg guisp=fg
highlight @markup.heading.2.delimiter.vimdoc cterm=underline,nocombine gui=underline,nocombine guifg=bg guibg=bg guisp=fg

highlight link @lsp.type.class @type
highlight link @lsp.type.comment @comment
highlight link @lsp.type.decorator @attribute
highlight link @lsp.type.enum @type
highlight link @lsp.type.enumMember @constant
highlight link @lsp.type.event @type
highlight link @lsp.type.function @function
highlight link @lsp.type.interface @type
highlight link @lsp.type.keyword @keyword
highlight link @lsp.type.macro @constant.macro
highlight @constant.macro guifg=#c8a89d
highlight link @lsp.type.method @function.method
highlight @function.method guifg=#9fbfaa
highlight link @lsp.type.modifier @type.qualifier
highlight link @lsp.type.namespace @module
highlight link @lsp.type.number @number
highlight link @lsp.type.operator @operator
highlight link @lsp.type.parameter @variable.parameter
highlight link @lsp.type.property @property
highlight link @lsp.type.regexp @string.regexp
highlight link @lsp.type.string @string
highlight link @lsp.type.struct @type
highlight link @lsp.type.type @type
highlight link @lsp.type.typeParameter @type.definition
highlight link @lsp.type.variable @variable
highlight link @lsp.mod.deprecated DiagnosticDeprecated
highlight DiagnosticDeprecated cterm=strikethrough gui=strikethrough guisp=NvimLightRed
highlight FloatShadow ctermbg=0 guibg=NvimDarkGrey4 blend=80
highlight FloatShadowThrough ctermbg=0 guibg=NvimDarkGrey4 blend=100
highlight link MatchParen MatchWord
highlight RedrawDebugClear ctermfg=0 ctermbg=11 guibg=NvimDarkYellow
highlight RedrawDebugComposed ctermfg=0 ctermbg=10 guibg=NvimDarkGreen
highlight RedrawDebugRecompose ctermfg=0 ctermbg=9 guibg=NvimDarkRed
highlight Error guifg=#221d23 guibg=#c8a89d
highlight NvimInternalError guifg=#d1969c
highlight link NvimAssignment Operator
highlight link NvimPlainAssignment NvimAssignment
highlight link NvimAugmentedAssignment NvimAssignment
highlight link NvimAssignmentWithAddition NvimAugmentedAssignment
highlight link NvimAssignmentWithSubtraction NvimAugmentedAssignment
highlight link NvimAssignmentWithConcatenation NvimAugmentedAssignment
highlight link NvimOperator Operator
highlight link NvimUnaryOperator NvimOperator
highlight link NvimUnaryPlus NvimUnaryOperator
highlight link NvimUnaryMinus NvimUnaryOperator
highlight link NvimNot NvimUnaryOperator
highlight link NvimBinaryOperator NvimOperator
highlight link NvimComparison NvimBinaryOperator
highlight link NvimComparisonModifier NvimComparison
highlight link NvimBinaryPlus NvimBinaryOperator
highlight link NvimBinaryMinus NvimBinaryOperator
highlight link NvimConcat NvimBinaryOperator
highlight link NvimConcatOrSubscript NvimConcat
highlight link NvimOr NvimBinaryOperator
highlight link NvimAnd NvimBinaryOperator
highlight link NvimMultiplication NvimBinaryOperator
highlight link NvimDivision NvimBinaryOperator
highlight link NvimMod NvimBinaryOperator
highlight link NvimTernary NvimOperator
highlight link NvimTernaryColon NvimTernary
highlight link NvimParenthesis Delimiter
highlight link NvimLambda NvimParenthesis
highlight link NvimNestingParenthesis NvimParenthesis
highlight link NvimCallingParenthesis NvimParenthesis
highlight link NvimSubscript NvimParenthesis
highlight link NvimSubscriptBracket NvimSubscript
highlight link NvimSubscriptColon NvimSubscript
highlight link NvimCurly NvimSubscript
highlight link NvimContainer NvimParenthesis
highlight link NvimDict NvimContainer
highlight link NvimList NvimContainer
highlight link NvimIdentifier Identifier
highlight link NvimIdentifierScope NvimIdentifier
highlight link NvimIdentifierScopeDelimiter NvimIdentifier
highlight link NvimIdentifierName NvimIdentifier
highlight link NvimIdentifierKey NvimIdentifier
highlight link NvimColon Delimiter
highlight link NvimComma Delimiter
highlight link NvimArrow Delimiter
highlight link NvimRegister SpecialChar
highlight link NvimNumber Number
highlight link NvimFloat NvimNumber
highlight link NvimNumberPrefix Type
highlight link NvimOptionSigil Type
highlight link NvimOptionName NvimIdentifier
highlight link NvimOptionScope NvimIdentifierScope
highlight link NvimOptionScopeDelimiter NvimIdentifierScopeDelimiter
highlight link NvimEnvironmentSigil NvimOptionSigil
highlight link NvimEnvironmentName NvimIdentifier
highlight link NvimString String
highlight link NvimStringBody NvimString
highlight link NvimStringQuote NvimString
highlight link NvimStringSpecial SpecialChar
highlight link NvimSingleQuote NvimStringQuote
highlight link NvimSingleQuotedBody NvimStringBody
highlight link NvimSingleQuotedQuote NvimStringSpecial
highlight link NvimDoubleQuote NvimStringQuote
highlight link NvimDoubleQuotedBody NvimStringBody
highlight link NvimDoubleQuotedEscape NvimStringSpecial
highlight link NvimFigureBrace NvimInternalError
highlight link NvimSingleQuotedUnknownEscape NvimInternalError
highlight link NvimSpacing Normal
highlight link NvimInvalidSingleQuotedUnknownEscape NvimInternalError
highlight link NvimInvalid Error
highlight link NvimInvalidAssignment NvimInvalid
highlight link NvimInvalidPlainAssignment NvimInvalidAssignment
highlight link NvimInvalidAugmentedAssignment NvimInvalidAssignment
highlight link NvimInvalidAssignmentWithAddition NvimInvalidAugmentedAssignment
highlight link NvimInvalidAssignmentWithSubtraction NvimInvalidAugmentedAssignment
highlight link NvimInvalidAssignmentWithConcatenation NvimInvalidAugmentedAssignment
highlight link NvimInvalidOperator NvimInvalid
highlight link NvimInvalidUnaryOperator NvimInvalidOperator
highlight link NvimInvalidUnaryPlus NvimInvalidUnaryOperator
highlight link NvimInvalidUnaryMinus NvimInvalidUnaryOperator
highlight link NvimInvalidNot NvimInvalidUnaryOperator
highlight link NvimInvalidBinaryOperator NvimInvalidOperator
highlight link NvimInvalidComparison NvimInvalidBinaryOperator
highlight link NvimInvalidComparisonModifier NvimInvalidComparison
highlight link NvimInvalidBinaryPlus NvimInvalidBinaryOperator
highlight link NvimInvalidBinaryMinus NvimInvalidBinaryOperator
highlight link NvimInvalidConcat NvimInvalidBinaryOperator
highlight link NvimInvalidConcatOrSubscript NvimInvalidConcat
highlight link NvimInvalidOr NvimInvalidBinaryOperator
highlight link NvimInvalidAnd NvimInvalidBinaryOperator
highlight link NvimInvalidMultiplication NvimInvalidBinaryOperator
highlight link NvimInvalidDivision NvimInvalidBinaryOperator
highlight link NvimInvalidMod NvimInvalidBinaryOperator
highlight link NvimInvalidTernary NvimInvalidOperator
highlight link NvimInvalidTernaryColon NvimInvalidTernary
highlight link NvimInvalidDelimiter NvimInvalid
highlight link NvimInvalidParenthesis NvimInvalidDelimiter
highlight link NvimInvalidLambda NvimInvalidParenthesis
highlight link NvimInvalidNestingParenthesis NvimInvalidParenthesis
highlight link NvimInvalidCallingParenthesis NvimInvalidParenthesis
highlight link NvimInvalidSubscript NvimInvalidParenthesis
highlight link NvimInvalidSubscriptBracket NvimInvalidSubscript
highlight link NvimInvalidSubscriptColon NvimInvalidSubscript
highlight link NvimInvalidCurly NvimInvalidSubscript
highlight link NvimInvalidContainer NvimInvalidParenthesis
highlight link NvimInvalidDict NvimInvalidContainer
highlight link NvimInvalidList NvimInvalidContainer
highlight link NvimInvalidValue NvimInvalid
highlight link NvimInvalidIdentifier NvimInvalidValue
highlight link NvimInvalidIdentifierScope NvimInvalidIdentifier
highlight link NvimInvalidIdentifierScopeDelimiter NvimInvalidIdentifier
highlight link NvimInvalidIdentifierName NvimInvalidIdentifier
highlight link NvimInvalidIdentifierKey NvimInvalidIdentifier
highlight link NvimInvalidColon NvimInvalidDelimiter
highlight link NvimInvalidComma NvimInvalidDelimiter
highlight link NvimInvalidArrow NvimInvalidDelimiter
highlight link NvimInvalidRegister NvimInvalidValue
highlight link NvimInvalidNumber NvimInvalidValue
highlight link NvimInvalidFloat NvimInvalidNumber
highlight link NvimInvalidNumberPrefix NvimInvalidNumber
highlight link NvimInvalidOptionSigil NvimInvalidIdentifier
highlight link NvimInvalidOptionName NvimInvalidIdentifier
highlight link NvimInvalidOptionScope NvimInvalidIdentifierScope
highlight link NvimInvalidOptionScopeDelimiter NvimInvalidIdentifierScopeDelimiter
highlight link NvimInvalidEnvironmentSigil NvimInvalidOptionSigil
highlight link NvimInvalidEnvironmentName NvimInvalidIdentifier
highlight link NvimInvalidString NvimInvalidValue
highlight link NvimInvalidStringBody NvimStringBody
highlight link NvimInvalidStringQuote NvimInvalidString
highlight link NvimInvalidStringSpecial NvimStringSpecial
highlight link NvimInvalidSingleQuote NvimInvalidStringQuote
highlight link NvimInvalidSingleQuotedBody NvimInvalidStringBody
highlight link NvimInvalidSingleQuotedQuote NvimInvalidStringSpecial
highlight link NvimInvalidDoubleQuote NvimInvalidStringQuote
highlight link NvimInvalidDoubleQuotedBody NvimInvalidStringBody
highlight link NvimInvalidDoubleQuotedEscape NvimInvalidStringSpecial
highlight link NvimInvalidDoubleQuotedUnknownEscape NvimInvalidValue
highlight link NvimInvalidFigureBrace NvimInvalidDelimiter
highlight link NvimInvalidSpacing ErrorMsg
highlight link NvimDoubleQuotedUnknownEscape NvimInvalidValue
highlight IblChar guifg=#2a3240

highlight @ibl.scope.underline.7 guibg=#241f24
highlight @ibl.scope.underline.6 guibg=#241f24
highlight @ibl.scope.underline.5 guibg=#241f24
highlight @ibl.scope.underline.4 guibg=#241f24
highlight @ibl.scope.underline.3 guibg=#241f24
highlight @ibl.scope.underline.2 guibg=#241f24
highlight @ibl.scope.underline.1 guibg=#241f24
highlight IblScopeChar guifg=#504452
highlight TooLong guifg=#c8a89d
highlight healthSuccess guifg=#292429 guibg=#66987c
highlight MatchWord guifg=#bf8f94 guibg=#6c5c6e
highlight Italic cterm=italic gui=italic
highlight Bold cterm=bold gui=bold
