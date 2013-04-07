" general {

	filetype plugin indent on
        let fortran_free_source=1
	syntax on
	set mouse=a

	set shortmess+=filmrxoOtT	" abbrev. of messages
	set viewoptions=folds,options,cursor,unix,slash
	set virtualedit=onemore
	set history=1000
	"set spell
        let s:extfname = expand("%:e")
        if s:extfname ==? "f"
            let fortran_fixed_source=1
            unlet! fortran_free_source
        else
            let fortran_free_source=1
            unlet! fortran_fixed_source
        endif
" }

" Vim UI {
        "colorscheme torte
        "colorscheme morning
        colorscheme default
	set tabpagemax=15
	set showmode "display the current mode

	"set cursorline

	set backspace=indent,eol,start
	set linespace=0
	set nu
	set showmatch
	"set incsearch
	"set hlsearch
	set winminheight=0
	set ignorecase
	set smartcase
	set wildmenu	" show list instead of just completing
	set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
	set scrolljump=5                " lines to scroll when cursor leaves screen
	set scrolloff=3                 " minimum lines to keep above and below cursor
	set foldenable                  " auto fold code
	"set gdefault                    " the /g flag on :s substitutions by default
	"set list
	"set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

"}

" Formatting {
	"set nowrap
	set autoindent
	set shiftwidth=4
	set expandtab
	set softtabstop=4
	set pastetoggle=<F12>
	" Remove trailing whitespaces and ^M chars
	autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" }

" Key (re)Mappings {

	" Easier moving in tabs and windows
	map <C-J> <C-W>j
	map <C-K> <C-W>k
	map <C-L> <C-W>l
	map <C-H> <C-W>h

	" Wrapped lines goes down/up to next row, rather than next line in file.
	nnoremap j gj
	nnoremap k gk

"}
"
" Using tab pages {
        nnoremap <C-Left> :tabprevious<CR>
        nnoremap <C-Right> :tabnext<CR>
        nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
        nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
"}
"
"Wmake command
command -nargs=* Wmake !wmake <args>
