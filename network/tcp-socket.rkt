#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defnet.rkt"
 "ipaddress.rkt"
 "socketstatus.rkt"
 "types.rkt"
 "../system/time.rkt")

(define-all-types defnet sfTcpSocket
  ([create (_fun  -> _sfTcpSocket-pointer)]
   [destroy (_fun _sfTcpSocket-pointer  -> _void)]
   [setBlocking (_fun _sfTcpSocket-pointer _bool  -> _void)]
   [isBlocking (_fun _sfTcpSocket-pointer  -> _bool)]
   [getLocalPort(_fun _sfTcpSocket-pointer  -> _uint)]
   [getRemoteAddress (_fun _sfTcpSocket-pointer  -> _sfIpAddress)]
   [getRemotePort (_fun _sfTcpSocket-pointer  -> _uint)]
   [connect
    (_fun
     _sfTcpSocket-pointer
     _sfIpAddress
     _ushort _sfTime
     -> _sfSocketStatus)]
   [disconnect (_fun _sfTcpSocket-pointer  -> _void)]
   [send
    (_fun
     _sfTcpSocket-pointer
     (_ptr io _void)
     _uint
     -> _sfSocketStatus)]
   [receive
       (_fun
        _sfTcpSocket-pointer
        (_ptr io _void)
        (_ptr io _uint)
        -> _sfSocketStatus)]
   [sendPacket
    (_fun
     _sfTcpSocket-pointer
     _sfPacket-pointer
     -> _sfSocketStatus)]
   [receivePacket
    (_fun
     _sfTcpSocket-pointer
     _sfPacket-pointer
     -> _sfSocketStatus)]))
