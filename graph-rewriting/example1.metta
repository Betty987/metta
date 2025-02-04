(link A B)
(link B C)
(link C D)
(link D A)

! (match &self (link $x $y)
    (link $x $y)) ;

! (match &self (, (link A B)
                  (link B C)
                  (link C D)
                  (link C D))
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
