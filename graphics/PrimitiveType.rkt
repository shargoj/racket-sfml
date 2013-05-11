#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "../sfml-util.rkt"
         "defgfx.rkt")

(define _sfPrimitiveType
  (_enum '(sfPoints
           sfLines
           sfLinesStrip
           sfTriangles
           sfTrianglesStrip
           sfTrianglesFan
           sfQuads)))
