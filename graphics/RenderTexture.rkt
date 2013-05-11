#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "../system/vector2.rkt"
 "defgfx.rkt"
 "Color.rkt"
 "Rect.rkt"
 "RenderStates.rkt"
 "PrimitiveType.rkt"
 "Vertex.rkt"
 "Types.rkt")

(define-all-types defgfx sfRenderTexture
  ([create (_fun _uint _uint _bool -> _sfRenderTexture-pointer)]
   [destroy (_fun _sfRenderTexture-pointer -> _void)]
   [getSize (_fun _sfRenderTexture-pointer -> _sfVector2u)]
   [setActive (_fun _sfRenderTexture-pointer _bool -> _bool)]
   [display (_fun _sfRenderTexture-pointer -> _void)]
   [clear (_fun _sfRenderTexture-pointer _sfColor -> _void)]
   [setView (_fun _sfRenderTexture-pointer _sfView-pointer -> _void)]
   [getView (_fun _sfRenderTexture-pointer -> _sfView-pointer)]
   [getDefaultView
    (_fun _sfRenderTexture-pointer -> _sfView-pointer)]
   [getViewport
    (_fun _sfRenderTexture-pointer _sfView-pointer -> _sfIntRect)]
   [mapPixelToCoords
    (_fun _sfRenderTexture-pointer
          _sfVector2i
          _sfVector2i
          -> _sfVector2f)]
   [mapCoordsToPixel
    (_fun _sfRenderTexture-pointer
          _sfVector2f
          _sfView-pointer
          -> _sfVector2i)]
   [drawSprite
    (_fun _sfRenderTexture-pointer
          _sfSprite-pointer
          (_ptr i _sfRenderStates)
          -> _void)]
   [drawText
    (_fun _sfRenderTexture-pointer
          _sfTexture-pointer
          (_ptr i _sfRenderStates)
          -> _void)]
   [drawShape
    (_fun _sfRenderTexture-pointer
          _sfShape-pointer
          (_ptr i _sfRenderStates)
          -> _void)]
   [drawCircleShape
    (_fun _sfRenderTexture-pointer
          _sfCircleShape-pointer
          (_ptr i _sfRenderStates)
          -> _void)]
   [drawConvexShape
    (_fun _sfRenderTexture-pointer
          _sfConvexShape-pointer
          (_ptr i _sfRenderStates)
          -> _void)]
   [drawRectangleShape
    (_fun _sfRenderTexture-pointer
          _sfRectangleShape-pointer
          (_ptr i _sfRenderStates)
          -> _void)]
   [drawVertexArray
    (_fun _sfRenderTexture-pointer
          _sfVertexArray-pointer
          (_ptr i _sfRenderStates)
          -> _void)]
   [drawPrimitives
    (_fun _sfRenderTexture-pointer
          (_ptr i _sfVertex)
          _uint
          _sfPrimitiveType
          (_ptr i _sfRenderStates)
          -> _void)]
   [pushGLStates (_fun _sfRenderTexture-pointer -> _void)]
   [popGLStates (_fun _sfRenderTexture-pointer -> _void)]
   [resetGLStates (_fun _sfRenderTexture-pointer -> _void)]
   [getTexture
    (_fun _sfRenderTexture-pointer -> _sfTexture-pointer)]
   [setSmooth (_fun _sfRenderTexture-pointer _bool -> _void)]
   [isSmooth (_fun _sfRenderTexture-pointer -> _bool)]))
