;; Require a few extra packages
(prelude-require-packages '(company company-sourcekit flycheck flycheck-swift 
                                    project-explorer swift-mode yasnippet yasnippet-snippets))

;; Company and Company SourceKit
(defun company-sourcekit-init ()
  "Enable sourcekit backend for company."
  (eval-after-load 'company
    '(add-to-list
      (make-local-variable 'company-backends)
      'company-sourcekit)))

(add-hook 'after-init-hook 'global-company-mode)
;(add-hook 'swift-mode-hook 'company-sourcekit-init)
(add-hook 'swift-mode-hook (lambda ()
                             (company-sourcekit-init)
                             (flycheck-mode 1)))

(global-set-key (kbd "<backtab>") 'company-complete-common)

;; Flycheck Swift
(eval-after-load 'flycheck '(flycheck-swift-setup))

;; Yasnippet
(add-hook 'prog-mode-hook 'yas-minor-mode)

;; Add a nice binding to open project explorer
(global-set-key (kbd "C-c C-p") 'project-explorer-toggle)

;; Add some folders to ignore in project explorer
(setq pe/omit-regex (mapconcat 'identity
                               '("^\\." "^#" "~$" "^build$")
                               "\\|"))

;; Guru mode always on
(guru-global-mode 1)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
