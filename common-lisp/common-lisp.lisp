;;; Much needed.
(defvar *vowels* "aeiouy")
(defvar *consonants* "bcdfghjklmnpqrstvwxz")

;;; Define something similar to the get-letter in scheme.
(defun get-letter ()
  (if (= 0 (random 2))
      (aref *vowels* (random 6))
      (aref *consonants* (random 19))))

;;; Gen-nick.
(defun gen-nick ()
  (let ((output (make-array 10 :element-type 'character :fill-pointer 0 :adjustable t)))
    (loop
      for count from 0 to (+ (random 6) 3)
      do (vector-push (get-letter) output))
    output))

;;; Get n amount of nicknames.
(defun gen-nnicks (n)
  (loop for count from 0 to n
        collect (gen-nick)))

(gen-nnicks 30)
