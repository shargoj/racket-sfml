#lang racket

(provide all-defined-out)
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "../system/inputstream.rkt"
 "../system/vector2.rkt"
 "../window/types.rkt"
 "defgfx.rkt"
 "types.rkt"
 "rect.rkt")

(define-all-types defgfx sfTexture
  ([create (_fun _uint _uint -> _sfTexture-pointer)]
   [createFromFile
    (_fun _bytes (_ptr i _sfIntRect) -> _sfTexture-pointer)]
   [createFromMemory
    (_fun
     (_ptr i _void)
     _uint
     (_ptr i _sfIntRect)
     -> _sfTexture-pointer)]
   [createFromStream
    (_fun
     _sfInputStream-pointer
     (_ptr i _sfIntRect)
     -> _sfTexture-pointer)]
   [createFromImage
    (_fun
     _sfImage-pointer
     (_ptr i _sfIntRect)
     -> _sfTexture-pointer)]
   [copy (_fun _sfTexture-pointer -> _sfTexture-pointer)]
   [destroy (_fun _sfTexture-pointer -> _void)]
   [getSize (_fun _sfTexture-pointer -> _sfVector2u)]
   [copyToImage (_fun _sfTexture-pointer -> _sfImage-pointer)]
   [updateFromPixels
    (_fun
     _sfTexture-pointer
     (_ptr i _uint8)
     _uint
     _uint
     _uint
     _uint
     -> _void)]
   [updateFromImage
    (_fun _sfTexture-pointer _sfImage-pointer _uint _uint -> _void)]
   [updateFromWindow
    (_fun _sfTexture-pointer _sfWindow-pointer _uint _uint -> _void)]
   [updateFromRenderWindow
    (_fun
     _sfTexture-pointer
     _sfRenderWindow-pointer
     _uint
     _uint
     -> _void)]
   [setSmooth (_fun _sfTexture-pointer _bool -> _void)]
   [isSmooth (_fun _sfTexture-pointer -> _bool)]
   [setRepeated (_fun _sfTexture-pointer _bool -> _void)]
   [isRepeated (_fun _sfTexture-pointer -> _bool)]
   [bind (_fun _sfTexture-pointer -> _void)]
   [getMaximumSize (_fun -> _uint)]
   ))
