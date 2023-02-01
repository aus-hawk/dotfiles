local cmp = require "cmp"
local luasnip = require "luasnip"

local cursor_after_text = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    if col == 0 then
        return false
    else
        c = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]
        return c:sub(col, col):match "%s" == nil
    end
end

cmp.setup {
    sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<C-j>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Select,
        },
        ["<C-k>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Select,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.complete_common_string()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif cursor_after_text() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
    },
}
