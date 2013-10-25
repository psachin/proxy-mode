;;; no-proxy-mode.el --- Bypass default Emacs proxy settings.

;; Copyright (C) 2013 by Sachin Patil

;; Author: Sachin Patil <isachin@iitb.ac.in>
;; URL: http://github.com/psachin/no-proxy-mode
;; Keywords: network, proxy, tool, convenience
;; Version: 0.9

;; This file is NOT a part of GNU Emacs.

;; `no-proxy-mode' is free software distributed under the terms of
;; the GNU General Public License, version 3. For details, see the
;; file COPYING.

;;; Commentary:
;; Bypass default Emacs proxy settings.
;; URL: http://github.com/psachin/no-proxy-mode

;; Install

;; Using `package'
;; M-x package-install no-proxy-mode

;; Unless installed from a `package', add the directory containing
;; this file to `load-path', and then:
;; (require 'no-proxy-mode)
;;
;; To enable this mode globally:
;;
;; '(no-proxy-mode t)

;; Customize
;; M-x customize-group RET no-proxy-mode RET
;;
;; See ReadMe.org for more info.

;;; Code:

(require 'url)

(defgroup no-proxy-mode nil
  "Provides no-proxy minor mode."
  :group 'extensions
  :link '(url-link :tag "Github" "https://github.com/psachin/no-proxy-mode"))

(defcustom no-proxy-services nil
  "*If nil, add you proxy host here.
'Protocol' can be http, https, ftp, socks etc.
Host can be a proxy-hostname or an IP address with PORT number separated by
colon(:).

For example:

Protocol: http
Host    : proxy.example.com:3128

For no_proxy, write each hostname or IP-address in a separate
field.

For example:

Protocol: no_proxy
Host    : *.example.com

Protocol: no_proxy
Host    : 127.0.0.1"
  :type '(alist :key-type (string :tag "Protocol")
		:value-type (string :tag "Host"))
  :group 'no-proxy)

(defun no-proxy-enable ()
  "Temporarily bypass default Emacs proxy settings."
  (kill-local-variable 'url-proxy-services)
  (setq url-proxy-services no-proxy-services))

(defun no-proxy-disable ()
  "Disable no-proxy-mode."
  (set (make-local-variable 'url-proxy-services) nil))

;;;###autoload
(define-minor-mode no-proxy-mode
  "Minor no-proxy-mode."
  :lighter " ρ"
  :global t
  :group 'no-proxy
  (if (not no-proxy-mode)
      (no-proxy-disable)
    (no-proxy-enable)))

(provide 'no-proxy-mode)
;;; no-proxy-mode.el ends here.
