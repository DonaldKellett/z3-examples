# A + B = B + A? Prove it!

*Inspired by:* https://www.codewars.com/kata/59db393bc1596bd2b700007f

`proof.smt2` proves that the following conjecture is valid: for all natural numbers `A` and `B`, `A + B = B + A`.  It does this by failing to find a single case where `A + B != B + A` where `A` and `B` are natural numbers.

## Comparison to the Haskell proof linked above

As opposed to `proof.smt2` in this directory, the Haskell version of the proof requires defining Peano's axioms for natural numbers which is relatively cumbersome.  Furthermore, the programmer is required to define the `symmetric`, `reflexive` and `transitive` properties of natural numbers and utilize them in the main proof `plusCommutes` in such a way that the entire program successfully type-checks.  All of this is not required and thus is made much more straightforward using the Z3 theorem prover.

On another note, as of 26/12/2017, even after constructing this proof (of commutativity of addition of natural numbers) using the Z3 theorem prover, I still haven't been able to solve the Kata linked above in Haskell :wink:
