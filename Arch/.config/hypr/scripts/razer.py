from openrazer.client import DeviceManager
from colorsys import rgb_to_hls, hls_to_rgb

COLOR = "#5D6669"

def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def increase_saturation(r, g, b, increase_amount=0):
    h, l, s = rgb_to_hls(r / 255.0, g / 255.0, b / 255.0)
    s = min(1.0, s + increase_amount)
    r, g, b = hls_to_rgb(h, l, s)
    return int(r * 255), int(g * 255), int(b * 255)

red, green, blue = hex_to_rgb(COLOR)
red, green, blue = increase_saturation(red, green, blue)

device_manager = DeviceManager()
device_manager.sync_effects = False

for device in device_manager.devices:
    device.fx.static(red=red, green=green, blue=blue)
