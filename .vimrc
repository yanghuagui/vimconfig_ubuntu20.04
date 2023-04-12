set nocompatible
filetype on 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'The-NERD-tree'
Plugin 'indentLine.vim'
Plugin 'delimitMate.vim'
Plugin 'taglist.vim'

call vundle#end()

"YoucomPleteMe:语句补全插件"
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_server_python_interpreter='/usr/bin/python3.8'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
""let g:ycm_clangd_binary_path = "~/ycm_temp/llvm_root_dir/bin/clangd"
let g:clang_library_path='/usr/lib/llvm-10/lib/libclang.so'

autocmd InsertLeave * if pumvisible() == 0|pclose|endif     " 离开插入模式后自动关闭预览窗口"
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_strings = 1
let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_key_invoke_completion = '<C-a>'  
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
let g:ycm_semantic_triggers = {
					\'c,cpp,python,java,go,perl':['re!\w{2}'],
					\'cs,lua,javascript':['re!\w{2}'],
					\}

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"             
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>   
let g:ycm_min_num_of_chars_for_completion = 2                 " 从第2个键入字符就开始罗列匹配项
let g:ycm_max_num_candidates = 15							  " 候选数量设置
let g:ycm_auto_trigger = 1									  " 签名帮助
"
"
set t_Co=256
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" " 开启tabline
let g:airline#extensions#tabline#enabled = 1
" " tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" " tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ' '
" " tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" " 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" " 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

" vim-scripts 中的插件 "
"ctags 配置:F3快捷键显示程序中的各种tags，包括变量和函数等。
map <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let g:Tlist_Process_File_Always=1
let Tlist_Auto_Update=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Auto_Highlight_Tag=1
let Tlist_WinWidt=25
let Tlist_Ctags_Cmd = "/usr/bin/ctags"

set noswapfile
set tags+=/usr/include/tags
set tags+=./tags
map ta :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

""NERDTree 配置:F2快捷键显示当前目录树
map <F2> :NERDTreeToggle<CR>
" NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1"""
 
" 当新建 .h .c .hpp .cpp .mk .sh等文件时自动调用SetTitleMy 函数
autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh exec ":call SetTitleMy()"
" 加入注释
func SetCommentMy()
	call setline(1,"/*================================================================")
	call append(line("."),   "*   Copyright (C) ".strftime("%Y")." OIDCAT Ltd. All rights reserved.")
	call append(line(".")+1, "*   ")
	call append(line(".")+2, "*   文件名称：".expand("%:t"))
	call append(line(".")+3, "*   创 建 者：OIDCAT")
	call append(line(".")+4, "*   创建日期：".strftime("%Y年%m月%d日"))
	call append(line(".")+5, "*   描    述：")
	call append(line(".")+6, "*")
	call append(line(".")+7, "================================================================*/")
	call append(line(".")+8, "")
	call append(line(".")+9, "")

endfunc

" 加入shell,Makefile注释
func SetCommentMy_sh()
	call setline(1, "#================================================================")
	call setline(2, "#   Copyright (C) ".strftime("%Y")." OIDCAT Ltd. All rights reserved.")
	call setline(3, "#   ")
	call setline(4, "#   文件名称：".expand("%:t"))
	call setline(5, "#   创 建 者：OIDCAT")
	call setline(6, "#   创建日期：".strftime("%Y年%m月%d日"))
	call setline(7, "#   描    述：")
	call setline(8, "#")
	call setline(9, "#================================================================")
	call setline(10, "")
	call setline(11, "")
endfunc

" 定义函数SetTitleMy，自动插入文件头
func SetTitleMy()
	if &filetype == 'make'
		call setline(1,"")
		call setline(2,"")
		call SetCommentMy_sh()
	elseif &filetype == 'sh'
		call setline(1,"#!/bin/sh")
		call setline(2,"")
		call SetCommentMy_sh()

	else
	     call SetCommentMy()
	     if expand("%:e") == 'hpp'
		  call append(line(".")+10, "#ifndef ".toupper(expand("%:t:r"))."_H__")
		  call append(line(".")+11, "#define ".toupper(expand("%:t:r"))."_H__")
		  call append(line(".")+12, "#ifdef __cplusplus")
		  call append(line(".")+13, "extern \"C\"")
		  call append(line(".")+14, "{")
		  call append(line(".")+15, "#endif")
		  call append(line(".")+16, "")
		  call append(line(".")+17, "#ifdef __cplusplus")
		  call append(line(".")+18, "}")
		  call append(line(".")+19, "#endif")
		  call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H__")

	elseif expand("%:e") == 'h'
          call append(line(".")+10, "#ifndef ".toupper(expand("%:t:r"))."_H__")
          call append(line(".")+11, "#define ".toupper(expand("%:t:r"))."_H__")
          call append(line(".")+12, "")
          call append(line(".")+13, "")
          call append(line(".")+14, "")
          call append(line(".")+15, "#endif //".toupper(expand("%:t:r"))."_H__")
	elseif &filetype == 'c'
	  	"call append(line(".")+10,"#include \"".expand("%:t:r").".h\"")
		call append(line(".")+10,"#include <stdio.h>")
		call append(line(".")+11,"")
		call append(line(".")+12,"")
		call append(line(".")+13,"int main(int argc, char *argv[])")
		call append(line(".")+14,"{")
		call append(line(".")+15,"	")
		call append(line(".")+16,"	")
		call append(line(".")+17,"	return 0;")
		call append(line(".")+18,"}")
		call append(line(".")+19,"")

	elseif &filetype == 'cpp'
	  	call append(line(".")+10, "#include <cstdio>")
	  	call append(line(".")+11, "#include <iostream>")
		call append(line(".")+12,"")
		call append(line(".")+13,"")
	  	call append(line(".")+14, "using namespace std;")
		call append(line(".")+15,"")
		call append(line(".")+16,"")
 		call append(line(".")+17,"int main(int argc, char *argv[])")
		call append(line(".")+18,"{")
		call append(line(".")+19,"	")
		call append(line(".")+20,"	")
		call append(line(".")+21,"	return 0;")
		call append(line(".")+22,"}")
		call append(line(".")+23,"")
	endif
	endif
autocmd BufNewFile * normal G
endfunc 

"键盘命令
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

set autoread
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
set completeopt=preview,menu 
filetype plugin on
""set tags=/home/lzy/;
""set autochdir 
set clipboard=unnamed 
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
set foldenable    
set syntax=on
set confirm
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set number
set history=1000
set ignorecase
set hlsearch
set incsearch
set gdefault
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8
set helplang=cn
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2
set cmdheight=2
filetype on
filetype plugin on
filetype indent on
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set report=0
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=1
set scrolloff=3
set smartindent
au BufRead,BufNewFile *  setfiletype txt
 :inoremap ( ()<ESC>i
 :inoremap ) <c-r>=ClosePair(')')<CR>
 :inoremap [ []<ESC>i
 :inoremap ] <c-r>=ClosePair(']')<CR>
 :inoremap " ""<ESC>i
 :inoremap ' ''<ESC>i
 function! ClosePair(char)
		 	if getline('.')[col('.') - 1] == a:char
				    return "\<Right>"
			else
					return a:char
			endif
endfunction 

filetype plugin indent on
set completeopt=longest,menu 
