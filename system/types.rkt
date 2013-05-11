#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe)

(define _sfClock-pointer (_cpointer 'sfClock))
(define _sfMutex-pointer (_cpointer 'sfMutex))
(define _sfThread-pointer (_cpointer 'sfThread))
