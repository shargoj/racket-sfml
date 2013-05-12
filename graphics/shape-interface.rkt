#lang racket

(provide define-all-types/shape)
(require ffi/unsafe
         "../sfml-util.rkt"
         "../system/vector2.rkt"
         "defgfx.rkt"
         "transform.rkt"
         "types.rkt"
         "rect.rkt"
         "color.rkt")

(define-syntax define-all-types/shape
  (syntax-rules ()
    [(_ deffun prefix pointer-type)
     (define-all-types deffun prefix
       ([create (_fun -> pointer-type)]
        [copy (_fun pointer-type -> pointer-type)]
        [destroy (_fun pointer-type -> _void)]
        [setPosition (_fun pointer-type _sfVector2f -> _void)]
        [setRotation (_fun pointer-type _float -> _void)]
        [setScale (_fun pointer-type _sfVector2f -> _void)]
        [setOrigin (_fun pointer-type _sfVector2f -> _void)]
        [getPosition (_fun pointer-type -> _sfVector2f)]
        [getRotation (_fun pointer-type -> _float)]
        [getScale (_fun pointer-type -> _sfVector2f)]
        [getOrigin (_fun pointer-type -> _sfVector2f)]
        [move (_fun pointer-type _sfVector2f -> _void)]
        [rotate (_fun pointer-type _float -> _void)]
        [scale (_fun pointer-type _sfVector2f -> _void)]
        [getTransform (_fun pointer-type -> _sfTransform)]
        [getInverseTransform (_fun pointer-type -> _sfTransform)]
        [setTexture
         (_fun pointer-type _sfTexture-pointer _bool -> _void)]
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
        [getPoint (_fun pointer-type _uint -> _sfVector2f)]
        [setRadius (_fun pointer-type _float -> _void)]
        [getRadius (_fun pointer-type -> _float)]
        [setPointCount (_fun pointer-type _uint -> _void)]
        [getLocalBounds (_fun pointer-type -> _sfFloatRect)]
        [getGlobalBounds (_fun pointer-type -> _sfFloatRect)]))]))
