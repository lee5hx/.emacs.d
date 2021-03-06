;;Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  :config
  (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
  (setq magit-push-always-verify nil))

;;(setq vc-handled-backends nil)

;; full screen magit-status
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))




(use-package projectile
  :ensure t
  :diminish projectile-mode
  :commands projectile-global-mode
  :config
  (setq projectile-indexing-method 'alien
        projectile-remember-window-configs nil
        projectile-switch-project-action 'projectile-dired
        projectile-completion-system 'default
        projectile-enable-caching nil
        projectile-create-missing-test-files t)

  (projectile-global-mode)
  (setq projectile-completion-system 'helm)

  (def-projectile-commander-method ?d
    "Open project root in dired."
    (projectile-dired)))


(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (setq compilation-read-command t)) ; do prompt for a compilation command

(use-package helm-ag
  :ensure t
  :commands helm-ag)


;;(add-to-list 'exec-path "/usr/local/bin/eslint" )

;;flycheck

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)


(provide '5hx-ELPA-packages)


;;; 5hx-ELPA-packages.el ends here
