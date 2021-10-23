; Returns true if input list is sorted and false otherwise
(define (sorted list)
    (cond 
        ; If we reached the end of the list, we are sorted
        ((equal? (cdr list) '())
            #t
        )
        ; If these were sorted, try the next
        ((<= (car list) (cadr list))
            (sorted (cdr list))
        )
        ; If not sorted, return false
        ((> (car list) (cadr list))
            #f
        ) 
    )
)

; Performs bubble-sort on the imported list
(define (bubble-sort list)
    (cond
        ; If we are sorted, we are done
        ((sorted list)
            list
        ) 
        ; If we are not sorted, do another run
        ((not (sorted list))
            (bubble-sort (bubble-sort-run list))
        ) 
    )
)

; Performs one run (trickle) of bubble sort on the imported list
(define (bubble-sort-run list)
    (cond
        ; If we've reached the end of the list, recursively return the list
        ((equal? (cdr list) '())
            list
        )
        ; If we're not at the end of the list, swap the first two elements (if needed) and then continue
        ((not (equal? (cdr list) '()))
            (cons (car (sort-first list)) (bubble-sort-run (cdr (sort-first list))))
        )
    )
)

; Swaps the first and second element of the list
(define (sort-first list)
    (cond
        ; If at the end of the list, recursively return the list
        ((equal? (cdr list) '())
            list
        )
        ; If next two elements are the wrong way around, swap them
        ((> (car list) (cadr list))
            (cons (cadr list) (cons (car list) (cddr list)))
        )
        ; If next two elements are right way around, don't swap them
        ((<= (car list) (cadr list))
            list
        )
    )
)

; TEST FUNCTIONS
; (load "bubble_sort.scm")
; (bubble-sort '(4 1 3 2 82 4 2 1378 474 2 2 18 5 5812))
; (bubble-sort '(4 1 3 2))
; (swap-first '(5 3 2 6 1 4))
; (sorted '(1 2 3 4))