#lang racket

(provide (all-defined-out))
(require ffi/unsafe)

(define _sfWindow-pointer (_cpointer 'sfWindow))
(define _sfContext-pointer (_cpointer 'sfContext))
