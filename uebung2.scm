;; Aufgabe 1:

;; Benutzen Sie car und cdr, um das #\W aus "Hallo Welt!" zu
;; extrahieren! Sie können eine Zeichenkette mit string->list in eine
;; Liste von Zeichen umwandeln. Wandeln Sie anschließend das Zeichen
;; mit list->string in eine Zeichenkette um. Dafür müssen Sie zunächst
;; eine entsprechende einelementige Liste mittel list erzeugen.

(caddr (cddddr (string->list "Hallo Welt!")))
(list->string (list
               (caddr (cddddr (string->list "Hallo Welt!")))))

;; Aufgabe 2:

;; Schreiben Sie die Prozedur zur Quadrierung der Elemente einer Liste
;; von Zahlen aus der letzten Übung in eine endrekursive Prozedur um!
;; Hinweis: Mittels append können Sie zwei Listen aneinanderhängen.
;; Dafür muss eventuell mit list eine einelementige Liste mit der
;; anzuhängenden Quadratzahl zerzeugt werden.


(define (lsquare l) 
  (define (lsquare-it l acc)
    (if (null? l)
        acc
        (lsquare-it (cdr l)
                    (append acc (list (* (car l) (car l)))))))
  (lsquare-it l '()))

(lsquare '(1 2 3 4))

;; Aufgabe 3:

;; Schreiben Sie eine Prozedur, die eine Liste invertiert. Benutzen Sie
;; diese Prozedur für die Definition einer Prozedur, die eine
;; Zeichenkette umdreht, z.B. soll (invertstr "Hallo Welt!") die
;; Zeichenkette "!tleW ollaH" ergeben.

(define (invertlist l)
  (define (invertlist-it l acc)
    (if (null? l)
        acc
        (invertlist-it (cdr l)
                       (cons (car l) acc))))
  (invertlist-it l '()))

(invertlist (lsquare '(1 2 3 4)))

(define (invertstr s) (list->string (invertlist (string->list s))))

;;(invertstr "Hallo Welt!")

;; Aufgabe 4:

;; Schreiben Sie eine Prozedur, die n! berechnet. Probieren Sie die
;; Prozedur für große Zahlen, wie n=1000 oder n=10000. Vergleichen Sie
;; die Ergebnisse mit der Berechnung von Wolfram Alpha
;; (z.B. http://www.wolframalpha.com/input/?i=1000!)!

(define (fac n)
  (define (fac-it n acc)
    (if (= n 1)
        acc
        (fac-it (- n 1) (* n acc))))
 (fac-it n 1))

;;(fac 1000)

;; Anmerkung: Scheme erlaubt Rechnen mit prinzipiell beliebiger
;; Stelligkeit. Zum Vergleich: Im C-Standard C99 ist die maximal
;; darstellbare Ganzzahl vom Typ unsigned long long int
;; 18446744073709551615 (2^64-1). Damit ist gerade noch
;; 20!=2432902008176640000 darstellbar, bereits 21!  liegt außerhalb
;; des darstellbaren Zahlenbereichs. Auch mit long double können nur
;; 18 Dezimalstellen dargestellt werden. 21! kann mit long double noch
;; exakt berechnet werden, bei 23! beträgt der relative Fehler bereits
;; fast 100%.







