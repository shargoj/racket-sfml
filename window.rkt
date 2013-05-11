#lang racket

(require ffi/unsafe
         ffi/unsafe/define
         "sfml-util.rkt")

(provide (all-defined-out))


(define-ffi-definer define-sfwin (ffi-lib "libcsfml-window"))

;;; Window/Types.h (ish)
(define _sfWindow-pointer (_cpointer 'sfWindow))
(define _sfContext-pointer (_cpointer 'sfContext))

;;; Window/WindowHandle.h
(define _sfWindowHandle (_cpointer 'sfWindowHandle))

;;; Window/Context.h
(define-all-types define-sfwin sfContext
  ([create (_fun -> _sfContext-pointer)]
   [destroy (_fun _sfContext-pointer -> _void)]
   [setActive (_fun _sfContext-pointer _bool -> _void)]))

;;; Window/Joystick.h
(define _sfJoystickAxis
  (_enum '(sfJoystickX
           sfJoystickY
           sfJoystickZ
           sfJoystickR
           sfJoystickU
           sfJoystickV
           sfJoystickPovX
           sfJoystickPovY)))

(define-all-types define-sfwin sfJoystick
  ([isConnected (_fun _uint -> _bool)]
   [getButtonCount (_fun _uint -> _uint)]
   [hasAxis (_fun _uint _sfJoystickAxis -> _bool)]
   [isButtonPressed (_fun _uint _uint -> _bool)]
   [getAxisPosition (_fun _uint _sfJoystickAxis -> _float)]
   [update (_fun -> _void)]))

;;; Window/Keyboard.h
(define _sfKeyCode
  (_enum '(sfKeyUnknown = -1
                        sfKeyA
                        sfKeyB
                        sfKeyC
                        sfKeyD
                        sfKeyE
                        sfKeyF
                        sfKeyG
                        sfKeyH
                        sfKeyI
                        sfKeyJ
                        sfKeyK
                        sfKeyL
                        sfKeyM
                        sfKeyN
                        sfKeyO
                        sfKeyP
                        sfKeyQ
                        sfKeyR
                        sfKeyS
                        sfKeyT
                        sfKeyU
                        sfKeyV
                        sfKeyW
                        sfKeyX
                        sfKeyY
                        sfKeyZ
                        sfKeyNum0
                        sfKeyNum1
                        sfKeyNum2
                        sfKeyNum3
                        sfKeyNum4
                        sfKeyNum5
                        sfKeyNum6
                        sfKeyNum7
                        sfKeyNum8
                        sfKeyNum9
                        sfKeyEscape
                        sfKeyLControl
                        sfKeyLShift
                        sfKeyLAlt
                        sfKeyLSystem
                        sfKeyRControl
                        sfKeyRShift
                        sfKeyRAlt
                        sfKeyRSystem
                        sfKeyMenu
                        sfKeyLBracket key
                        sfKeySemiColon
                        sfKeyComma
                        sfKeyPeriod
                        sfKeyQuote
                        sfKeySlash
                        sfKeyBackSlash
                        sfKeyTilde
                        sfKeyEqual
                        sfKeyDash
                        sfKeySpace
                        sfKeyReturn
                        sfKeyBack
                        sfKeyTab
                        sfKeyPageUp
                        sfKeyPageDown
                        sfKeyEnd
                        sfKeyHome
                        sfKeyInsert
                        sfKeyDelete
                        sfKeyAdd
                        sfKeySubtract
                        sfKeyMultiply
                        sfKeyDivide
                        sfKeyLeft
                        sfKeyRight
                        sfKeyUp
                        sfKeyDown
                        sfKeyNumpad0
                        sfKeyNumpad1
                        sfKeyNumpad2
                        sfKeyNumpad3
                        sfKeyNumpad4
                        sfKeyNumpad5
                        sfKeyNumpad6
                        sfKeyNumpad7
                        sfKeyNumpad8
                        sfKeyNumpad9
                        sfKeyF1
                        sfKeyF2
                        sfKeyF3
                        sfKeyF4
                        sfKeyF5
                        sfKeyF6
                        sfKeyF7
                        sfKeyF8
                        sfKeyF9
                        sfKeyF10
                        sfKeyF11
                        sfKeyF12
                        sfKeyF13
                        sfKeyF14
                        sfKeyF15
                        sfKeyPause
                        sfKeyCount)))

(define-sfwin sfKeyboard_isKeyPressed (_fun _sfKeyCode -> _bool))

;;; Window/Mouse.h
(define _sfMouseButton
  (_enum
   '(sfMouseLeft
     sfMouseRight
     sfMouseMiddle
     sfMouseXButton1
     sfMouseXButton2
     sfMouseButtonCount)))

(define-sfwin sfMouse_isButtonPressed (_fun _sfMouseButton -> _bool))

#|
(define-sfwin sfMouse_getPosition
  (_fun _sfWindow-pointer -> _sfVector2i))

(define-sfwin sfMouse_setPosition
  (_fun _sfWindow-pointer _sfVector2i -> _void))
|#

;;; Window/Event.h
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

;;; Window/VideoMode.h
(define-cstruct _sfVideoMode
  ([width _uint]
   [height _uint]
   [bitsPerPixel _uint]))

(define-all-types define-sfwin sfVideoMode
  ([getDesktopMode (_fun -> _sfVideoMode)]
   [getFullscreenModes (_fun (_ptr o _uint8) -> _sfVideoMode-pointer)]
   [isValid (_fun _sfVideoMode -> _bool)]))

;;; Window/Window.h
;; TODO - encode this in a more mathematical way

(define _windowStyles
  (_enum `(sfNone = 0
                  sfTitlebar = 1
                  sfResize = 2
                  sfClose = 4
                  sfFullscreen = 8
                  sfDefaultStyle = 7)))

(define-cstruct _sfContextSettings
  ([depthBits _uint]
   [stencilBits _uint]
   [antialiasingLevel _uint]
   [majorVersion _uint]
   [minorVersion _uint]))



(define-all-types define-sfwin sfWindow
  ([create
    (_fun
     _sfVideoMode
     _bytes
     _windowStyles
     _sfContextSettings-pointer
     -> _sfWindow-pointer)]

   [createUnicode
    (_fun
     _sfVideoMode
     _string/utf-8
     _uint32
     _sfContextSettings-pointer
     -> _sfWindow-pointer)]

   [createFromHandle
    (_fun
     _sfWindowHandle
     _sfContextSettings-pointer
     -> _sfWindow-pointer)]

   [destroy
    (_fun _sfWindow-pointer -> _void)]

   [close
    (_fun _sfWindow-pointer -> _void)]

   [isOpen
    (_fun _sfWindow-pointer -> _bool)]

   [getSettings
    (_fun _sfWindow-pointer -> _sfContextSettings)]

   [pollEvent
    (_fun
     _sfWindow-pointer
     (event : (_ptr o _sfEvent))
     -> (had-event? : _bool)
     -> (values event had-event?))]

   [waitEvent
    (_fun
     _sfWindow-pointer
     (event : (_ptr o _sfEvent))
     -> (had-event? : _bool)
     -> (values event had-event?))]


   [setTitle
    (_fun _sfWindow-pointer _bytes -> _void)]

   [setUnicodeTitle
    (_fun _sfWindow-pointer _string/utf-8 -> _void)]

   [setIcon
    (_fun _sfWindow-pointer _uint _uint (_ptr i _uint8)
          -> _void)]

   [setVisible
    (_fun _sfWindow-pointer _bool -> _void)]

   [setMouseCursorVisible
    (_fun _sfWindow-pointer _bool -> _void)]

   [setVerticalSyncEnabled
    (_fun _sfWindow-pointer _bool -> _void)]

   [setKeyRepeatEnabled
    (_fun _sfWindow-pointer _bool -> _void)]

   [setActive
    (_fun _sfWindow-pointer _bool -> _void)]

   [display
    (_fun _sfWindow-pointer -> _void)]

   [setFramerateLimit
    (_fun _sfWindow-pointer _uint -> _void)]

   [setJoystickThreshold
    (_fun _sfWindow-pointer _float -> _void)]

   [getSystemHandle
    (_fun _sfWindow-pointer -> _sfWindowHandle)]

   #;
   [getPosition
    (_fun _sfWindow-pointer -> sfVector2i)]

   #;
   [setPosition
    (_fun _sfWindow-pointer _sfVector2i -> _void)]

   #;
   [getSize
    (_fun _sfWindow-pointer -> sfVector2u)]

   #;
   [setSize
    (_fun _sfWindow-pointer _sfVector2u -> _void)]))
