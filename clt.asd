(asdf:defsystem "clt"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on (:cffi "cl-opengl")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "clt/tests"))))

(asdf:defsystem "clt/tests"
  :author ""
  :license ""
  :depends-on ("clt"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for clt"
  :perform (test-op (op c) (symbol-call :rove :run c)))
