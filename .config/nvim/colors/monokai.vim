" Vim color file for Monokai from Textmate

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "monokai"

" ── Palette ────────────────────────────────────────────────────────────────────
"                              gui       cterm
let s:bg         = ['#272822', 235]  " background
let s:bg_soft    = ['#3c3d37', 237]  " cursor line, sign column
let s:bg_sel     = ['#49483e',  59]  " visual selection / nontext fg
let s:bg_nontext = ['#31322c', 236]  " nontext background
let s:fg         = ['#f8f8f2', 231]  " foreground
let s:fg_cursor  = ['#f8f8f0', 231]  " cursor block / error text
let s:comment    = ['#75715e', 242]  " comments
let s:line_nr    = ['#90908a', 102]  " line numbers
let s:split      = ['#64645e', 241]  " vert split, statusline
let s:pink       = ['#f92672', 197]  " keywords, operators, tags
let s:green      = ['#a6e22e', 148]  " functions
let s:yellow     = ['#e6db74', 186]  " strings, labels
let s:purple     = ['#ae81ff', 141]  " numbers, booleans, constants
let s:cyan       = ['#66d9ef',  81]  " identifiers, types
let s:orange     = ['#fd971f', 208]  " block parameters
let s:diff_add   = ['#46830c',  64]  " diff added bg
let s:diff_del   = ['#8b0807',  88]  " diff deleted fg
let s:diff_txt   = ['#204a87',  24]  " diff changed text bg

" special highlights
let s:kw_special_1 = ['#fd1e1e',  196]  " special keyword (red)
let s:kw_special_2 = ['#fd561e',  202]  " special keyword (red-orange)
let s:kw_special_3 = ['#fcfd1e',  226]  " special keyword (yellow)
let s:kw_special_4 = ['#1efd56',   47]  " special keyword (emerald)
let s:kw_special_5 = ['#1e8dfd',   33]  " special keyword (azure)
let s:kw_special_6 = ['#8d1efd',   93]  " special keyword (violet)
let s:kw_special_7 = ['#fd1ec5',  200]  " special keyword (pink)
" ───────────────────────────────────────────────────────────────────────────────

" Helper: s:h(group, fg, bg [, gui_attr [, cterm_attr]])
" fg/bg: [hex, cterm] or [] for NONE; [hex] (single element) omits the cterm colour.
function! s:h(group, fg, bg, ...)
  let l:ga = get(a:, 1, 'NONE') | if empty(l:ga) | let l:ga = 'NONE' | endif
  let l:ca = get(a:, 2, l:ga)   | if empty(l:ca) | let l:ca = 'NONE' | endif
  execute 'hi ' . a:group
    \ . ' guifg='   . (len(a:fg) > 0 ? a:fg[0] : 'NONE')
    \ . ' ctermfg=' . (len(a:fg) > 1 ? a:fg[1] : 'NONE')
    \ . ' guibg='   . (len(a:bg) > 0 ? a:bg[0] : 'NONE')
    \ . ' ctermbg=' . (len(a:bg) > 1 ? a:bg[1] : 'NONE')
    \ . ' gui='     . l:ga
    \ . ' cterm='   . l:ca
endfunction

" ── Editor UI ──────────────────────────────────────────────────────────────────
call s:h('Cursor',       s:bg,      s:fg_cursor)
call s:h('Visual',       [],        s:bg_sel)
call s:h('CursorLine',   [],        s:bg_soft)
call s:h('CursorColumn', [],        s:bg_soft)
call s:h('ColorColumn',  [],        s:bg_soft)
call s:h('LineNr',       s:line_nr, s:bg_soft)
call s:h('VertSplit',    s:split,   s:split)
call s:h('MatchParen',   s:pink,    [],      'underline')
call s:h('StatusLine',   s:fg,      s:split, 'bold')
call s:h('StatusLineNC', s:fg,      s:split)
call s:h('Pmenu',        [],        [])
call s:h('PmenuSel',     [],        s:bg_sel)
call s:h('IncSearch',    s:bg,      s:yellow)
call s:h('Search',       [],        [],      'underline')
call s:h('Directory',    s:purple,  [])
call s:h('Folded',       s:comment, s:bg)
call s:h('SignColumn',   [],        s:bg_soft)
call s:h('Normal',       s:fg,      s:bg)
call s:h('NonText',      s:bg_sel,  s:bg_nontext)
call s:h('SpecialKey',   s:bg_sel,  s:bg_soft)

