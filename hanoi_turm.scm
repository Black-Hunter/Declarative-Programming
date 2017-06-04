(define (lsum-t l)
  (define  (lsum l s)
    (if (null? l) 
        s ( (lsum (cdr   l)) (+ s (car l))  )))
  (lsum l 0))

(define (print-move from to )
  (display from )
    (display " --> ")
      (display to) 
   (newline)
  )
  



(define (hanoi n from to aux ) 
  (if(= n 1) (print-move from to)    
  (begin (hanoi (- n 1) from aux to) (print-move from to) (hanoi (- n 1) aux to from ) )
  ))

