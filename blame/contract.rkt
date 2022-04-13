#lang eopl

(define-datatype lc-exp lc-exp?
  (var-exp
   (var symbol?))
  (lambda-exp
   (bound-var (lambda (x) (and (symbol? x) (not (equal? x 'lambda)))))
   (body lc-exp?))
  (app-exp
   (rator lc-exp?)
   (rand lc-exp?)))
