vim.filetype.add {
    pattern = {
        -- For all files that start with "dot-", determine the filetype by
        -- replacing that prefix with an actual dot and trying again.
        ["dot%-(.+)"] = function(path, bufnr, ext)
            local ft = vim.filetype.match { filename = "." .. ext }
            return ft
        end,
    },
}
