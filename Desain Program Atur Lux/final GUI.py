import tkinter as tk
from tkinter import ttk

class ControlPanel(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Control Panel")
        # self.geometry("400x500")

        # Initialize variables
        self.percentage = tk.IntVar(value=100)
        self.last_valid_value = 100

        self.status = tk.StringVar(value="ON")  # Variabel status dengan nilai awal "Off"

        # Create Widgets
        self.create_widgets()

    def create_widgets(self):
        # ON Button
        self.on_button = ttk.Button(self, text="ON", command=self.turn_on)
        self.on_button.grid(row=0, column=0, padx=10, pady=10)

        # OFF Button
        self.off_button = ttk.Button(self, text="OFF", command=self.turn_off)
        self.off_button.grid(row=1, column=0, padx=10, pady=10)

        # Percentage Display
        self.percentage_label = ttk.Entry(self, textvariable=self.percentage, width=5, justify="center", validate="key", validatecommand=(self.register(self.validate_input), "%P"))

        self.percentage_label.grid(row=0, column=2, padx=10, pady=60, rowspan=2)
        self.percentage_label.bind("<FocusIn>", self.select_all)  # Menambahkan event untuk memblok teks saat fokus

        # Up Arrow
        self.up_arrow = ttk.Button(self, text="▲", command=self.increase_percentage)
        self.up_arrow.grid(row=0, column=2, padx=5)

        # Down Arrow
        self.down_arrow = ttk.Button(self, text="▼", command=self.decrease_percentage)
        self.down_arrow.grid(row=1, column=2, padx=5)

        # Slider
        self.slider = ttk.Scale(self, from_=100, to=0, orient="vertical", variable=self.percentage, command=self.update_input)
        self.slider.grid(row=0, column=3, rowspan=2, padx=10)
        self.slider_label_full = ttk.Label(self, text="100 %")
        self.slider_label_full.grid(row=0, column=4, padx=10)
        self.slider_label_zero = ttk.Label(self, text="0 %")
        self.slider_label_zero.grid(row=1, column=4, padx=10)

        # Label untuk menampilkan teks status
        self.status_label = ttk.Label(self, text="Status:", font=("Arial", 12))
        self.status_label.grid(row=2, column=1, padx=10, pady=10)  # Menempatkan label teks status di grid

        # Label untuk menampilkan nilai status
        self.status_value_label = ttk.Label(self, textvariable=self.status, font=("Arial", 12))
        self.status_value_label.grid(row=2, column=2, padx=10, pady=10)  # Menempatkan label nilai status di grid

        # Exit Button
        self.exit_button = ttk.Button(self, text="Exit", command=self.exit_program)
        self.exit_button.grid(row=4, column=4, pady=10, padx=10)

    def turn_on(self):
        self.status.set("ON")  # Mengubah status menjadi "On"
        print("Turned ON")

    def turn_off(self):
        self.status.set("OFF")  # Mengubah status menjadi "Off"
        print("Turned OFF")

    def increase_percentage(self):
        if self.percentage.get() < 100:
            self.percentage.set(self.percentage.get() + 1)
        self.last_valid_value = self.percentage.get()

    def decrease_percentage(self):
        if self.percentage.get() > 0:
            self.percentage.set(self.percentage.get() - 1)
        self.last_valid_value = self.percentage.get()

    def select_all(self, event):
        self.percentage_label.selection_range(0, tk.END)  # Memilih semua teks di dalam kotak input

    def validate_input(self, new_value):
        # Memastikan input hanya angka dan tidak lebih dari 100
        if new_value.isdigit() and int(new_value) <= 100:
            self.last_valid_value = int(new_value)
            return True  # Mengizinkan input jika angka dan tidak lebih dari 100
        elif new_value == "":
            return True  # Mengizinkan input jika kosong (untuk menghapus)
        else:
            self.percentage.set(self.last_valid_value)
            return False  # Menolak input jika bukan angka atau lebih dari 100
    
    def update_input(self, value):
        # Memperbarui nilai kotak input dengan nilai dari slider dan memastikan itu integer
        self.percentage.set(int(float(value)))
        self.last_valid_value = self.percentage.get()
        print(self.percentage.get())

    def exit_program(self):
        self.destroy()

if __name__ == "__main__":
    app = ControlPanel()
    app.mainloop()