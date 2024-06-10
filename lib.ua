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

# Inverse of N modulo M (M if nonexistent)
# ? N M
ModInv ← ⊗1◿:×⇡,
# Multiplicative order of N modulo M
# ? N M
ModOrd ← ⊡1⊚=1◿:ⁿ⇡,

# Binomial coefficient aka N choose K
# ? K N
Binom ← /×÷+1⟜-⇡

# Convert a number X to a continued fraction to N terms
# ? N X
ToCFrac ← ⇌◌⍥(⊙⊂÷:1◿1⟜⌊)⊙⊙[]
# Convert to a number from a continued fraction
FromCFrac ← /(+÷:1)⇌

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
