import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import pandas as pd

df = pd.read_csv('./training_srgan_log full.csv')

# Inisialisasi plot
fig, ax = plt.subplots()
line_g_loss, = ax.plot([], [], lw=2, label='g_loss')
line_g_psnr, = ax.plot([], [], lw=2, label='g_psnr')
annotation_g_loss = ax.annotate("", xy=(0, 0), xytext=(20, 20), textcoords="offset points",
                                bbox=dict(boxstyle="round", fc="w"),
                                arrowprops=dict(arrowstyle="->"))
annotation_g_psnr = ax.annotate("", xy=(0, 0), xytext=(20, 20), textcoords="offset points",
                                bbox=dict(boxstyle="round", fc="w"),
                                arrowprops=dict(arrowstyle="->"))

# Menambahkan garis horizontal pada y=0
ax.axhline(y=0, color='black', linestyle='--', linewidth=1)

ax.set_ylim(df[['g_loss', 'g_psnr']].min().min(), df[['g_loss', 'g_psnr']].max().max())
ax.set_xlim(0, (df.shape[0] + 1) + 50)
ax.set_xlabel('Epoch')
ax.set_ylabel('Values')
ax.legend()

# Inisialisasi nilai awal untuk anotasi
frame = 0
x = df['epoch'][:frame + 1]
y_g_loss = df['g_loss'][:frame + 1]
y_g_psnr = df['g_psnr'][:frame + 1]
line_g_loss.set_data(x, y_g_loss)
line_g_psnr.set_data(x, y_g_psnr)
annotation_g_loss.set_text(f'Epoch: {frame + 1}\ng_loss: {y_g_loss.iloc[-1]:.2f}')
annotation_g_loss.xy = (x.iloc[-1], y_g_loss.iloc[-1])
annotation_g_psnr.set_text(f'Epoch: {frame + 1}\ng_psnr: {y_g_psnr.iloc[-1]:.2f}')
annotation_g_psnr.xy = (x.iloc[-1], y_g_psnr.iloc[-1])

# Fungsi animasi
def update(frame):
    global x, y_g_loss, y_g_psnr
    x = df['epoch'][:frame + 1]
    y_g_loss = df['g_loss'][:frame + 1]
    y_g_psnr = df['g_psnr'][:frame + 1]
    line_g_loss.set_data(x, y_g_loss)
    line_g_psnr.set_data(x, y_g_psnr)
    
    # Update anotasi g_loss
    annotation_g_loss.set_text(f'Epoch: {frame + 1}\ng_loss: {y_g_loss.iloc[-1]:.2f}')
    annotation_g_loss.xy = (x.iloc[-1], y_g_loss.iloc[-1])
    
    # Update anotasi g_psnr
    annotation_g_psnr.set_text(f'Epoch: {frame + 1}\ng_psnr: {y_g_psnr.iloc[-1]:.2f}')
    annotation_g_psnr.xy = (x.iloc[-1], y_g_psnr.iloc[-1])
    
    return line_g_loss, line_g_psnr, annotation_g_loss, annotation_g_psnr

# Membuat animasi
ani = FuncAnimation(fig, update, frames=df.shape[0], blit=True)

# Menampilkan plot
plt.show()