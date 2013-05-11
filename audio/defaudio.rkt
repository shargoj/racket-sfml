#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         ffi/unsafe/define
         "../sfml-util.rkt")

(define-ffi-definer defaudio (ffi-lib "libcsfml-audio"))
