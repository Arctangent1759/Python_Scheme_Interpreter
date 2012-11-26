;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Moonlit Recursive Trees on a Fall Evening 
;;;
;;; Description:
;;;	def haiku (some_text):
;;;     len(some_text) is 17
;;;     return '*YOUR CODE HERE*'

(define (draw)
	(define (tree d n a)
		(if (= n 1)
			(begin
				(fd d)
				(cond ((< a 22) (color 'green)) ((< a 38)(color 'red)) (else (color 'yellow)))
				(circle 3)
				(color 'white)
				(penup)
				(fd (- d))
				(pendown)
			)
			(begin
				(fd d)
				(rt (- a))
				(tree (/ d 1.61803398875) (- n 1) a)
				(rt (* a 2))
				(tree (/ d 1.61803398875) (- n 1) a)
				(penup)
				(rt (- a))
				(fd (- d))
				(pendown)
			)
		)
	)
	;72 symbols

	(define (fib n)
		(define (helpy prev curr n)
			(if (= n 1)
				curr
				(helpy curr (+ prev curr) (- n 1))
			)
		)
		(helpy 0 1 n)
	)
	;25 symbols

	(define (random lbound upbound seed)
		(+ lbound (remainder (* (fib seed) seed seed) (- upbound lbound)))
	)
	;16 symbols

	(define (forest ntrees d n a seed)
		(if (= ntrees 0)
			nil
			(begin
				(define voffset (random -20 20 seed))  
				(tree  (random 20 d seed) n (random 20 a seed))
				(rt 90)
				(rt voffset)
				(fd (/ d 1.62))
				(rt (- voffset))
				(rt -90)
				(forest (- ntrees 1) d n a (+ seed (random 1 seed seed)))
			)
		)
	)
	;55 symbols

	(define (repeat k fn)
		(if (> k 0)
			(begin (fn) (repeat (- k 1) fn))
			nil
		)
	)
	;16 symbols

	(define (inverse-appolonian-gasket r n)
		(if (= n 1)
			(circle r)
			(begin
				(repeat 3 
					(lambda ()
						
						(circle r 120)
						(inverse-appolonian-gasket (/ r 2.15470053838) (- n 1))
						
					)
				)
			)
		)
	)
	;24 symbols
	(begin_fill)
	(goto 1000 0)
	(circle 2000)
	(end_fill)
	(penup)
	(goto -400 -250)
	(pendown)
	(color 'white)
	(rt -90)
	(fd -150)
	(rt 90)
	(forest 9 100 6 45 10)
	(rt 90)
	(fd 100)
	(penup)
	(goto 200 200)
	(pendown)
	(color 'yellow)
	(rt 40)
	(inverse-appolonian-gasket 35 5)
	(ht)
	;43 Symbols
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.  All Scheme tokens in this file (including the one below) count
; toward the token limit.
(draw)
