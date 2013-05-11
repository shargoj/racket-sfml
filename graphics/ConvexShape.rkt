#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         (file "defgfx.rkt")
         "shape-interface.rkt"
         "Types.rkt")

(define-all-types/shape defgfx sfCircleShape _sfConvexShape-pointer)
