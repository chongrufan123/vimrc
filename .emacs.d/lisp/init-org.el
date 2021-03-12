;;; init-org --- Summary:
;;; Commentary:

;;; Code:

;; 将org文件保存到~/org中
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; 设置一个org模板
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))
(global-set-key (kbd "C-c r") 'org-capture)


(provide 'init-org)
;;; init-org ends here



