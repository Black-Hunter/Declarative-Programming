(define exercise
  (let ((num 0))
  (lambda ()
    (begin (set! num (+ num 1))
           (newline)
           (display "Aufgabe ") (display num)
           (newline)))))
    
;; Aufgabe 1:
;;
;; Ändern Sie lsquare aus der letzten Übung so ab, dass es auch auf
;; verschachtelten Listen operiert (man spricht dann auch von "tiefer
;; Anwendung")! Z.B. soll (lsquare-deep '(1 2 (3 (4 5)) 6)) die Liste
;; (1 4 (9 (16 25)) 36) liefern.
;;
;; Zusatzaufgabe: Schreiben Sie eine Prozedur flatten, die eine
;; verschachtelte Liste in eine flache Liste umwandelt!
(exercise)

(define (lsquare-deep l) 
  (define (lsquare-it l acc)
    (if (null? l)
        acc
        (lsquare-it (cdr l)
                    (append acc (if (list? (car l))
                                    (list (lsquare-deep (car l)))
                                    (list (* (car l) (car l))))))))
  (lsquare-it l '()))

(lsquare-deep '(1 2 (3 (4 5)) 6))

(define (flatten l)
  (define (flatten-it l acc)
    (if (null? l) acc
        (flatten-it (cdr l) (append acc
                                    (if (list? (car l))
                                            (flatten (car l))
                                            (list (car l)))))))
  (flatten-it l '()))
                             
(flatten (lsquare-deep '(1 2 (3 (4 5)) 6)))

;; Aufgabe 2:
;;
;; Schreiben Sie eine Prozedur, die die Elemente einer Liste
;; aufsummiert!
(exercise)

(define (lsum l)
  (define (lsum-it l s)
    (if (null? l) s
        (lsum-it (cdr l) (+ (car l) s))))
  (lsum-it l 0))

(lsum '(1 2 3 4 5))

;; Aufgabe 3:
;;
;; Türme von Hanoi: Implementieren Sie eine Lösung der Türme von Hanoi
;; mit drei Stäben für n Scheiben! Zu Beginn liegen alle Scheiben auf
;; Turm 1, zum Schluss sollen alle Scheiben auf Turm 2 liegen. Die
;; Lösung soll in Form von Anweisungen folgender Art ausgegeben
;; werden: "Ziehe oberste Scheibe von Turm <i> nach Turm <j>!", wobei
;; i,j=1,2,3. Die Ausgabe sollte mit Hilfe einer entsprechenden
;; Prozedur print-move erfolgen.
(exercise)


(define (hanoi size)
	(define (print-move from to)
		(display "Ziehe oberste Scheibe von Turm ")
		(display from)
		(display " nach Turm ")
		(display to)
		(display "!")
		(newline))
	(define (hanoi-search size from to aux)
		(cond ((= size 1) (print-move from to))
					(else
					 (hanoi-search (- size 1) from aux to)
					 (print-move from to)
					 (hanoi-search (- size 1) aux to from))))
	(hanoi-search size 1 2 3))		

(hanoi 4)

;; Aufgabe 4:
;;
;; Schreiben Sie eine Prozedur, die das Skalarprodukt zweier gegebener
;; reeller Vektoren berechnet! Was macht Ihre Prozedur, wenn Sie zwei
;; Vektoren unterschiedlicher Dimension übergeben bekommt?
(exercise)

(define (dot v1 v2)
  (if (or (null? v1) (null? v2)) 0
      (+ (* (car v1) (car v2)) (dot (cdr v1) (cdr v2)))))

(dot '(1 2 3) '(1 2 3))
(dot '(1 2 3) '(1 2 3 4))
(dot '(1 2 3 4) '(1 2 3))
