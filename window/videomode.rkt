#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defwin.rkt")

(define-cstruct _sfVideoMode
  ([width _uint]
   [height _uint]
   [bitsPerPixel _uint]))

(define-all-types defwin sfVideoMode
  ([getDesktopMode (_fun -> _sfVideoMode)]
   [getFullscreenModes
    (_fun (_ptr o _uint8) -> _sfVideoMode-pointer)]
   [isValid (_fun _sfVideoMode -> _bool)]))
