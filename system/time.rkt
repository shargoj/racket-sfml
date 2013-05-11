#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defsys.rkt")

(define-cstruct _sfTime ([microseconds _int64]))

(define-all-types defsys sfTime
  ([asSeconds (_fun _sfTime  -> _float)]
   [asMilliseconds (_fun _sfTime  -> _int32)]
   [asMicroseconds (_fun _sfTime  -> _int64)]))
