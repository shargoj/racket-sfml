#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defsys.rkt"
 "types.rkt")

(define-all-types defsys sfMutex
  ([create (_fun  -> _sfMutex-pointer)]
   [destroy (_fun _sfMutex-pointer  -> _void)]
   [lock (_fun _sfMutex-pointer  -> _void)]
   [unlock (_fun _sfMutex-pointer  -> _void)]))
