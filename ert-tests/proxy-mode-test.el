;;; proxy-mode-test.el --- tests for proxy-mode.el
(require 'ert)
(require 'proxy-mode)

(ert-deftest demo-test ()
  "Demo test."
  (should (equal (+ 1 2) 3)))

