#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "../sfml-util.rkt"
         "../system/inputstream.rkt"
         "../system/vector2.rkt"
         "../system/vector3.rkt"
         "defgfx.rkt"
         "transform.rkt"
         "types.rkt"
         "color.rkt")

(define-all-types defgfx sfShader
  ([createFromFile (_fun _bytes _bytes -> _sfShader-pointer)]
   [createFromMemory (_fun _bytes _bytes -> _sfShader-pointer)]
   [createFromStream
    (_fun
     _sfInputStream-pointer
     _sfInputStream-pointer
     -> _sfShader-pointer)]
   [destroy (_fun _sfShader-pointer -> _void)]
   [setFloatParameter
    (_fun _sfShader-pointer _bytes _float -> _void)]
   [setFloat2Parameter
    (_fun _sfShader-pointer _bytes _float _float -> _void)]
   [setFloat3Parameter
    (_fun _sfShader-pointer _bytes _float _float _float -> _void)]
   [setFloat4Parameter
    (_fun
     _sfShader-pointer
     _bytes
     _float
     _float
     _float
     _float
     -> _void)]
   [setVector2Parameter
    (_fun _sfShader-pointer _bytes _sfVector2f -> _void)]
   [setVector3Parameter
    (_fun _sfShader-pointer _bytes _sfVector3f -> _void)]
   [setColorParameter
    (_fun _sfShader-pointer _bytes _sfColor -> _void)]
   [setTransformParameter
    (_fun _sfShader-pointer _bytes _sfTransform -> _void)]
   [setTextureParameter
    (_fun _sfShader-pointer _bytes _sfTexture-pointer -> _void)]
   [setCurrentTextureParameter
    (_fun _sfShader-pointer _bytes -> _void)]
   [bind (_fun _sfShader-pointer -> _void)]
   [isAvailable (_fun -> _bool)]))
