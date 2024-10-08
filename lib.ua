# Experimental!
# Various math functions

# Extract real
R ↚ ◌°ℂ
# Floating point epsilon
ε ← 2.2204460492503131e-16
# ? ErrorMsg
Throw! ↚ ⍤^0 0

# -- Averages --

# Arithmetic mean
Mean ← ÷⧻⟜/+
# Geometric mean
GMean ← ⁿ÷:1⧻⟜/×
# Harmonic mean
HMean ← ÷/+⟜⧻÷:1
# Quadratic mean
QMean ← √÷⧻⟜/+°√
# Median
# TODO: O(n) median algorithm?
Median ← ÷2/+⊏⊟⊃⌊⌈÷2-1⊸⧻⊏⊸⍏

# -- Matrices/Vectors --

# ? SwappedRows Pivot
GaussEliminate‼ ↚ ∧(
  ⊢⍖⊸⌵⍜⊙↙×0⟜⊡⤚⊸⊙⍉
  ⍜⊏⇌ ⊃⊙⊙∘^0 ⊟⤙⊙⊙∘ ⊙(⊃⋅⊙∘^1 ⍤.≥ε⊸⌵) ⟜⊡
  ⊸⍜⊡(÷⊸⊡:),
  ⍜(°⊂↻|⊙-:⊸⊞×:⊙(⊡⤚˜⊙⍉)),
)°⊏

# Matrix Determinant
MDet ← ◌⍣GaussEliminate‼(⍥¯/≠⊙⋅⋅∘|×⊙⋅⋅∘)⊙0 ⊙1

# Perform Gauss-Jordan elimination
Mgje     ← ⍣GaussEliminate‼()()⟜Throw!"Elimination cannot be completed"
MInvImpl ↚ ⍜⍉(↘÷2⊸⧻) ⍣Mgje⟜Throw!"Matrix has no inverse" ≡⊂:⊞=.°⊏
# Matrix Inverse
MInv ← ⌅(MInvImpl|MInvImpl)

MSquarify ↚ ⍜△[.√⊢]
# Matrix Cofactors
MCof ← ⍥¯⊞≠.◿2°⊏MSquarify≡(MDet MSquarify≡⊡⊙¤⊚¬⊞↥°⊟)⊙¤⬚0∵°⊚⊚⊸=.

# Dot product
Dot ← /+×
# Cross product
Cross ← ↻2-∩(×↻2)⤙.
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

QqpMask ↚ [
  1_2_3_4
  2_¯1_4_¯3
  3_¯4_¯1_2
  4_3_¯2_¯1]
# Quaternion product
# Computes P * Q for quaternion arrays P and Q.
# Semi-pervasive; the last axis of the inputs must be of length 4,
# and will be interpreted as the input quaternions' real, i, j, and k.
# ```uiua
# # Computes (1+2i+3j+4k)(1+3i+5j+7k) and (2+4i+6j+8k)(5+6i+7j+8k)
# Qqp [1_2_3_4 2_4_6_8] [1_3_5_7 5_6_7_8]
# ## ╭─
# ## ╷  ¯48  6  6 12
# ##   ¯120 24 60 48
# ##                 ╯
# ```
# ? P Q
Qqp ← ⍉⊕/+-1⌵⊙×⟜±QqpMask⊞×∩°⍉
# Create 3D rotation quaternions.
# Expects an angle array θ and a unit vector axis array U.
# Semi-pervasive; the unit vector array must have one extra trailing
# axis compared to the angle array, and that axis must be length 3.
# For each angle-vector pair, computes cos(θ/2) + Usin(θ/2).
# ```uiua
# # Creates two rotation quaternions:
# # - η radians about 0_0_1
# # - π radians about 3/5_4/5_0
# RQuat η_π [0_0_1 3/5_4/5_0]
# ```
# To use rotation quaternions created by `RQuat` to rotate 3D
# vectors, see `QRot`.
# ? θ U
RQuat ← ⍜⊙°⍉⊂⊙×:°∠÷2
# Quaternion rotation implementation
QRotImpl ↚ ⍜⊙°⍉↘1⍥₂Qqp⟜⍜∩°⍉(⬚0↙¯4:⍜↘¯ 1)
# Rotate a 3D vector array using a quaternion array.
# To create rotation quaternions to use with `QRot`, see `RQuat`.
# Expects a quaternion array Q and a 3D vector array V.
# Semi-pervasive; the input arrays should have matching shapes aside
# from the final axis, which should be of lengths 4 and 3 respectively.
# For each quaternion-vector pair, computes Q * V * Q'.
# ```uiua
# RQuat η 0_0_1        # Create a rotation by η radians about 0_0_1
# QRot ¤:[3_2_0 1_3_2] # Use the quaternion to rotate 3_2_0 and 1_3_2
# ```
# `QRot` can be used with ⍜ to undo the rotations afterward.
# ? Q V
QRot ← ⌅(QRotImpl|⟜QRotImpl|QRotImpl⍜(↘1°⍉)¯)

