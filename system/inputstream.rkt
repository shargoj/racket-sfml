#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defsys.rkt")

; TODO: are all these pointers IO? (see for all pointers in these procs)
(define _sfInputStreamReadFunc
  (_fun (_ptr io _void) _int64 (_ptr io _void) -> _int64))

(define _sfInputStreamSeekFunc
  (_fun _int64 (_ptr io _void) -> _int64))

(define _sfInputStreamTellFunc
  (_fun (_ptr io _void) -> _int64))

(define _sfInputStreamGetSizeFunc
  (_fun (_ptr io _void) -> _int64))

(define-cstruct _sfInputStream
  ([read _sfInputStreamReadFunc]
   [seek _sfInputStreamSeekFunc]
   [tell _sfInputStreamTellFunc]
   [getSize _sfInputStreamGetSizeFunc]
   [userData (_cpointer 'userdata)]))
