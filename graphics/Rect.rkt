#lang racket

(provide (all-defined-out))
(require ffi/unsafe
         (file "../sfml-util.rkt")
         (file "defgfx.rkt"))

(define-cstruct _sfFloatRect
  ([left _float]
   [top _float]
   [width _float]
   [height _float]))

(define-all-types defgfx sfFloatRect
  ([contains (_fun (_ptr i _sfFloatRect) _float _float -> _bool)]
   [intersects
    (_fun
     (_ptr i _sfFloatRect)
     (_ptr i _sfFloatRect)
     (_ptr i _sfFloatRect)
     -> _bool)]))

(define-cstruct _sfIntRect
  ([left _int]
   [top _int]
   [width _int]
   [height _int]))

(define-all-types defgfx sfIntRect
  ([contains (_fun (_ptr i _sfIntRect) _int _int -> _bool)]
   [intersects
    (_fun
     (_ptr i _sfIntRect)
     (_ptr i _sfIntRect)
     (_ptr i _sfIntRect)
     -> _bool)]))
