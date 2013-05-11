#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defaudio.rkt"
 "types.rkt")

(define-all-types defaudio sfSoundBufferRecorder
  ([create (_fun -> _sfSoundBufferRecorder-pointer)]
   [destroy (_fun _sfSoundBufferRecorder-pointer -> _void)]
   [start (_fun _sfSoundBufferRecorder-pointer _uint -> _void)]
   [stop (_fun _sfSoundBufferRecorder-pointer -> _void)]
   [_getSampleRate
    (_fun _sfSoundBufferRecorder-pointer -> _uint)]
   [getBuffer
    (_fun
     _sfSoundBufferRecorder-pointer
     -> _sfSoundBuffer-pointer)]))
