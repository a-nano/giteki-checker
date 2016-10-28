#|
  This file is a part of giteki-checker project.
  Copyright (c) 2016 Akihide Nano (an74abc@gmail.com)
|#

#|
  Author: Akihide Nano (an74abc@gmail.com)
|#

(in-package :cl-user)
(defpackage giteki-checker-asd
  (:use :cl :asdf))
(in-package :giteki-checker-asd)

(defsystem giteki-checker
  :version "0.1"
  :author "Akihide Nano"
  :license "LLGPL"
  :depends-on (:drakma
               :babel
               :cl-ppcre)
  :components ((:module "src"
                :components
                ((:file "giteki-checker"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op giteki-checker-test))))
