#!/bin/guile -s
!#

;; Define le funny.
(define *vowels* "aeiouy")
(define *consonant* "bcdfghjklmnpqrstvwxz")
;; Use the current time as a seed for random state.
(define *random-state* (seed->random-state (car (gettimeofday))))

;; Define a function to get a letter to get a more "functional" feel.
(define (get-letter)
  (if (= (random 2 *random-state*) 0)
      (array-ref *vowels* (random 5 *random-state*))
      (array-ref *consonant* (random 19 *random-state*))))

(define (gen-nick)
  (let ((limit (+ (random 6 *random-state*) 3)))
    (do ((count 0 (1+ count))
         (out "" (string-append out (string (get-letter)))))
        ((= count limit) out))))

;; Get n amount of nicks
(define (get-nnicks n)
  (do ((count 0 (1+ count))
       (output '() (append (list (gen-nick)) output)))
      ((= count n) output)))

;; Get 40 nicks, for standalone execution.
(get-nnicks 40)
