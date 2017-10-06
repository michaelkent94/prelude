;; Require a few extra packages
(prelude-require-packages '(company company-sourcekit flycheck flycheck-swift flycheck-swift3
                                    project-explorer swift-mode swift3-mode yasnippet yasnippet-snippets))

;; Company and Company SourceKit
(defun company-sourcekit-init ()
  "Enable sourcekit backend for company."
  (eval-after-load 'company
    '(add-to-list
      (make-local-variable 'company-backends)
      'company-sourcekit)))

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'swift-mode-hook 'company-sourcekit-init)

(global-set-key (kbd "<backtab>") 'company-complete-common)

;; Flycheck Swift
(eval-after-load 'flycheck '(flycheck-swift-setup))

;; Yasnippet
(add-hook 'prog-mode-hook 'yas-minor-mode)

;; Add a nice binding to open project explorer
(global-set-key (kbd "C-c C-p") 'project-explorer-open)

;; Guru mode always on
(guru-global-mode 1)
