local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    s("mm", fmt("${}$", { i(1, "expr") })),

    s("dm", fmt("\\[ {} \\]", { i(1, "expr") })),

    s("fr", fmt("\\frac{{{}}}{{{}}}", { i(1, "num"), i(2, "den") })),

    s("sum", fmt("\\sum_{{{}}}^{{{}}} {}", { i(1, "i=1"), i(2, "n"), i(3, "expr") })),

    s("int", fmt("\\int_{{{}}}^{{{}}} {}", { i(1, "a"), i(2, "b"), i(3, "f(x)dx") })),

    s("lim", fmt("\\lim_{{{} \\to {}}} {}", { i(1, "x"), i(2, "0"), i(3, "expr") })),

    s("eq", fmt("\\quad=\\quad", {})),

    s("mat", fmt([[
    \begin{{bmatrix}}
        {} & {} \\
        {} & {}
    \end{{bmatrix}}
    ]], { i(1, "a"), i(2, "b"), i(3, "c"), i(4, "d") })),

    s("thm", fmt([[
    \begin{{theoremWithTOC}}{{{}}}
    {}
    \end{{theoremWithTOC}}
    ]], { i(1, "thorem"), i(2, "body") })),

    s("prf", fmt([[
    \begin{{proofWithTOC}}{{{}}}
    {}
    \end{{proofWithTOC}}
    ]], { i(1, "thorem"), i(2, "body") })),

    s("exa", fmt([[
    \begin{{exampleWithTOC}}{{{}}}
    {}
    \end{{exampleWithTOC}}
    ]], { i(1, "thorem"), i(2, "body") })),
    
    s("exe", fmt([[
    \begin{{exerciseWithTOC}}{{{}}}
    {}
    \end{{exerciseWithTOC}}
    ]], { i(1, "thorem"), i(2, "body") })),

    s("ans", fmt([[
    \begin{{answerWithTOC}}{{{}}}
    {}
    \end{{answerWithTOC}}
    ]], { i(1, "thorem"), i(2, "body") })),

    s("recap", fmt([[
    \begin{{recapWithTOC}}{{{}}}
    {}
    \end{{recapWithTOC}}
    ]], { i(1, "thorem"), i(2, "body") })),

    s("boilerplate", fmt([[
    \documentclass[17pt, a4paper]{{extarticle}}

    \usepackage[utf8]{{inputenc}}
    \usepackage{{amsmath, amssymb, amsthm}}
    \usepackage{{xcolor}}
    \usepackage{{tcolorbox}}
    \usepackage{{hyperref}}
    \usepackage{{lipsum}}
    \usepackage[a4paper,margin=.1cm]{{geometry}}

    \definecolor{{theoremBG}}{{RGB}}{{230,245,255}} 
    \definecolor{{exampleBG}}{{RGB}}{{235,255,235}}
    \definecolor{{exerciseBG}}{{RGB}}{{255,245,230}}
    \definecolor{{recapBG}}{{RGB}}{{245,235,255}}   

    \tcbset{{
      colframe=lightgray,
      boxrule=0.5pt,
      arc=3pt,
      left=5pt,
      right=5pt,
      top=5pt,
      bottom=5pt,
    }}
    
    \newtcolorbox{{theoremBox}}[2][]{{colback=theoremBG,title=Teorema: #2,#1}}
    \newenvironment{{theoremWithTOC}}[1]{{
      \begin{{theoremBox}}{{#1}}
      \addcontentsline{{toc}}{{subsection}}{{Teorema: #1}}
    }}{{
      \end{{theoremBox}}
    }}
    \newtcolorbox{{proofBox}}[2][]{{colback=theoremBG,title=Dimostrazione: #2,#1}}
    \newenvironment{{proofWithTOC}}[1]{{
      \begin{{proofBox}}{{#1}}
      \addcontentsline{{toc}}{{subsection}}{{Dimostrazione: #1}}
    }}{{
      \end{{proofBox}}
    }}
    \newtcolorbox{{exampleBox}}[2][]{{colback=exampleBG,title=Esempio: #2,#1}}
    \newenvironment{{exampleWithTOC}}[1]{{
      \begin{{exampleBox}}{{#1}}
      \addcontentsline{{toc}}{{subsection}}{{Esempio: #1}}
    }}{{
      \end{{exampleBox}}
    }}
    \newtcolorbox{{exerciseBox}}[2][]{{colback=exerciseBG,title=Esercizio: #2,#1}}
    \newenvironment{{exerciseWithTOC}}[1]{{
      \begin{{exerciseBox}}{{#1}}
      \addcontentsline{{toc}}{{subsection}}{{Esercizio: #1}}
    }}{{
      \end{{exerciseBox}}
    }}
    \newtcolorbox{{recapBox}}[2][]{{colback=recapBG,title=Riepilogo: #2,#1}}
    \newenvironment{{recapWithTOC}}[1]{{
      \begin{{recapBox}}{{#1}}
      \addcontentsline{{toc}}{{subsection}}{{Riepilogo: #1}}
    }}{{
      \end{{recapBox}}
    }}
    \newtcolorbox{{answerBox}}[2][]{{colback=white,title=Soluzione #2,#1}}
    \newenvironment{{answerWithTOC}}[1]{{
      \begin{{answerBox}}{{#1}}
      \addcontentsline{{toc}}{{subsection}}{{Soluzione #1}}
    }}{{
      \end{{answerBox}}
    }}

    \title{{{}}}
    \author{{Razvan Pop}}
    \date{{\today}}

    \begin{{document}}

    \maketitle
    \tableofcontents
    \newpage

    {}

    \end{{document}}
     ]], { i(1, "title"), i(2, "body") })),


}
