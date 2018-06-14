

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
            (flycheck-mode +1)
            (setq c-basic-offset 2)
            ;; use code format
            (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
(cond
   ((eq system-type 'windows-nt)
    (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
    (setq meghanada-maven-path "mvn.cmd"))
   (t
    (setq meghanada-java-path "java")
    (setq meghanada-maven-path "mvn"))))


(c-add-style
 "intellij"
 '("Java"
   (c-basic-offset . 4)
   (c-offsets-alist
    (inline-open . 0)
    (topmost-intro-cont    . +)
    (statement-block-intro . +)
    (knr-argdecl-intro     . 5)
    (substatement-open     . +)
    (substatement-label    . +)
    (label                 . +)
    (statement-case-open   . +)
    (statement-cont        . ++)
    (arglist-intro  . +)
    (arglist-close . c-lineup-arglist)
    (access-label   . 0)
    (inher-cont     . ++)
    (func-decl-cont . ++))))

;;(+update-c-style '(java-mode . "intellij"))


(with-eval-after-load 'meghanada
 (define-key meghanada-mode-map (kbd "M-.") nil)
 (define-key meghanada-mode-map (kbd "M-,") nil))




(provide '5hx-meghanada)
