#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defaudio.rkt"
 "types.rkt"
 "soundstatus.rkt")

(define-all-types defaudio sfMusic
  ([createFromFile (_fun _bytes -> _sfMusic-pointer)]
   [createFromMemory (_fun (_ptr i _void) _uint -> _sfMusic-pointer)]
   #;
   [createFromStream
    (_fun _sfInputStream-pointer -> _sfMusic-pointer)]
   [destroy (_fun _sfMusic-pointer -> _void)]
   [setLoop (_fun _sfMusic-pointer _bool -> _void)]
   [getLoop (_fun _sfMusic-pointer -> _bool)]
   #;
   [getDuration (_fun _sfMusic-pointer -> _sfTime)]
   [play (_fun _sfMusic-pointer -> _void)]
   [pause (_fun _sfMusic-pointer -> _void)]
   [stop (_fun _sfMusic-pointer -> _void)]
   [getChannelCount(_fun _sfMusic-pointer -> _uint)]
   [getSampleRate(_fun _sfMusic-pointer -> _uint)]
   [getStatus (_fun _sfMusic-pointer -> _sfSoundStatus)]
   #;
   [getPlayingOffset (_fun _sfMusic-pointer -> _sfTime)]
   [setPitch (_fun _sfMusic-pointer _float -> _void)]
   [setVolume (_fun _sfMusic-pointer _float -> _void)]
   #;[setPosition (_fun _sfMusic-pointer _sfVector3f -> _void)]
   [setRelativeToListener (_fun _sfMusic-pointer _bool -> _void)]
   [setMinDistance (_fun _sfMusic-pointer _float -> _void)]
   [setAttenuation (_fun _sfMusic-pointer _float -> _void)]
   #;
   [setPlayingOffset (_fun _sfMusic-pointer _sfTime -> _void)]
   [getPitch (_fun _sfMusic-pointer -> _float)]
   [getVolume (_fun _sfMusic-pointer -> _float)]
   #;[getPosition (_fun _sfMusic-pointer -> _sfVector3f)]
   [isRelativeToListener (_fun _sfMusic-pointer -> _bool)]
   [getMinDistance (_fun _sfMusic-pointer -> _float)]
   [getAttenuation (_fun _sfMusic-pointer -> _float)]))
