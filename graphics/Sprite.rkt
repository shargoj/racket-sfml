#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "defgfx.rkt"
 "../sfml-util.rkt"
 "../system/vector2.rkt"
 "color.rkt"
 "rect.rkt"
 "transform.rkt"
 "types.rkt")

(define-all-types defgfx sfSprite
  ([create (_fun -> _sfSprite-pointer)]
   [copy (_fun _sfSprite-pointer -> _sfSprite-pointer)]
   [destroy (_fun _sfSprite-pointer -> _void)]
   [setPosition (_fun _sfSprite-pointer _sfVector2f -> _void)]
   [setRotation (_fun _sfSprite-pointer _float -> _void)]
   [setScale (_fun _sfSprite-pointer _sfVector2f -> _void)]
   [setOrigin (_fun _sfSprite-pointer _sfVector2f -> _void)]
   [getPosition (_fun _sfSprite-pointer -> _sfVector2f)]
   [getRotation (_fun _sfSprite-pointer -> _float)]
   [getScale (_fun _sfSprite-pointer -> _sfVector2f)]
   [getOrigin (_fun _sfSprite-pointer -> _sfVector2f)]
   [move (_fun _sfSprite-pointer _sfVector2f -> _void)]
   [rotate (_fun _sfSprite-pointer _float -> _void)]
   [scale (_fun _sfSprite-pointer _sfVector2f -> _void)]
   [getTransform (_fun _sfSprite-pointer -> _sfTransform)]
   [getInverseTransform (_fun _sfSprite-pointer -> _sfTransform)]
   [setTexture
    (_fun _sfSprite-pointer _sfTexture-pointer _bool -> _void)]
   [setTextureRect (_fun _sfSprite-pointer _sfIntRect -> _void)]
   [setColor (_fun _sfSprite-pointer _sfColor -> _void)]
   [getTexture (_fun _sfSprite-pointer -> _sfTexture-pointer)]
   [getTextureRect (_fun _sfSprite-pointer -> _sfIntRect)]
   [getColor (_fun _sfSprite-pointer -> _sfColor)]
   [getLocalBounds (_fun _sfSprite-pointer -> _sfFloatRect)]
   [getGlobalBounds (_fun _sfSprite-pointer -> _sfFloatRect)]))
