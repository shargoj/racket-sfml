#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         (file "defgfx.rkt")
         "shape-interface.rkt"
         "types.rkt")

(define-all-types/shape defgfx sfCircleShape _sfConvexShape-pointer)
