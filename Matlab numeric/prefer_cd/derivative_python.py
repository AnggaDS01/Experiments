from sympy import symbols, diff, exp
import matplotlib.pyplot as plt
import numpy as np

def hitung_error(diff, eksak):
    error = abs(diff - eksak) * 100 / abs(diff)
    return error

# Definisikan variabel simbolik
x = symbols('x')

# Definisikan fungsi
fx = 2*x*exp(x**2)
eksak_deriv = diff(fx, x)

print(eksak_deriv)
# # Nilai awal untuk h atau step yang ingin diberikan pada fungsi yang diketahui
# h_1 = 0.00001

# # Array untuk menyimpan hasil eksak dan numerik
# eksak_deriv_values = []
# approx_deriv_values = []

# print("________________________________________________________________________")
# print("%s \t | %-8s | %-8s | %-10s  | %-10s  | %s%%" % ('i', 'eksak', 'numeric', 'f(x+h)',  'f(x-h)',  'error'))
# print("________________________________________________________________________")
# for i in range(0, 50):
#     eksak_deriv = diff(fx, x).subs(x, i)
#     eksak_deriv_values.append(eksak_deriv)
    
#     f1 = fx.subs(x, i + h_1)
#     f_1 = fx.subs(x, i - h_1)
#     approx_deriv = (f1 - f_1) / (2*h_1)
#     approx_deriv_values.append(approx_deriv)
    
#     error = hitung_error(approx_deriv, eksak_deriv)
#     print("%g\t | %-8g | %-8g | %-10g  | %-10g  | %g%%" % (i, eksak_deriv, approx_deriv, f1, f_1, error))

# # Buat array nilai x untuk plot
# nilai_x = np.arange(0, 50)

# # Plot hasil derivative eksak dan numerik
# plt.plot(nilai_x, eksak_deriv_values, label='Derivative Eksak')
# plt.plot(nilai_x, approx_deriv_values, label='Derivative Numerik')
# plt.xlabel('x')
# plt.ylabel('Derivative')
# plt.title('Plot Hasil Derivative Eksak dan Numerik')
# plt.legend()
# plt.grid(True)
# plt.show()
