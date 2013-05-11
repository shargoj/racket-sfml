#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe)

(define _sfMusic-pointer (_cpointer 'sfMusic))
(define _sfSound-pointer (_cpointer 'sfSound))
(define _sfSoundBuffer-pointer (_cpointer 'sfSoundBuffer))
(define _sfSoundBufferRecorder-pointer
  (_cpointer 'sfSoundBufferRecorder))
(define _sfSoundRecorder-pointer (_cpointer 'sfSoundRecorder))
(define _sfSoundStream-pointer (_cpointer 'sfSoundStream))
