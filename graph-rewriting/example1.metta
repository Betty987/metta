;Graph Rewriting Rule
;The first match operation retrieves and prints all existing links.
;The transformation rule modifies the graph:
;It removes the link (D → A), breaking the cycle.
;It adds a new link (D → E), extending the graph.
;Querying
;The final match operation retrieves and prints all current links in the modified graph.
;Before rewriting=A → B → C → D → A
;After rewriting=A → B → C → D → E


(link A B)
(link B C)
(link C D)
(link D A)

! (match &self (link $x $y)
    (link $x $y)) ;

! (match &self (, (link A B)
                  (link B C)
                  (link C D)
                  (link D A))
               (let () (remove-atom &self (link D A))
                       (add-atom &self (link D E))
                       )
  ) ; [(), (), ()]
! (match &self (link $x $y)
    (link $x $y)) 


;output
;[(link A B), (link B C), (link D A), (link C D)]
;[()]
;[(link A B), (link B C), (link D E), (link C D)]
