#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "../system/vector2.rkt"
 "defgfx.rkt"
 "types.rkt"
 "rect.rkt")

(define-all-types defgfx sfView
  ([create (_fun -> _sfView-pointer)]
   [createFromRect (_fun _sfFloatRect -> _sfView-pointer)]
   [copy (_fun _sfView-pointer -> _sfView-pointer)]
   [destroy (_fun _sfView-pointer -> _void)]
   [setCenter (_fun _sfView-pointer _sfVector2f -> _void)]
   [setSize (_fun _sfView-pointer _sfVector2f -> _void)]
   [setRotation (_fun _sfView-pointer _float -> _void)]
   [setViewport (_fun _sfView-pointer _sfFloatRect -> _void)]
   [reset (_fun _sfView-pointer _sfFloatRect -> _void)]
   [getCenter (_fun _sfView-pointer -> _sfVector2f)]
   [getSize (_fun _sfView-pointer -> _sfVector2f)]
   [getRotation (_fun _sfView-pointer -> _float)]
   [getViewport (_fun _sfView-pointer -> _sfFloatRect)]
   [move (_fun _sfView-pointer _sfVector2f -> _void)]
   [rotate (_fun _sfView-pointer _float -> _void)]
   [zoom (_fun _sfView-pointer _float -> _void)]))
