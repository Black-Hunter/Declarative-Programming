;;Rest_Rekrusive
(define (lsum l)
  (define (lsum-it l s)  
    (if (null? l) s
       (  lsum-it (cdr l) (+ (car l) s))))
   (lsum-it l 0)         
  )

;;nicht rest_Recrusive  
(define (sum x )
 
  ( if (null? x) 0 
            (+ (sum  (cdr x)) (car x)  )))



  
(define (sum1 x sum) (if (null? x) sum 
                  (+  (+  (car x ) sum)  (sum1 (cdr x) sum))
                          ))
(lsum '(1 2 3 4))




(define (sum3 x )
   ( if (null? x)  0 
            (list  '+ (car x) (sum3 (cdr x)) )))

;;(sum3 '(1 2 3 4))

(define (lsum l)
  (define (lsum-it l s)  
    (if (null? l) s
       (  lsum-it (cdr l) (+ (car l) s))))
   (lsum-it l 0)         
  )

;;inorder

(define (inorder x)
     (if (not (pair? t)) (display t)                
            (( inorder (car t))
            (display (car t))
            (inorder (caddr t)))))
            

;;iteration
(define (fak l)
  (define (fak-it l s)
    (if (null? l) s
        (fak-it (cdr l) (* (car l ) s))
        ))
   
 (fak-it l 1 ))
 
;;(fak '(1 2 3 4 5 6 7 8 9))

;;symbolic auswertung
(define (plus a b) 
  (list '+ a b))

;;(plus 1 2)

;;Auswertung
(define l  (list '((lambda (a) (cons a 3)) 2)) )
((lambda (a)  (cons a  3)) (cons 3 2) )

;;l