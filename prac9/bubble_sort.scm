(define (sorted list)
    (cond 
        ; If we reached the end of the list, we are sorted
        ((equal? (cdr list) '())
            #t
        )
        ; If these were sorted, try the next
        ((<= (car list) (cdar list))
            (sorted (cdr list))
        )
        ; If not sorted, return false
        ((> (cdar list) (car list))
            #f
        ) 
    )
)

(define (bubble-sort list)
    (cond
        ((sorted list) 
            list
        ) 
        ((not (sorted list))
            (bubble-sort (bubble-sort-run list))
        ) 
    )
)

(define (bubble-sort-run list)
    (cond
        ((equals? (car list) '())
            list
        )
        ((> (car list) )
        )
    )
)