

(defun my-java-mode-hook ()
  (setq indent-tabs-mode nil
        zeal-at-point-docset "java")
  ;;(my-common-prog-mode-settings)

  )

;;(add-hook 'java-mode-hook (lambda() (eclim-mode t)))

;;my-common-prog-mode-settings

(use-package meghanada
  :defer t
  :init
  (add-hook 'java-mode-hook
          (lambda ()
            ;; meghanada-mode on
            (meghanada-mode t)
            (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)
	    (add-hook 'java-mode-hook 'my-java-mode-hook)
	    (add-hook 'java-mode-hook 'semantic-mode)
	    )))





(provide '5hx-meghanada)