" ── Messages ───────────────────────────────────────────────────────────────────
call s:h('ErrorMsg',   s:fg_cursor, s:pink)
call s:h('WarningMsg', s:fg_cursor, s:pink)

" ── Diff ───────────────────────────────────────────────────────────────────────
call s:h('DiffAdd',     s:fg,      s:diff_add,       'bold')
call s:h('DiffDelete',  s:diff_del, [])
call s:h('DiffChange',  ['#f8f8f2'], ['#243955'])     " gui-only colours; no cterm equivalent
call s:h('DiffText',    s:fg,      s:diff_txt,       'bold')
call s:h('diffAdded',   [s:green[0], 2], [])          " ANSI colours preserved from original
call s:h('diffRemoved', [s:pink[0],  1], [])
call s:h('@diff.plus',  [s:green[0], 2], [])
call s:h('@diff.minus', [s:pink[0],  1], [])

" ── Syntax ─────────────────────────────────────────────────────────────────────
call s:h('Boolean',      s:purple,  [])
call s:h('Character',    s:purple,  [])
call s:h('Comment',      s:comment, [])
call s:h('Conditional',  s:pink,    [])
call s:h('Constant',     [],        [])
call s:h('Define',       s:pink,    [])
call s:h('Float',        s:purple,  [])
call s:h('Function',     s:green,   [])
call s:h('Identifier',   s:cyan,    [],  'italic', 'NONE')
call s:h('Keyword',      s:pink,    [])
call s:h('Label',        s:yellow,  [])
call s:h('Number',       s:purple,  [])
call s:h('Operator',     s:pink,    [])
call s:h('PreProc',      s:pink,    [])
call s:h('Special',      s:fg,      [])
call s:h('Statement',    s:pink,    [])
call s:h('StorageClass', s:cyan,    [],  'italic', 'NONE')
call s:h('String',       s:yellow,  [])
call s:h('Tag',          s:pink,    [])
call s:h('Title',        s:fg,      [],  'bold')
call s:h('Todo',         ['#75715e', 95], [], 'inverse,bold')  " ctermfg=95 preserved from original
call s:h('Type',         s:pink,    [])
call s:h('Underlined',   [],        [],  'underline')

" ── Ruby ───────────────────────────────────────────────────────────────────────
call s:h('rubyClass',                    s:pink,   [])
call s:h('rubyFunction',                 s:green,  [])
call s:h('rubyInterpolationDelimiter',   [],       [])
call s:h('rubySymbol',                   s:purple, [])
call s:h('rubyConstant',                 s:cyan,   [],  'italic', 'NONE')
call s:h('rubyStringDelimiter',          s:yellow, [])
call s:h('rubyBlockParameter',           s:orange, [],  'italic', 'NONE')
call s:h('rubyInstanceVariable',         [],       [])
call s:h('rubyInclude',                  s:pink,   [])
call s:h('rubyGlobalVariable',           [],       [])
call s:h('rubyRegexp',                   s:yellow, [])
call s:h('rubyRegexpDelimiter',          s:yellow, [])
call s:h('rubyEscape',                   s:purple, [])
call s:h('rubyControl',                  s:pink,   [])
call s:h('rubyClassVariable',            [],       [])
call s:h('rubyOperator',                 s:pink,   [])
call s:h('rubyException',                s:pink,   [])
call s:h('rubyPseudoVariable',           [],       [])
call s:h('rubyRailsUserClass',           s:cyan,   [],  'italic', 'NONE')
call s:h('rubyRailsARAssociationMethod', s:cyan,   [])
call s:h('rubyRailsARMethod',            s:cyan,   [])
call s:h('rubyRailsRenderMethod',        s:cyan,   [])
call s:h('rubyRailsMethod',              s:cyan,   [])

" ── ERuby ──────────────────────────────────────────────────────────────────────
call s:h('erubyDelimiter',   [],                  [])
call s:h('erubyComment',     ['#75715e', 95], [])  " ctermfg=95 preserved from original
call s:h('erubyRailsMethod', s:cyan,              [])

" ── HTML ───────────────────────────────────────────────────────────────────────
call s:h('htmlTag',         [],               [])
call s:h('htmlEndTag',      [s:green[0]],     [])  " gui-only; no cterm in original
call s:h('htmlTagName',     [],               [])
call s:h('htmlArg',         [],               [])
call s:h('htmlSpecialChar', s:purple,         [])

