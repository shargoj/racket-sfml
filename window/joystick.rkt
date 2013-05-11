#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defwin.rkt")

(define _sfJoystickAxis
  (_enum '(sfJoystickX
           sfJoystickY
           sfJoystickZ
           sfJoystickR
           sfJoystickU
           sfJoystickV
           sfJoystickPovX
           sfJoystickPovY)))

(define-all-types defwin sfJoystick
  ([isConnected (_fun _uint -> _bool)]
   [getButtonCount (_fun _uint -> _uint)]
   [hasAxis (_fun _uint _sfJoystickAxis -> _bool)]
   [isButtonPressed (_fun _uint _uint -> _bool)]
   [getAxisPosition (_fun _uint _sfJoystickAxis -> _float)]
   [update (_fun -> _void)]))
