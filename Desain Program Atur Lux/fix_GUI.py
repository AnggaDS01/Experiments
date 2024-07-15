import tkinter as tk
from tkinter import ttk
from gpiozero import PWMLED
from smbus2 import SMBus
import time
import threading

class ControlPanel(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Control Panel")
        self.geometry("734x895")

        # Initialize variables
        self.percentage = tk.IntVar(value=100)
        self.last_valid_value = 100
        self.status = tk.StringVar(value="ON")
        self.lux_value = tk.StringVar(value="Lux: --")

        # GPIO setup
        self.led = PWMLED(13)
        self.led.value = 1  # Set LED to full brightness (100%)

        # I2C setup for BH1750
        self.bus = SMBus(1)
        self.bh1750_address = 0x23

        # Create Widgets
        self.create_widgets()

        # Start thread to monitor BH1750 sensor
        self.monitor_thread = threading.Thread(target=self.monitor_lux)
        self.monitor_thread.daemon = True
        self.monitor_thread.start()

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
        self.percentage_label.bind("<FocusIn>", self.select_all)

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
        self.status_label.grid(row=2, column=1, padx=10, pady=10)

        # Label untuk menampilkan nilai status
        self.status_value_label = ttk.Label(self, textvariable=self.status, font=("Arial", 12))
        self.status_value_label.grid(row=2, column=2, padx=10, pady=10)

        # Label untuk menampilkan nilai lux
        self.lux_label = ttk.Label(self, textvariable=self.lux_value, font=("Arial", 12))
        self.lux_label.grid(row=3, column=1, columnspan=2, padx=10, pady=10)

        # Exit Button
        self.exit_button = ttk.Button(self, text="Exit", command=self.exit_program)
        self.exit_button.grid(row=4, column=4, pady=10, padx=10)

    def turn_on(self):
        self.status.set("ON")
        self.update_led()
        print("Turned ON")

    def turn_off(self):
        self.status.set("OFF")
        self.update_led()
        print("Turned OFF")

    def increase_percentage(self):
        if self.percentage.get() < 100:
            self.percentage.set(self.percentage.get() + 1)
        self.last_valid_value = self.percentage.get()
        self.update_led()

    def decrease_percentage(self):
        if self.percentage.get() > 0:
            self.percentage.set(self.percentage.get() - 1)
        self.last_valid_value = self.percentage.get()
        self.update_led()

    def select_all(self, event):
        self.percentage_label.selection_range(0, tk.END)

    def validate_input(self, new_value):
        if new_value.isdigit() and int(new_value) <= 100:
            self.last_valid_value = int(new_value)
            self.update_led()
            return True
        elif new_value == "":
            return True
        else:
            self.percentage.set(self.last_valid_value)
            return False

    def update_input(self, value):
        self.percentage.set(int(float(value)))
        self.last_valid_value = self.percentage.get()
        self.update_led()

    def update_led(self):
        if self.status.get() == "ON":
            self.led.value = self.percentage.get() / 100.0
        else:
            self.led.value = 0

    def read_lux(self):
        data = self.bus.read_i2c_block_data(self.bh1750_address, 0x20, 2)
        lux = (data[1] + (256 * data[0])) / 1.2
        return lux

    def monitor_lux(self):
        while True:
            lux = self.read_lux()
            self.lux_value.set(f"Lux: {lux:.2f}")
            print(f"Lux: {lux}")
            if lux < 100:
                self.turn_on()
            else:
                self.turn_off()
            time.sleep(1)

    def exit_program(self):
        self.led.close()
        self.destroy()

if __name__ == "__main__":
    app = ControlPanel()
    app.mainloop()
