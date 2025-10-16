# uiua-math
`uiua-math` is a library of mathematical functions for the [Uiua](https://uiua.org) programming language.

The library requires `# Experimental!` due to internal usage of experimental stack manipulation modifiers.

Import the whole lib
```uiua
Math ~ "git: github.com/Omnikar/uiua-math"
```
or import select functions
```uiua
~ "git: github.com/Omnikar/uiua-math" ~ QRot Qqp RQuat
```

Feel free to PR

Functions list (see in-code documentation for more detail)
| Function | Description     |
|----------|-----------------|
| `Mean`   | Arithmetic mean |
| `GMean` | Geometric mean |
| `HMean` | Harmonic mean |
| `QMean` | Quadratic mean |
| `Median` | Median |
| `Var` | Variance |
| `Stdev` | Standard deviation |
| `Sin` | Sine |
| `Cos` | Cosine |
| `Tan` | Tangent |
| `Csc` | Cosecant |
| `Sec` | Secant |
| `Cot` | Cotangent |
| `Sinh` | Hyperbolic sine |
| `Cosh` | Hyperbolic cosine |
| `Tanh` | Hyperbolic tangent |
| `Csch` | Hyperbolic cosecant |
| `Sech` | Hyperbolic secant |
| `Coth` | Hyperbolic cotangent |
| `MDet` | Matrix determinant |
| `Mgje` | Matrix Gauss-Jordan Elimination |
| `MCof` | Matrix cofactors |
| `MInv` | Matrix inverse |
| `Dot` | Dot product |
| `Cross` | Cross product |
| `Mmp` | Matrix product |
| `Mvp` | Matrix-vector product |
| `Mpow` | Matrix power |
| `Qqp` | Quaternion product |
| `RQuat` | Create 3D rotation quaternions |
| `QRot` | Rotate a 3D vector array using a quaternion array |
| `Fact` | Pervasive factorial |
| `Gamma` | Gamma function |
| `GCD` | Greatest common divisor |
| `LCM` | Least common multiple |
| `Base` | Encode an array of numbers into digits of a given base |
| `ModInv` | Inverse of N modulo M |
| `ModOrd` | Multiplicative order of N modulo M |
| `CFrac` | Convert a number X to a continued fraction to N terms |
| `Divisors` | Divisors of N (including 1 and N) |
| `Erf` | Error function |
| `DistRand` | Seeded random indices from a distribution array |
| `BoxMuller` | Box-muller transform: generate pairs of normally distributed values given pairs of uniformly distributed values |
| `Gaussian` | Generate a 2 dimensional square Gaussian kernel |
| `BinomPmf` | Binomial distribution |
| `BinomCmf` | Cumulative binomial distribution |
| `GeomPmf` | Geometric distribution (0-indexed) |
| `GeomCmf` | Cumulative geometric distribution (0-indexed) |
| `PoissonPmf` | Poisson distribution |
| `PoissonCmf` | Cumulative Poisson distribution |
| `NormalPdf` | Normal distribution |
| `NormalCdf` | Cumulative normal distribution |
| `Quad` | Po-Shen quadratic solver |
| `PSet` | Powerset of a list |
| `FFTConvolve` | Rank-polymorphic convolution using fast fourier transform |
