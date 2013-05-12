#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         (file "../sfml-util.rkt")
         (file "defgfx.rkt"))

(define-cstruct _sfColor
  ([r _uint8]
   [g _uint8]
   [b _uint8]
   [a _uint8]))

(define-all-types defgfx sfColor
  ([fromRGB
    (_fun _uint8 _uint8 _uint8 -> _sfColor)]
   [fromRGBA
    (_fun _uint8 _uint8 _uint8 _uint8 -> _sfColor)]
   [add (_fun _sfColor _sfColor -> _sfColor)]
   [modulate (_fun _sfColor _sfColor -> _sfColor)]))
