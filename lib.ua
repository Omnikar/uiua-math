# Experimental!
# Various math functions

# Extract real
R ↚ ◌°ℂ

# Flip
F ← ˜∘

# -- Averages --

# Arithmetic mean
Mean ← ÷⧻⟜/+
# Geometric mean
GMean ← ⁿ˜÷1⧻⟜/×
# Harmonic mean
HMean ← ÷/+⟜⧻˜÷1
# Quadratic mean
QMean ← √÷⧻⟜/+˙×
# Median
# TODO: O(n) median algorithm?
Median ← ÷2/+⊏⊟⊃⌊⌈÷2-1⊸⧻⍆

# Variance
Var ← -˙×∩÷∩⊃⧻/+⟜˙×
# Standard deviation
Stdev ← √Var

# -- Trigonometry --

# Sine
Sin ← ∿
# Cosine
Cos ← ∿˜-η
# Tangent
Tan ← ⌅(÷°∠|∠⊙1)

# Cosecant
Csc ← ⨪Sin
# Secant
Sec ← ⨪Cos
# Cotangent
Cot ← Tan˜-η

# Hyperbolic Sine
Sinh ← ⌅(÷₂-∩ₑ⊸¯|°ₑ+⟜⍜˙×+₁)
# Hyperbolic Cosine
Cosh ← ⌅(÷₂+∩ₑ⊸¯|°ₑ+⟜⍜˙×-₁)
# Hyperbolic Tangent
Tanh ← ⌅(÷⊃+-1ₑ×₂|÷₂°ₑ÷˜⊃-+1)

# Hyperbolic Cosecant
Csch ← ⨪Sinh
# Hyperbolic Secant
Sech ← ⨪Cosh
# Hyperbolic Cotangent
Coth ← ⨪Tanh

┌─╴test
  # Inverse functions have standard ranges
  ⍤⤙≍ ¯η_0_η °Sin ¯1_0_1
  ⍤⤙≍ 0_¯η_η_0 °Csc ¯∞_¯1_1_∞
  ⍤⤙≍ π_η_0 °Cos ¯1_0_1
  ⍤⤙≍ η_π_0_η °Sec ¯∞_¯1_1_∞
  ⍤⤙≍ ¯η_¯η/2_0_η/2_η °Tan ¯∞_¯1_0_1_∞
  ⍤⤙≍ π_3η/2_η_η/2_0 °Cot ¯∞_¯1_0_1_∞

  ˙⍤ /×=1 ⁅₅ -∩˙×⊃Sinh Cosh ×2-⊸¬÷⟜⇡10 # Pythagorean Identity

  ⍤⤙≍ ¯0.88137_0.88137 ⁅₅ °Csch ¯1_1
  ⍤⤙≍ ∞_1.31696_0 ⁅₅ °Sech 0_1/2_1
  ⍤⤙≍ ¯0.54931_¯∞_∞_0.54931 ⁅₅ °Coth ¯2_¯1_1_2
└─╴

# -- Matrices/Vectors --

# ? SwappedRows Pivot
GaussEliminate‼ ↚ ∧(
  ⊢⍖⊸⌵⍜⊙↙×0⟜⊡⤚⊸⊙⍉
  ⍜⊏⇌ ⊃⊙⊙∘^0 ⊟⤙⊙⊙∘ ⊙(⊃⋅⊙∘^1 ˙⍤≥ε⊸⌵) ⟜⊡
  ⊸⍜⊡(÷˜⊸⊡)⊸F
  ⍜(°⊂↻|˜⊙-˜⊸⊞×⊙(⊡⤚˜⊙⍉))⊸F
)°⊏

# Matrix Determinant
MDet ← ◌⍣GaussEliminate‼(⍥¯∪∪/≠)∪∪× ⊙0⊙1

# Perform Gauss-Jordan elimination
Mgje ← ⊏⍏˜⨂1>1e¯12⊸⌵ ⍥(
  ↻₁⍣(⍜⊙⊢÷⟜(-⊞×⊙⊸⊢⊂0÷)°⊂⊸≡⊏⊢)◌⊚>1e¯12⌵⊸⊢
)⊸⧻
# Mgje ← ⍣GaussEliminate‼(|)(⍤"Elimination cannot be completed"0)

# Matrix Inverse
MInv ← |1 ⌅(⍜⍉(↘÷2⊸⧻) ⍣Mgje(⍤"Matrix has no inverse"0) ˜≡⊂˙⊞=°⊏|MInv)

