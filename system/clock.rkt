#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defsys.rkt"
 "types.rkt"
 "time.rkt")

(define-all-types defsys sfClock
  ([create (_fun -> _sfClock-pointer)]
   [copy (_fun _sfClock-pointer -> _sfClock-pointer)]
   [destroy (_fun _sfClock-pointer -> _void)]
   [getElapsedTime (_fun _sfClock-pointer -> _sfTime)]
   [restart (_fun _sfClock-pointer -> _sfTime)]))
