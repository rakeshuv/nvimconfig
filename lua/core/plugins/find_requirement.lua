local function find_word_in_file(word, filepath)
	local handle = io.open(filepath, "r")
	if handle then
		for line in handle:lines() do
			if line:find(word, 1, true) then
				handle:close()
				return line
			end
		end
		handle:close()
	end
	return nil
end

function find_word_under_cursor_in_file()
	local word = vim.fn.expand("<cword>")
	local filepath = "/home/ruv/orgfiles/requirements.txt" 

	local found_line = find_word_in_file(word, filepath)

	if found_line then
		local new_buffer = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_lines(new_buffer, 0, -1, false, {found_line})
		vim.api.nvim_open_win(new_buffer, true, {
			relative = "win",
			width = vim.o.columns / 2,
			height = vim.o.lines,
			col = vim.o.columns / 2,
			row = 0,
			style = "minimal",
		})
	else
		print(word .. " not found.")
	end
end

vim.api.nvim_set_keymap('n', '<leader>f', [[:lua find_word_under_cursor_in_file()<CR>]], { noremap = true, silent = true })
