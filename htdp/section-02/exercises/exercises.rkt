#lang htdp/bsl

(require 2htdp/image)

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
(ff (+ 1 1))

;; Exercise 22
;; Check distance-to-origin program in DrRacket's stepper.
(define (distance-to-origin x y)
  (sqrt (+ (sqr x) (sqr y))))
(distance-to-origin 3 4)

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
(--> #true #false)

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
;; Answer: If it does I am not able to see it in the stepper.
(image-classify-step (rectangle 30 20 "solid" "Violet Red"))

;; Exercise 26
;; What do you expect as the value of this program:
;; Confirm your expectation with DrRacket and its stepper.
(define (string-insert-step s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))

(string-insert-step "helloworld" 6)

;; (string-insert-step "helloworld" 6)
;; => (string-append (substring "helloworld" 0 6) "_" (substring "helloworld" 6))
;; => (string-append (substring "helloworld" 0 6) "_" (substring "helloworld" 6))
;; => (string-append "hellow" "_" "orld")
;; => "hellow_orld"

;; Exercise 27
(define wiggle '())

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
