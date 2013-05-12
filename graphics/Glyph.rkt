#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "../sfml-util.rkt"
         "defgfx.rkt"
         "rect.rkt")

(define-cstruct _sfGlyph
  ([advance _int]
   [bounds _sfIntRect]
   [textureRect _sfIntRect]))
