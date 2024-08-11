# uiua-math
`uiua-math` is a library of mathematical functions for the [Uiua](https://uiua.org) programming language.

The library requires `# Experimental!` due to usage of the `fft` function (for `RPFFT` and `FFTConvolve`) and internal usage of the stack manipulation modifiers `⤙ but` and `⤚ with`.

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
| `GCD` | Greatest common divisor |
| `LCM` | Least common multiple |
| `BaseEnc` | Encode an array of numbers into digits of a given base |
| `BaseDec` | Decode an array of encoded lists of digits of a given base |
| `ModInv` | Inverse of N modulo M |
| `ModOrd` | Multiplicative order of N modulo M |
| `Binom` | Binomial coefficient aka N choose K |
| `CFrac` | Convert a number X to a continued fraction to N terms |
| `Erf` | Error function |
| `DistRand` | Seeded random index from a distribution array |
| `BoxMuller` | Box-muller transform |
| `Gaussian` | Generate a 2 dimensional square Gaussian kernel |
| `Perms` | Permutations of N items |
| `Quad` | Po-Shen quadratic solver |
| `PSet` | Powerset of a list |
| `RPFFT` | Rank-polymorphic fast fourier transform |
| `FFTConvolve` | Rank-polymorphic convolution using fast fourier transform |
