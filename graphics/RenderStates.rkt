#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "BlendMode.rkt"
         "Types.rkt")

(define-cstruct _sfRenderStates
  ([blendMode _sfBlendMode]
   #;[transform _sfTransform]
   [texture _sfTexture-pointer]
   [shader _sfShader-pointer]))