" ── JavaScript ─────────────────────────────────────────────────────────────────
call s:h('javaScriptFunction',      s:cyan, [],  'italic', 'NONE')
call s:h('javaScriptRailsFunction', s:cyan, [])
call s:h('javaScriptBraces',        [],     [])

" ── YAML ───────────────────────────────────────────────────────────────────────
call s:h('yamlKey',            s:pink,   [])
call s:h('yamlAnchor',         [],       [])
call s:h('yamlAlias',          [],       [])
call s:h('yamlDocumentHeader', s:yellow, [])

" ── CSS ────────────────────────────────────────────────────────────────────────
call s:h('cssURL',           s:orange, [],  'italic', 'NONE')
call s:h('cssFunctionName',  s:cyan,   [])
call s:h('cssColor',         s:purple, [])
call s:h('cssPseudoClassId', s:green,  [])
call s:h('cssClassName',     s:green,  [])
call s:h('cssValueLength',   s:purple, [])
call s:h('cssCommonAttr',    s:cyan,   [])
call s:h('cssBraces',        [],       [])

" ── Treesitter ─────────────────────────────────────────────────────────────
" Identifiers
call s:h('@variable',                 s:fg,      [])
call s:h('@variable.builtin',        s:purple,  [],  'italic', 'NONE')
call s:h('@variable.parameter',      s:orange,  [],  'italic', 'NONE')
call s:h('@variable.member',         s:fg,      [])
call s:h('@constant',                s:purple,  [])
call s:h('@constant.builtin',        s:purple,  [])
call s:h('@constant.macro',          s:purple,  [])
call s:h('@module',                  s:cyan,    [],  'italic', 'NONE')
call s:h('@label',                   s:yellow,  [])

" Literals
call s:h('@string',                  s:yellow,  [])
call s:h('@string.documentation',    s:comment, [])
call s:h('@string.regexp',           s:yellow,  [])
call s:h('@string.escape',           s:purple,  [])
call s:h('@string.special',          s:purple,  [])
call s:h('@string.special.symbol',   s:purple,  [])
call s:h('@string.special.url',      s:cyan,    [],  'underline')
call s:h('@character',               s:purple,  [])
call s:h('@character.special',       s:purple,  [])
call s:h('@number',                  s:purple,  [])
call s:h('@number.float',            s:purple,  [])
call s:h('@boolean',                 s:purple,  [])

" Types
call s:h('@type',                    s:cyan,    [])
call s:h('@type.builtin',            s:cyan,    [],  'italic', 'NONE')
call s:h('@type.definition',         s:green,   [])
call s:h('@attribute',               s:green,   [])
call s:h('@attribute.builtin',       s:green,   [])
call s:h('@property',               s:fg,      [])

" Functions
call s:h('@function',                s:green,   [])
call s:h('@function.builtin',        s:green,   [])
call s:h('@function.call',           s:green,   [])
call s:h('@function.macro',          s:green,   [])
call s:h('@function.method',         s:green,   [])
call s:h('@function.method.call',    s:green,   [])
call s:h('@constructor',             s:green,   [])

" Keywords
call s:h('@keyword',                 s:pink,    [])
call s:h('@keyword.coroutine',       s:pink,    [])
call s:h('@keyword.function',        s:cyan,    [],  'italic', 'NONE')
call s:h('@keyword.operator',        s:pink,    [])
call s:h('@keyword.import',          s:pink,    [])
call s:h('@keyword.type',            s:cyan,    [],  'italic', 'NONE')
call s:h('@keyword.modifier',        s:pink,    [])
call s:h('@keyword.repeat',          s:pink,    [])
call s:h('@keyword.return',          s:pink,    [])
call s:h('@keyword.debug',           s:pink,    [])
call s:h('@keyword.exception',       s:pink,    [])
call s:h('@keyword.conditional',     s:pink,    [])
call s:h('@keyword.conditional.ternary', s:pink, [])
call s:h('@keyword.directive',       s:pink,    [])
call s:h('@keyword.directive.define', s:pink,   [])

" Punctuation
call s:h('@punctuation.delimiter',   s:fg,      [])
call s:h('@punctuation.bracket',     s:fg,      [])
call s:h('@punctuation.special',     s:pink,    [])

