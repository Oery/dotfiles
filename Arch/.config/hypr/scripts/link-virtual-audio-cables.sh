#!/bin/bash

OUTPUT_DEVICE="alsa_output.usb-Razer_Razer_Kraken_X_USB_00000000-00.analog-stereo"

pw-link Media_Sink_Playback $OUTPUT_DEVICE
pw-link System_Sink_Playback $OUTPUT_DEVICE
pw-link Discord_Sink_Playback $OUTPUT_DEVICE
