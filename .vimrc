set undofile " Maintain undo history between vim sessions
set undodir=/home/caley/.vim/undodir " Save all undo files here instead of in the directory where the opened file lives
cmap w!! w !sudo tee % > /dev/null " This allows you to type :w!! to save a read only file from an instance of vim not launched with sudo
