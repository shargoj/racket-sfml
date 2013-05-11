#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe)

(define _sfWindowHandle (_cpointer 'sfWindowHandle))
