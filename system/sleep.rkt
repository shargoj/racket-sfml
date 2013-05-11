#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defsys.rkt"
 "time.rkt")

(defsys sfSleep (_fun _sfTime -> _void))
