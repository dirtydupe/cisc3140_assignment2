;Parameter n is a list of numbers
;Processes the digits for the final mod 10 test and returns the result as an integer
;The base-case (1) tests if the list has a single element and returns
;that number if so. If the list has multiple elements the main conditional
;block (2) is entered. The length of the list dictates whether the position
;at the head of the list is odd or even. If the length is even, the next
;conditional (3) is entered and tests whether the number is greater than or
;equal to 5. If so, this call to process-digits will double the value at the head
;of the list then subtract 9 from it resulting in the value needed if it were to
;double the value then add the digits (2x - 9 will map {5, 6, 7, 8, 9} to
;{1, 3, 5, 7, 9}, respectively). If the number is less than 5 then the value is
;simply doubled. Numbers at odd positions are left alone (4) and, as in all of the
;previous cases, the cdr of the list is passed to the next call to process-digits.
;The sum is gathered as the recursive calls return.
(define process-digits (lambda (n)
               (if(= 1 (length n))                                     ;(1)   
                  (car n)
               (if(even? (length n))                                   ;(2)
                  (if(>= (car n) 5)                                    ;(3)
                     (+ (- (* 2 (car n)) 9) (process-digits (cdr n)))
                     (+ (* 2 (car n)) (process-digits (cdr n))))
                  (+ (car n) (process-digits (cdr n)))                 ;(4)
                  ))))

;Parameter n is a list of numbers
;(5) Performs the mod 10 test on the result of calling process-digits
;If the residue of the number modulo 10 = 0, return true, else return false
(define luhn (lambda (n) 
               (if(= (modulo (process-digits n) 10) 0)                 ;(5)
                  #t
                  #f
                  )))