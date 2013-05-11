#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe)

(define _sfSocketStatus
  (_enum
   '(sfSocketDone
     sfSocketNotReady
     sfSocketDisconnected
     sfSocketError)))
