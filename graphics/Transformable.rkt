#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "defgfx.rkt"
 "../sfml-util.rkt"
 "Types.rkt"
 "Transform.rkt")

(define-all-types defgfx sfTransformable
  ([create (_fun -> _sfTransformable-pointer)]
   [copy (_fun _sfTransformable-pointer -> _sfTransformable-pointer)]
   [destroy (_fun _sfTransformable-pointer -> _void)]
   #;
   [setPosition (_fun _sfTransformable-pointer _sfVector2f -> _void)]
   [setRotation (_fun _sfTransformable-pointer _float -> _void)]
   #;
   [setScale (_fun _sfTransformable-pointer _sfVector2f -> _void)]
   #;
   [setOrigin (_fun _sfTransformable-pointer _sfVector2f -> _void)]
   #;
   [getPosition (_fun _sfTransformable-pointer -> _sfVector2f)]
   [getRotation (_fun _sfTransformable-pointer -> _float)]
   #;
   [getScale (_fun _sfTransformable-pointer -> _sfVector2f)]
   #;
   [getOrigin (_fun _sfTransformable-pointer -> _sfVector2f)]
   #;
   [move (_fun _sfTransformable-pointer _sfVector2f -> _void)]
   [rotate (_fun _sfTransformable-pointer _float -> _void)]
   #;
   [scale (_fun _sfTransformable-pointer _sfVector2f -> _void)]
   [getTransform (_fun _sfTransformable-pointer -> _sfTransform)]
   [getInverseTransform
    (_fun _sfTransformable-pointer -> _sfTransform)]))
