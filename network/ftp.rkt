#lang racket

(provide (all-defined-out))
(require
 ffi/unsafe
 "../sfml-util.rkt"
 "defnet.rkt"
 "ipaddress.rkt"
 "types.rkt"
 "../system/time.rkt")

(define _sfFtpTransferMode
  (_enum
   '(sfFtpBinary
     sfFtpAscii
     sfFtpEbcdic)))

(define _sfFtpStatus
  (_enum
   '(
     sfFtpRestartMarkerReply
     = 110
     sfFtpServiceReadySoon            = 120
     sfFtpDataConnectionAlreadyOpened = 125
     sfFtpOpeningDataConnection       = 150

     sfFtpOk                    = 200
     sfFtpPointlessCommand      = 202
     sfFtpSystemStatus          = 211
     sfFtpDirectoryStatus       = 212
     sfFtpFileStatus            = 213
     sfFtpHelpMessage           = 214
     sfFtpSystemType            = 215
     sfFtpServiceReady          = 220
     sfFtpClosingConnection     = 221
     sfFtpDataConnectionOpened  = 225
     sfFtpClosingDataConnection = 226
     sfFtpEnteringPassiveMode   = 227
     sfFtpLoggedIn              = 230
     sfFtpFileActionOk          = 250
     sfFtpDirectoryOk           = 257

     sfFtpNeedPassword       = 331
     sfFtpNeedAccountToLogIn = 332
     sfFtpNeedInformation    = 350

     sfFtpServiceUnavailable        = 421
     sfFtpDataConnectionUnavailable = 425
     sfFtpTransferAborted           = 426
     sfFtpFileActionAborted         = 450
     sfFtpLocalError                = 451
     sfFtpInsufficientStorageSpace  = 452

     sfFtpCommandUnknown          = 500
     sfFtpParametersUnknown       = 501
     sfFtpCommandNotImplemented   = 502
     sfFtpBadCommandSequence      = 503
     sfFtpParameterNotImplemented = 504
     sfFtpNotLoggedIn             = 530
     sfFtpNeedAccountToStore      = 532
     sfFtpFileUnavailable         = 550
     sfFtpPageTypeUnknown         = 551
     sfFtpNotEnoughMemory         = 552
     sfFtpFilenameNotAllowed      = 553

     sfFtpInvalidResponse  = 1000
     sfFtpConnectionFailed = 1001
     sfFtpConnectionClosed = 1002
     sfFtpInvalidFile      = 1003)))

(define-all-types defnet sfFtpListingResponse
  ([destroy (_fun _sfFtpListingResponse-pointer -> _void)]
   [isOk (_fun _sfFtpListingResponse-pointer -> _bool)]
   [getStatus (_fun _sfFtpListingResponse-pointer -> _sfFtpStatus)]
   [getMessage (_fun _sfFtpListingResponse-pointer -> _bytes)]
   [getCount (_fun _sfFtpListingResponse-pointer -> _uint)]
   [getName (_fun _sfFtpListingResponse-pointer _uint -> _bytes)]))

(define-all-types defnet sfFtpDirectoryResponse
  ([destroy (_fun _sfFtpDirectoryResponse-pointer -> _void)]
   [isOk (_fun _sfFtpDirectoryResponse-pointer -> _bool)]
   [getStatus (_fun _sfFtpDirectoryResponse-pointer -> _sfFtpStatus)]
   [getMessage (_fun _sfFtpDirectoryResponse-pointer -> _bytes)]
   [getDirectory (_fun _sfFtpDirectoryResponse-pointer -> _bytes)]))

(define-all-types defnet sfFtpResponse
  ([destroy (_fun _sfFtpResponse-pointer -> _void)]
   [isOk (_fun _sfFtpResponse-pointer -> _bool)]
   [getStatus (_fun _sfFtpResponse-pointer -> _sfFtpStatus)]
   [getMessage (_fun _sfFtpResponse-pointer -> _bytes)]))

(define-all-types defnet sfFtp
  ([create (_fun -> _sfFtp-pointer)]
   [destroy (_fun _sfFtp-pointer -> _void)]
   [connect
    (_fun
     _sfFtp-pointer
     _sfIpAddress
     _ushort
     _sfTime
     -> _sfFtpResponse-pointer)]
   [loginAnonymous (_fun _sfFtp-pointer -> _sfFtpResponse-pointer)]
   [login
    (_fun _sfFtp-pointer _bytes _bytes -> _sfFtpResponse-pointer)]
   [disconnect (_fun _sfFtp-pointer -> _sfFtpResponse-pointer)]
   [keepAlive (_fun _sfFtp-pointer -> _sfFtpResponse-pointer)]
   [getWorkingDirectory
    (_fun _sfFtp-pointer -> _sfFtpDirectoryResponse-pointer)]
   [getDirectoryListing
    (_fun _sfFtp-pointer _bytes -> _sfFtpListingResponse-pointer)]
   [changeDirectory
    (_fun _sfFtp-pointer _bytes -> _sfFtpResponse-pointer)]
   [parentDirectory
    (_fun _sfFtp-pointer -> _sfFtpResponse-pointer)]
   [createDirectory
    (_fun _sfFtp-pointer _bytes -> _sfFtpResponse-pointer)]
   [deleteDirectory
    (_fun _sfFtp-pointer _bytes -> _sfFtpResponse-pointer)]
   [renameFile
    (_fun _sfFtp-pointer _bytes _bytes -> _sfFtpResponse-pointer)]
   [deleteFile
    (_fun _sfFtp-pointer _bytes -> _sfFtpResponse-pointer)]
   [download
    (_fun
     _sfFtp-pointer
     _bytes
     _bytes
     _sfFtpTransferMode
     -> _sfFtpResponse-pointer)]
   [upload
    (_fun
     _sfFtp-pointer
     _bytes
     _bytes
     _sfFtpTransferMode
     -> _sfFtpResponse-pointer)]))
