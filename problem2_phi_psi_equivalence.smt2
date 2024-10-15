; Declare the Boolean variables
(declare-fun p () Bool)
(declare-fun q () Bool)
(declare-fun r () Bool)

; Define Formula 1 which is \varphi
(define-fun varphi () Bool
    (and
        (or q (not r))          ; (q or ~r)
        (or (not p) r)          ; (~p or r)
        (or (not q) r p)        ; (~q or r or p)
        (or p q (not q))        ; (p or q or ~q)  (Always true)
        (or (not r) q)          ; (~r or q)
    )
)

; Define Formula 2 which is \psi
(define-fun psi () Bool
    (and
        (or q (not r))          ; (q or ~r)
        (or (not p) r)          ; (~p or r)
        (or (not q) r p)        ; (~q or r or p)
        (or q (not p))          ; (q or ~p)
        (or (not q) r)          ; (~q or r)
    )
)

; Check if varphi and psi are equivalent by asserting their equivalence
; Negate the equivalence to check for unsatisfiability
(assert (not (and
    (or (not varphi) psi)
    (or (not psi) varphi)        
)))

(check-sat)

; If unsat, it means varphi and psi are logically equivalent
