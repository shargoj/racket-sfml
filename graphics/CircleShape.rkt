#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "../sfml-util.rkt"
         "defgfx.rkt"
         "Types.rkt"
         "shape-interface.rkt")

(define-all-types/shape defgfx sfCircleShape _sfCircleShape-pointer)
