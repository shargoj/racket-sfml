#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         "../window.rkt"
         "../sfml-util.rkt"
         "defgfx.rkt"
         "Types.rkt"
         "Color.rkt"
         "Rect.rkt"
         "RenderStates.rkt")

(define-all-types defgfx sfRenderWindow
  ([create
    (_fun
     _sfVideoMode
     _bytes
     _uint32
     _sfContextSettings-pointer
     -> _sfRenderWindow-pointer)]
   [createUnicode
    (_fun
     _sfVideoMode
     (_ptr i _uint32)
     _uint32
     _sfContextSettings-pointer
     -> _sfRenderWindow-pointer)]
   [createFromHandle
    (_fun
     _sfWindowHandle
     _sfContextSettings-pointer
     -> _sfRenderWindow-pointer)]
   [destroy
    (_fun _sfRenderWindow-pointer -> _void)]
   [close
    (_fun _sfRenderWindow-pointer -> _void)]
   [isOpen
    (_fun _sfRenderWindow-pointer -> _bool)]
   [getSettings
    (_fun _sfRenderWindow-pointer -> _sfContextSettings)]
   [pollEvent
    (_fun
     _sfRenderWindow-pointer
     (event : (_ptr o _sfEvent))
     -> (had-event? : _bool)
     -> (values event had-event?))]
   [waitEvent
    (_fun
     _sfRenderWindow-pointer
     (event : (_ptr o _sfEvent))
     -> (had-event? : _bool)
     -> (values event had-event?))]
   #;[getPosition
    (_fun _sfRenderWindow-pointer -> _sfVector2i)]
   #;[setPosition
    (_fun _sfRenderWindow-pointer _sfVector2i -> _void)]
   #;[getSize
    (_fun _sfRenderWindow-pointer -> _sfVector2u)]
   #;[setSize
    (_fun _sfRenderWindow-pointer _sfVector2u -> _void)]
   [setTitle
    (_fun _sfRenderWindow-pointer _bytes -> _void)]
   [setUnicodeTitle
    (_fun _sfRenderWindow-pointer (_ptr i _uint32) -> _void)]
   [setIcon
    (_fun
     _sfRenderWindow-pointer
     _uint
     _uint
     (_ptr i _uint8) -> _void)]
   [setVisible
    (_fun _sfRenderWindow-pointer _bool -> _void)]
   [setMouseCursorVisible
    (_fun _sfRenderWindow-pointer _bool -> _void)]
   [setVerticalSyncEnabled
    (_fun _sfRenderWindow-pointer _bool -> _void)]
   [setKeyRepeatEnabled
    (_fun _sfRenderWindow-pointer _bool -> _void)]
   [setActive
    (_fun _sfRenderWindow-pointer _bool -> _bool)]
   [display
    (_fun _sfRenderWindow-pointer -> _void)]
   [setFramerateLimit
    (_fun _sfRenderWindow-pointer _uint -> _void)]
   [setJoystickThreshold
    (_fun _sfRenderWindow-pointer _float -> _void)]
   [getSystemHandle
    (_fun _sfRenderWindow-pointer -> _sfWindowHandle)]
   [clear
    (_fun _sfRenderWindow-pointer _sfColor -> _void)]
   [setView
    (_fun _sfRenderWindow-pointer _sfView-pointer -> _void)]
   [getView
    (_fun _sfRenderWindow-pointer -> _sfView-pointer)]
   [getDefaultView
    (_fun _sfRenderWindow-pointer -> _sfView-pointer)]
   [getViewport
    (_fun _sfRenderWindow-pointer _sfView-pointer -> _sfIntRect)]
   #;
   [mapPixelToCoords
    (_fun
     _sfRenderWindow-pointer
     _sfVector2i
     _sfView-pointer
     -> _sfVector2f)]
   #;
   [mapCoordsToPixel
    (_fun
     _sfRenderWindow-pointer
     _sfVector2f
     _sfView-pointer
     -> _sfVector2i)]
   [drawSprite
    (_fun
     _sfRenderWindow-pointer
     _sfSprite-pointer
     _sfRenderStates-pointer
     -> _void)]
   [drawText
    (_fun
     _sfRenderWindow-pointer
     _sfText-pointer
     _sfRenderStates-pointer
     -> _void)]
   [drawShape
    (_fun
     _sfRenderWindow-pointer
     _sfShape-pointer
     _sfRenderStates-pointer
     -> _void)]
   [drawCircleShape
    (_fun
     _sfRenderWindow-pointer
     _sfCircleShape-pointer
     _sfRenderStates-pointer
     -> _void)]
   [drawConvexShape
    (_fun
     _sfRenderWindow-pointer
     _sfConvexShape-pointer
     _sfRenderStates-pointer
     -> _void)]
   [drawRectangleShape
    (_fun
     _sfRenderWindow-pointer
     _sfRectangleShape-pointer
     _sfRenderStates-pointer
     -> _void)]
   [drawVertexArray
    (_fun
     _sfRenderWindow-pointer
     _sfVertexArray-pointer
     _sfRenderStates-pointer -> _void)]
   #;
   [drawPrimitives
    (_fun
     _sfRenderWindow-pointer
     _sfVertex-pointer
     _uint
     _sfPrimitiveType
     _sfRenderStates-pointer
     -> _void)]
   [pushGLStates
    (_fun _sfRenderWindow-pointer -> _void)]
   [popGLStates
    (_fun _sfRenderWindow-pointer -> _void)]
   [resetGLStates
    (_fun _sfRenderWindow-pointer -> _void)]
   [capture
    (_fun _sfRenderWindow-pointer -> _sfImage-pointer)]))

(define-all-types defgfx sfMouse
  (#;
   [getPositionRenderWindow
    (_fun _sfRenderWindow-pointer -> _sfVector2i)]
   #;
   [setPositionRenderWindow
    (_fun _sfVector2i _sfRenderWindow-pointer -> _void)]))
