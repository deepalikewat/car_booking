from PIL import ImageGrab, Image
import io

img = ImageGrab.grabclipboard()
img.save("img/doc6.png", "PNG")

