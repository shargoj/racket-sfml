#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         (file "../sfml-util.rkt")
         (file "defgfx.rkt"))

(define _sfBlendMode
  (_enum '(sfBlendAlpha sfBlendAdd, sfBlendMultiply, sfBlendNone)))
