#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "../sfml-util.rkt"
         "defgfx.rkt"
         "Types.rkt"
         "Rect.rkt"
         "PrimitiveType.rkt"
         "Vertex.rkt")

(define-all-types defgfx sfVertexArray
  ([create (_fun -> _sfVertexArray-pointer)]
   [copy (_fun _sfVertexArray-pointer -> _sfVertexArray-pointer)]
   [destroy (_fun _sfVertexArray-pointer -> _void)]
   [getVertexCount (_fun _sfVertexArray-pointer -> _uint)]
   [getVertex
    (_fun _sfVertexArray-pointer _uint ->
          (_ptr o _sfVertex))]
   [clear (_fun _sfVertexArray-pointer -> _void)]
   [resize (_fun _sfVertexArray-pointer _uint -> _void)]
   [append (_fun _sfVertexArray-pointer _sfVertex -> _void)]
   [setPrimitiveType
    (_fun _sfVertexArray-pointer _sfPrimitiveType -> _void)]
   [getPrimitiveType
    (_fun _sfVertexArray-pointer -> _sfPrimitiveType)]
   [getBounds (_fun _sfVertexArray-pointer -> _sfFloatRect)]))
