; Introduction

(echo "Odd + Even = Odd? Prove it!")
(echo "Inspired by: https://www.codewars.com/kata/599d973255342a0ce400009b")
(echo "NOTE: All proofs presented here are valid if and only if every line below show `unsat`. This is due to the way that the Z3 theorem prover works.")
(echo "--------------------------------------------------------------------------------")

; Key Definitions and Assertions

(declare-const n Int) ; Let `n` be an integer
(declare-const m Int) ; Let `m` be an integer
(define-fun natural ((n Int)) Bool
  (>= n 0) ; A natural number is a non-negative integer
)
(define-fun even ((n Int)) Bool
  (= (mod n 2) 0) ; An even number is any integer wholly divisible by 2
)
(define-fun odd ((n Int)) Bool
  (not (even n)) ; An odd number is any integer that is not even
)
(assert (natural n)) ; Let the integer `n` be a natural number
(assert (natural m)) ; Let the integer `m` be a natural number

; Proof - The natural number `n` is even => Its successor `n + 1` is odd

(push)
(define-fun evenPlusOneIsOdd () Bool
  (=>
    (even n)
    (odd (+ n 1))
  )
)
(assert (not evenPlusOneIsOdd)) ; Try to find a case where even + 1 = odd is not true
(check-sat) ; If this displays `sat` then the conjecture is invalid
(pop)


; Proof - The natural number `n` is odd => Its successor `n + 1` is even

(push)
(define-fun oddPlusOneIsEven () Bool
  (=>
    (odd n)
    (even (+ n 1))
  )
)
(assert (not oddPlusOneIsEven))
(check-sat)
(pop)

; Proof - The natural numbers `n` and `m` are both even => Their sum `n + m` is even

(push)
(define-fun evenPlusEvenIsEven () Bool
  (=>
    (and (even n) (even m))
    (even (+ n m))
  )
)
(assert (not evenPlusEvenIsEven))
(check-sat)
(pop)

; Proof - `n` and `m` are both odd - Their sum `n + m` is even

(push)
(define-fun oddPlusOddIsEven () Bool
  (=>
    (and (odd n) (odd m))
    (even (+ n m))
  )
)
(assert (not oddPlusOddIsEven))
(check-sat)
(pop)

; Proof - `n` is even and `m` is odd => their sum `n + m` is odd

(push)
(define-fun evenPlusOddIsOdd () Bool
  (=>
    (and (even n) (odd m))
    (odd (+ n m))
  )
)
(assert (not evenPlusOddIsOdd))
(check-sat)
(pop)

; Proof - `n` is odd and `m` is even => their sum `n + m` is odd

(push)
(define-fun oddPlusEvenIsOdd () Bool
  (=>
    (and (odd n) (even m))
    (odd (+ n m))
  )
)
(assert (not oddPlusEvenIsOdd))
(check-sat)
(pop)

; Proof - `n` and `m` are both even => their product `n * m` is even

(push)
(define-fun evenTimesEvenIsEven () Bool
  (=>
    (and (even n) (even m))
    (even (* n m))
  )
)
(assert (not evenTimesEvenIsEven))
(check-sat)
(pop)

; Proof - `n` and `m` are both odd => their product `n * m` is odd

(push)
(define-fun oddTimesOddIsOdd () Bool
  (=>
    (and (odd n) (odd m))
    (odd (* n m))
  )
)
(assert (not oddTimesOddIsOdd))
(check-sat)
(pop)

; Proof - `n` is even and `m` is odd => their product `n * m` is even

(push)
(define-fun evenTimesOddIsEven () Bool
  (=>
    (and (even n) (odd m))
    (even (* n m))
  )
)
(assert (not evenTimesOddIsEven))
(check-sat)
(pop)

; Proof - `n` is odd and `m` is even => their product `n * m` is even

(push)
(define-fun oddTimesEvenIsEven () Bool
  (=>
    (and (odd n) (even m))
    (even (* n m))
  )
)
(assert (not oddTimesEvenIsEven))
(check-sat)
(pop)
