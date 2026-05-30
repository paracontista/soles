#lang htdp/bsl

(require 2htdp/batch-io)
(require 2htdp/image)
(require 2htdp/universe)

;; Exercise 11
;; distance : Int -> Int -> Int
;; function which consumes two numbers (x,y) and computes distance relative to origin (0,0).
(define (distance x y)
  (sqrt (+ (sqr x) (sqr y))))

;; Exercise 12
;; cvolume : Int -> Int
;; function which accepts the length of a side of an equilateral cube and computes its volume.
(define (cvolume side) (expt side 3))

;; Exercise 12.1
;; csurface : Int -> Int
;; function which accepts the length of a side of an equilateral cube and computers its surface area.
(define (csurface side) (* 6 (cvolume side)))

;; Exercise 13
;; string-first : String -> 1String
;; function which extracts the first 1String from a non-empty String.
(define (string-first s) (string-ith s 0))

;; Exercise 14
;; string-last : String -> 1String
;; function which extracts the last 1String from a non-empty String.
(define (string-last s) (string-ith s (- (string-length s) 1)))

;; Exercise 15
;; (==>) : Boolean -> Boolean -> Boolean
;; function which consumes two Boolean values and return a Boolean value
;; Basically define the material implication functional connective and/or operator from FOL.
;; P Q | P => Q
;; T T |   T
;; T F |   F
;; F T |   T
;; F F |   T

