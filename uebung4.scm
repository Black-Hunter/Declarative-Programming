(define exercise
  (let ((num 0))
    (lambda ()
      (begin (set! num (+ num 1))
             (newline)
             (display "Aufgabe ") (display num)
             (newline)))))

;; Aufgabe 1
;;
;; Schreiben Sie ein Prädikat, dass für eine gegebene Zahl
;; entscheidet, ob es eine Primzahl ist. Benutzen Sie dabei ein
;; geeignet definiertes Prädikat divides?, welches auf Teilbarkeit
;; testet!
(exercise)

(define (divides? n k)
  (= (remainder n k) 0))

(define (prime? n)
  (define (prime-test n i)
    (cond ((> i (sqrt n)) #t)
          ((divides? n i) #f)
          (else (prime-test n (+ i 2)))))
  (cond ((= n 2) #t)
        ((or (< n 2) (divides? n 2)) #f)
        (else (prime-test n 3))))

;; Aufgabe 2
;;
;; Gegeben sei die folgende Prodzedur compose, die die Komposition
;; zweier Funktionen realisiert. Außerdem sehen Sie Beispiele für die
;; Benutzung von compose. Definieren Sie eine Prozedur, die die
;; n-fache Anwendung einer Funktion mittels compose realisiert.
;; Berechnen Sie damit die 20- sowie 100-fache Anwendung der Wurzel
;; von 2! Implementieren Sie dies Summe zweier natürlicher Zahlen n+m
;; durch m-fache Anwendung des Inkrements auf n!
(exercise)

(define (compose f g)
  (lambda (x)
    (f (g x))))

((compose log exp) 2)
((compose sqrt (lambda (x) (expt x 2))) 9)

(define (repeated f n)
  (if (= 1 n) f
      (compose f (repeated f (- n 1)))))

((repeated sqrt 20) 2)
((repeated sqrt 100) 2)

(define (plus n m)
  ((repeated (lambda (k) (+ k 1)) m) n))

(plus 13 14)

;; Aufgabe 3
;;
;; Schreiben Sie eine Prozedur, die die Summe einer Funktion f(k) von
;; k=a bis k=b berechnet! Benutzen Sie diese Prozedur, um Pi mit der
;; Leibniz-Reihe zu berechnen!
(exercise)

(define (sum f a b)
  (define (sum-it f a b s)
    (if (> a b) s
        (sum-it f (+ a 1) b (+ s (f a)))))
  (sum-it f a b 0))

(define pi (* 4
              (sum (lambda (k) (/ (expt -1 k)
                                  (+ (* 2 k) 1.0)))
                   0 1000)))

pi