" Comments
call s:h('@comment',                 s:comment, [])
call s:h('@comment.documentation',   s:comment, [])
call s:h('@comment.error',           s:pink,    [],  'bold')
call s:h('@comment.warning',         s:orange,  [],  'bold')
call s:h('@comment.todo',            s:cyan,    [],  'bold')
call s:h('@comment.note',            s:cyan,    [],  'bold')

" Markup (markdown, rst, etc.)
call s:h('@markup.strong',           s:fg,      [],  'bold')
call s:h('@markup.italic',           s:fg,      [],  'italic', 'NONE')
call s:h('@markup.strikethrough',    s:comment, [],  'strikethrough')
call s:h('@markup.underline',        s:fg,      [],  'underline')
call s:h('@markup.heading',          s:green,   [],  'bold')
call s:h('@markup.heading.1',        s:pink,    [],  'bold')
call s:h('@markup.heading.2',        s:green,   [],  'bold')
call s:h('@markup.heading.3',        s:cyan,    [],  'bold')
call s:h('@markup.heading.4',        s:yellow,  [],  'bold')
call s:h('@markup.heading.5',        s:purple,  [],  'bold')
call s:h('@markup.heading.6',        s:orange,  [],  'bold')
call s:h('@markup.quote',            s:comment, [],  'italic', 'NONE')
call s:h('@markup.math',             s:purple,  [])
call s:h('@markup.link',             s:cyan,    [])
call s:h('@markup.link.label',       s:purple,  [])
call s:h('@markup.link.url',         s:cyan,    [],  'underline')
call s:h('@markup.raw',              s:yellow,  [])
call s:h('@markup.raw.block',        s:yellow,  [])
call s:h('@markup.list',             s:pink,    [])
call s:h('@markup.list.checked',     s:green,   [])
call s:h('@markup.list.unchecked',   s:comment, [])

" Tags (HTML/JSX)
call s:h('@tag',                     s:pink,    [])
call s:h('@tag.builtin',             s:pink,    [])
call s:h('@tag.attribute',           s:green,   [])
call s:h('@tag.delimiter',           s:fg,      [])

" Misc
call s:h('@operator',                s:pink,    [])
call s:h('@none',                    s:fg,      [])

" ── LSP Semantic Tokens ───────────────────────────────────────────────────
call s:h('@lsp.type.class',          s:cyan,    [])
call s:h('@lsp.type.decorator',      s:green,   [])
call s:h('@lsp.type.enum',           s:cyan,    [])
call s:h('@lsp.type.enumMember',     s:purple,  [])
call s:h('@lsp.type.function',       s:green,   [])
call s:h('@lsp.type.interface',      s:cyan,    [],  'italic', 'NONE')
call s:h('@lsp.type.macro',          s:green,   [])
call s:h('@lsp.type.method',         s:green,   [])
call s:h('@lsp.type.namespace',      s:cyan,    [],  'italic', 'NONE')
call s:h('@lsp.type.parameter',      s:orange,  [],  'italic', 'NONE')
call s:h('@lsp.type.property',       s:fg,      [])
call s:h('@lsp.type.struct',         s:cyan,    [])
call s:h('@lsp.type.type',           s:cyan,    [])
call s:h('@lsp.type.typeParameter',  s:cyan,    [],  'italic', 'NONE')
call s:h('@lsp.type.variable',       s:fg,      [])
call s:h('@lsp.mod.defaultLibrary',  [],        [],  'italic', 'NONE')
call s:h('@lsp.mod.deprecated',      [],        [],  'strikethrough')

" ── Diagnostics ───────────────────────────────────────────────────────────
call s:h('DiagnosticError',          s:pink,    [])
call s:h('DiagnosticWarn',           s:orange,  [])
call s:h('DiagnosticInfo',           s:cyan,    [])
call s:h('DiagnosticHint',           s:comment, [])
call s:h('DiagnosticOk',             s:green,   [])
call s:h('DiagnosticUnderlineError', s:pink,    [],  'undercurl')
call s:h('DiagnosticUnderlineWarn',  s:orange,  [],  'undercurl')
call s:h('DiagnosticUnderlineInfo',  s:cyan,    [],  'undercurl')
call s:h('DiagnosticUnderlineHint',  s:comment, [],  'undercurl')
call s:h('DiagnosticUnderlineOk',    s:green,   [],  'undercurl')
call s:h('DiagnosticVirtualTextError', s:pink,  [])
call s:h('DiagnosticVirtualTextWarn',  s:orange, [])
call s:h('DiagnosticVirtualTextInfo',  s:cyan,   [])
call s:h('DiagnosticVirtualTextHint',  s:comment, [])
call s:h('DiagnosticSignError',      s:pink,    s:bg_soft)
call s:h('DiagnosticSignWarn',       s:orange,  s:bg_soft)
call s:h('DiagnosticSignInfo',       s:cyan,    s:bg_soft)
call s:h('DiagnosticSignHint',       s:comment, s:bg_soft)

