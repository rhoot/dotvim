if has("gui_macvim")
	macmenu File.Print key=<nop>

	" ctrlp
	map <D-p> :CtrlP<CR>
	let g:ctrlp_map = '<D-p>'
	let g:ctrlp_cmd = 'CtrlP'
endif
