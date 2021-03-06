;;(require 'hungry-delete)



(global-hungry-delete-mode)

(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :bind
  (:map ivy-mode-map
   ("C-'" . ivy-avy))
  :config
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  ;; number of result lines to display
  (setq ivy-height 10)
  ;; does not count candidates
  (setq ivy-count-format "")
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
        ;; allow input not in order
        '((t . ivy--regex-ignore-order))))

(use-package ivy-hydra
  :ensure t)



(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ("C-c C-r" . ivy-resume)
         ("<f6>" . ivy-resume))
  :config
  (ivy-mode 1)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-use-virtual-buffers t)
  (setq swiper-action-recenter t))



(use-package counsel
  :ensure t
  :bind (;;("C-x C-f" . counsel-find-file)
         ;;("M-y" . counsel-yank-pop)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)
         ("C-c s a" . counsel-ag)))

(use-package avy
  :bind
  (("C-c SPC" . avy-goto-char)
   ("C-'" . avy-goto-char-2)
   ("M-g M-g" . avy-goto-line)))



;;(Add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
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

;;which-key
(which-key-mode 1)
(setq which-key-side-window-location 'bottom)

;;clipmon
(use-package clipmon
  :ensure t
  :commands clipmon-mode-start
  :bind ("M-S-<f2>" . clipmon-autoinsert-toggle)
  :config
  (clipmon-mode-start))

;;popwin
(require 'popwin)    ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)


;;company
;;(use-package company
;;  :ensure t
;;  :diminish company-mode
;;  :bind
;;  ("M-/" . company-complete-common)
;;  :config
;;  (add-hook 'after-init-hook 'global-company-mode 1))
(global-company-mode 1)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


;;(use-package company-tern)

(use-package super-save
  :ensure t
  :diminish super-save-mode
  :config (super-save-mode +1))


(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region)
  :config (setq expand-region-smart-cursor t))


(use-package goto-last-change
  :ensure t
  :bind
  ("C-x C-\\" . goto-last-change)
  :config
  (autoload 'goto-last-change "goto-last-change"
    "Set point to the position of the last change." t))

(use-package autorevert
  :diminish auto-revert-mode
  :config
  (global-auto-revert-mode 1)
  (add-hook 'dired-mode-hook 'auto-revert-mode)
  (setq global-auto-revert-non-file-buffers t
	auto-revert-verbose nil))

(use-package multiple-cursors
  :ensure t
  :init (require 'multiple-cursors)
  :bind (("C-c m c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-M->"       . mc/unmark-next-like-this)
         ("C-M-<"       . mc/unmark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)
         ("C-!"         . mc/mark-next-symbol-like-this)
         ("C-x C-m"     . mc/mark-all-dwim)
	 ("C-S-<mouse-1>" . mc/add-cursor-on-click)

	 ))


(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :init
  (yas-global-mode 1)
  :config
  ;; (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets"))
  (add-to-list 'yas-snippet-dirs "/Users/lee5hx/src/github/elisp/yasnippet-snippets")
  )
  ;;(add-to-list 'yas-snippet-dirs "/Users/lee5hx/src/github/elisp/yasnippet-snippets")
;;(add-to-list 'yas-snippet-dirs "$$DIRECTORY_WHERE_YOU_CLONE

(use-package auto-yasnippet
  :ensure t
  :config
  (global-set-key (kbd "C-o") #'aya-open-line)
  (global-set-key (kbd "H-w") #'aya-create)
  (global-set-key (kbd "H-w") #'aya-expand))




;; (defun eos/setup-helm-gtags ()
;;   (interactive)
;;   ;; this variables must be set before load helm-gtags
;;   ;; you can change to any prefix key of your choice
;;   (setq helm-gtags-prefix-key "\C-cg")
;;   (setq helm-gtags-ignore-case t
;;         helm-gtags-auto-update t
;;         helm-gtags-use-input-at-cursor t
;;         helm-gtags-pulse-at-cursor t
;;         helm-gtags-suggested-key-mapping t)
;;   (use-package helm-gtags
;;     :ensure t
;;     :init (helm-gtags-mode t)
;;     :diminish "")
;;   ;; key bindings
;;   (define-key helm-gtags-mode-map (kbd "M-S") 'helm-gtags-select)
;;   (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;;   (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;;   (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;;   (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history))




(use-package ggtags
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'c-mode-common-hook
              (lambda ()
                (when (derived-mode-p 'c-mode 'c++-mode 'java-mode )
                 ;;(eos/setup-semantic-mode)
                  ;; helm-gtags
                  ;;(eos/setup-helm-gtags)
                  ;; regular gtags
                  ;;(my/setup-ggtags)
		  (ggtags-mode 1)
                  )))))


(with-eval-after-load 'ggtags
  (define-key ggtags-mode-map (kbd "M-.") nil)
  (define-key ggtags-mode-map (kbd "M-,") nil))


;; key bindings
  ;; (define-key helm-gtags-mode-map (kbd "M-S") 'helm-gtags-select)
  ;; (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
 ;; (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
  ;; (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  ;; (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history))


(use-package helm-gtags
  :ensure t
  :commands (helm-gtags-mode)
  :bind (("M-." . helm-gtags-dwim)
         ("M-," . helm-gtags-pop-stack)
	 ("M-S" . helm-gtags-select)
	 ("C-c <" . helm-gtags-previous-history)
	 ("C-c >" . helm-gtags-next-history)
	 )


  :config
  (custom-set-variables
   '(helm-gtags-path-style 'relative)
   '(helm-gtags-ignore-case t)
   '(helm-gtags-auto-update t)))










(provide '5hx-better-editor)
