(define (hax n k)
    (define (repeat k fn)
        (if (> k 0) 
            (begin (fn) (repeat (- k 1) fn))
            'done
        )
    )

    (define (hex fn)
        (repeat 
            6 
            (lambda () (fn) (lt 60))
        )
    )

    (define (tri fn)
        (repeat 
            3 
            (lambda () (fn) (lt 60))
        )
    )



    (define (hax_helper d k)
        (if (= k 1)
            (hex (lambda () (fd d)))
            (tri (lambda () (leg d k)))
        )
    )
    (define (leg d k)
        (hax_helper (/ d 2) (- k 1))
        (fd d)
        (lt 60)
        (fd d)
    )

    (lt 30)
    (hax_helper d k)
)
(hax 300 6)


