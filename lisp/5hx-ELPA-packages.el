
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


;;exec-path-from-shell
(use-package exec-path-from-shell
  :if (and (eq system-type 'darwin) (display-graphic-p))
  :ensure t
  :pin melpa-stable
  :config
  (progn
     (when (string-match-p "/zsh$" (getenv "SHELL"))
      ;; Use a non-interactive login shell.  A login shell, because my
      ;; environment variables are mostly set in `.zprofile'.
       (setq exec-path-from-shell-arguments '("-l")))

     (exec-path-from-shell-initialize)
     ))

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


(provide '5hx-ELPA-packages)
