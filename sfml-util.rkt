#lang racket

(provide define-all-types)

(define-syntax (define-all-types stx)
  (syntax-case stx ()
    [(_ deffun
        ((funcname type) ...))
     (syntax (begin
               (deffun funcname type) ...))]
    [(_ deffun prefix
        ((funcname type) ...))
     (with-syntax
         ([(newname ...)
           (map
            (lambda (name)
              (datum->syntax stx
                             (string->symbol
                              (string-append
                               (symbol->string (syntax-e #'prefix))
                               "_"
                               (symbol->string (syntax-e name))))))
            (syntax->list #'(funcname ...)))])
       #`(begin
           (deffun newname type) ...))]))
