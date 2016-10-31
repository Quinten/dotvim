let g:airline#themes#base16_flatlite#palette = {}
let s:gui00 = "#2C3E50"
let s:gui01 = "#C0392B"
let s:gui02 = "#27AE60"
let s:gui03 = "#F1C40F"
let s:gui04 = "#747C84"
let s:gui05 = "#8E44AD"
let s:gui06 = "#16A085"
let s:gui07 = "#BDC3C7"
let s:gui08 = "#34495E"
let s:gui09 = "#E74C3C"
let s:gui0A = "#2ECC71"
let s:gui0B = "#F39C12"
let s:gui0C = "#3498DB"
let s:gui0D = "#9B59B6"
let s:gui0E = "#1ABC9C"
let s:gui0F = "#ECF0F1"

let s:cterm00 = 0
let s:cterm01 = 1
let s:cterm02 = 2
let s:cterm03 = 3
let s:cterm04 = 4
let s:cterm05 = 5
let s:cterm06 = 6
let s:cterm07 = 7
let s:cterm08 = 8
let s:cterm09 = 9
let s:cterm0A = 10
let s:cterm0B = 11
let s:cterm0C = 12
let s:cterm0D = 13
let s:cterm0E = 14
let s:cterm0F = 15

let s:N1   = [ s:gui07, s:gui02, s:cterm07, s:cterm02 ]
let s:N2   = [ s:gui0F, s:gui0A, s:cterm0F, s:cterm0A ]
let s:N3   = [ s:gui0F, s:gui07, s:cterm0F, s:cterm07 ]
let g:airline#themes#base16_flatlite#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1   = [ s:gui07, s:gui05, s:cterm07, s:cterm05 ]
let s:I2   = [ s:gui0F, s:gui0D, s:cterm0F, s:cterm0D ]
let s:I3   = [ s:gui0F, s:gui07, s:cterm0F, s:cterm07 ]
let g:airline#themes#base16_flatlite#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:R1   = [ s:gui01, s:gui08, s:cterm01, s:cterm08 ]
let s:R2   = [ s:gui06, s:gui02, s:cterm06, s:cterm02 ]
let s:R3   = [ s:gui09, s:gui01, s:cterm09, s:cterm01 ]
let g:airline#themes#base16_flatlite#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:V1   = [ s:gui08, s:gui03, s:cterm08, s:cterm03 ]
let s:V2   = [ s:gui03, s:gui08, s:cterm03, s:cterm08 ]
let s:V3   = [ s:gui0F, s:gui07, s:cterm0F, s:cterm07 ]
let g:airline#themes#base16_flatlite#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:IA1   = [ s:gui0F, s:gui07, s:cterm0F, s:cterm07 ]
let s:IA2   = [ s:gui0F, s:gui07, s:cterm0F, s:cterm07 ]
let s:IA3   = [ s:gui0F, s:gui04, s:cterm0F, s:cterm04 ]
let g:airline#themes#base16_flatlite#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded if the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#base16_flatlite#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:gui07, s:gui02, s:cterm07, s:cterm02, '' ],
      \ [ s:gui07, s:gui04, s:cterm07, s:cterm04, '' ],
      \ [ s:gui05, s:gui01, s:cterm05, s:cterm01, 'bold' ])
