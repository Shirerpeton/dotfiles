require('luasnip.session.snippet_collection').clear_snippets 'typescript'

local ls = require 'luasnip'

local s = ls.snippet
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt

local fni_snippet = s('fni', fmt('const {} = ({}): {} => {};', { i(1), i(2), i(3), i(4) }))
local fn_snippet = s('fn', fmt('const {} = ({}): {} => {{\n    {}\n}};', { i(1), i(2), i(3), i(4) }))

ls.add_snippets('typescript', { fni_snippet, fn_snippet })
ls.add_snippets('vue', { fni_snippet, fn_snippet })
