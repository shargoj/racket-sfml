#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defnet.rkt"
 "types.rkt"
 "../system/time.rkt")

(define _sfHttpMethod
  (_enum
   '(sfHttpGet
     sfHttpPost
     sfHttpHead)))

(define _sfHttpStatus
  (_enum
   '(sfHttpOk
     = 200
     sfHttpCreated        = 201
     sfHttpAccepted       = 202
     sfHttpNoContent      = 204
     sfHttpResetContent   = 205
     sfHttpPartialContent = 206


     sfHttpMultipleChoices  = 300
     sfHttpMovedPermanently = 301
     sfHttpMovedTemporarily = 302
     sfHttpNotModified      = 304


     sfHttpBadRequest          = 400
     sfHttpUnauthorized        = 401
     sfHttpForbidden           = 403
     sfHttpNotFound            = 404
     sfHttpRangeNotSatisfiable = 407


     sfHttpInternalServerError = 500
     sfHttpNotImplemented      = 501
     sfHttpBadGateway          = 502
     sfHttpServiceNotAvailable = 503
     sfHttpGatewayTimeout      = 504
     sfHttpVersionNotSupported = 505


     sfHttpInvalidResponse  = 1000
     sfHttpConnectionFailed = 1001)))

(define-all-types defnet sfHttpRequest
  ([create (_fun -> _sfHttpRequest-pointer)]
   [destroy (_fun _sfHttpRequest-pointer -> _void)]
   [setField (_fun _sfHttpRequest-pointer _bytes _bytes -> _void)]
   [setMethod (_fun _sfHttpRequest-pointer _sfHttpMethod -> _void)]
   [setUri (_fun _sfHttpRequest-pointer _bytes -> _void)]
   [setHttpVersion (_fun _sfHttpRequest-pointer _uint _uint -> _void)]
   [setBody (_fun _sfHttpRequest-pointer _bytes -> _void)]))

(define-all-types defnet sfHttpResponse
  ([destroy (_fun _sfHttpResponse-pointer -> _void)]
   [getField (_fun _sfHttpResponse-pointer _bytes -> _bytes)]
   [getStatus (_fun _sfHttpResponse-pointer -> _sfHttpStatus)]
   [getMajorVersion (_fun _sfHttpResponse-pointer -> _uint)]
   [getMinorVersion (_fun _sfHttpResponse-pointer -> _uint)]
   [getBody (_fun _sfHttpResponse-pointer -> _bytes)]))

(define-all-types defnet sfHttp
  ([create (_fun -> _sfHttp-pointer)]
   [destroy (_fun _sfHttp-pointer -> _void)]
   [setHost (_fun _sfHttp-pointer _bytes _ushort -> _void)]
   [sendRequest
    (_fun
     _sfHttp-pointer
     _sfHttpRequest-pointer
     _sfTime -> _sfHttpResponse-pointer)] ))
