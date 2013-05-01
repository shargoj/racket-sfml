#lang racket

;;; This is a file for tests for racket-sfml Window module.

;;; Whatever can be unit-tested should be, though do to the graphical
;;; nature of the code, this file should contain functions that can be
;;; called from an interpretor and manually verified.

(require (file "../sfml.rkt")
         ffi/unsafe)
(provide (all-defined-out))

(define (test-window-basic do-window-stuff)
  (define mode (sfVideoMode_getDesktopMode))
  (define name #"Test Window")
  (define defaultStyle 'sfDefaultStyle)
  (define context-settings (make-sfContextSettings 3 3 0 3 0))
  (define win (sfWindow_create mode name defaultStyle context-settings))
  (dynamic-wind
   (lambda () '())
   (lambda () (do-window-stuff win))
   (lambda () (when (sfWindow_isOpen win)
                (void (sfWindow_destroy win))))))

(define (test-open-close)
  (test-window-basic (lambda (w) (sleep 2))))

(define (test-event-loop)
  (define (event-loop w)
    (let open-loop ()
      (when (sfWindow_isOpen w)
        (let event-loop ()
          (define-values (event had-event?) (sfWindow_pollEvent w))
          (when had-event?
            (when (eq? (ptr-ref event _sfEventType) 'sfEvtClosed)
              (sfWindow_close w))
            (event-loop)))
        (open-loop))))
  (test-window-basic event-loop))
