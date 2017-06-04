;; Aufgabe 1:
;;
;; Schreiben Sie zwei Ausdrücke, die den Umfang und den Flächeninhalt
;; eines Kreises mit Durchmesser von 10 berechnen! Definieren Sie dafür
;; vorher Pi!

(define pi (* 2 (asin 1)))
(* pi 10)
(* (/ pi 4) (* 10 10))

;; Aufgabe 2:
;;
;; Benutzen Sie verschachtelte car und cdr, um das Literal 3 aus der
;; Liste '(0 1 (2 3) 4) zu extrahieren! Verwenden Sie anschließend die
;; abkürzende Schreibweise cxxxxr für das selbe Ergebnis! Hinweis:
;; Die abkürzende Schreibweise existiert nur bis zur Länge 4.

(car (cdr (car (cdr (cdr '(0 1 (2 3) 4))))))
(car (cdaddr '(0 1 (2 3) 4)))

;; Aufgabe 3:
;;
;; Schreiben Sie eine Prozedur lsquare, die für eine Liste von Zahlen
;; eine Liste der Quadrate dieser Zahlen zurück gibt!  Beispielsweise
;; soll (lsquare '(1 2 3 4)) zu (1 4 9 16) ausgewertet werden.

(define (square x) (* x x))

(define (lsquare l)
  (if (null? l)
      '()
      (cons (* (car l) (car l))
            (lsquare (cdr l)))))

(lsquare '(1 2 3 4))

