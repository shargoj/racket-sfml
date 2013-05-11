#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 ffi/unsafe/define
 "defgfx.rkt"
 "../sfml-util.rkt"
 "Types.rkt"
 "Rect.rkt")

(define-cstruct _sfTransform
  ([matrix (_array _float 9)]))

(define-all-types defgfx sfTransform
  ([fromMatrix
    (_fun
     _float _float _float
     _float _float _float
     _float _float _float
    -> _sfTransform)]
   ; TODO: make this just return a matrix?
   [getMatrix (_fun _sfTransform-pointer (_ptr io _float) -> _void)]
   [getInverse (_fun _sfTransform-pointer -> _sfTransform)]
   #;
   [transformPoint
    (_fun _sfTransform-pointer _sfVector2f -> _sfVector2f)]
   [transformRect
    (_fun _sfTransform-pointer _sfFloatRect -> _sfFloatRect)]
   [combine
    (_fun _sfTransform-pointer _sfTransform-pointer -> _void)]
   [translate (_fun _sfTransform-pointer _float _float -> _void)]
   [rotate (_fun _sfTransform-pointer _float -> _void)]
   [rotateWithCenter
    (_fun _sfTransform-pointer _float _float _float -> _void)]
   [scale (_fun _sfTransform-pointer _float _float -> _void)]
   [scaleWithCenter
    (_fun
     _sfTransform-pointer
     _float
     _float
     _float
     _float -> _void)]))
