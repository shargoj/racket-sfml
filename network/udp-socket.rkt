#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defnet.rkt"
 "ipaddress.rkt"
 "socketstatus.rkt"
 "types.rkt")

(define-all-types defnet sfUdpSocket
  ([create (_fun  -> _sfUdpSocket-pointer)]
   [destroy (_fun _sfUdpSocket-pointer  -> _void)]
   [setBlocking (_fun _sfUdpSocket-pointer _bool  -> _void)]
   [isBlocking (_fun _sfUdpSocket-pointer  -> _bool)]
   [getLocalPort(_fun _sfUdpSocket-pointer  -> _uint)]
   [bind (_fun _sfUdpSocket-pointer _ushort  -> _sfSocketStatus)]
   [unbind (_fun _sfUdpSocket-pointer  -> _void)]
   [send
    (_fun
     _sfUdpSocket-pointer
     (_ptr io _void)
     _uint
     _sfIpAddress
     _ushort -> _sfSocketStatus)]
   [receive
       (_fun
        _sfUdpSocket-pointer
        (_ptr io _void)
        _uint
        (_ptr io _uint)
        (_ptr io _sfIpAddress)
        (_ptr io _ushort)
        -> _sfSocketStatus)]
   [sendPacket
    (_fun
     _sfUdpSocket-pointer
     _sfPacket-pointer
     _sfIpAddress
     _ushort
     -> _sfSocketStatus)]
   [receivePacket
    (_fun
     _sfUdpSocket-pointer
     _sfPacket-pointer
     _sfIpAddress-pointer
     (_ptr io _ushort)
     -> _sfSocketStatus)]
   [maxDatagramSize(_fun -> _uint)]))
