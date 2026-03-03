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

" ── WhichKey ───────────────────────────────────────────────────────────────────
call s:h('WhichKey',          s:green,   [])
call s:h('WhichKeyGroup',     s:cyan,    [])
call s:h('WhichKeyDesc',      s:fg,      [])
call s:h('WhichKeySeparator', s:comment, [])
call s:h('WhichKeyNormal',    s:fg,      s:bg)
call s:h('WhichKeyFloat',     [],        s:bg)
call s:h('WhichKeyBorder',    s:split,   s:bg)
call s:h('WhichKeyValue',     s:purple,  [])