;; Boolean-blindness: https://existentialtype.wordpress.com/2011/03/15/boolean-blindness/
;; definition of (==>)
(define (==> p q) (if (and (boolean=? p #true) (boolean=? q #false)) #false #true))

;; Improvement using the following equivalence: P -> Q ≡ ¬P ∨ Q
(define (--> p q) (or (not p) q))

;; Exercise 16
;; image-area : Image -> Int
;; function which computes the area of a given Image.
(define (image-area img)
  (+ (image-height img)
     (image-width img)))

;; Exercise 17
;; image-classify : Image -> String
;; function which consumes an image and conditionally tells you which kind is based on measurements.
(define (image-classify img)
  (cond
    [(< (image-height img) (image-width img)) "tall"]
    [(> (image-height img) (image-width img)) "wide"]
    [else                                     "square"]))

;; Exercise 18
;; string-join : String -> String -> String
;; function which consumes two Strings and appends them with "_" in between
(define (string-join s s2)
  (string-append s "_" s2))

;; Exercise 19
;; string-insert : String -> Int -> String
;; function which consumes a String and a number idx: inserts "_" at the ith position of String.
(define (string-insert str idx)
  (string-append (substring str 0 idx) "_" (substring str idx)))

;; Exercise 20
;; string-delete : String -> Int -> String
;; function which consumes a String and a number idx: deletes a character in the ith position from String.
(define (string-delete str idx)
  (string-append (substring str 0 (- idx 1)) (substring str idx)))

;; Exercise 21
;; Check ff function in DrRacket's stepper.
(define (ff a) (* 10 a))

;; (ff (+ 1 1))

;; Exercise 22
;; Check distance-to-origin program in DrRacket's stepper.
(define (distance-to-origin x y)
  (sqrt (+ (sqr x) (sqr y))))

;; (distance-to-origin 3 4)

;; Exercise 23
;; How does the following function computes its result?
(define (string-first-step s)
  (substring s 0 1))

;; => Stands for "evals to"
;; (string-first-step "hello world")
;;  => (substring "fun" 0)
;;  => "f"

;; Exercise 24
;; Using the definition of --> defined above determine the value of (--> #true #false)
;; (--> #true #false)

;; (--> #true #false)
;; => (or (not #true) #false)
;; => (or #false #false)
;; => #false

;; Exercise 25
;; Take a look at this attempt to solve Exercise 17
(define (image-classify-step img)
  (cond
    [(>= (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(<= (image-height img) (image-width img)) "wide"]))

;; Does stepping through an application suggests a fix?
;; ... If it does I am not able to see it in the stepper.
;; (image-classify-step (rectangle 30 20 "solid" "Violet Red"))

;; Exercise 26
;; What do you expect as the value of this program:
;; Confirm your expectation with DrRacket and its stepper.
(define (string-insert-step s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))

;; (string-insert-step "helloworld" 6)

;; (string-insert-step "helloworld" 6)
;; => (string-append (substring "helloworld" 0 6) "_" (substring "helloworld" 6))
;; => (string-append (substring "helloworld" 0 6) "_" (substring "helloworld" 6))
;; => (string-append "hellow" "_" "orld")
;; => "hellow_orld"

;; Exercise 27
;; Rewrite the magic numbers to constants in the following functions.
(define ATTENDEES 120)
(define TICKET-PRICE 5.0)
(define ATTENDEES-VARIATION 15)
(define OWNER-FIXED-COST 180)
(define COST-PER-ATTENDEE 0.4)
(define CENTS 0.1)
(define PRICE-SENSITIVITY (/ ATTENDEES-VARIATION CENTS))

;; attendees : Float -> Int
;; function which determines how the number of attendees depends on the ticket price.
(define (attendees ticket-price)
  (- ATTENDEES (* (- ticket-price TICKET-PRICE) PRICE-SENSITIVITY)))

;; revenue : Float -> Int
;; function which calculates the revenue generated by the sale of tickets.
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

;; cost : Float -> Int
;; function which computes the total cost of a show.
(define (cost ticket-price)
  (+ OWNER-FIXED-COST (* COST-PER-ATTENDEE (attendees ticket-price))))

;; profit : Float -> Int
;; function which computes the difference between revenue and costs for some given ticket price.
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;; Exercise 28
;; Determine the potential profit of $1, $2, $3, $4 and $5.
;; Which price maximizes profit of the movie theater.

;; (profit 1) ;; => 252
;; (profit 2) ;; => 732
;; (profit 3) ;; => 912
;; (profit 4) ;; => 792
;; (profit 5) ;; => 372

;; Clearly selling tickets at 3$ gives the max amount of profit.

;; Exercise 29
;; After some optimization (removing fixed performance cost.)
(define COST-PER-ATTENDEE-OPTIMIZED 1.5)

(define (cost-optimized ticket-price)
  (* COST-PER-ATTENDEE-OPTIMIZED (attendees ticket-price)))

(define (profit-optimized ticket-price)
  (- (revenue ticket-price)
     (cost-optimized ticket-price)))

;; (profit-optimized 1) ;; => -360 This reflects selling tickets at $1 is a loss!
;; (profit-optimized 2) ;; => 285
;; (profit-optimized 3) ;; => 630
;; (profit-optimized 4) ;; => 675
;; (profit-optimized 5) ;; => 420

;; Clearly after removing the fixed cost ($180) per performance and make the profit based
;; on the how many attendees the performance gets shows that selling tickets at $4 generates more profit.

;; Exercise 30
;; Above define constants for the price optimization program at the movie theater.

;; Exercise 31
;; First batch program.
;; letter : String -> String -> String -> String
(define (letter first-name last-name signature-name)
  (string-append
   (opening first-name)
   "\n\n"
   (body first-name last-name)
   "\n\n"
   (closing signature-name)))

;; opening : String -> String
(define (opening first-name)
  (string-append "Dear " first-name ","))

;; body : String -> String -> String
(define (body first-name last-name)
  (string-append
   "We have discovered that all people with the" "\n"
   "last name " last-name " have won our lottery. So, " "\n"
   first-name ", " "hurry and pick up your prize."))

;; closing : String -> String
(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

;; main : File -> File -> File -> File
(define (main in-fst in-lst in-signature out)
  (write-file out
              (letter (read-file in-fst)
                      (read-file in-lst)
                      (read-file in-signature))))

;; Execise 31
;; Created and tested files.
(main "io/fst.txt"
      "io/lst.txt"
      "io/signature.txt"
      "io/letter.txt")

;; Exercise 32
;; First interactive program.
(define BACKGROUND (empty-scene 100 100))
(define DOT (circle 3 "solid" "Violet Red"))

;; main- : WorldState -> World (Window)
(define (main- y)
  (big-bang y
            [on-tick sub1]
            [stop-when zero?]
            [to-draw place-dot-at]
            [on-key stop]))

;; place-dot-at : Int -> Image
(define (place-dot-at y)
  (place-image DOT 50 y BACKGROUND))

;; stop : ?Int -> ?KeyStroke -> Int
(define (stop y ke) 0)

;; Exercise 33
;; "Research the 'year 2000' problem"
;; Basically it refers to the Y2K problem where computers coulnd't distinguish between 2000 and 1900.

;; Exercise 34
;; string-first : String -> 1String
;; function which extracts the first character from a non-empty String.
;; (define (string-first str) (string-ith str 0))

;; Exercise 35
;; string-last : String -> 1String
;; function which extracts the last character from a non-empty String.
;; (define (string-last str) (string-ith str (- (string-length str) 1)))

;; Exercise 36
;; image-area : Image -> Int
;; function which computes the area of a given Image.
;; (define (image-area img)
;;   (* (image-width img)
;;      (image-height img)))

;; Exercise 37
;; string-rest : String -> String
;; function which produces a String like the given one with the first character removed.
;; Example: (string-rest "aeiou") => "eiou"
(define (string-rest str) '()) 

;; Exercise 38
;; string-remove-last : String -> String
;; function which produces a String like the given one with last character removed.
;; Example: (string-remove-last "aeiou") => "aeio"
(define (string-remove-last str) '())

;; Tests
(distance 5 0)
(cvolume  2)
(csurface 8)
(string-first "Test")
(string-last  "Test")
(==> #true  #true)
(==> #true  #false)
(==> #false #true)
(==> #false #false)
(--> #true  #true)
(--> #true  #false)
(--> #false #true)
(--> #false #false)
(image-area     (circle 20 "solid" "Violet Red"))
(image-classify (circle 20 "solid" "Violet Red"))
(image-classify (rectangle 20 30 "solid" "Violet Red"))
(image-classify (rectangle 30 20 "solid" "Violet Red"))
(string-join "trayec" "tory")
(string-insert "measurement" 0)
(string-insert "measurement" 1)
(string-delete "measurement" 1)
(string-delete "measurement" (string-length "measurement"))
(place-dot-at 89)
(stop 89 "q")
(main- 90)
