#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         ffi/unsafe/define
         (file "../sfml-util.rkt"))

(define-ffi-definer defgfx (ffi-lib "libcsfml-graphics"))
