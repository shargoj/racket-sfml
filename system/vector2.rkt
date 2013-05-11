#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe)

(define-cstruct _sfVector2i
  ([x _int]
   [y _int]))

(define-cstruct _sfVector2u
  ([x _uint]
   [y _uint]))

(define-cstruct _sfVector2f
  ([x _float]
   [y _float]))
