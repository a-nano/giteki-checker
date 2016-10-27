#|
  This file is a part of giteki-checker project.
  Copyright (c) 2016 Akihide Nano (an74abc@gmail.com)
|#

(in-package :cl-user)
(defpackage giteki-checker-test-asd
  (:use :cl :asdf))
(in-package :giteki-checker-test-asd)

(defsystem giteki-checker-test
  :author "Akihide Nano"
  :license "LLGPL"
  :depends-on (:giteki-checker
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "giteki-checker"))))
  :description "Test system for giteki-checker"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
