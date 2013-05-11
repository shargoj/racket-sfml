#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "../system/vector2.rkt"
 "event.rkt"
 "types.rkt"
 "windowhandle.rkt"
 "videomode.rkt"
 "defwin.rkt")

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

(define-all-types defwin sfWindow
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

   [getPosition
    (_fun _sfWindow-pointer -> _sfVector2i)]

   [setPosition
    (_fun _sfWindow-pointer _sfVector2i -> _void)]

   [getSize
    (_fun _sfWindow-pointer -> _sfVector2u)]

   [setSize
    (_fun _sfWindow-pointer _sfVector2u -> _void)]))
