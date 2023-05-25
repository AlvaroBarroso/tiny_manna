import sys

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
                    return False
    return True

# Check invariant: Statistic test binomial dist p=0.5
def check_binomial(pila):
    # TODO: implement
    return True

# Check invariant: Bordes
# The cells at the edges of the pila are connected to the cells at the opposite edge
def check_bordes(pila):
    # TODO: implement
    return True


print(check_activos(pila))
print(check_binomial(pila))
print(check_bordes(pila))
