return {"vimwiki/vimwiki", 
    init = function() 
        vim.g.vimwiki_list = {
            {
                path = '~/Documents/note/',
                syntax = 'markdown',
                ext = '.md',
            },
        }
    end,
}
