#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 ffi/unsafe/define
 "../sfml-util.rkt"
 "defaudio.rkt"
 "types.rkt"
 "soundstatus.rkt")

(define-cstruct _sfSoundStreamChunk
  ([samples (_ptr io _int16)]
   [sampleCount _uint]))

(define _sfSoundStreamGetDataCallback
  (_fun
   (_ptr io _sfSoundStreamChunk)
   (_ptr io _void)
   -> _bool))

#;
(define _sfSoundStreamSeekCallback
  (_fun
   _sfTime
   (_ptr io _void)
   -> _void))

(define-all-types defaudio sfSoundStream
  (
   #;
   [create
    (_fun
     _sfSoundStreamGetDataCallback
     _sfSoundStreamSeekCallback
     _uint
     _uint
     _void-pointer
     -> _sfSoundStream-pointer)]
   [destroy (_fun _sfSoundStream-pointer -> _void)]
   [play (_fun _sfSoundStream-pointer -> _void)]
   [pause (_fun _sfSoundStream-pointer -> _void)]
   [stop (_fun _sfSoundStream-pointer -> _void)]
   [getStatus (_fun _sfSoundStream-pointer -> _sfSoundStatus)]
   [getChannelCount (_fun _sfSoundStream-pointer -> _uint)]
   [getSampleRate (_fun _sfSoundStream-pointer -> _uint)]
   [setPitch (_fun _sfSoundStream-pointer _float -> _void)]
   [setVolume (_fun _sfSoundStream-pointer _float -> _void)]
   #;
   [setPosition (_fun _sfSoundStream-pointer _sfVector3f -> _void)]
   [setRelativeToListener
    (_fun _sfSoundStream-pointer _bool -> _void)]
   [setMinDistance (_fun _sfSoundStream-pointer _float -> _void)]
   [setAttenuation (_fun _sfSoundStream-pointer _float -> _void)]
   #;
   [setPlayingOffset (_fun _sfSoundStream-pointer _sfTime -> _void)]
   [setLoop (_fun _sfSoundStream-pointer _bool -> _void)]
   [getPitch (_fun _sfSoundStream-pointer -> _float)]
   [getVolume (_fun _sfSoundStream-pointer -> _float)]
   #;
   [getPosition (_fun _sfSoundStream-pointer -> _sfVector3f)]
   [isRelativeToListener (_fun _sfSoundStream-pointer -> _bool)]
   [getMinDistance (_fun _sfSoundStream-pointer -> _float)]
   [getAttenuation (_fun _sfSoundStream-pointer -> _float)]
   [getLoop (_fun _sfSoundStream-pointer -> _bool)]
   #;
   [getPlayingOffset (_fun _sfSoundStream-pointer -> _sfTime)]))
