;;; init-ui.el --- Summary
;;; Commentary:
;;; Code:

;; 添加主题
;;; (use-package gruvbox-theme
  ;;; :init (load-theme 'gruvbox-dark-soft t))
;;; (color-theme-initialize)
;;; (color-theme-monokai-theme)

(load-theme 'monokai-pro t)


;; 改变状态栏
(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))


;; 设置字体
(use-package emacs
  :if (display-graphic-p)
  :config
  (if *is-windows*
      (progn
	(set-face-attribute 'defaule nil :font "Microsoft Yahei Mono 9")
	(dolist (charset '(kana han symbol cjk-misc bopomofo))
	  (set-fontset-font (frame-parameter nil 'font)
			    charset (font-spac :family "Microsoft Yahei Mono" :size 30))))
    ))

;; 添加行号
(global-linum-mode 1)
(linum-relative-global-mode t)
(unless *is-windows*
  (global-display-line-numbers-mode t))


(provide 'init-ui)
;;; init-ui ends here
