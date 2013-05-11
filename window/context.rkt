#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defwin.rkt"
 "types.rkt")

(define-all-types defwin sfContext
  ([create (_fun -> _sfContext-pointer)]
   [destroy (_fun _sfContext-pointer -> _void)]
   [setActive (_fun _sfContext-pointer _bool -> _void)]))
