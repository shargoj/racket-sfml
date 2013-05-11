#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defnet.rkt"
 "socketstatus.rkt"
 "types.rkt")

(define-all-types defnet sfTcpListener
  ([create (_fun  -> _sfTcpListener-pointer)]
   [destroy (_fun _sfTcpListener-pointer  -> _void)]
   [setBlocking (_fun _sfTcpListener-pointer _bool  -> _void)]
   [isBlocking (_fun _sfTcpListener-pointer  -> _bool)]
   [getLocalPort (_fun _sfTcpListener-pointer  -> _ushort)]
   [listen (_fun _sfTcpListener-pointer _ushort  -> _sfSocketStatus)]
   [accept
    (_fun
     _sfTcpListener-pointer
     (_ptr io  _sfTcpSocket-pointer)
     -> _sfSocketStatus)]))