# -- Number theory --

# Greatest common divisor
# Ignores sign
GCD ← ◌⍢⤚◿±⌵
# Least common multiple
# Ignores sign
LCM ← ⌵÷⊃GCD×

BaseEncImpl ↚ ⍉◌∧⊃◿(⊂¤⌊÷)ⁿ⊙¤⇌⇡/↥♭+1⌊⊃ₙ⊙⊙[]
BaseDecImpl ↚ /+×ⁿ⊙¤⇡⧻,⊙°⍉
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
BaseEnc ← ⌅(BaseEncImpl|⟜BaseEncImpl|BaseDecImpl)
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
BaseDec ← ⌅(BaseDecImpl|⟜BaseDecImpl|BaseEncImpl)

# Inverse of N modulo M (M if nonexistent)
# ? N M
ModInv ← ⊗1◿:×⇡,
# Multiplicative order of N modulo M
# ? N M
ModOrd ← ⊡1⊚=1◿:ⁿ⇡,

# Binomial coefficient aka N choose K
# ? K N
Binom ← /×÷+1⟜-⇡

# Convert a number X to a continued fraction to N terms.
# Use `°CFrac` to convert to a number from a continued fraction.
# ? N X
CFrac ← ⌅([◌⍥⊃(÷⤚◿1)⌊]|⊃⧻/(+÷:1))

# -- Probability --

# Error function
Erf ← (
  ÷:1+1×0.3275911 ⟜(ⁿ:e¯×.) ⌵⟜±
  :[1.061405429 ¯1.453152027 1.421413741
    ¯0.284496736 0.254829592
  ]:0
  ×¬×∧(×⊙+)¤
)

# Seeded random indices from a distribution array
# Given a seed, a shape, and a probability distribution array
# of any rank containing numbers that sum to 1, `DistRand` returns
# an array of deep indices into the distribution arrays, chosen
# randomly weighted by the distribution. The generated random
# indices will fill the shape given to the function. If the
# distribution array is rank 1, the output will have the shape
# given. If the distribution array is rank >1, the output will
# have a shape equal to the shape given suffixed with the rank of
# the distribution array.
#
# ```uiua
# # Generate random indices in the shape 2_3 with a seed of 8
# DistRand [0.1 0.4 0.3 0.2] 2_3 8
# ## ╭─
# ## ╷ 1 2 3
# ##   2 1 2
# ##         ╯
# ```
# Indices ? Distribution Shape Seed
DistRand ← ⍜♭≡(⊢⊚>):⊓¤gen⍜♭\+

# Box-Muller transform
# Converts uniformly distributed pairs of input values to
# standard normally distributed pairs of output values
BoxMuller ← ∩×⤙°∠×τ:√×¯2ₙe¬

# Generate a 2 dimensional square Gaussian kernel
# ? Size StandardDeviation
Gaussian ← ÷/+⊸♭ⁿ:e¯÷2°√÷:⌵⊞ℂ.-÷2-1⟜⇡

# -- Misc --

# Permutation indices of N items
# Indices ? N
Perms ← ☇1⍉∧(≡↻⇡⟜↯+1⟜⊂):¤¤°⊂⇡

# Po-Shen quadratic solver
# Returns roots as a list
# Outputs complex-typed numbers only if the roots are complex
# ? A B C
Quad ← ⍥R⌵↥0:⊟⊃-+⊙:√⟜±-:°√⟜:ℂ0¯÷2∩÷⟜:

# Powerset of a list
PSet ← ⍚▽⋯⇡ⁿ:2⧻⟜¤

# Rank-polymorphic fast fourier transform
RPFFT ← ⌅(⍥(⍉fft)⧻△.|⍥°(⍉fft)⧻△.)

# Rank-polymorphic convolution using fast fourier transform
FFTConvolve ← ⍥R¬↥⊃∩type(
  ∩⬚0↙⟜:-1+∩△,,  # Pad to size of final array
  ×√/×⊸△⍜∩RPFFT× # Multidimensional FFT, multiply, and normalize
)
