#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(provide (all-defined-out))


(define-ffi-definer defwin (ffi-lib "libcsfml-window"))
