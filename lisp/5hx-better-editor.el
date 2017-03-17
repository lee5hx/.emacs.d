
;;(require 'hungry-delete)
(global-hungry-delete-mode)



(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)


;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)



;;recentf
(use-package recentf
  :init
    (setq recentf-save-file "~/.emacs.d/etc/recentf")
  :config
    (recentf-mode 1)
    (setq recentf-max-saved-items 100))

;;savehist
(setq savehist-additional-variables '(search-ring regexp-search-ring)
      savehist-file "~/.emacs.d/etc/savehist"
      history-length 150)
(savehist-mode)

;;saveplace
(use-package saveplace
  :init
    (setq save-place-file "~/.emacs.d/etc/saveplace"
          save-place-forget-unreadable-files nil)
    (setq-default save-place t))


(provide '5hx-better-editor)
