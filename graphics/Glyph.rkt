#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "../sfml-util.rkt"
         "defgfx.rkt"
         "Rect.rkt")

(define-cstruct _sfGlyph
  ([advance _int]
   [bounds _sfIntRect]
   [textureRect _sfIntRect]
   ))
