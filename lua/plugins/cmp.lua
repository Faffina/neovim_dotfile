return {
    {},
    {'hrsh7th/cmp-nvim-lsp-signature-help'},
    {
        'hrsh7th/cmp-nvim-lsp',
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()


            -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
            local servers = { 'clangd', 'lua_ls' }
            for _, lsp in ipairs(servers) do
                vim.lsp.config(lsp, {
                    capabilities = capabilities,
                })
            end
        end,
    },
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'saadparwaiz1/cmp_luasnip'},
    {
        'L3MON4D3/LuaSnip',
        config = function()
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
            local luasnip = require 'luasnip'
            vim.keymap.set({"i"}, "<C-K>", function() luasnip.expand() end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-L>", function() luasnip.jump( 1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-J>", function() luasnip.jump(-1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-E>", function()
                if luasnip.choice_active() then
                    luasnip.change_choice(1)
                end
            end, {silent = true})
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            "windwp/nvim-autopairs",
            "nvim-neorg/neorg",
        },
        opts = function(_, opts)
            local luasnip = require("luasnip")
            local cmp = require("cmp")
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
            opts.snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            }
            opts.mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-k>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            })
            opts.sources = cmp.config.sources({
                { name = 'nvim_lsp_signature_help' },
                { name = 'nvim_lsp' },
                { name = 'luasnip'},
                { name = 'buffer'},
                { name = 'nvim_lua'},
                { name = 'path'},
                { name = 'neorg'},
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = true,
        event = "InsertEnter"
    }
}

