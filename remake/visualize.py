import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
from matplotlib.widgets import Button
import sys

from helpers import load_and_parse

# Access the command-line argument
arg = sys.argv[1] if len(sys.argv) > 1 else None

# Print the argument
print("The file is:", arg)
pila = load_and_parse(arg)
print(pila)

# Function to plot the current step
def plot_step(step):
    x = range(len(pila[step]))
    y = pila[step]

    segments = [[(i, 0), (i, y_val)] for i, y_val in zip(x, y)]
    lc = LineCollection(segments, colors='blue', linewidths=4)  # Increase linewidth for bigger bars
    ax.clear()
    ax.add_collection(lc)
    ax.set_xlabel('Position')
    ax.set_ylabel('Value')
    ax.set_title(f'Step {step}')
    ax.grid(True)
    ax.set_xlim(-0.5, len(pila[step]) - 0.5)  # Set x-axis limits
    ax.set_ylim(ymin, ymax)  # Set y-axis limits
    ax.set_xticks(range(len(pila[step])))  # Set x-axis tick positions
    ax.set_xticklabels(range(len(pila[step])))  # Set x-axis tick labels as integers
    plt.draw()

# Previous button click event
def prev_button_clicked(event):
    global current_step
    if current_step > 0:
        current_step -= 1
        plot_step(current_step)

# Next button click event
def next_button_clicked(event):
    global current_step
    if current_step < len(pila) - 1:
        current_step += 1
        plot_step(current_step)

# Define the pila of the discrete function

# Initialize the current step
current_step = 0

# Set the y-axis limits
ymin = min(min(step) for step in pila)
ymax = max(max(step) for step in pila)

# Create the plot for the initial step
fig, ax = plt.subplots()

# Create previous and next buttons
ax_prev = plt.axes([0.7, 0.05, 0.1, 0.04])
ax_next = plt.axes([0.81, 0.05, 0.1, 0.04])
btn_prev = Button(ax_prev, 'Previous')
btn_next = Button(ax_next, 'Next')

# Connect button click events to their respective functions
btn_prev.on_clicked(prev_button_clicked)
btn_next.on_clicked(next_button_clicked)

# Plot the initial step
plot_step(current_step)

# Show the plot
plt.show()