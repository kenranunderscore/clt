(defpackage clt/tests/main
  (:use :cl
        :clt
        :rove))
(in-package :clt/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :clt)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
