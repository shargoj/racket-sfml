#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "../sfml-util.rkt"
         "../system/inputstream.rkt"
         "../system/vector2.rkt"
         "defgfx.rkt"
         "types.rkt"
         "color.rkt"
         "rect.rkt")

(define-all-types defgfx sfImage
  ([create (_fun _uint _uint -> _sfImage-pointer)]
   [createFromColor (_fun _uint _uint _sfColor -> _sfImage-pointer)]
   [createFromPixels
    (_fun _uint _uint (_ptr i _uint8) -> _sfImage-pointer)]
   [createFromFile (_fun _bytes -> _sfImage-pointer)]
   [createFromMemory (_fun (_ptr i _void) _uint -> _sfImage-pointer)]
   [createFromStream (_fun _sfInputStream -> _sfImage-pointer)]
   [copy (_fun _sfImage-pointer -> _sfImage-pointer)]
   [destroy (_fun _sfImage-pointer -> _void)]
   [saveToFile (_fun _sfImage-pointer _bytes -> _bool)]
   [getSize (_fun _sfImage-pointer -> _sfVector2u)]
   [createMaskFromColor
    (_fun _sfImage-pointer _sfColor _uint8 -> _void)]
   [copyImage
    (_fun
     _sfImage-pointer
     _sfImage-pointer
     _uint
     _uint
     _sfIntRect
     _bool
     -> _void)]
   [setPixel (_fun _sfImage-pointer _uint _uint _sfColor -> _void)]
   [getPixel (_fun _sfImage-pointer _uint _uint -> _sfColor)]
   [getPixelsPtr (_fun _sfImage-pointer -> (_ptr o _uint8))]
   [flipHorizontally (_fun _sfImage-pointer -> _void)]
   [flipVertically (_fun _sfImage-pointer -> _void)]))
