#lang racket

(provide (all-defined-out))
(require ffi/unsafe)

(define-cstruct _sfVector3f
  ([x _float]
   [y _float]
   [z _float]))
