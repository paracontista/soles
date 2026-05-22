(module exercises racket)

#lang racket

(define x 3)
(define y 4)
(define prefix "hello")
(define suffix "world")
(define underscore "_")
(define str "helloworld")
(define i 5)

;; distance : (Int, Int) -> Int
;; function which calculates distance of a point (x,y) relative to origin (0,0) in the cartesian plane.
(define (distance x y)
  (sqrt (+ (expt x 2) (expt y 2))))

;; add-middle-char : String -> String -> String
;; function which appends an underscore between two strings.
(define (add-middle-char s s2)
  (string-append s underscore s2))

;; add-char-at-index : String -> Char -> Int -> String
;; function which appends a Char at a given index inside a String.
(define (add-char-at-index s c idx)
  (string-append (substring s 0 idx) c (substring s idx)))

#|
(distance 1 0) (distance 0 1) ...
(add-middle-char prefix suffix)
(add-char-at-index str underscore i)
#|
