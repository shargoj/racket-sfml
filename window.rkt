#lang racket

(require racket/provide)
#;
(provide
 (filtered-out
  (lambda (name)
    (if (or (regexp-match? #rx"sf.*" name)
            (regexp-match? #rx"make-.*" name)
            (eq? name "_sfEvent"))
        name
        #f))
  (all-defined-out)))

(provide (all-defined-out))

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer define-sfwin (ffi-lib "libcsfml-window"))

;;; Window/Types.h (ish)
(define _sfWindow-pointer (_cpointer 'sfWindow))
(define _sfContext-pointer (_cpointer 'sfContext))

;;; Window/WindowHandle.h
(define _sfWindowHandle (_cpointer 'sfWindowHandle))

;;; Window/Context.h
(define-sfwin sfContext_create
  (_fun -> _sfContext-pointer))

(define-sfwin sfContext_destroy
  (_fun _sfContext-pointer -> _void))

(define-sfwin sfContext_setActive
  (_fun _sfContext-pointer _bool -> _void))

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

(define-sfwin sfJoystick_isConnected
  (_fun _uint -> _bool))

(define-sfwin sfJoystick_getButtonCount
  (_fun _uint -> _uint))

(define-sfwin sfJoystick_hasAxis
  (_fun _uint _sfJoystickAxis -> _bool))

(define-sfwin sfJoystick_isButtonPressed
  (_fun _uint _uint -> _bool))

(define-sfwin sfJoystick_getAxisPosition
  (_fun _uint _sfJoystickAxis -> _float))

(define-sfwin sfJoystick_update (_fun -> _void))

;;; Window/Keyboard.h
(define _sfKeyCode
  (_enum '(sfKeyUnknown = 0
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

(define-sfwin sfKeyboard_isKeyPressed
  (_fun _sfKeyCode -> _bool))

;;; Window/Mouse.h
(define _sfMouseButton
  (_enum
   '(sfMouseLeft
     sfMouseRight
     sfMouseMiddle
     sfMouseXButton1
     sfMouseXButton2
     sfMouseButtonCount)))

(define-sfwin sfMouse_isButtonPressed
  (_fun _sfMouseButton -> _bool))

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

(define-sfwin sfVideoMode_getDesktopMode (_fun -> _sfVideoMode))

(define-sfwin sfVideoMode_getFullscreenModes
  (_fun (_ptr o _uint8) -> _sfVideoMode-pointer))

(define-sfwin sfVideoMode_isValid
  (_fun _sfVideoMode -> _bool))

;;; Window/Window.h
;; TODO - encode this in a more mathematical way
(define _windowStyles (_enum `(sfNone = 0
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

(define-sfwin sfWindow_create
  (_fun _sfVideoMode _bytes _windowStyles _sfContextSettings-pointer ->
        _sfWindow-pointer))

(define-sfwin sfWindow_createUnicode
  (_fun _sfVideoMode _string/utf-8 _uint32 _sfContextSettings-pointer
        -> _sfWindow-pointer))

(define-sfwin sfWindow_createFromHandle
  (_fun _sfWindowHandle _sfContextSettings-pointer
        -> _sfWindow-pointer))

(define-sfwin sfWindow_destroy (_fun _sfWindow-pointer -> _void))

(define-sfwin sfWindow_close (_fun _sfWindow-pointer -> _void))

(define-sfwin sfWindow_isOpen (_fun _sfWindow-pointer -> _bool))

(define-sfwin sfWindow_getSettings
  (_fun _sfWindow-pointer -> _sfContextSettings))

(define-sfwin sfWindow_pollEvent
  (_fun _sfWindow-pointer
        (event : (_ptr o _sfEvent))
        -> (had-event? : _bool)
        -> (values event had-event?)))

(define-sfwin sfWindow_waitEvent
  (_fun _sfWindow-pointer (_ptr o _sfEvent) -> _bool))

#|
(define-sfwin sfWindow_getPosition
  (_fun _sfWindow-pointer -> sfVector2i))

(define-sfwin sfWindow_setPosition
  (_fun _sfWindow-pointer _sfVector2i -> _void))

(define-sfwin sfWindow_getSize
  (_fun _sfWindow-pointer -> sfVector2u))

(define-sfwin sfWindow_setSize
  (_fun _sfWindow-pointer _sfVector2u -> _void))
|#

(define-sfwin sfWindow_setTitle
  (_fun _sfWindow-pointer _bytes -> _void))

(define-sfwin sfWindow_setUnicodeTitle
  (_fun _sfWindow-pointer _string/utf-8 -> _void))

(define-sfwin sfWindow_setIcon
  (_fun _sfWindow-pointer _uint _uint (_ptr i _uint8)
        -> _void))

(define-sfwin sfWindow_setVisible
  (_fun _sfWindow-pointer _bool -> _void))

(define-sfwin sfWindow_setMouseCursorVisible
  (_fun _sfWindow-pointer _bool -> _void))

(define-sfwin sfWindow_setVerticalSyncEnabled
  (_fun _sfWindow-pointer _bool -> _void))

(define-sfwin sfWindow_setKeyRepeatEnabled
  (_fun _sfWindow-pointer _bool -> _void))

(define-sfwin sfWindow_setActive
  (_fun _sfWindow-pointer _bool -> _void))

(define-sfwin sfWindow_display (_fun _sfWindow-pointer -> _void))

(define-sfwin sfWindow_setFramerateLimit
  (_fun _sfWindow-pointer _uint -> _void))

(define-sfwin sfWindow_setJoystickThreshold
  (_fun _sfWindow-pointer _float -> _void))

(define-sfwin sfWindow_getSystemHandle
  (_fun _sfWindow-pointer -> _sfWindowHandle))
