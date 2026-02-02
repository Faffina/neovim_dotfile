vim.api.nvim_create_user_command("Genfun", function()
    local line = vim.api.nvim_get_current_line()
    local file = vim.api.nvim_buf_get_name(0)

    -- Match: return_type function_name(args);
    local ret_type, func_name, args = line:match("^%s*(.-)%s+([%w_]+)%s*%((.-)%)%s*;?%s*$")
    if not ret_type or not func_name or not args then
        print("Couldn't parse function signature.")
        return
    end

    -- Get libname from path: ./include/libname.h
    local libname = file:match("include/(.-)%.h$")
    if not libname then
        print("Not in an expected header file (include/libname.h)")
        return
    end

    local source_dir = "source/" .. libname
    local source_file = source_dir .. "/" .. func_name .. ".c"

    -- Make the source directory
    os.execute("mkdir -p " .. source_dir)

    -- Check if file already exists
    local f = io.open(source_file, "r")
    if f then
        print("Source file already exists: " .. source_file)
        f:close()
        -- Open it anyway in a new tab
        vim.cmd("e " .. source_file)
        return
    end

    -- Create function stub
    local stub = string.format("#include \"%s.h\" \n\n%s %s(%s) {\n\n}\n",libname, ret_type, func_name, args)
    local wf = io.open(source_file, "w")
    wf:write(stub)
    wf:close()

    print("Created function file: " .. source_file)

    -- Open the file in a new tab
    vim.cmd("e " .. source_file)
    vim.api.nvim_win_set_cursor(0, {4, 4})
end, {})

vim.api.nvim_create_user_command("AddLib", function(opts) 
    local lib_name = opts.args
    local guard = lib_name:upper():gsub("[^%w]", "_") .. "_H"
    local include_dir = "./include"
    local file_path = include_dir .. "/" .. lib_name .. ".h"

    -- Create include directory if it doesn't exist
    if vim.fn.isdirectory(include_dir) == 0 then
        vim.fn.mkdir(include_dir, "p")
    end

    -- Only create the file if it doesn't exist
    if vim.fn.filereadable(file_path) == 0 then
        local lines = {
            "#ifndef " .. guard,
            "#define " .. guard,
            "",
            "#endif"
        }
        vim.fn.writefile(lines, file_path)
    end

    -- Open the file in the current window
    vim.cmd("edit " .. file_path)
end, {
        nargs = 1,
        complete = "file"
    })

vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = "*.tex",
  callback = function()
    vim.cmd("silent VimtexView")
  end,
})
