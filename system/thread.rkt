#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defsys.rkt"
 "types.rkt")

(define-all-types defsys sfThread
  ([create
    (_fun
     (_fun (_ptr io _void) -> _void)
     (_ptr io _void)
     -> _sfThread-pointer)]
   [destroy (_fun _sfThread-pointer  -> _void)]
   [launch (_fun _sfThread-pointer  -> _void)]
   [wait (_fun _sfThread-pointer  -> _void)]
   [terminate (_fun _sfThread-pointer  -> _void)]))
