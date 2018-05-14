(in-package :cl-user)
(defpackage giteki-checker-test
  (:use :cl
        :giteki-checker
        :prove))
(in-package :giteki-checker-test)

;; NOTE: To run this test file, execute `(asdf:test-system :giteki-checker)' in your Lisp.

(setf *enable-colors* nil)

(plan 2)

(ok (check "018-160054"))
(is (check "000-000000") '(nil nil nil nil) :test #'equalp)

(finalize)
