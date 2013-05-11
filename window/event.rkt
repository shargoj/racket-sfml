#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "keyboard.rkt"
 "mouse.rkt"
 "joystick.rkt"
 "defwin.rkt")

(define _sfEventType
  (_enum '(sfEvtClosed
           sfEvtResized
           sfEvtLostFocus
           sfEvtGainedFocus
           sfEvtTextEntered
           sfEvtKeyPressed
           sfEvtKeyReleased
           sfEvtMouseWheelMoved
           sfEvtMouseButtonPressed
           sfEvtMouseButtonReleased
           sfEvtMouseMoved
           sfEvtMouseEntered
           sfEvtMouseLeft
           sfEvtJoystickButtonPressed
           sfEvtJoystickButtonReleased
           sfEvtJoystickMoved
           sfEvtJoystickConnected
           sfEvtJoystickDisconnected)))

(define-cstruct _sfKeyEvent
  ([type _sfEventType]
   [code _sfKeyCode]
   [alt _bool]
   [control _bool]
   [shift _bool]
   [system _bool]))

(define-cstruct _sfTextEvent
  ([type _sfEventType] [unicode _uint32]))

(define-cstruct _sfMouseMoveEvent
  ([type _sfEventType]
   [x _int]
   [y _int]))

(define-cstruct _sfMouseButtonEvent
  ([type _sfEventType]
   [button _sfMouseButton]
   [x _int]
   [y _int]))

(define-cstruct _sfMouseWheelEvent
  ([type _sfEventType]
   [delta _int]
   [x _int]
   [y _int]))

(define-cstruct _sfJoystickMoveEvent
  ([type _sfEventType]
   [joystickId _uint]
   [axis _sfJoystickAxis]
   [position _float]))

(define-cstruct _sfJoystickButtonEvent
  ([type _sfEventType]
   [joystickId _uint]
   [button _uint]))

(define-cstruct _sfJoystickConnectEvent
  ([type _sfEventType]
   [joystickId _uint]))

(define-cstruct _sfSizeEvent
  ([type _sfEventType]
   [width _uint]
   [height _uint]))

(define _sfEvent
  (make-union-type _sfEventType
                   _sfSizeEvent
                   _sfKeyEvent
                   _sfTextEvent
                   _sfMouseMoveEvent
                   _sfMouseButtonEvent
                   _sfMouseWheelEvent
                   _sfJoystickMoveEvent
                   _sfJoystickButtonEvent
                   _sfJoystickConnectEvent))

(define (sfEvent-pointer) (_cpointer _sfEvent))
