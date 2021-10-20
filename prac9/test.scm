; (define (length list)
;     (cond 
;         (equal? (car list) '()) 1
;         (equal? (car list) '()) 
;             ()
;     )

; )

(define (sorted list)
    (cond 
        ((equal? (cdr list) '()) #t) ; If we reached the end of the list, we are sorted
        ((<= (car list) (cdar list)) (sorted cdr list)) ; If these were sorted, try the next
        ((> (cdar list) (car list)) #f) ; If not sorted, return false
    )
)

; (define (bubble-sort list)
; )