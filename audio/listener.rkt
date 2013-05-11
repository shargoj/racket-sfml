#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "../system/vector3.rkt"
 "defaudio.rkt")

(define-all-types defaudio sfListener
  ([setGlobalVolume (_fun _float  -> _void)]
   [getGlobalVolume (_fun  -> _float)]
   [setPosition (_fun _sfVector3f  -> _void)]
   [getPosition (_fun  -> _sfVector3f)]
   [setDirection (_fun _sfVector3f  -> _void)]
   [getDirection (_fun  -> _sfVector3f)]))
