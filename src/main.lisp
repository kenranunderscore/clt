(defpackage clt
  (:use :cl))
(in-package :clt)

(defconstant +o-rdonly+ 0)
(defconstant +o-wronly+ 1)
(defconstant +o-rdwr+ 2)
(defconstant +o-noctty+ #x8000)

; TODO errno handling

(cffi:defcfun ("posix_openpt" c-posix-openpt) :int
  "Open a pseudoterminal"
  (flags :int))

(defmacro posix-openpt (flags)
  "Open a PTY. Return `nil' on failure."
  `(let ((code (c-posix-openpt ,flags)))
    (if (< code 0)
        (format t "Couldn't open pseudo-terminal.")
        code)))

(cffi:defcfun ("grantpt" c-grantpt) :int
  "Grant access to secondary pseudoterminal"
  (fd :int))

(defmacro grantpt (fd)
  "Grant access to a secondary pseudoterminal"
  `(let ((code (c-grantpt ,fd)))
     (if (< code 0)
         (format t "granpt failed")o
         code)))

(cffi:defcfun ("unlockpt" c-unlockpt) :int
  "Unlock a primary/secondary pseudoterminal pair"
  (fd :int))

(defmacro unlockpt (fd)
  "Unlock a primary/secondary PTY FD pair"
  `(let ((code (c-unlockpt ,fd)))
     (if (< code 0)
         (format t "unlockpt failed")o
         code)))

(defun open-pty ()
  (if-let ((main-fd (posix-openpt (boole boole-ior +o-rdwr+ +o-noctty+)))
           (_ (grantpt main-fd)))))
