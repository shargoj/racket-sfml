#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "blendmode.rkt"
         "transform.rkt"
         "types.rkt")

(define-cstruct _sfRenderStates
  ([blendMode _sfBlendMode]
   [transform _sfTransform]
   [texture _sfTexture-pointer]
   [shader _sfShader-pointer]))
