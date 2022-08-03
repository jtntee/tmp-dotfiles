syntax enable

source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/coc.vim

let plug_install = 0
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path . 
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

call plug#begin('~/.config/nvim/plugins')
  Plug 'gruvbox-community/gruvbox'
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'neovim/nvim-lspconfig'
  Plug 'itchyny/lightline.vim'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install

colorscheme gruvbox
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

au! BufWritePost $MYVIMRC source %

augroup exe_code
    autocmd!
    autocmd FileType python nnoremap <buffer> <leader>r
                \ :sp<CR> :term python3 %<CR> :startinsert<CR>
    autocmd FileType yaml nnoremap <buffer> <leader>r
                \ :sp<CR> :term ansible-playbook % --vault-password-file=~/.vault<CR> :startinsert<CR>
augroup END

command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-python', 
  \ ]


nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>