┌─╴test
  ⍤⤙≍ 5 ⁅₃ MDet [1_¯3_¯1 1_¯1_¯2 1_0_0]
  ⍤⤙≍ [0_0_1 ¯0.4_0.2_0.2 0.2_¯0.6_0.4] ⁅₃ MInv [1_¯3_¯1 1_¯1_¯2 1_0_0]
  ⍤⤙≍ ˙⊞=⇡3 ⁅₃ Mgje [1_¯3_¯1 1_¯1_¯2 1_0_0]

  # FIXME: These tests have been temporarily commented due to a bug
  #        causing values used in the tests to persist afterward.
  # Mgje [1_5_5
  #       4_5_¯10]
  # ⍤⤙≍ [1_0_¯5
  #      0_1_2]

  # ⁅₉ Mgje [3_¯1_10
  #          ¯2_4_5
  #          1_1_8]
  # ⍤⤙≍ [1_0_4.5
  #      0_1_3.5
  #      0_0_0]

  # ⁅₉ Mgje [0_0_2_¯4_¯5
  #          0_1_¯1_1_3
  #          0_6_0_¯6_5]
  # ⍤⤙≍ [0_1_0_¯1_0
  #      0_0_1_¯2_0
  #      0_0_0_0_1]
└─╴

MSquarify ↚ ⍜△[⟜∘√⊢]
# Matrix Cofactors
MCof ← ⍥¯˙⊞≠◿2°⊏MSquarify≡(MDet MSquarify≡⊡⊙¤⊚¬⊞↥°⊟)⊙¤⬚0≡₀°⊚⊚⊸⊸=

# Dot product
Dot ← /+×
# Cross product
Cross ← ↻2-∩(×↻2)◡F
# Matrix product
#
# Computes AB
# ? A B
Mmp ← |2 ⌅(⊞Dot⊙⍉|◌⍜≡⊂Mgje)
# Matrix-vector product
#
# Computes MV where V is represented as a 1D list of numbers
# ? M V
Mvp ← |2 ⌅(Dot⍉|♭◌⍜≡⊂Mgje)
# Matrix power
# ? P M
Mpow ← ◌⍥⟜Mmp⊙(F˙⊞=°⊏)
# TODO: Change to this if it comes to work with negative powers
# Mpow ← ⍥⟜Mmp⊙(˙⊞=°⊏)

┌─╴test
  ⍤⤙≍ [3_7 ¯6_2] ⌝Mmp [1_0 0_1] [3_7 ¯6_2]
  ⍤⤙≍ [1_0 0_1] ⁅ ˙⌝Mmp [1_2 3_4]
  ⍤⤙≍ 3 ⁅ MDet [5_6 2_3]

  ⍤⤙≍ [¯8 5 ¯3 2 ¯1 1 0 1 1 2 3 5 8] ≡(⊢♭Mpow) ⍜-⇡¯7 6 ¤ [1_1 1_0]
└─╴

QqpMask ↚ [1_2_3_4
           2_¯1_4_¯3
           3_¯4_¯1_2
           4_3_¯2_¯1]
# Quaternion product
#
# Computes PQ for quaternion arrays P and Q.
#
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
#
# Expects an angle array θ and a unit vector axis array U.
#
# Semi-pervasive; the unit vector array must have one extra trailing
# axis compared to the angle array, and that axis must be length 3.
#
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
RQuat ← ⍜⊙°⍉⊂˜⊙×°∠÷2
# Quaternion rotation implementation
QRotImpl ↚ ⍜⊙°⍉↘1 Qqp Qqp ⟜⍜∩°⍉(˜⬚0↙₋₄⍜↘¯ 1)
# Rotate a 3D vector array using a quaternion array.
#
# To create rotation quaternions to use with `QRot`, see `RQuat`.
#
# Expects a quaternion array Q and a 3D vector array V.
#
# Semi-pervasive; the input arrays should have matching shapes aside
# from the final axis, which should be of lengths 4 and 3 respectively.
#
# For each quaternion-vector pair, computes Q * V * Q'.
# ```uiua
# RQuat η 0_0_1        # Create a rotation by η radians about 0_0_1
# QRot ¤:[3_2_0 1_3_2] # Use the quaternion to rotate 3_2_0 and 1_3_2
# ```
# `QRot` can be used with ⍜ to undo the rotations afterward.
# ? Q V
QRot ← ⌅(QRotImpl|QRotImpl⍜(↘1°⍉)¯)

