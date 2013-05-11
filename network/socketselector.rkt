#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "../system/time.rkt"
 "types.rkt"
 "defnet.rkt")

(define-all-types defnet sfSocketSelector
  ([create (_fun -> _sfSocketSelector-pointer)]
   [copy
    (_fun _sfSocketSelector-pointer -> _sfSocketSelector-pointer)]
   [destroy (_fun _sfSocketSelector-pointer -> _void)]
   [addTcpListener
    (_fun _sfSocketSelector-pointer _sfTcpListener-pointer -> _void)]
   [addTcpSocket
    (_fun _sfSocketSelector-pointer _sfTcpSocket-pointer -> _void)]
   [addUdpSocket
    (_fun _sfSocketSelector-pointer _sfUdpSocket-pointer -> _void)]
   [removeTcpListener
    (_fun _sfSocketSelector-pointer _sfTcpListener-pointer -> _void)]
   [removeTcpSocket
    (_fun _sfSocketSelector-pointer _sfTcpSocket-pointer -> _void)]
   [removeUdpSocket
    (_fun _sfSocketSelector-pointer _sfUdpSocket-pointer -> _void)]
   [clear (_fun _sfSocketSelector-pointer -> _void)]
   [wait (_fun _sfSocketSelector-pointer _sfTime -> _bool)]
   [isTcpListenerReady
    (_fun _sfSocketSelector-pointer _sfTcpListener-pointer -> _bool)]
   [isTcpSocketReady
    (_fun _sfSocketSelector-pointer _sfTcpSocket-pointer -> _bool)]
   [isUdpSocketReady
    (_fun _sfSocketSelector-pointer _sfUdpSocket-pointer -> _bool)]
   ))
