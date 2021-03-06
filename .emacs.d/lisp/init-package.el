;;; init-package ---- setting for package

;;; Commentary:
;;; Code:

;;; 测试启动耗时
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

;;; 删除相关的包
(use-package crux
  :bind ("C-k" . crux-smart-kill-line))

(use-package hungry-delete
  :bind (("C-c DEL" . hungry-delete-backward))
  :bind (("C-c C-d" . hungry-delete-forward)))

;;; 可以自由移动行或区块
(use-package drag-stuff
  :bind (("M-n" . drag-stuff-down))
  :bind (("M-p" . drag-stuff-up)))

;;; 强化搜索
(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d%d "
	enable-recursive-minibuffers t
	ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
		swiper-include-line-number-in-search t))

;;; 自动补全
(use-package company
  :config
  (setq company-dabbrev-code-everywhere t
		        company-dabbrev-code-modes t
		        company-dabbrev-code-other-buffers 'all
		        company-dabbrev-downcase nil
		        company-dabbrev-ignore-case t
		        company-dabbrev-other-buffers 'all
		        company-require-match nil
		        company-minimum-prefix-length 1
		        company-show-numbers t
		        company-tooltip-limit 20
		        company-idle-delay 0
		        company-echo-delay 0
		        company-tooltip-offset-display 'scrollbar
		        company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook ((after-init . global-company-mode)))

;;; 语法检查
(use-package flycheck
  :hook (after-init . global-flycheck-mode))

;;; crux优化插件
(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
	 ("C-x ," . crux-find-user-init-file)
	 ("C-c C-y" . crux-duplicate-current-line-or-region)))

;;; 记忆快捷键
(use-package which-key
  :defer nil
  :config (which-key-mode))

;;; 快速跳转
(use-package ace-window
  :bind (("M-o" . 'ace-window)))

;;; lsp配置
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (;;;(lsp-mode . lsp-enable-which-key-integration)
	 (python-mode . lsp-deferred)
	 (http-mode . lsp-deferred)
	 (css-mode . lsp-deferred)
	 (js-mode . lsp-deferred)
	 (c-mode . lsp-deferred)
	 (web-mode . lsp-deferred))
  :commands lsp)


(provide 'init-package)
;;; init-package ends here
