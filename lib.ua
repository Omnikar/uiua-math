# Experimental!
# Various math functions

# Extract real
R ↚ ◌°ℂ

# -- Averages --

# Arithmetic mean
Mean ← ÷⧻⟜/+
# Geometric mean
GMean ← ⁿ÷:1⧻⟜/×
# Harmonic mean
HMean ← ÷/+⟜⧻÷:1
# Quadratic mean
QMean ← √÷⧻⟜/+°√
Median ← ÷2/+⊏⊟⊃⌊⌈÷2-1⧻.⊏⍏.

# -- Matrices --

# Dot product
Dot ← /+×
# Cross product
Cross ← ↻2-∩(×↻2):,,
# Matrix product
# Computes B * A
# ? A B
Mmp ← ⍜⍉⊞Dot
# Matrix-vector product
# Computes M * V where V is represented as a 1D list of numbers
# ? M V
Mvp ← Dot⍉
# Matrix power
# ? P M
Mpow ← ⊙◌⍥(⊞Dot,⍉):⊞=.⇡⧻,

# -- Number theory --

# Greatest common divisor
# Ignores sign
GCD ← ◌⍢⊃◿∘±⌵
# Least common multiple
# Ignores sign
LCM ← ⌵÷⊃GCD×

BaseEncImpl ↚ ⍉◌∧⊃◿(⊂¤⌊÷)⊞ⁿ⇌⇡/↥♭+1⌊⊃ₙ⊙⊙[]
BaseDecImpl ↚ /+×⊞ⁿ⇡⧻,⊙°⍉
# Encode an array of numbers into digits of a given base.
# Analogous to ⋯ for base 2; the least significant digit is first.
# No °; see `BaseDec` for decoding from a base.
#
# `BaseEnc` allows multiple bases as input.
# ```uiua
# # Encodes 6 in base 2, 7 in base 3, 8 in base 4, and 9 in base 5.
# BaseEnc [2_3 4_5] [6_7 8_9]
# ## ╭─
# ## ╷ 0 1 1
# ## ╷ 1 2 0
# ##
# ##   0 2 0
# ##   4 1 0
# ##         ╯
# ```
BaseEnc ← setundBaseEncImpl ⟜BaseEncImpl BaseDecImpl
# Decode an array of encoded lists of digits of a given base.
# Analogous to °⋯ for base 2; the least significant digit is first.
# See `BaseEnc` for encoding to a base.
#
# `BaseDec` allows multiple bases as input.
# ```uiua
# # Decodes 6 in base 2, 7 in base 3, 8 in base 4, and 9 in base 5.
# BaseDecImpl [2_3 4_5] [[0_1_1 1_2_0] [0_2_0 4_1_0]]
# ## ╭─
# ## ╷ 6 7
# ##   8 9
# ##       ╯
# ```
BaseDec ← setundBaseDecImpl ⟜BaseDecImpl BaseEncImpl

# Inverse of N modulo M (M if nonexistent)
# ? N M
ModInv ← ⊗1◿:×⇡,
# Multiplicative order of N modulo M
# ? N M
ModOrd ← ⋊b⊚=1◿:ⁿ⇡,

# Binomial coefficient aka N choose K
# ? K N
Binom ← /×÷+1⟜-⇡

# Convert a number X to a continued fraction to N terms.
# Use `°CFrac` to convert to a number from a continued fraction.
# ? N X
CFrac ← setinv[◌⍥⊃(÷:1◿1)⌊]⊃⧻/(+÷:1)

# -- Misc --

# Permutations of N items
# Indices ? N
Perms ← ☇1⍉∧(≡↻⇡⟜↯+1⟜⊂):¤¤°⊂⇡

# Po-Shen quadratic solver
# Returns roots as a list
# ? A B C
Quad ← ⍥R⌵↥0:⊟⊃-+⊙:√⟜±-:°√⟜:ℂ0¯÷2∩÷⟜:

# Powerset of a list
PSet ← ⍚▽⋯⇡ⁿ:2⧻⟜¤

# Rank polymorphic fast fourier transform
RPFFT ← setinv(⍥(⍉fft)⧻△.|°⍥(⍉fft)⧻△.)

# Rank polymorphic convolution using fast fourier transform
FFTConvolve ← ⍥R¬↥⊃∩type(
  ∩⬚0↙⟜:-1+∩△,,  # Pad to size of final array
  ×√/×⊸△⍜∩RPFFT× # Multidimensional FFT, multiply, and normalize
)
