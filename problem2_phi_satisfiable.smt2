; The boolean variables
(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)

;checking for satisfiability
(assert (and 
    (or q (not r))
    (or (not p) r)
    (or (not q) r p)
    (or p q (not q)) ; Always true due to (q or ~q)
    (or (not r) q)
))



; Check for satisfibility
(check-sat)

; Get the valuation
(get-model)

; sat
; (
;   (define-fun q () Bool
;     false)
;   (define-fun p () Bool
;     false)
;   (define-fun r () Bool
;     false)
; )