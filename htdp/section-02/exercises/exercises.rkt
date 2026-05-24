#lang htdp/bsl

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
;; functions which accepts the lenght of a side of an equilateral cube and computers its surface area.
(define (csurface side) (* 6 (cvolume side)))

;; Exercise 13
;; wiggle : ? -> ?
(define wiggle '())

;; Tests
(distance 5 0)
(cvolume 2)
(csurface 8)
