import sys
from scipy.stats import binomtest

from helpers import load_and_parse

# Access the command-line argument
arg = sys.argv[1] if len(sys.argv) > 1 else None

# Print the argument
# print("Invariant checkers:", arg)
pila = load_and_parse(arg)

# Pila is a list of lists
# Each list is a step
# Each step is a list of integers
# Each integer is the number of grains of sand in a cell


# Check invariant: Activos
# A cell is active if it has more than 1 grain of sand
# If it's active in the n-th step and the surrounded piles are inactive, then in the n+1-th step it will have 0 grains of sand
def check_activos(pila):
    for step in range(len(pila) - 1):
        for cell in range(len(pila[step]))[1:-1]:
            if pila[step][cell] > 1 and pila[step][cell - 1] <= 1  and pila[step][cell + 1] <= 1:
                if pila[step + 1][cell] != 0:
                    raise Exception("active -> inactive transition failed")
    return True

# Check invariant: Statistic test binomial dist p=0.5
def check_binomial(pila):
    data_points = []
    for step in range(len(pila) - 1):
        for cell in range(len(pila[step]))[2:-2]:
            if (
                pila[step][cell] > 1 and
                pila[step][cell - 2] <= 1  and # Para que no interfieran
                pila[step][cell + 2] <= 1
            ):
                reminder_left = 0 if pila[step][cell - 1] > 1 else pila[step][cell - 1]
                reminder_right = 0 if pila[step][cell + 1] > 1 else pila[step][cell + 1]

                left = pila[step + 1][cell - 1] - reminder_left
                right = pila[step + 1][cell + 1] - reminder_right

                assert(pila[step][cell] == left + right)
                data_points.append((left, right))

    total_sum = sum([left + right for left, right in data_points])
    left_sum = sum([left for left, _ in data_points])

    test_results = binomtest(left_sum, n=total_sum, p=0.5, alternative='two-sided')
    assert test_results.pvalue > 0.005, f"Statistical test failed with k={test_results.k} n={test_results.n} pvalue={test_results.pvalue}"

# Check invariant: Bordes
# The cells at the edges of the pila are connected to the cells at the opposite edge
def check_bordes(pila):
    # Left edge -> right edge
    for step in range(len(pila) - 1):
        if pila[step][0] > 1 and pila[step][len(pila[step]) - 2] <= 1 and pila[step][2] <= 1:
            initial_amount = pila[step][0]
            right_amount = pila[step + 1][1] - (0 if pila[step][1] > 1 else pila[step][1])
            left_amount = pila[step + 1][len(pila[step]) - 1] - (0 if pila[step][len(pila[step]) - 1] > 1 else pila[step][len(pila[step]) - 1])
            assert initial_amount == (right_amount + left_amount), f"left edge -> right edge transition failed at step {step}"

    # Right edge -> left edge
    for step in range(len(pila) - 1):
        if pila[step][len(pila[step]) - 1] > 1 and pila[step][len(pila[step]) - 3] <= 1 and pila[step][1] <= 1:
            initial_amount = pila[step][len(pila[step]) - 1]
            right_amount = pila[step + 1][0] - (0 if pila[step][0] > 1 else pila[step][0])
            left_amount = pila[step + 1][len(pila[step]) - 2] - (0 if pila[step][len(pila[step]) - 2] > 1 else pila[step][len(pila[step]) - 2])
            assert initial_amount == (right_amount + left_amount), f"right edge -> left edge transition failed at step {step}"

# Check invariant: Conservacion!
# Ver que cuando divide, no desaparecen granos ni se crean granos.
def check_conservacion(pila):
    set_sums = set(sum(step) for step in pila)
    assert len(set_sums) == 1, f"Conservation of sand failed {set_sums}"

print(f"Running invariant checkers... for {arg}")
check_activos(pila)
check_binomial(pila)
check_bordes(pila)
check_conservacion(pila)
print("All invariant checkers passed!")