library(tuneR)

# Parameters
sample_rate <- 44100  # Sampling rate (Hz)
duration <- 30        # Duration of sound (seconds)
carrier_freq <- 200   # Carrier frequency (Hz)
theta_freq <- 4       # Theta frequency (Hz)

# Generate time vector
t <- seq(0, duration, by = 1 / sample_rate)

# Generate binaural beat waves
left_wave <- sin(2 * pi * carrier_freq * t) * 32767
right_wave <- sin(2 * pi * (carrier_freq + theta_freq) * t) * 32767

# Create Wave object
wave_object <- Wave(left = left_wave, right = right_wave, samp.rate = sample_rate, bit = 16)

# Write to file
writeWave(wave_object, "theta_binaural_beat_4hz.wav")



object.size(wave_object)/10000


library(tuneR)

# Parameters
sample_rate <- 44100  # Sampling rate (Hz)
duration <- 30#1800       # Duration of sound (seconds) (30 minutes = 1800 seconds)
carrier_freq <- 250   # Carrier frequency (Hz)
beat_freq <- 6       # Binaural beat frequency (Hz)

# Generate time vector
t <- seq(0, duration, by = 1 / sample_rate)

# Generate sine waves for left and right ears
left_wave <- sin(2 * pi * carrier_freq * t)
right_wave <- sin(2 * pi * (carrier_freq + beat_freq) * t)

# Combine the waves, scale to 16-bit range, and create Wave object
stereo_wave <- cbind(left_wave, right_wave)  # Left and right channels
wave_object <- Wave(left = left_wave * 32767, right = right_wave * 32767, samp.rate = sample_rate, bit = 16)

# Write Wave object to file
writeWave(wave_object, "6hz_binaural_250hz_carrier.wav")

cat("6 Hz binaural beat with 250 Hz carrier generated and saved to 6hz_binaural_250hz_carrier.wav\n")
