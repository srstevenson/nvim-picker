" vim-picker: a fuzzy picker for Neovim and Vim
" Maintainer: Scott Stevenson <scott@stevenson.io>
" Source:     https://github.com/srstevenson/vim-picker

if exists('g:loaded_picker')
    finish
endif

let g:loaded_picker = 1

function! picker#IsNumber(variable) abort
    " Determine if a variable is a number.
    "
    " Parameters
    " ----------
    " variable : Any
    "     Value of the variable.
    "
    " Returns
    " -------
    " Boolean
    "     v:true if the variable is a number, v:false otherwise.
    return type(a:variable) ==# type(0)
endfunction

function! picker#IsString(variable) abort
    " Determine if a variable is a string.
    "
    " Parameters
    " ----------
    " variable : Any
    "     Value of the variable.
    "
    " Returns
    " -------
    " Boolean
    "     v:true if the variable is a string, v:false otherwise.
    return type(a:variable) ==# type('')
endfunction

if exists('g:picker_selector')
    echoerr 'vim-picker: g:picker_selector is deprecated; see :help'
                \ 'picker-configuration.'
endif

if exists('g:picker_find_executable')
    if !picker#IsString(g:picker_find_executable)
        echoerr 'vim-picker: g:picker_find_executable must be a string'
    endif
else
    let g:picker_find_executable = 'fd'
endif

if exists('g:picker_find_flags')
    if !picker#IsString(g:picker_find_flags)
        echoerr 'vim-picker: g:picker_find_flags must be a string'
    endif
else
    let g:picker_find_flags = '--color never --type f'
endif

if exists('g:picker_selector_executable')
    if !picker#IsString(g:picker_selector_executable)
        echoerr 'vim-picker: g:picker_selector_executable must be a string'
    endif
else
    let g:picker_selector_executable = 'fzy'
endif

if exists('g:picker_selector_flags')
    if !picker#IsString(g:picker_selector_flags)
        echoerr 'vim-picker: g:picker_selector_flags must be a string'
    endif
else
    let g:picker_selector_flags = '--lines=' . &lines
endif

if exists('g:picker_split')
    if !picker#IsString(g:picker_split)
        echoerr 'vim-picker: g:picker_split must be a string'
    endif
else
    let g:picker_split = 'botright'
endif

if exists('g:picker_height')
    if !picker#IsNumber(g:picker_height)
        echoerr 'vim-picker: g:picker_height must be a number'
    endif
else
    let g:picker_height = 10
endif

command -bar PickerEdit call picker#Edit()
command -bar PickerSplit call picker#Split()
command -bar PickerTabedit call picker#Tabedit()
command -bar PickerVsplit call picker#Vsplit()
command -bar PickerBuffer call picker#Buffer()
command -bar PickerTag call picker#Tag()
command -bar PickerStag call picker#Stag()
command -bar PickerBufferTag call picker#BufferTag()
command -bar PickerHelp call picker#Help()
command -bar PickerListUserCommands call picker#ListUserCommands()

nnoremap <silent> <Plug>PickerEdit :PickerEdit<CR>
nnoremap <silent> <Plug>PickerSplit :PickerSplit<CR>
nnoremap <silent> <Plug>PickerTabedit :PickerTabedit<CR>
nnoremap <silent> <Plug>PickerVsplit :PickerVsplit<CR>
nnoremap <silent> <Plug>PickerBuffer :PickerBuffer<CR>
nnoremap <silent> <Plug>PickerTag :PickerTag<CR>
nnoremap <silent> <Plug>PickerStag :PickerStag<CR>
nnoremap <silent> <Plug>PickerBufferTag :PickerBufferTag<CR>
nnoremap <silent> <Plug>PickerHelp :PickerHelp<CR>
nnoremap <silent> <Plug>PickerListUserCommands :PickerListUserCommands<CR>
