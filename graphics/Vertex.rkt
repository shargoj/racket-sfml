#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "Color.rkt")

(define-cstruct _sfVertex
  (;[position _sfVector2f]
   [color _sfColor]
   ;#[texCoords _sfVector2f]
   ))
