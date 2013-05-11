#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "../sfml-util.rkt"
         "defgfx.rkt"
         "shape-interface.rkt"
         "Types.rkt")

(define-all-types/shape defgfx sfCircleShape _sfRectangleShape-pointer)