" ── Modern UI ─────────────────────────────────────────────────────────────
call s:h('NormalFloat',    s:fg,     s:bg_soft)
call s:h('FloatBorder',    s:split,  s:bg_soft)
call s:h('FloatTitle',     s:green,  s:bg_soft, 'bold')
call s:h('WinSeparator',   s:split,  s:bg)
call s:h('CursorLineNr',   s:orange, s:bg_soft)
call s:h('WinBar',         s:fg,     [])
call s:h('WinBarNC',       s:comment, [])

" ── Org Mode (nvim-orgmode) ────────────────────────────────────────────────
" Headlines: cycle palette colours, then into kw_special series
call s:h('@org.headline.level1',     s:green,         [],  'bold')
call s:h('@org.headline.level2',     s:cyan,          [],  'bold')
call s:h('@org.headline.level3',     s:yellow,        [],  'bold')
call s:h('@org.headline.level4',     s:purple,        [],  'bold')
call s:h('@org.headline.level5',     s:kw_special_1,  [],  'bold')
call s:h('@org.headline.level6',     s:kw_special_2,  [],  'bold')
call s:h('@org.headline.level7',     s:kw_special_3,  [],  'bold')
call s:h('@org.headline.level8',     s:kw_special_4,  [],  'bold')
" Legacy highlight names (used by some org plugins)
call s:h('OrgHeadlineLevel1',        s:green,         [],  'bold')
call s:h('OrgHeadlineLevel2',        s:cyan,          [],  'bold')
call s:h('OrgHeadlineLevel3',        s:yellow,        [],  'bold')
call s:h('OrgHeadlineLevel4',        s:purple,        [],  'bold')
call s:h('OrgHeadlineLevel5',        s:kw_special_1,  [],  'bold')
call s:h('OrgHeadlineLevel6',        s:kw_special_2,  [],  'bold')
call s:h('OrgHeadlineLevel7',        s:kw_special_3,  [],  'bold')
call s:h('OrgHeadlineLevel8',        s:kw_special_4,  [],  'bold')
" Inline markup
call s:h('@org.bold',                s:fg,      [],  'bold')
call s:h('@org.italic',             s:fg,      [],  'italic', 'NONE')
call s:h('@org.underline',          s:fg,      [],  'underline')
call s:h('@org.strikethrough',      s:comment, [],  'strikethrough')
call s:h('@org.code',               s:yellow,  [])
call s:h('@org.verbatim',           s:yellow,  [])
" Keywords and metadata
call s:h('@org.keyword.todo',        s:pink,    [],  'bold')
call s:h('@org.keyword.done',        s:green,   [],  'bold')
call s:h('@org.timestamp.active',    s:cyan,    [])
call s:h('@org.timestamp.inactive',  s:comment, [])
call s:h('@org.tag',                 s:comment, [])
call s:h('@org.priority',           s:orange,  [],  'bold')
call s:h('@org.properties',         s:comment, [])
call s:h('@org.drawer',             s:comment, [])
call s:h('@org.plan',               s:comment, [])
call s:h('@org.hyperlink',          s:cyan,    [],  'underline')
call s:h('@org.latex',              s:purple,  [])
" Checkboxes
call s:h('@org.checkbox',           s:fg,      [])
call s:h('@org.checkbox.checked',   s:green,   [])
call s:h('@org.checkbox.halfchecked', s:orange, [])
call s:h('@org.bullet',             s:comment, [])

" ── WhichKey ───────────────────────────────────────────────────────────────────
call s:h('WhichKey',          s:green,   [])
call s:h('WhichKeyGroup',     s:cyan,    [])
call s:h('WhichKeyDesc',      s:fg,      [])
call s:h('WhichKeySeparator', s:comment, [])
call s:h('WhichKeyNormal',    s:fg,      s:bg)
call s:h('WhichKeyFloat',     [],        s:bg)
call s:h('WhichKeyBorder',    s:split,   s:bg)
call s:h('WhichKeyValue',     s:purple,  [])
