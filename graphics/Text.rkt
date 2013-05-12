#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "../system/vector2.rkt"
 "color.rkt"
 "transform.rkt"
 "types.rkt"
 "rect.rkt"
 "defgfx.rkt")

(define _sfTextStyle
  (_enum
   '(sfTextRegular = 0
                   sfTextBold = 1
                   sfTextBold = 2
                   sfTextBold = 4)))

(define-all-types defgfx sfText
  ([create (_fun -> _sfText-pointer)]
   [copy (_fun _sfText-pointer -> _sfText-pointer)]
   [destroy (_fun _sfText-pointer -> _void)]
   [setPosition (_fun _sfText-pointer _sfVector2f -> _void)]
   [setRotation (_fun _sfText-pointer _float -> _void)]
   [setScale (_fun _sfText-pointer _sfVector2f -> _void)]
   [setOrigin (_fun _sfText-pointer _sfVector2f -> _void)]
   [getPosition (_fun _sfText-pointer -> _sfVector2f)]
   [getRotation (_fun _sfText-pointer -> _float)]
   [getScale (_fun _sfText-pointer -> _sfVector2f)]
   [getOrigin (_fun _sfText-pointer -> _sfVector2f)]
   [move (_fun _sfText-pointer _sfVector2f -> _void)]
   [rotate (_fun _sfText-pointer _float -> _void)]
   [scale (_fun _sfText-pointer _sfVector2f -> _void)]
   [getTransform (_fun _sfText-pointer -> _sfTransform)]
   [getInverseTransform (_fun _sfText-pointer -> _sfTransform)]
   [setString (_fun _sfText-pointer _bytes -> _void)]
   [setUnicodeString
    (_fun _sfText-pointer (_ptr i _uint32) -> _void)]
   [setFont (_fun _sfText-pointer _sfFont-pointer -> _void)]
   [setCharacterSize (_fun _sfText-pointer _uint -> _void)]
   [setStyle (_fun _sfText-pointer _uint32 -> _void)]
   [setColor (_fun _sfText-pointer _sfColor -> _void)]
   [getString (_fun _sfText-pointer -> _bytes)]
   [getUnicodeString (_fun _sfText-pointer -> (_ptr o _uint32))]
   [getFont (_fun _sfText-pointer -> _sfFont-pointer)]
   [getCharacterSize(_fun _sfText-pointer -> _uint)]
   [getStyle (_fun _sfText-pointer -> _uint32)]
   [getColor (_fun _sfText-pointer -> _sfColor)]
   [findCharacterPos (_fun _sfText-pointer _uint -> _sfVector2f)]
   [getLocalBounds (_fun _sfText-pointer -> _sfFloatRect)]
   [getGlobalBounds (_fun _sfText-pointer -> _sfFloatRect)]))
