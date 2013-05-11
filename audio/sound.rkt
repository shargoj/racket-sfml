#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defaudio.rkt"
 "types.rkt"
 "soundstatus.rkt")

(define-all-types defaudio sfSound
  ([create (_fun -> _sfSound-pointer)]
   [copy (_fun _sfSound-pointer -> _sfSound-pointer)]
   [destroy (_fun _sfSound-pointer -> _void)]
   [play (_fun _sfSound-pointer -> _void)]
   [pause (_fun _sfSound-pointer -> _void)]
   [stop (_fun _sfSound-pointer -> _void)]
   [setBuffer
    (_fun _sfSound-pointer _sfSoundBuffer-pointer -> _void)]
   [getBuffer (_fun _sfSound-pointer -> _sfSoundBuffer-pointer)]
   [setLoop (_fun _sfSound-pointer _bool -> _void)]
   [getLoop (_fun _sfSound-pointer -> _bool)]
   [getStatus (_fun _sfSound-pointer -> _sfSoundStatus)]
   [setPitch (_fun _sfSound-pointer _float -> _void)]
   [setVolume (_fun _sfSound-pointer _float -> _void)]
   #;[setPosition (_fun _sfSound-pointer _sfVector3f -> _void)]
   [setRelativeToListener (_fun _sfSound-pointer _bool -> _void)]
   [setMinDistance (_fun _sfSound-pointer _float -> _void)]
   [setAttenuation (_fun _sfSound-pointer _float -> _void)]
   #;
   [setPlayingOffset (_fun _sfSound-pointer _sfTime -> _void)]
   [getPitch (_fun _sfSound-pointer -> _float)]
   [getVolume (_fun _sfSound-pointer -> _float)]
   #;[getPosition (_fun _sfSound-pointer -> _sfVector3f)]
   [isRelativeToListener (_fun _sfSound-pointer -> _bool)]
   [getMinDistance (_fun _sfSound-pointer -> _float)]
   [getAttenuation (_fun _sfSound-pointer -> _float)]
   #;
   [getPlayingOffset (_fun _sfSound-pointer -> _sfTime)]))
