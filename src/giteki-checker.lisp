(in-package :cl-user)
(defpackage giteki-checker
  (:nicknames :giteki)
  (:use :cl
        :drakma
        :babel
        :cl-ppcre)
  (:export :check))
(in-package :giteki-checker)

(defun vector-to-string (input-vector)
  (babel:octets-to-string input-vector :encoding :cp932))

(defun get-html-string (url)
  (multiple-value-bind (body status)
      (drakma:http-request url :force-binary t)
    (vector-to-string body)))

(defun giteki-url (number)
  (concatenate 'string "http://www.tele.soumu.go.jp/giteki/SearchServlet?pageID=jk01&NAM=&NUM="
               number
               "&FOM=&ERA=1&YAR=&MON=&DAY=&RAD=00-00-00-00&TEC=1&TEC=2&TEC=3&TEC=4&TEC=5&TEC=6&TEC=7&SK=0&DC=0&SC=1&as_fid=0"))

(defun get-data (number)
  (let ((html-body (get-html-string (giteki-url number))))
    (ppcre:all-matches-as-strings
     "<TD  >(.*)<\/TD>" html-body)))

(defun check (number)
  (let ((lst (mapcar #'(lambda (el)
                         (subseq el 6 (- (length el) 5)))
                     (get-data number))))
    (list (car lst) (cadr lst) (caddr lst) (nth 4 lst))))