┌─╴test
  ⍤⤙≍ [¯48_6_6_12 ¯120_24_60_48] Qqp [1_2_3_4 2_4_6_8] [1_3_5_7 5_6_7_8]
  ⍤⤙≍ [¯2_3_0 ¯3_1_2] ⁅ QRot ¤ ⊙[3_2_0 1_3_2] RQuat η 0_0_1
└─╴

# -- Number theory --

# Pervasive factorial
Fact ← /×°⍉+1⬚0≡₀⇡

┌─╴test
  ⍤⤙≍ [1 1 2 6 24 120 720 5040] Fact [0 1 2 3 4 5 6 7]
└─╴

# Gamma function
# Γ(z)
Gamma ← (
  -1/2 ⟜(
    -1
    # From https://en.wikipedia.org/wiki/Lanczos_approximation
    °⊏[
      0.9999999999999999
      1975.3739023578853
      ¯4397.382392792243
      3462.6328459862716
      ¯1156.9851431631168
      154.53815050252774
      ¯6.253671612368916
      0.034642762454736804
      ¯7.477617197444297e¯7
      6.304125382185226e¯8
      ¯2.7405717035683877e¯8
      4.048694881756761e¯9
    ]
    /+÷⍜⊢⋅1≡+⊙˜¤
  )
  ××× √τ ₑ¯ ⤙ⁿ ⤙+ 8 # g
)

┌─╴test
  ⍤⤙(<1e¯10 ⌵-) √π Gamma 1/2
  ⍤⤙(<1e¯10 ⌵-) 24 Gamma 5
  ⍤⤙(<1e¯10 ⌵-) ℂ¯0.09161772311294437 0.024480267015440246 Gamma ˙ℂ¯√2
└─╴

# Greatest common divisor
# 
# Ignores sign
GCD ← ◌⍢⤚◿±⌵
# Least common multiple
# 
# Ignores sign
LCM ← ⌵÷⊃GCD×

┌─╴test
  ⍤⤙≍ 6 GCD 18 24
  ⍤⤙≍ 24 LCM 8 12
└─╴

# Encode an array of numbers into digits of a given base
# 
# Analogous to `⋯` for base 2; the least significant digit is first.
# 
# `Base` allows multiple bases as input.
# ```uiua
# # Encodes 6 in base 2, 7 in base 3, 8 in base 4, and 9 in base 5.
# Base [2_3 4_5] [6_7 8_9]
# ## ╭─
# ## ╷ 0 1 1
# ## ╷ 1 2 0
# ##
# ##   0 2 0
# ##   4 1 0
# ##         ╯
# ```
# 
# You can use `⌝Base` to decode from a base/bases.
# ```uiua
# # Decodes 6 in base 2, 7 in base 3, 8 in base 4, and 9 in base 5.
# ⌝Base [2_3 4_5] [[0_1_1 1_2_0] [0_2_0 4_1_0]]
# ## ╭─
# ## ╷ 6 7
# ##   8 9
# ##       ╯
# ```
Base ← ⌅(
  ⍉◌∧⊃◿(⊂¤⌊÷)ⁿ⊙¤⇌⇡/↥♭+1⌊⊃⌝˜ⁿ⊙⊙[]
| /+×ⁿ⊙¤⇡◡⋅⧻⊙°⍉)

┌─╴test
  ⍤⤙≍ [[2_2 1_0][3_1 1_1]] Base 5 [12_1 8_6]
  ⍤⤙≍ [[0_1_1 1_2_0][0_2_0 4_1_0]] Base [2_3 4_5] [6_7 8_9]
  ⍤⤙≍ [12_1 8_6] ⌝Base 5 [[2_2 1_0][3_1 1_1]]
  ⍤⤙≍ [6_7 8_9] ⌝Base [2_3 4_5] [[0_1_1 1_2_0][0_2_0 4_1_0]]
└─╴

# Inverse of N modulo M (M if nonexistent)
# ? N M
ModInv ← ˜⨂1˜◿×◡⋅⇡
# Multiplicative order of N modulo M
# ? N M
ModOrd ← ⊡1⊚=1˜◿ⁿ◡⋅⇡

┌─╴test
  ⍤⤙≍ 2 ModInv 4 7
└─╴

# Convert a number X to a continued fraction to N terms.
# 
# Use `°CFrac` to convert to a number from a continued fraction.
# ? N X
CFrac ← ⌅(⍥⊃(÷⤚◿1)⌊|⊃⧻/(+˜÷1)⇌)

