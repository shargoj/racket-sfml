#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defnet.rkt"
 "types.rkt")

(define-all-types defnet sfPacket
 ([create(_fun -> _sfPacket-pointer)]
  [copy(_fun _sfPacket-pointer -> _sfPacket-pointer)]
  [destroy(_fun _sfPacket-pointer -> _void)]
  [append(_fun _sfPacket-pointer (_ptr io _void) _uint -> _void)]
  [clear(_fun _sfPacket-pointer -> _void)]
  [getData(_fun _sfPacket-pointer -> (_ptr o _void))]
  [getDataSize(_fun _sfPacket-pointer -> _uint)]
  [endOfPacket(_fun _sfPacket-pointer -> _bool)]
  [canRead(_fun _sfPacket-pointer -> _bool)]
  [readBool(_fun _sfPacket-pointer -> _bool)]
  [readInt8(_fun _sfPacket-pointer -> _int8)]
  [readUint8(_fun _sfPacket-pointer -> _uint8)]
  [readInt16(_fun _sfPacket-pointer -> _int16)]
  [readUint16(_fun _sfPacket-pointer -> _uint16)]
  [readInt32(_fun _sfPacket-pointer -> _int32)]
  [readUint32(_fun _sfPacket-pointer -> _uint32)]
  [readFloat(_fun _sfPacket-pointer -> _float)]
  [readDouble(_fun _sfPacket-pointer -> _double)]
  [readString(_fun _sfPacket-pointer _bytes -> _void)]
  [readWideString(_fun _sfPacket-pointer  -> _void)]
  [writeBool(_fun _sfPacket-pointer -> _void)]
  [writeInt8(_fun _sfPacket-pointer _int8 -> _void)]
  [writeUint8(_fun _sfPacket-pointer _uint8 -> _void)]
  [writeInt16(_fun _sfPacket-pointer _int16 -> _void)]
  [writeUint16(_fun _sfPacket-pointer _uint16 -> _void)]
  [writeInt32(_fun _sfPacket-pointer _int32 -> _void)]
  [writeUint32(_fun _sfPacket-pointer _uint32 -> _void)]
  [writeFloat(_fun _sfPacket-pointer _float -> _void)]
  [writeDouble(_fun _sfPacket-pointer _double -> _void)]
  [writeString(_fun _sfPacket-pointer _bytes -> _void)]
  [writeWideString(_fun _sfPacket-pointer _string/utf-16 -> _void)]))
