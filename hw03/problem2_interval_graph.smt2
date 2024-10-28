; Declare the variables
(declare-const l1 Real)
(declare-const u1 Real)
(declare-const l2 Real)
(declare-const u2 Real)
(declare-const l3 Real)
(declare-const u3 Real)
(declare-const l4 Real)
(declare-const u4 Real)



; Declare the existential variable x
(declare-const x Real)



; Define Formula 1 (edge between n1, n2)
(define-fun phi1 () Bool
    (exists ((x Real))
        (and
            (> x l1)
            (< x u1)
            (> x l2)
            (< x u2)
        )
    )
)

; Define Formula 2 (edge between n1, n4)
(define-fun phi2 () Bool
    (exists ((x Real))
        (and
            (> x l1)
            (< x u1)
            (> x l4)
            (< x u4)
        )
    )
)

; Define Formula 3 (no edge between n1, n3)
(define-fun phi3 () Bool
    (not 
        (exists ((x Real))
            (and
                (> x l1)
                (< x u1)
                (> x l3)
                (< x u3)
            )
        )
    )
)

; Define Formula 4 (edge between n2, n3)
(define-fun phi4 () Bool
    (exists ((x Real))
        (and
            (> x l2)
            (< x u2)
            (> x l3)
            (< x u3)
        )
    )
)

; Define Formula 5 (edge between n3, n4)
(define-fun phi5 () Bool
    (exists ((x Real))
        (and
            (> x l4)
            (< x u4)
            (> x l3)
            (< x u3)
        )
    )
)

; Define Formula 6 (no edge between n2, n4)
(define-fun phi6 () Bool
    (not 
        (exists ((x Real))
            (and
                (> x l2)
                (< x u2)
                (> x l4)
                (< x u4)
            )
        )
    )
)




; Assert the negation of phi1
(assert (and 
        phi1
        phi2
        phi3
        phi4
        phi5
        phi6
        (< l1 u1)
        (< l2 u2)        
        (< l3 u3)
        (< l4 u4)        
        )
)

(check-sat)
; Output: unsat