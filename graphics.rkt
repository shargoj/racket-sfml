#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         ffi/unsafe/define
         "sfml-util.rkt")

(define-ffi-definer defgfx (ffi-lib "libcsfml-graphics"))

;;; Graphics/Types
(define _sfCircleShape-pointer (_cpointer 'sfCircleShape))
(define _sfConvexShape-pointer (_cpointer 'sfConvexShape))
(define _sfFont-pointer (_cpointer 'sfFont))
(define _sfImage-pointer (_cpointer 'sfImage))
(define _sfShader-pointer (_cpointer 'sfShader))
(define _sfRectangleShape-pointer (_cpointer 'sfRectangleShape))
(define _sfRenderTexture-pointer (_cpointer 'sfRenderTexture))
(define _sfRenderWindow-pointer (_cpointer 'sfRenderWindow))
(define _sfShape-pointer (_cpointer 'sfShape))
(define _sfSprite-pointer (_cpointer 'sfSprite))
(define _sfText-pointer (_cpointer 'sfText))
(define _sfTexture-pointer (_cpointer 'sfTexture))
(define _sfTransformable-pointer (_cpointer 'sfTransformable))
(define _sfVertexArray-pointer (_cpointer 'sfVertexArray))
(define _sfView-pointer (_cpointer 'sfView))

;;; Graphics/Rect.h
(define-cstruct _sfFloatRect
  ([left _float]
   [top _float]
   [width _float]
   [height _float]))

(define-all-types defgfx sfFloatRect
  ([contains (_fun (_ptr i _sfFloatRect) _float _float -> _bool)]
   [intersects
    (_fun
     (_ptr i _sfFloatRect)
     (_ptr i _sfFloatRect)
     (_ptr i _sfFloatRect)
     -> _bool)]))

(define-cstruct _sfIntRect
  ([left _int]
   [top _int]
   [width _int]
   [height _int]))

(define-all-types defgfx sfIntRect
  ([contains (_fun (_ptr i _sfIntRect) _int _int -> _bool)]
   [intersects
    (_fun
     (_ptr i _sfIntRect)
     (_ptr i _sfIntRect)
     (_ptr i _sfIntRect)
     -> _bool)]))


;;; Graphics/BlendMode.h
(define _sfBlendMode
  (_enum '(sfBlendAlpha sfBlendAdd, sfBlendMultiply, sfBlendNone)))


;;; Graphics/Color.h
(define-cstruct _sfColor
  ([r _uint8]
   [g _uint8]
   [b _uint8]
   [a _uint8]))

(define-all-types defgfx sfColor
  ([fromRGB
     (_fun _uint8 _uint8 _uint8 -> _sfColor)]
   [fromRGBA
     (_fun _uint8 _uint8 _uint8 _uint8 -> _sfColor)]
   [add (_fun _sfColor _sfColor -> _sfColor)]
   [modulate (_fun _sfColor _sfColor -> _sfColor)]))

;;; Graphics/Glyph.h
(define-cstruct _sfGlyph
  ([advance _int]
   [bounds _sfIntRect]
   [textureRect _sfIntRect]
   ))

;;; Graphics/Image.h
(define-all-types defgfx sfImage
  ([create (_fun _uint _uint -> _sfImage-pointer)]
   [createFromColor (_fun _uint _uint _sfColor -> _sfImage-pointer)]
   [createFromPixels (_fun _uint _uint (_ptr i _uint8) -> _sfImage-pointer)]
   [createFromFile (_fun _bytes -> _sfImage-pointer)]
   [createFromMemory (_fun (_ptr i _void) _uint -> _sfImage-pointer)]
   #;[createFromStream (_fun _sfInputStream -> _sfImage-pointer)]
   [copy (_fun _sfImage-pointer -> _sfImage-pointer)]
   [destroy (_fun _sfImage-pointer -> _void)]
   [saveToFile (_fun _sfImage-pointer _bytes -> _bool)]
   #;[getSize (_fun _sfImage-pointer -> _sfVector2u)]
   [createMaskFromColor (_fun _sfImage-pointer _sfColor _uint8 -> _void)]
   [copyImage
   (_fun _sfImage-pointer _sfImage-pointer _uint _uint _sfIntRect _bool -> _void)]
   [setPixel (_fun _sfImage-pointer _uint _uint _sfColor -> _void)]
   [getPixel (_fun _sfImage-pointer _uint _uint -> _sfColor)]
   [getPixelsPtr (_fun _sfImage-pointer -> (_ptr o _uint8))]
   [flipHorizontally (_fun _sfImage-pointer -> _void)]
   [flipVertically (_fun _sfImage-pointer -> _void)]))

;;; Graphics/PrimitiveType.h
(define _sfPrimitiveType
  (_enum '(sfPoints
           sfLines
           sfLinesStrip
           sfTriangles
           sfTrianglesStrip
           sfTrianglesFan
           sfQuads)))


;;; Graphics/Font.h
(define-all-types defgfx sfFont
  [[createFromFile (_fun _bytes -> _sfFont-pointer)]
   [createFromMemory (_fun (_ptr i _void) _uint -> _sfFont-pointer)]
   #;[createFromStream (_fun _sfInputStream-pointer  -> _sfFont-pointer)]
   [copy (_fun _sfFont-pointer  -> _sfFont-pointer)]
   [destroy (_fun _sfFont-pointer -> _void)]
   #;[getGlyph (_fun _sfFont-pointer _uint32 _uint _bool -> _sfGlyph)]
   [getKerning (_fun _sfFont-pointer _uint32 _uint32 _uint -> _int)]
   (getLineSpacing (_fun _sfFont-pointer _uint -> _int))
   (getTexture (_fun _sfFont-pointer _uint -> _sfTexture-pointer))])


(define-syntax define-all-types/shape
  (syntax-rules ()
    [(_ deffun prefix pointer-type)
     (define-all-types deffun prefix
       ([create (_fun -> pointer-type)]
        [copy (_fun pointer-type -> pointer-type)]
        [destroy (_fun pointer-type -> _void)]
        #;[setPosition (_fun pointer-type _sfVector2f -> _void)]
        [setRotation (_fun pointer-type _float -> _void)]
        #;[setScale (_fun pointer-type _sfVector2f -> _void)]
        #;[setOrigin (_fun pointer-type _sfVector2f -> _void)]
        #;[getPosition (_fun pointer-type -> _sfVector2f)]
        #;[getRotation (_fun pointer-type -> _float)]
        #;[getScale (_fun pointer-type -> _sfVector2f)]
        #;[getOrigin (_fun pointer-type -> _sfVector2f)]
        #;[move (_fun pointer-type _sfVector2f -> _void)]
        #;[rotate (_fun pointer-type _float -> _void)]
        #;[scale (_fun pointer-type _sfVector2f -> _void)]
        #;[getTransform (_fun pointer-type -> _sfTransform)]
        #;[getInverseTransform (_fun pointer-type -> _sfTransform)]
        [setTexture (_fun pointer-type _sfTexture-pointer _bool -> _void)]
        [setTextureRect (_fun pointer-type _sfIntRect -> _void)]
        [setFillColor (_fun pointer-type _sfColor -> _void)]
        [setOutlineColor (_fun pointer-type _sfColor -> _void)]
        [setOutlineThickness (_fun pointer-type _float -> _void)]
        [getTexture (_fun pointer-type -> _sfTexture-pointer)]
        [getTextureRect (_fun pointer-type -> _sfIntRect)]
        [getFillColor (_fun pointer-type -> _sfColor)]
        [getOutlineColor (_fun pointer-type -> _sfColor)]
        [getOutlineThickness (_fun pointer-type -> _float)]
        [getPointCount (_fun pointer-type -> _uint)]
        #;[getPoint (_fun pointer-type _uint -> _sfVector2f)]
        [setRadius (_fun pointer-type _float -> _void)]
        [getRadius (_fun pointer-type -> _float)]
        [setPointCount (_fun pointer-type _uint -> _void)]
        [getLocalBounds (_fun pointer-type -> _sfFloatRect)]
        [getGlobalBounds (_fun pointer-type -> _sfFloatRect)]
        ))]))

;;; Graphics/CircleShape.h
(define-all-types/shape defgfx sfCircleShape _sfCircleShape-pointer)

;;; Graphics/ConvexShape.h
(define-all-types/shape defgfx sfCircleShape _sfConvexShape-pointer)

;;; Graphics/RectangleShape.h
(define-all-types/shape defgfx sfCircleShape _sfRectangleShape-pointer)

;;; Graphics/RenderStates.h
(define-cstruct _sfRenderStates
  ([blendMode _sfBlendMode]
   #;[transform _sfTransform]
   [texture _sfTexture-pointer]
   [shader _sfShader-pointer]))

;;; Graphics/RenderTexture.h
(define-all-types defgfx sfTexture
  ([create (_fun _uint _uint _bool -> _sfRenderTexture-pointer)]
   [destroy (_fun _sfRenderTexture-pointer -> _void)]
   #;[getSize (_fun _sfRenderTexture-pointer -> _sfVector2u)]
   [setActive (_fun _sfRenderTexture-pointer _bool -> _bool)]
   [display (_fun _sfRenderTexture-pointer -> _void)]
   [clear (_fun _sfRenderTexture-pointer _sfColor -> _void)]
   [setView (_fun _sfRenderTexture-pointer _sfView-pointer -> _void)]
   [sfRenderTexture_getView (_fun _sfRenderTexture-pointer -> _sfView-pointer)]
   [sfRenderTexture_getDefaultView (_fun _sfRenderTexture-pointer -> _sfView-pointer)]
   [getViewport (_fun _sfRenderTexture-pointer _sfView-pointer -> _sfIntRect)]
   #;
   [mapPixelToCoords
    (_fun _sfRenderTexture-pointer
          _sfVector2i
          _sfVector2i
          -> _sfVector2f)]
   #;
   [mapCoordsToPixel
    (_fun _sfRenderTexture-pointer
          _sfVector2f
          _sfView-pointer
          -> sfVector2i)]
   [drawSprite
    (_fun _sfRenderTexture-pointer
          _sfSprite-pointer
          (_ptr i _sfRenderState)
          -> _void)]
   [drawText
    (_fun _sfRenderTexture-pointer
          _sfTexture-pointer
          (_ptr i _sfRenderState)
          -> _void)]
   [drawShape
    (_fun _sfRenderTexture-pointer
          _sfShape-pointer
          (_ptr i _sfRenderState)
          -> _void)]
   [drawCircleShape
    (_fun _sfRenderTexture-pointer
          _sfCircleShape-pointer
          (_ptr i _sfRenderState)
          -> _void)]
   [drawConvexShape
    (_fun _sfRenderTexture-pointer
          _sfConvexShape-pointer
          (_ptr i _sfRenderState)
          -> _void)]
   [drawRectangleShape
    (_fun _sfRenderTexture-pointer
          _sfRectangleShape-pointer
          (_ptr i _sfRenderState)
          -> _void)]
   [drawVertexArray
    (_fun _sfRenderTexture-pointer
          _sfVertexArray-pointer
          (_ptr i _sfRenderState)
          -> _void)]
   [drawPrimitives
    (_fun _sfRenderTexture-pointer
          (_ptr i _sfVertex)
          _uint
          _sfPrimitiveType
          (_ptr i _sfRenderState)
          -> _void)]
   [pushGLStates (_fun _sfRenderTexture-pointer -> _void)]
   [popGLStates (_fun _sfRenderTexture-pointer -> _void)]
   [resetGLStates (_fun _sfRenderTexture-pointer -> _void)]
   [sfRenderTexture_getTexture
    (_fun _sfRenderTexture-pointer -> _sfTexture-pointer)]
   [setSmooth (_fun _sfRenderTexture-pointer _bool -> _void)]
   [isSmooth (_fun _sfRenderTexture-pointer -> _bool)]))
