#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "../system/inputstream.rkt"
 "../system/time.rkt"
 "defaudio.rkt"
 "types.rkt")

(define-all-types defaudio sfSoundBuffer
  ([createFromFile (_fun _bytes -> _sfSoundBuffer-pointer)]
   [createFromMemory
    (_fun (_ptr i _void) _uint -> _sfSoundBuffer-pointer)]
   [createFromStream
    (_fun _sfInputStream-pointer -> _sfSoundBuffer-pointer)]
   [createFromSamples
    (_fun
     (_ptr i _uint16)
     _uint
     _uint
     _uint
     -> _sfSoundBuffer-pointer)]
   [copy (_fun _sfSoundBuffer-pointer -> _sfSoundBuffer-pointer)]
   [destroy (_fun _sfSoundBuffer-pointer -> _void)]
   [saveToFile (_fun _sfSoundBuffer-pointer _bytes -> _bool)]
   [getSamples (_fun _sfSoundBuffer-pointer -> (_ptr o _uint16))]
   [getSampleCount (_fun _sfSoundBuffer-pointer -> _uint)]
   [getSampleRate
    (_fun _sfSoundBuffer-pointer -> _uint)]
   [getChannelCount
    (_fun _sfSoundBuffer-pointer -> _uint)]
   [getDuration (_fun _sfSoundBuffer-pointer -> _sfTime)]))
