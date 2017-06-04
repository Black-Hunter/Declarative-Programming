(define cal  
   (lambda (x) (* x 4))
 )

;; (cal 9)

 (define q '(1 2 3 4 ))

 (define (mult l n )
      (if   (null? l) '()
           (cons (* (car l) n)  (mult (cdr  l) n)) )
   )

;; (mult q 4)

(define l1 '(1 2 3 4 5))
(define l2 '(5 6 7 8))
( cons (car l1) (cons (cadr l1) (cons (caddr l1) (cons ( cadddr l1) l2))) )
(define (walk l1) (if
                    (null? l1) '()
                      () ))
(define (merg l1 l2)
          (cond (null? l1) '()
             (cons () )
              )
