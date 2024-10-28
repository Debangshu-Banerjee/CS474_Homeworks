from z3 import *

x, y = Reals('x y')
formula = ForAll(x, Exists(y, And(2 * y > 3 * x, 4 * y < 8 * x + 10)))

# Quantfier elimination
qe_formula = simplify(Tactic('qe').apply(formula).as_expr())

print(qe_formula)
# Output : False