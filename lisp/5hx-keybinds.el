


;;Key bindings
(global-set-key (kbd "M-g M-g")       'goto-line)
(global-set-key (kbd "M-%")           'query-replace-regexp)
;;(global-set-key "\C-x\C-e"          'compile)
(global-set-key (kbd "C-x C-n")       'next-error)
(global-set-key (kbd "C-x C-i")       'c-indent-exp)
(global-set-key (kbd "C-x k")         'kill-this-buffer)

(global-set-key (kbd "<f1>")          'indent-for-tab-command)
(global-set-key [(shift f1)]          'indent-region)
(global-set-key (kbd "<f2>")          '(lambda () (interactive) (save-some-buffers t)))
(global-set-key [(shift f2)]          '(lambda () (interactive) (revert-buffer t t)))
(global-set-key [(shift f3)]          'helm-recentf)
(global-set-key [(meta shift f3)]     'sbt-grep)
(global-set-key [f5]                  'compile)
(global-set-key [(shift f5)]          'toggle-truncate-lines)
(global-set-key [(shift f11)]         'eval-region)
(global-set-key [(control shift f11)] 'align-regexp)




;;ivy keys
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
;;(global-set-key (kbd "<f1> l") 'counsel-find-library)
;;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;;(global-set-key (kbd "C-c g") 'counsel-git)
;;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;;(global-set-key (kbd "C-c k") 'counsel-ag)
;;(global-set-key (kbd "C-x l") 'counsel-locate)
;;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

;;(global-set-key (kbd "C-v") 'scroll-down)
;;(global-set-key (kbd "M-v") 'scroll-up)


;;shell
;;(global-set-key (kbd "C-x m") 'shell)
;;(global-set-key (kbd "C-x M") 'ansi-term)

;;windmove
;;(windmove-default-keybindings 'meta)
;;
;;(winner-mode t)
(use-package whitespace
  :bind ("S-<f10>" . whitespace-mode))



(global-set-key (kbd "s-e") 'recentf-open-files)
(global-set-key (kbd "s-/") 'comment-dwim-2) ;

;; sfasf

(provide '5hx-keybinds)
