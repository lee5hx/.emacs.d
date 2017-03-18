
(use-package company-emacs-eclim
  :ensure t
  :commands company-emacs-eclim-setup)
(use-package eclimd
  :load-path "/home/nelson/src/github/elisp/emacs-eclim"
  :commands start-eclimd
  :config
  (custom-set-variables
    '(eclimd-autostart nil)))
(use-package eclim
  :load-path "/home/nelson/src/github/elisp/emacs-eclim"
  :diminish eclim-mode
  :commands (global-eclim-mode)
  :init (use-package cl)
  :config
    (let ((eclipse-dir (expand-file-name "~/apps/eclipse/java/neon/eclipse")))
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



;;emacs-gradle-mode

;;(use-package gradle-mode
;;  :ensure t
;;  :diminish gradle-mode
;;  :init
;;    (gradle-mode 1))

(provide '5hx-java)
