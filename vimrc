set modeline
set modelines=3
set nocompatible

" set t_Co=1
syntax on
set showmatch
set ts=4
set sw=4
"set expandtab

set ignorecase
set smartcase

set exrc
set foldmethod=indent
set foldnestmax=1
set nofoldenable

set colorcolumn=81

let mydir = getcwd()
let &tags = ''
if (filereadable(mydir . "/tags"))
	let &tags = mydir . "/tags"
endif

""""""""""
" FIXME: This gets caught in an infinite loop when the directory
"        we're sitting in gets deleted
""""""""""
while (mydir != '/')
	let i = strridx(mydir, '/')

	if (i == 0)
		let i = 1
	endif

	let mydir = strpart(mydir, 0, i)
	if (filereadable(mydir . "/tags"))
		if (&tags != '')
			let &tags = &tags . "," . mydir . "/tags"
		else
			let &tags = mydir . "/tags"
		endif
	endif
endwhile

" echo "Tag Path = " . &tags
" since c++ headers sometimes don't have a suffix
au BufRead * if search('\V-*- C++ -*-', 'n', 5) | setlocal ft=cpp ts=8 sw=8 | endif



hi Comment     term=bold      cterm=NONE      ctermfg=LightBlue
hi Constant    term=underline cterm=NONE      ctermfg=DarkRed
hi Special     term=bold      cterm=NONE      ctermfg=Yellow
hi Identifier  term=underline cterm=NONE      ctermfg=DarkCyan
hi Statement   term=bold      cterm=NONE      ctermfg=Yellow
hi PreProc     term=underline cterm=NONE      ctermfg=Magenta
hi Type        term=underline cterm=NONE      ctermfg=DarkGreen
hi Underlined  term=underline cterm=underline ctermfg=DarkMagenta
hi Ignore      term=NONE      cterm=NONE      ctermfg=white

hi ColorColumn term=NONE     ctermbg=DarkGrey
hi Folded term=reverse ctermfg=DarkCyan ctermbg=DarkGrey
hi FoldColumn term=reverse ctermfg=DarkCyan ctermbg=DarkGrey
hi Error term=reverse cterm=NONE ctermfg=Red ctermbg=Yellow
hi Todo  term=reverse cterm=NONE ctermfg=Red ctermbg=Yellow

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'

" let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_min_num_identifier_candidate_chars = 0
" let g:ycm_auto_trigger = 1
" let g:ycm_filetype_whitelist = { '*': 1 }
" let g:ycm_filetype_blacklist = {
"      \ 'tagbar' : 1,
"      \ 'qf' : 1,
"      \ 'notes' : 1,
"      \ 'markdown' : 1,
"      \ 'unite' : 1,
"      \ 'text' : 1,
"      \ 'vimwiki' : 1,
"      \ 'pandoc' : 1
"      \}
" let g:ycm_filetype_specific_completion_to_disable = {}
" let g:ycm_show_diagnostics_ui = 1

" let g:ycm_error_symbol = '>>'
let g:ycm_error_symbol = 'E>'

" let g:ycm_warning_symbol = '>>'
let g:ycm_warning_symbol = 'W>'

" let g:ycm_enable_diagnostic_signs = 1
" let g:ycm_enable_diagnostic_highlighting = 1
" let g:ycm_echo_current_diagnostic = 1

" let g:ycm_always_populate_location_list = 0
let g:ycm_always_populate_location_list = 1

" let g:ycm_open_loclist_on_ycm_diags = 1
" let g:ycm_allow_changing_updatetime = 1
" let g:ycm_complete_in_comments = 0
" let g:ycm_complete_in_strings = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 0

" let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_collect_identifiers_from_tags_files = 1

" let g:ycm_seed_identifiers_with_syntax = 0
" let g:ycm_extra_conf_vim_data = []
" let g:ycm_path_to_python_interpreter = ''
" let g:ycm_server_use_vim_stdout = 0
" let g:ycm_server_keep_logfiles = 0
" let g:ycm_server_log_level = 'info'
" let g:ycm_csharp_server_port = 2000
" let g:ycm_auto_start_csharp_server = 1
" let g:ycm_auto_stop_csharp_server = 1

" let g:ycm_add_preview_to_completeopt = 0
let g:ycm_add_preview_to_completeopt = 1

" let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_completion = 1

" let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" let g:ycm_max_diagnostics_to_display = 30
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
" let g:ycm_key_invoke_completion = '<C-Space>'
" let g:ycm_key_detailed_diagnostics = '<leader>d'

" let g:ycm_global_ycm_extra_conf = ''
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" let g:ycm_confirm_extra_conf = 1
let g:ycm_confirm_extra_conf = 0

" let g:ycm_extra_conf_globlist = []
" let g:ycm_filepath_completion_use_working_dir = 0
" let g:ycm_semantic_triggers =  {
"  \   'c' : ['->', '.'],
"  \   'objc' : ['->', '.'],
"  \   'ocaml' : ['.', '#'],
"  \   'cpp,objcpp' : ['->', '.', '::'],
"  \   'perl' : ['->'],
"  \   'php' : ['->', '::'],
"  \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
"  \   'ruby' : ['.', '::'],
"  \   'lua' : ['.', ':'],
"  \   'erlang' : [':'],
"  \ }
" let g:ycm_cache_omnifunc = 1
" let g:ycm_use_ultisnips_completer = 1

nnoremap <F2> :YcmDiags<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
