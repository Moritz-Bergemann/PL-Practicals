; (
;     ; Defines times2 function
;     define (times2 x)
;         (* x 2)
; )
; (
;     define stack '(A B C)
; )
; (
;     define (push stack x)
;         ( cons x stack)
; )
; (
;     ; More like peek - doesn't actually remove elements from the stack
;     define (pop stack)
;         (car stack)
; )
; (
;     ; Exponent
;     define (exp x y)
;         (cond 
;             ((= y 1)) x ; If y = 1, return x
;             ((> y 1)) (* x (exp x (- y 1))) ; If y > 1, multiply x by 1 less exponent 
;         )
; )

; ; Basic lil calculator
; (
;     define (execOp ) ;TODO
; )

; (
;     define (calc op n1 n2)
;     (cond
;         ((equal) ' + op)
;         (execOp (lambda (x y) (+ x y)) n1 n2)
;     )
; )

; Insert-right-first
; OG
; (
;     define (ins-right- x y list)
;         (cond
;             ((equal? y '()) '()) ; Return an empty list if we didn't find anything
;             ((not (equal? y (car list))) (cons (car list) (ins-right-1st x y (cdr list)))) ; Do recursive call if this wasn't a match but we didn't find it
;             ((equal? y (car list)) (cons (car list) (cons x (cdr list))) ; Return the rest of the list with stuff prepended to it 
;         )
; )

; BETTER FORMATTING 
(define (ins-right-1st x y list)
    (cond
        ; Return an empty list if we didn't find anything
        ((equal? y '()) 
            '()
        )
        ; Do recursive call if this wasn't a match but we didn't find it
        ((not (equal? y (car list))) 
            (cons 
                (car list) 
                (ins-right-1st x y (cdr list))
            )
        )
        ((equal? y (car list)) 
            (cons 
                (car list) 
                (cons x (cdr list))
            )
        ) ; Return the rest of the list with stuff prepended to it 
    )
)

; (load "prac.scm")
; (ins-right-1st 'beans 'B '(A B C D))