
(use-package company-emacs-eclim
  :ensure t
  :commands company-emacs-eclim-setup
  :config)




(use-package eclimd
  ;;:load-path "/home/nelson/src/github/elisp/emacs-eclim"
  :commands start-eclimd
  :config
  (custom-set-variables
    '(eclimd-autostart nil)))
(use-package eclim
  ;;:load-path "/home/nelson/src/github/elisp/emacs-eclim"
  :diminish eclim-mode
  :commands (global-eclim-mode)
  :init (use-package cl)
  :config
    (let ((eclipse-dir (expand-file-name "/Users/lee5hx/Applications/Eclipse.app/Contents/Eclipse")))
      (if (file-accessible-directory-p eclipse-dir)
          (progn
            (add-to-list 'eclim-eclipse-dirs eclipse-dir)
            (setq eclim-executable (or (concat eclipse-dir "/eclim") (executable-find "eclim"))
                  eclimd-executable (or (concat eclipse-dir "/eclimd") (executable-find "eclimd"))
                  ))))
    (company-emacs-eclim-setup)

    (global-company-mode t)
    (setq eclim-auto-save t
          eclimd-wait-for-process nil
          eclimd-default-workspace "~/workspace/"
          help-at-pt-display-when-idle t
          help-at-pt-timer-delay 0.1

          )
    ;; Call the help framework with the settings above & activate eclim-mode
    (help-at-pt-set-timer)

    ;; keep consistent which other auto-complete backend.
    (custom-set-faces
     '(ac-emacs-eclim-candidate-face ((t (:inherit ac-candidate-face))))
     '(ac-emacs-eclim-selection-face ((t (:inherit ac-selection-face))))))


(defun my-java-mode-hook ()
  (setq indent-tabs-mode nil
        zeal-at-point-docset "java"))

(add-hook 'java-mode-hook (lambda() (eclim-mode t)))
(add-hook 'java-mode-hook 'my-java-mode-hook)
(add-hook 'java-mode-hook 'semantic-mode)

(defun nl/restart-eclim (workspace-dir)
  "Restarts the eclim server.  If it is currently active, the server is stopped first."
  (interactive (list (read-directory-name "Workspace directory: "
                                          eclimd-default-workspace nil t)))
  (if (get-buffer "*eclimd*") (stop-eclimd))
  (start-eclimd workspace-dir)
  (switch-to-buffer "*eclimd*"))


(defun nl/gradle-javadoc ()
  "Uses gradle to build the Javadoc for the project."
  (interactive)
  (let* ((current-directory default-directory))
    (setq default-directory (locate-dominating-file default-directory "build.gradle"))
    (compile "gradle -q --console=plain javadoc")
    (setq default-directory current-directory)))


;;emacs-gradle-mode

;;(use-package gradle-mode
;;  :ensure t
;;  :diminish gradle-mode
;;  :init
;;    (gradle-mode 1))

(provide '5hx-java)

;;; 5hx-java.el ends here
