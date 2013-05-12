#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "../sfml-util.rkt"
         "defgfx.rkt"
         "shape-interface.rkt"
         "types.rkt")

(define-all-types/shape defgfx sfCircleShape
  _sfRectangleShape-pointer)
