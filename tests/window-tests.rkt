#lang racket

;;; This is a file for tests for racket-sfml Window module.

;;; Whatever can be unit-tested should be, though do to the graphical
;;; nature of the code, this file should contain functions that can be
;;; called from an interpretor and manually verified.

(require (file "../sfml.rkt"))
(provide (all-defined-out))

(define (test-window-basic)
  (define mode (sfVideoMode_getDesktopMode))
  (define name #"Test Window")
  (define defaultStyle 7)
  (define context-settings (make-sfContextSettings 3 3 0 3 0))
  (define win (sfWindow_create mode name defaultStyle context-settings))
  (sleep 3)
  (void (sfWindow_destroy win)))
