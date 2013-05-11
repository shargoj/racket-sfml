#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "../sfml-util.rkt"
         "../system/inputstream.rkt"
         "defgfx.rkt"
         "Types.rkt"
         "Glyph.rkt"
         "Rect.rkt")

(define-all-types defgfx sfFont
  [[createFromFile (_fun _bytes -> _sfFont-pointer)]
   [createFromMemory (_fun (_ptr i _void) _uint -> _sfFont-pointer)]
   [createFromStream
    (_fun _sfInputStream-pointer  -> _sfFont-pointer)]
   [copy (_fun _sfFont-pointer  -> _sfFont-pointer)]
   [destroy (_fun _sfFont-pointer -> _void)]
   [getGlyph
    (_fun _sfFont-pointer _uint32 _uint _bool -> _sfGlyph)]
   [getKerning (_fun _sfFont-pointer _uint32 _uint32 _uint -> _int)]
   [getLineSpacing (_fun _sfFont-pointer _uint -> _int)]
   [getTexture (_fun _sfFont-pointer _uint -> _sfTexture-pointer)]])
