if has("gui_macvim")
	macmenu File.Print key=<nop>
endif

if has("gui_win32")
	map <C-t> :tabnew<CR>
	vmap <C-c> "+yi
	vmap <C-x> "+c
	vmap <C-v> c<ESC>"+p
	imap <C-v> <ESC>"+pa
end
