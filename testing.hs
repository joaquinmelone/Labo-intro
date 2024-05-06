-- equiposValidos

{--

[("a","b"),("c","d"),("e","f"),("q","r"),("s","t"),("j","n")] - True
[("a","b"),("c","d"),("e","f"),("a","b"),("c","d"),("e","f")] - False
[("a","b"),("c","d"),("e","f"),("q","r"),("s","t"),("e","n")] - False
[("a", "b"),("b", "a")] - False
[("a", "b"),("j","q"),("b", "a")] - False
[("a", "b"),("j","q"),("b", "a"),("q","r"),("s","t"),("e","n")] - False

--}

-- porcentajeDeGoles

{--

porcentajeDeGoles "a" [("b", "c"), ("d","a"), ("h", "j")] [15,24,14] - 45.28
porcentajeDeGoles "c" [("b", "c"), ("d","a"), ("h", "j"),("k", "l"), ("o","p")] [15,14,3,56,3] - 16,48
porcentajeDeGoles "j" [("b", "c"), ("d","a"), ("h", "j")] [15,24,14] - 26.41
porcentajeDeGoles "a" [("d","a")] [15] - 100.0
porcentajeDeGoles "a" [("b", "c"), ("d","a"), ("h", "j"), ("m","n")] [15,525,24,14] - 90,83

--}

-- vallaMenosVencida

{--

vallaMenosVencida [("b", "c"), ("d","a"), ("h", "j")] [15,24,14] - "j"
vallaMenosVencida [("b", "c"), ("d","a"), ("h", "j"),("k", "l"), ("o","p")] [15,14,3,56,3] - "j" o "p"
vallaMenosVencida [("b", "c"), ("d","a"), ("h", "j")] [15,24,14] - "j"
vallaMenosVencida [("d","a")] [15] - "a"
vallaMenosVencida [("b", "c"), ("d","a"), ("h", "j"), ("m","n")] [15,525,24,14] - "n"
vallaMenosVencida [("d","a"), ("h", "u")] [15, 3] - "u"

--}


--parcialComisionA

--Ejercicio 1
{--

hayQueCodificar 'a' [('b','c'), ('a','j')] - True
hayQueCodificar 'a' [('b','c'), ('a','j'), ('s', 't')] - True
hayQueCodificar 'a' [('b','c'), ('x','j')] - False
hayQueCodificar 'b' [('b','c'), ('x','j')] - True
hayQueCodificar 'a' [] - False
hayQueCodificar 'a' [('b','c'), ('x','a')] - False

--}

-- Ejercicio 2

{--

cuantasVecesHayQueCodificar 'a' ['b','c','d','e', 'a', 'j', 'a'] [('b','c'), ('a','e')] - 2
cuantasVecesHayQueCodificar 'a' ['b','c','d','e', 'w', 'j', 'w'] [('b','c'), ('a','j')] - 0
cuantasVecesHayQueCodificar 'a' ['b','c','d','e', 'a', 'j', 'a'] [('b','c'), ('x','j')] - 0
cuantasVecesHayQueCodificar 'a' ['b','a','d','e', 'a', 'j', 'a'] [('b','c'), ('a','h'), ('x','j')] - 3

--}

-- Ejercicio 3

{--

laQueMasHayQueCodificar ['b','c','d','e', 'a', 'j', 'a'] [('b','c'), ('a','e')] - a
laQueMasHayQueCodificar ['b','c','d','e', 'w', 'j', 'w'] [('b','c'), ('a','j')] - b
laQueMasHayQueCodificar ['b','c','d','e', 'a', 'j', 'a'] [('b','c'), ('x','j')] - b
laQueMasHayQueCodificar ['b','a','d','e', 'a', 'j', 'a'] [('b','c'), ('a','h'), ('x','j')] - a
laQueMasHayQueCodificar ['b','b','b','c','d','e', 'a','a', 'a'] [('b','c'), ('a','e')] - b
laQueMasHayQueCodificar ['b', 'b','a','a'] [('b','c'), ('a','e')] - b

--}

--Ejercicio 4

{--

codificarFrase ['b','b','b','c','d','e', 'a','a', 'a'] [('b','c'), ('a','e')] - [c,c,c,c,d,e,e,e,e]
codificarFrase ['b','b','b','c','d','e', 'a','a', 'a'] [('b','c'), ('a','e'), ('d', 'f')] - [c,c,c,c,f,e,e,e,e]
codificarFrase ['b','b','b','c','d','e', 'a','a', 'a'] [('c','b'), ('a','e')] - [b,b,b,b,d,e,e,e,e]
codificarFrase ['b','b','b','c','d','e', 'a','a', 'a'] [('x','y'), ('z','q'), ('h','j')] - [b,b,b,c,d,e,a,a,a]

--}