┌─╴test
  ⍤⤙≍ [3 7 15 1 292 1 1 1] CFrac 8 π
  ⍤⤙≍ e ◌°CFrac CFrac 100 e
└─╴

# Divisors of N (including 1 and N)
# The values are in increasing order and distinct.
# ? N
Divisors ← ◌°▽⊂⊃÷⇌ ▽=0⊸⊃◿÷ +1⇡⌊⊸√

┌─╴test
  ⍤⤙≍ [1] Divisors 1
  ⍤⤙≍ [1 2 3 4 6 9 12 18 36] Divisors 36
  ⍤⤙≍ [1 2 4 5 8 10 20 25 40 50 100 125 200 250 500 1000] Divisors 1000
└─╴

# -- Probability --

# Error function
Erf ← (
  # From https://www.johndcook.com/blog/cpp_erf
  ˜÷1+1×0.3275911 ⟜(˜ⁿe¯˙×) ⌵⟜±
  ⊙[1.061405429 ¯1.453152027 1.421413741
    ¯0.284496736 0.254829592
  ]⊙0
  ×¬×∧(×⊙+)¤
)

┌─╴test
  ⍤⤙≍ 0 Erf 0
  ⍤⤙≍ 1 Erf 1000
  ⍤⤙≍ ¯1 Erf ¯1000
  ⍤⤙(<1e¯6⌵-) 0.5204998778130465 Erf 0.5
  ⍤⤙(<1e¯6⌵-) ¯0.5204998778130465 Erf ¯0.5
└─╴

# Seeded random indices from a distribution array
# 
# Given a seed, a shape, and a probability distribution array
# of any rank containing positive numbers, `DistRand` normalizes
# the distribution if necessary so it sums to 1, then returns
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
DistRand ← ˜⍜♭≡(⊢⊚>)⊓¤gen⍜♭\+÷/+⊸♭

# Box-Muller transform
# 
# Converts uniformly distributed pairs of input values to
# standard normally distributed pairs of output values
BoxMuller ← ∩×⤙⊓°∠∘×τF√×¯2°ₑ¬

# Generate a 2 dimensional square Gaussian kernel
# ? Size StandardDeviation
Gaussian ← ÷/+⊸♭ₑ¯÷2˙×˜÷⌵˙⊞ℂ-÷2-1⟜⇡

# Binomial distribution
# 
# Probability that n Bernoulli trials each with success probability p will amount to X successes
# ? p n X
BinomPmf ← ××⊃(≡₀⧅>|˜⋅ⁿ|ⁿ⊓-¬) ⤚⋅F
# Cumulative binomial distribution
# 
# Probability that n Bernoulli trials each with success probability p will amount to X or fewer successes
# 
# **NOTE:** This function only accepts scalars for X. Use `each` or `rows` if multiple X values are desired
# ? p n X
BinomCmf ← /+BinomPmf⊓∩¤(⇡+1)

# Geometric distribution
# 
# Probability of X failures before the first success of repeated trials with success probability p
# ? p X
GeomPmf ← ×⟜(˜ⁿ¬)
# Cumulative geometric distribution
# 
# Probability of X or fewer failures before the first success of repeated trials with success probability p
# ? p X
GeomCmf ← ⍜¬˜ⁿ⊙(+1)

# Poisson distribution
# 
# Probability of X occurrences of an unlikely event over many trials with expected value λ
# ? λ X
PoissonPmf ← ÷⊙×⊃(⋅Fact|˜ⁿ|ₑ¯)
# Cumulative Poisson distribution
# 
# Probability of X or fewer occurrences of an unlikely event over many trials with expected value λ
# ? λ X
PoissonCmf ← /+PoissonPmf⊓¤(⇡+1)

# Normal distribution
# 
# Probability density of a gaussian/bell curve with mean μ and standard deviation σ
# ? σ μ X
NormalPdf ← ÷⊃(×√τ|ₑ÷2¯˙×÷⊙-)
# Cumulative normal distribution
# 
# Probability that a normally distributed random variable with mean μ and standard deviation σ is less than X
# ? σ μ X
NormalCdf ← ÷2+1Erf÷×√2⊙-

# -- Misc --

# Po-Shen quadratic solver
# 
# Returns roots as a list
# 
# Outputs complex-typed numbers only if the roots are complex
# ? A B C
Quad ← ⍥R⌵˜↥₀⊟⊃-+⊙F√⟜±˜-˙×⟜Fℂ₀¯÷₂∩⌞÷

