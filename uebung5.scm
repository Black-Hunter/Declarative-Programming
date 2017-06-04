;; Aufgabe 1
;;
;; Implementieren Sie das Intervallhalbierungsverfahren zur
;; nährungsweisen Bestimmung der Nullstellen einer Funktion!
;; Bestimmen Sie Nullstellen der Sinus-Funktion in geeigneten
;; Intervallen!

(define (bisection-method f a b tolerance)
  (define (average x y)
    (/ (+ x y) 2))
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (find-root f a b)
    (let ((mid (average a b)))
      (if (close-enough? a b)
          mid
          (let ((test-value (f mid)))
            (cond ((> test-value 0)
                   (find-root f a mid))
                  ((< test-value 0)
                   (find-root f mid b))
                  (else mid))))))
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (< a-value 0) (> b-value 0))
           (find-root f a b))
          ((and (< b-value 0) (> a-value 0))
           (find-root f b a))
          (else (display "No root in intervall!")))))

(bisection-method sin 2.0 4.0 0.001)
(bisection-method sin 2.0 4.0 0.0000001)
(bisection-method cos 2.0 4.0 0.001)