(module exercises racket)

#lang racket

(define x 3)
(define y 4)

;; distance : (Int, Int) -> Int
;; relative to origin (0,0) in the cartesian plane.
(define (distance x y)
  (sqrt (+ (expt x 2) (expt y 2))))

;; (distance 1 0)
;; (distance 0 1)
;; (distance 0 0)
