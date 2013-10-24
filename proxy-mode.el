;;; proxy-mode.el --- Provides proxy minor mode.

;; Copyright (C) 2013 by Sachin Patil

;; Author: Sachin Patil <isachin@iitb.ac.in>
;; URL: http://github.com/psachin/proxy-mode
;; Keywords: network, proxy, tool, convenience
;; Version: 0.9

;; This file is NOT a part of GNU Emacs.

;; `proxy-mode' is free software distributed under the terms of
;; the GNU General Public License, version 3. For details, see the
;; file COPYING.

;;; Commentary:
;; Provides proxy minor mode.
;; URL: http://github.com/psachin/proxy-mode

;; Install

;; Using `package'
;; M-x package-install proxy-mode

;; Unless installed from a `package', add the directory containing
;; this file to `load-path', and then:
;; (require 'proxy-mode)
;;
;; To enable this mode globally:
;;
;; '(proxy-mode t)

;; Customize
;; M-x customize-group RET proxy-mode RET
;;
;; See ReadMe.org for more info.

;;; Code:

(defgroup proxy-mode nil
  "Provides proxy minor mode."
  :group 'extensions
  :link '(url-link :tag "Github" "https://github.com/psachin/proxy-mode"))

(defcustom proxy-services nil
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
  :group 'proxy)

(defun proxy-enable ()
  "Enable proxy."
  (setq-default url-proxy-services proxy-services))

(defun proxy-disable ()
  "Disable proxy."
  (setq-default url-proxy-services nil))

;;;###autoload
(define-minor-mode proxy-mode
  "Minor proxy-mode."
  :lighter nil ;; " ρ"
  :global t
  :group 'proxy
  (if (not proxy-mode)
      (proxy-disable)
    (proxy-enable)))

(provide 'proxy-mode)
;;; proxy-mode.el ends here
