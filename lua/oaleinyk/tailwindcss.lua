-- Add these requires at the beginning of your Lua script
local parsers = require("nvim-treesitter.parsers")
local query = [[
    (attribute
        (attribute_name) @attr_name (#eq? @attr_name "class")
        (quoted_attribute_value
            (attribute_value) @attr_value
        )
    )
]]

local prefixDelimiters = { ":", "__", "--", "_", "-" }

local function split(str, sep)
	local fields = {}
	str:gsub("([^" .. sep .. "]+)", function(c)
		fields[#fields + 1] = c
	end)
	return fields
end

local function trim(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function getLast(t)
	return t[#t]
end

local function findDelimiterIndex(className, delimiters, startIndex)
	for _, delimiter in ipairs(delimiters) do
		local index = className:find(delimiter, startIndex, true)
		if index then
			return index
		end
	end
	return nil
end

local function getClassPrefix(className)
	local startIndex = className:find("[^_-]")

	if startIndex then
		local delimiterIndex = findDelimiterIndex(className, prefixDelimiters, startIndex)
		if delimiterIndex then
			return className:sub(1, delimiterIndex - 1)
		end
	end
	return className
end

local function groupClasses(classString)
	local classNames = split(trim(classString), "%s+")
	local groupedByPrefix = {}
	local previousPrefix = nil

	table.sort(classNames)

	for i, className in ipairs(classNames) do
		local prefix = getClassPrefix(className)

		if prefix ~= previousPrefix and prefix ~= classNames[i - 1] then
			table.insert(groupedByPrefix, {})
		end

		table.insert(getLast(groupedByPrefix), className)
		previousPrefix = prefix
	end

	local formattedClasses = {}
	for _, group in ipairs(groupedByPrefix) do
		table.insert(formattedClasses, table.concat(group, " "))
	end

	return formattedClasses
end

local function get_visual_selection_range()
	local start_pos = vim.api.nvim_buf_get_mark(0, "<")
	local end_pos = vim.api.nvim_buf_get_mark(0, ">")

	start_pos[1] = start_pos[1] - 1
	end_pos[1] = end_pos[1] - 1

	return start_pos, end_pos
end

local M = {}

function M.setup()
	vim.cmd([[command! TWSplitClasses lua require('user.tailwindcss').split_classes()]])
	vim.api.nvim_set_keymap("n", "tw", "<cmd>TWSplitClasses<CR>", { noremap = true, silent = true })
end

function M.split_classes()
	if not parsers.has_parser("vue") then
		print("Vue parser is not installed.")
		return
	end

	local parser = parsers.get_parser(0, "vue")

	if not parser then
		print("Failed to obtain Vue parser.")
		return
	end

	local root_tree = parser:parse()[1]:root()

	local ts_query = vim.treesitter.query.parse("vue", query)
	local cursor_row, cursor_col = unpack(vim.api.nvim_win_get_cursor(0))
	cursor_row = cursor_row - 1

	for pattern, node in ts_query:iter_captures(root_tree, 0) do
		local start_row, start_col, end_row, end_col = node:range()

		if cursor_row >= start_row and cursor_row <= end_row and cursor_col >= start_col and cursor_col <= end_col then
			local node_text = vim.treesitter.get_node_text(node, 0)
			local line_text = vim.api.nvim_buf_get_lines(0, start_row, start_row + 1, false)[1]
			local current_indentation = line_text:match("^(%s*)")

			local classes = groupClasses(node_text)
			table.sort(classes)

			local extra_indentation = "  "
			for i, class in ipairs(classes) do
				classes[i] = current_indentation .. extra_indentation .. class
			end

			table.insert(classes, 1, "")
			table.insert(classes, current_indentation .. "")

			local formatted_classes = table.concat(classes, "\n")

			vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, vim.split(formatted_classes, "\n"))
		end
	end
end

return M
