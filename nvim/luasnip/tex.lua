local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local rec_ls
rec_ls = function()
	return sn(nil, {
		c(1, {
			-- important!! Having the sn(...) as the first choice will cause infinite recursion.
			t({""}),
			-- The same dynamicNode as in the snippet (also note: self reference).
			sn(nil, {t({"", "\t\\item "}), i(1), d(2, rec_ls, {})}),
		}),
	});
end


local tex = {}
tex.in_mathzone = function()
        return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex.in_text = function()
        return not tex.in_mathzone()
end

--Snippets start
--
return {

s("ls", {
	t({"\\begin{itemize}",
	"\t\\item "}), i(1), d(2, rec_ls, {}),
	t({"", "\\end{itemize}"}), i(0)
}),

s("dm", {
	t({ "\\[", "\t" }),
	i(1),
	t({ "", "\\]" }),
}, { condition = tex.in_text }),


  -- playing
  s({trig = ";b", snippetType="autosnippet", dscr="\beta"},
    {
      t("\\beta"),
    }
  ),
}
