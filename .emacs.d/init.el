;;; init.el --- some init configs

;;; Commentary:
;;; Code:
(add-to-list 'load-path
	     "/home/pi/.emacs.d/lisp")


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-const)
(require 'init-startup)
(require 'init-elpa)
(require 'init-package)
(require 'init-ui)
(require 'init-kbd)
(require 'init-org)


;;; init.el ends here


