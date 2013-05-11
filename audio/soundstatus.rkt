#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defaudio.rkt")

(define _sfSoundStatus
  (_enum '(sfStopped sfPaused sfPlaying)))
