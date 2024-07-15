import tkinter as tk
from tkinter import ttk

def turn_on():
    print("Light turned ON")

def turn_off():
    print("Light turned OFF")

def set_lux_450():
    print("Brightness set to 450 lux")

def set_lux_900():
    print("Brightness set to 900 lux")

def set_full():
    print("Brightness set to Full")

# Create the main window
root = tk.Tk()
root.title("Light Control")
root.geometry("300x300")

# Create buttons
on_button = ttk.Button(root, text="ON", command=turn_on)
on_button.place(x=50, y=50, width=80, height=30)

off_button = ttk.Button(root, text="OFF", command=turn_off)
off_button.place(x=50, y=100, width=80, height=30)

lux_450_button = ttk.Button(root, text="450 lux", command=set_lux_450)
lux_450_button.place(x=200, y=50, width=80, height=30)

lux_900_button = ttk.Button(root, text="900 lux", command=set_lux_900)
lux_900_button.place(x=200, y=100, width=80, height=30)

full_button = ttk.Button(root, text="Full", command=set_full)
full_button.place(x=200, y=150, width=80, height=30)

exit_button = ttk.Button(root, text="Exit", command=root.quit)
exit_button.place(x=120, y=250, width=80, height=30)

# Run the application
root.mainloop()