┌─╴test
  ⍤⤙≍ [1 2] Quad 1 ¯3 2
  ⍤⤙≍ [¯i i] Quad 1 0 1
  ⍤⤙≍ ∩⍆ [ℂ3 ¯1 ℂ¯1 2] ⁅₃ Quad 1 ℂ¯2 ¯1 ℂ7 1
└─╴

# Powerset of a list
PSet ← ⍚▽⋯⇡˜ⁿ2⧻⟜¤

# Rank-polymorphic convolution using fast fourier transform
┌─╴FFTConvolve
  # Full convolution wherever any overlap between the inputs exists
  Full ← ⍥R=0↥⊃∩type(×√/×⊸△⍜∩fft×∩⌞⬚0↙-1+◡∩△)
  Call ← Full
  # Convolution of only instances of complete overlap between inputs
  Valid ← ⍥R=0↥⊃∩type(↘-+1⌵⊙⟜(×√/×⊸△⍜∩fft×∩⌞⬚0↙)⊃-↥◡∩△)
  # Convolution that maintains the largest of the input dimensions
  Same ← ↙⟜(↻⌊÷₂-)⊙⊸△↥⊃∩△Full
  # Wrapping convolution producing the same shape as the largest input
  Wrap ← ⍥R=0↥⊃∩type(×√/×⊸△⍜∩fft×∩⌞⬚0↙↥◡∩△)
└─╴

# Configuration parameters for the Ode‼ macro
~OdeConfig {
  # Error bound
  ε ← 1e¯8
  # Initial step size
  H ← 0.01
  # Minimum step size
  HMin ← 1e¯10
  # Maximum step size
  HMax ← 1
}

A‼ ↚^ $"∩_(_)"+@₀⬚0⍜⧻↥₁⇌⊥10↥0-2⊢˜⊓⊢⊏₁
B‼ ↚^ $"∩_(_)"+@₀⬚0⍜⧻↥₁⇌⊥10⊢˜⊓⊢⊏₁
C‼ ↚^ $"∩_(_)"+@₀⬚0⍜⧻↥₁⇌⊥10-1⊢˜⊓⊢⊏₁

OdeImpl‼ ↚ (
  # Runge-Kutta-Fehlberg 4th-5th-order variable-step-size numerical integrator
  # From https://math.okstate.edu/people/yqwang/teaching/math4513_fall11/Notes/rungekutta.pdf
  ⟜⊓⊃⋅⊙∘OdeConfig!(↥⊙↧⊃HMin⊃HMax H)⊓A‼^0∘∩[]
  ⍢⟜(
    ⊙(◡(⊙⊓¤⊙⊓A‼^0¤[]
        {[0]
         [1/4 1/4]
         [3/8 3/32 9/32]
         [12/13 1932/2197 ¯7200/2197 7296/2197]
         [1 439/216 ¯8 3680/513 ¯845/4104]
         [1/2 ¯8/27 2 ¯3544/2565 1859/4104 ¯11/40]}
      
        ⊃∧◇(
          ˜⊂¤×⊸⊃⋅⋅⋅∘(
            ⊃⋅◌^0˜∩+⊙/+∪₂⌟˜∩×⊙∘°⊂⊙⊙⊙⊙⤙⊓A‼^0∘◌
          )
        )⋅⋅⋅∘
      
        [[25/216 0 1408/2565 2197/4104 ¯1/5 0]
         [16/135 0 6656/12825 28561/56430 ¯9/50 2/55]]
        ⊃(˜÷⍜°√/+♭/-)⊣ ≡/+×⌟
      ))
  
    ⊙⊙⊙⊙⊙⊙⤙₂⊓A‼^0∘⋅◌
    ⟜(∪⌞⊙∘×⊃(
        ×0.84√₄˜÷OdeConfig~ε
      | ⊙⋅◌↥◡OdeConfig!⊃(≤ε|∪∪∪∪≤HMin)
        ⨬◌⊃(˜∘⊸˜∩+|∪₂˜∩˜⊂⋅⊙¤)))
    ∪₂⌞⊙∘(↥⊙↧) OdeConfig!⊃HMin HMax
    ⊙⊙⊙⤚₂⋅⋅A‼^0∘
  )(⊙⊙⊙⊙⤙⊙⊙◌^1◡⋅B‼^1∘⊙⊙⊙⤚⋅⊙∘)
  ˜∩˜⊂⊙¤⋅⊙⊙⋅A‼^0◌
)

