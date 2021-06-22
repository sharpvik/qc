# qc

QC stands for "quick calc" and it's just that -- a small binary that lets you
perform quick and simple calculations within your terminal! (In [RPN][rpn] tho...)

[rpn]: https://en.wikipedia.org/wiki/Reverse_Polish_notation

## Usage

```bash
qc 1 2 + 3 x 4 - 2 /
❯❯❯ 2.5
```

This is pretty much all it can really do.

## Install

Please, use `stack` or `cabal` to install QC like so:

```bash
git clone git@github.com:sharpvik/qc.git
cd qc
stack install # or `cabal install`
```

Both `stack` and `cabal` work since `stack` is just a convenience wrapper
around `cabal` anyway.
