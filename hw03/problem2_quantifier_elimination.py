from z3 import *

l1, l2, u1, u2, w, z = Reals('l1 l2 u1 u2 w z')
psi = Exists(w, And([l1 < w, w < u1, l2 < w, w < u2]))
phi = And([l1 < z, z < u1, l2 < z, z < u2])

formula = ForAll(z, Or(Not(phi), psi))

# Quantfier elimination
qe_formula = simplify(Tactic('qe').apply(formula).as_expr())

print(qe_formula)

# Output: True
