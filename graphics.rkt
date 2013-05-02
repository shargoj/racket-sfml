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
        #;[setTextureRect (_fun pointer-type _sfIntRect -> _void)]
        [setFillColor (_fun pointer-type _sfColor -> _void)]
        [setOutlineColor (_fun pointer-type _sfColor -> _void)]
        [setOutlineThickness (_fun pointer-type _float -> _void)]
        [getTexture (_fun pointer-type -> _sfTexture-pointer)]
        #;[getTextureRect (_fun pointer-type -> _sfIntRect)]
        [getFillColor (_fun pointer-type -> _sfColor)]
        [getOutlineColor (_fun pointer-type -> _sfColor)]
        [getOutlineThickness (_fun pointer-type -> _float)]
        [getPointCount (_fun pointer-type -> _uint)]
        #;[getPoint (_fun pointer-type _uint -> _sfVector2f)]
        [setRadius (_fun pointer-type _float -> _void)]
        [getRadius (_fun pointer-type -> _float)]
        [setPointCount (_fun pointer-type _uint -> _void)]
        #;[getLocalBounds (_fun pointer-type -> _sfFloatRect)]
        #;[getGlobalBounds (_fun pointer-type -> _sfFloatRect)]
        ))]))

;;; Graphics/CircleShape.h
(define-all-types/shape defgfx sfCircleShape _sfCircleShape-pointer)

;;; Graphics/ConvexShape.h
(define-all-types/shape defgfx sfCircleShape _sfConvexShape-pointer)

;;; Graphics/RectangleShape.h
(define-all-types/shape defgfx sfCircleShape _sfRectangleShape-pointer)
