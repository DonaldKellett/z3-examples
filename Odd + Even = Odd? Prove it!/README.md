# Odd + Even = Odd? Prove it!

*Inspired by:* https://www.codewars.com/kata/599d973255342a0ce400009b

`proof.smt2` proves the following conjectures for all natural numbers `n` and `m` using [the Z3 Theorem Prover](https://github.com/Z3Prover/z3):

- If `n` is odd then `n + 1` must be even
- If `n` is even then `n + 1` must be odd
- If `n` and `m` are both even then `n + m` must be even
- If `n` and `m` are both odd then `n + m` must be even
- If `n` is even and `m` is odd then `n + m` must be odd
- If `n` is odd and `m` is even then `n + m` must be odd
- If `n` and `m` are both even then `n * m` must be even
- If `n` and `m` are both odd then `n * m` must be odd
- If `n` is even and `m` is odd then `n * m` must be even
- If `n` is odd and `m` is even then `n * m` must be even

It performs this proof in a manner distinct from the approach proposed by the Haskell kata linked above in Codewars, the most notable being that it requires much less "setup".  While in the Kata linked above one has to first define Peano's axioms for natural numbers, even numbers and odd numbers before any proof can be written, in the Z3 theorem prover one can take advantage of the predefined `Int` type and add a few simple constraints to them before constructing the full proof.  Also, as opposed to the Haskell kata where the conjectures are proven by compiling the code without encountering any type errors, the same thing can be achieved in the Z3 theorem prover by simply stating the conjectures and commanding Z3 to try to find a single case where the conjecture does not hold (which it fails to find if the conjecture is valid).  Therefore, it can be argued that the proof is much more straightforward in Z3 than in Haskell since the computer does most of the job automatically.

You can view the results of the proof by executing `z3 proof.smt2` in this directory - if you can see `10` `unsat`s printed to the screen in succession then all 10 conjectures mentioned above have been successfully proven to be valid.
