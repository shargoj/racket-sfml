#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defnet.rkt"
 "../system/time.rkt")

(define-cstruct _sfIpAddress
  ([address (_array _byte 16)]))

(defnet sfIpAddress_None _sfIpAddress)
(defnet sfIpAddress_LocalHost _sfIpAddress)
(defnet sfIpAddress_Broadcast _sfIpAddress)

(define-all-types defnet sfIpAddress
  ([fromString
    (_fun _bytes  -> _sfIpAddress)]
   [fromBytes
    (_fun _uint8 _uint8 _uint8 _uint8 -> _sfIpAddress)]
   [fromInteger (_fun _int32  -> _sfIpAddress)]
   [toString (_fun _sfIpAddress _bytes  -> _void)]
   [toInteger (_fun _sfIpAddress  -> _uint32)]
   [getLocalAddress (_fun -> _sfIpAddress)]
   [getPublicAddress (_fun _sfTime  -> _sfIpAddress)]))
