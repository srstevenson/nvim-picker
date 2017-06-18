" vim-picker: a fuzzy picker for Neovim and Vim
" Maintainer: Scott Stevenson <scott@stevenson.io>
" Source:     https://github.com/srstevenson/vim-picker

if exists('g:loaded_picker')
    finish
endif

let g:loaded_picker = 1

if exists('g:picker_selector')
    call picker#CheckIsString(g:picker_selector, 'g:picker_selector')
else
    let g:picker_selector = 'fzy --lines=' . &lines
endif

if exists('g:picker_height')
    call picker#CheckIsNumber(g:picker_height, 'g:picker_height')
else
    let g:picker_height = 10
endif

command -bar PickerEdit call picker#Edit()
command -bar PickerSplit call picker#Split()
command -bar PickerTabedit call picker#Tabedit()
command -bar PickerVsplit call picker#Vsplit()
command -bar PickerBuffer call picker#Buffer()
command -bar PickerTag call picker#Tag()
command -bar PickerBufferTag call picker#BufferTag()
command -bar PickerHelp call picker#Help()

nnoremap <silent> <Plug>PickerEdit :PickerEdit<CR>
nnoremap <silent> <Plug>PickerSplit :PickerSplit<CR>
nnoremap <silent> <Plug>PickerTabedit :PickerTabedit<CR>
nnoremap <silent> <Plug>PickerVsplit :PickerVsplit<CR>
nnoremap <silent> <Plug>PickerBuffer :PickerBuffer<CR>
nnoremap <silent> <Plug>PickerTag :PickerTag<CR>
nnoremap <silent> <Plug>PickerBufferTag :PickerBufferTag<CR>
nnoremap <silent> <Plug>PickerHelp :PickerHelp<CR>
