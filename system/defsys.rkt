#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 ffi/unsafe/define)

(define-ffi-definer defsys (ffi-lib "libcsfml-system"))
