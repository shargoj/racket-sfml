#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defaudio.rkt"
 "types.rkt")
#;
(define _sfSoundRecorderStartCallback
  (_cprocedure (list (_ptr i _void)) _bool))
#;
(define _sfSoundRecorderProcessCallback
  (_cprocedure (list (_ptr i _int16) _uint (_ptr i _void)) _bool))
#;
(define _sfSoundRecorderStopCallback
  (_cprocedure (list (_ptr i _void)) _bool))

(define _sfSoundRecorderStartCallback
  (_fun (_ptr i _void) -> _bool))

(define _sfSoundRecorderProcessCallback
  (_fun (_ptr i _int16) _uint (_ptr i _void) -> _bool))

(define _sfSoundRecorderStopCallback
  (_fun (_ptr i _void) -> _bool))

(define-all-types defaudio sfSoundRecorder
  ([create
    (_fun
     _sfSoundRecorderStartCallback
     _sfSoundRecorderProcessCallback
     _sfSoundRecorderStopCallback
     (_ptr i _void)
     -> _sfSoundRecorder-pointer)]
   [destroy (_fun _sfSoundRecorder-pointer -> _void)]
   [start (_fun _sfSoundRecorder-pointer _uint -> _void)]
   [stop (_fun _sfSoundRecorder-pointer -> _void)]
   [getSampleRate (_fun _sfSoundRecorder-pointer -> _uint)]
   [isAvailable (_fun -> _bool)]))
