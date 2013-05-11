#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defwin.rkt"
 "types.rkt"
 "../system/vector2.rkt")

(define _sfMouseButton
  (_enum
   '(sfMouseLeft
     sfMouseRight
     sfMouseMiddle
     sfMouseXButton1
     sfMouseXButton2
     sfMouseButtonCount)))

(define-all-types defwin sfMouse
  ([isButtonPressed (_fun _sfMouseButton -> _bool)]
   [getPosition (_fun _sfWindow-pointer -> _sfVector2i)]
   [setPosition (_fun _sfWindow-pointer _sfVector2i -> _void)]))
