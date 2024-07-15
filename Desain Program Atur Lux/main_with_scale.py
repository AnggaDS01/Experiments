import tkinter as tk
from tkinter import ttk

def turn_on():
    status_label.config(text="Status: ON")

def turn_off():
    status_label.config(text="Status: OFF")

def set_percentage(value):
    percentage_entry.delete(0, tk.END)
    percentage_entry.insert(0, str(value))

def increase_percentage():
    current_value = int(percentage_entry.get())
    if current_value < 100:
        current_value += 1
        set_percentage(current_value)
        slider.set(current_value)

def decrease_percentage():
    current_value = int(percentage_entry.get())
    if current_value > 0:
        current_value -= 1
        set_percentage(current_value)
        slider.set(current_value)

def slider_changed(event):
    value = int(slider.get())
    set_percentage(value)

root = tk.Tk()
root.title("Control Panel")

frame = ttk.Frame(root, padding="10")
frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))

# ON Button
on_button = ttk.Button(frame, text="ON", command=turn_on)
on_button.grid(row=0, column=0, padx=5, pady=5)

# OFF Button
off_button = ttk.Button(frame, text="OFF", command=turn_off)
off_button.grid(row=1, column=0, padx=5, pady=5)

# Percentage Entry
percentage_entry = ttk.Entry(frame, width=5, justify='center')
percentage_entry.grid(row=0, column=1, rowspan=2, padx=5)
set_percentage(100)

# Up and Down Buttons
up_button = ttk.Button(frame, text="▲", command=increase_percentage)
up_button.grid(row=0, column=2, padx=5, pady=5)

down_button = ttk.Button(frame, text="▼", command=decrease_percentage)
down_button.grid(row=1, column=2, padx=5, pady=5)

# Slider
slider = ttk.Scale(frame, from_=100, to=0, orient='vertical', command=slider_changed)
slider.grid(row=0, column=3, rowspan=2, padx=5, pady=5)
slider.set(100)

# Slider Labels
slider_label_full = ttk.Label(frame, text="Full")
slider_label_full.grid(row=0, column=4, padx=5, pady=5)

slider_label_empty = ttk.Label(frame, text="0")
slider_label_empty.grid(row=1, column=4, padx=5, pady=5)

# Status Label
status_label = ttk.Label(frame, text="Status: OFF")
status_label.grid(row=2, column=0, columnspan=5, pady=10)

# Exit Button
exit_button = ttk.Button(frame, text="Exit", command=root.destroy)
exit_button.grid(row=3, column=0, columnspan=5, pady=5)

root.mainloop()