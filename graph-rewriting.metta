;Graph Rewriting in meTTa: Tree Reversal
;1. The initial graph represents a tree with A as the root and the following relationships:
; original
      A
     ↙   ↘
    B      C          
   ↙  ↘   ↙  ↘
  D    E  F    G

;Transformed

   G   F   D   E
   ↘  ↙   ↘  ↙
     C       B
      ↘     ↙
         A

;2. Graph Rewriting Rule
    ;Finds each (link Parent Child).
    ;Removes the original link.
    ;Adds a new reversed link (Child → Parent).
;3.Query the transformed graph

(link A B)
(link A C)
(link B D)
(link B E)
(link C F)
(link C G)
! (match &self (link $parent $child)
    (let () (remove-atom &self (link $parent $child))
            (add-atom &self (link $child $parent))))
! (match &self (link $x $y)
    (link $x $y))

;output
[(), (), (), (), (), ()]
[(link G C), (link C A), (link F C), (link B A), (link E B), (link D B)]