# More configurable version of `Ode‼`
# 
# The first of the three functions can be used to set optional arguments:
# - `ε` - error bound
# - `HMin` - minimum step size
# - `HMax` - maximum step size
# - `H` - initial step size
# The remaining two functions correspond to those of `Ode‼`.
# 
# Example: Changing simulation precision
# This sets the simulation precision threshold to a larger value (meaning less precision, with a cheaper simulation).
# ```uiua
# g ← 9.81 # Gravity
# L ← 1    # Pendulum length
# μ ← 0.5  # Damping coefficient
# 
# [0 12] # Initial position of 0 and velocity of 12
# 0      # Initial time of 0
# Ode‼!(°⊸ε 1e¯3|⋅⊃[⊣|¯+˜∩×g μ÷L∿°⊟]|<10)
# ```
# T X ? T₀ X₀
Ode‼! ← OdeImpl‼^1^2 OdeConfig!(^0($"_New"˜▽@⊙-1⊢⋅⊢)^!^0)

# Numerical integrator
# 
# Takes two functions and two values.
# - The first function should take a time value and a state vector and output the derivative of the state vector.
# - The second function should take anywhere from 1 to 4 arguments and return 0 or 1 for whether to continue simulating. Based on how many inputs the second function takes, it will be passed:
#   1. The current time
#   2. The current state vector
#   3. The array of all past times
#   4. The array of all past state vectors
# 
# The two values should respectively be the initial time and the initial state vector.
# 
# Example: Simulating a damped pendulum
# This simulates the motion of a damped pendulum that begins vertical with an initial angular velocity of 12 radians per second.
# ```uiua
# g ← 9.81 # Gravity
# L ← 1    # Pendulum length
# μ ← 0.5  # Damping coefficient
# 
# [0 12] # Initial position of 0 and velocity of 12
# 0      # Initial time of 0
# Ode‼(⋅⊃[⊣|¯+˜∩×g μ÷L∿°⊟]|<10)
# ```
# 
# Uses Runge-Kutta-Fehlberg 4th-5th-order variable-step-size numerical integration.
# T X ? T₀ X₀
Ode‼ ← Ode‼!∘^0^1

# More configurable version of `OdeT!`
# 
# The first of the two functions can be used to set optional arguments:
# - `ε` - error bound
# - `HMin` - minimum step size
# - `HMax` - maximum step size
# - `H` - initial step size
# The remaining function corresponds to that of `OdeT!`.
# 
# Example: Simulating a damped pendulum
# This sets the simulation precision threshold to a larger value (meaning less precision, with a cheaper simulation).
# ```uiua
# g ← 9.81 # Gravity
# L ← 1    # Pendulum length
# μ ← 0.5  # Damping coefficient
# 
# [0 12]  # Initial position of 0 and velocity of 12
# ⍜×⇡5 10 # Time from 0 to 10 at 5 samples per second
# OdeT‼(°⊸ε 1e¯3|⋅⊃[⊣|¯+˜∩×g μ÷L∿°⊟])
# ```
# X ? T X₀
OdeT‼ ← (
  OdeConfig!⊃⊓C‼^0◌∘(
    ⤙⊓C‼^0∘◌⊓C‼^0∘⊃(/↥|/↧⧈-⍆|/↧)
    ⬚∘Ode‼!(^0⊓C‼^0∘°⊸HMax|^1|<°◌)
  )
  ⟜(⤚⊏⊙⧈⊟-₁˜⨂1⊸>⌟)
  ˜÷˜-⊙≡⊃⊢/-
  ⊙(⍜⊙-×|°⊟⤸₁⊏|⧈⊟)
)

# Numerical integrator
# 
# Takes a function and two values.
# The function should take a time value and a state vector and output the derivative of the state vector.
# The two values should be as follows:
# 1. A list of all times to output samples at
# 2. The initial state vector, interpreted to be the state at time equal to the smallest value in the time value list
# 
# Example: Simulating a damped pendulum
# This simulates the motion of a damped pendulum that begins vertical with an initial angular velocity of 12 radians per second.
# ```uiua
# g ← 9.81 # Gravity
# L ← 1    # Pendulum length
# μ ← 0.5  # Damping coefficient
# 
# [0 12]  # Initial position of 0 and velocity of 12
# ⍜×⇡5 10 # Time from 0 to 10 at 5 samples per second
# OdeT!⋅⊃[⊣|¯+˜∩×g μ÷L∿°⊟]
# ```
# 
# Uses Runge-Kutta-Fehlberg 4th-5th-order variable-step-size numerical integration.
# X ? T X₀
OdeT! ← OdeT‼∘^
