colorscheme vividchalk

" set font to Monaco 14pt
set guifont=Monaco:h14

" turn on line numbering
set number

" disable expanded macvim toolbar
if has("gui_running")
  set guioptions=egmrt

  " need this to enable the super retarded MacVim horizontal scrollbar
  set guioptions+=b
endif

