


(defun nl/setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )

(defun my-common-prog-mode-settings ()
  "Enables settings common between programming language modes."
  (nl/setup-indent 3) ; indent 2 spaces width
  ;;
  ;; Set tab and CR/LF keys to call their corresponding more-general
  ;; functions.  This needs to be here to override the settings of some modes
  ;; (e.g. c++-mode changes the tab key to do a re-indent).
  ;;
  (local-set-key "\t" 'tab-to-tab-stop)
  (local-set-key "\n" 'newline-and-indent)
  (local-set-key "\r" 'newline-and-indent)
  ;;
  ;; Set paragraph/comment auto-formatting to wrap at column 100.
  ;;
  (set-fill-column 100)
  ;;
  ;; Set the comment column to zero so that lisp comment lines will act like
  ;; C++ comments (i.e. line up with the code), and not automatically indent
  ;; to column 50.
  ;;
  (setq comment-column 0)
  (push '(">=" . ?≥) prettify-symbols-alist)
  (push '("<=" . ?≤) prettify-symbols-alist)
  (push '("->" . ?→) prettify-symbols-alist)
  )

(setq makefile-mode-hook 'my-common-prog-mode-settings)
(setq sh-mode-hook       'my-common-prog-mode-settings)


(use-package fic-mode
  :ensure t
  :commands fic-mode
  :config
    (add-hook 'c++-mode-hook 'fic-mode)
    (add-hook 'c-mode-hook 'fic-mode)
    (add-hook 'java-mode-hook 'fic-mode)
    (add-hook 'sala-mode-hook 'fic-mode)
    (add-hook 'python-mode-hook 'fic-mode)
    (add-hook 'php-mode-hook 'fic-mode))



(use-package js2-mode
  :ensure t
  :commands (js2-mode)
  :mode "\\.js\\'"
  :init
  (setq js2-global-externs '("define"
                             "jasmine"
                             "describe"
                             "fdescribe"
                             "fail"
                             "beforeEach"
                             "afterEach"
                             "inject"
                             "expect"
                             "spyOn"
                             "it"
                             "fit"
                             "xit"))
  :config
  (custom-set-variables '(js2-basic-offset 2)
                        '(js2-bounce-indent-p nil)
                        '(js2-highlight-level 3))

  ;;(eval-after-load 'js2-mode
  ;;  '(define-key js2-mode-map (kbd "RET") 'js2-line-break))

  ;;(add-hook 'js2-mode-hook 'ac-js2-mode)
  ;;(setq ac-js2-evaluate-calls t)

  (setq-default js2-mode-show-parse-errors t)
  (setq-default js2-strict-missing-semi-warning t)
  (setq-default js2-strict-trailing-comma-warning t))


(use-package js2-refactor
  :ensure t
  :after js2-mode
  :diminish js2-refactor-mode
  :config
  (add-hook 'js-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-m"))



(setq javascript-common-imenu-regex-list
      '(("Controller" "[. \t]controller([ \t]*['\"]\\([^'\"]+\\)" 1)
        ("Controller" "[. \t]controllerAs:[ \t]*['\"]\\([^'\"]+\\)" 1)
        ("Filter" "[. \t]filter([ \t]*['\"]\\([^'\"]+\\)" 1)
        ("State" "[. \t]state[(:][ \t]*['\"]\\([^'\"]+\\)" 1)
        ("Factory" "[. \t]factory([ \t]*['\"]\\([^'\"]+\\)" 1)
        ("Service" "[. \t]service([ \t]*['\"]\\([^'\"]+\\)" 1)
        ("Module" "[. \t]module( *['\"]\\([a-zA-Z0-9_.]+\\)['\"], *\\[" 1)
        ("ngRoute" "[. \t]when(\\(['\"][a-zA-Z0-9_\/]+['\"]\\)" 1)
        ("Directive" "[. \t]directive([ \t]*['\"]\\([^'\"]+\\)" 1)
        ("Event" "[. \t]\$on([ \t]*['\"]\\([^'\"]+\\)" 1)
        ("Config" "[. \t]config([ \t]*function *( *\\([^\)]+\\)" 1)
        ("Config" "[. \t]config([ \t]*\\[ *['\"]\\([^'\"]+\\)" 1)
        ("OnChange" "[ \t]*\$(['\"]\\([^'\"]*\\)['\"]).*\.change *( *function" 1)
        ("OnClick" "[ \t]*\$([ \t]*['\"]\\([^'\"]*\\)['\"]).*\.click *( *function" 1)
        ("Watch" "[. \t]\$watch( *['\"]\\([^'\"]+\\)" 1)
        ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
        ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
        ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)
        ))

;; js-mode imenu enhancement
;; @see http://stackoverflow.com/questions/20863386/idomenu-not-working-in-javascript-mode
(defun nl-js-imenu-make-index ()
  (save-excursion
    (imenu--generic-function javascript-common-imenu-regex-list)))

(defun nl/javascript-mode-hook ()
  (nl/setup-indent 2) ; indent 2 spaces width
  (setq comment-multi-line t)
  (define-key js-mode-map [remap indent-new-comment-line]
    'c-indent-new-comment-line)
  (setq indent-tabs-mode nil)
  (setq imenu-create-index-function 'nl-js-imenu-make-index)
  (flycheck-mode t))

;;(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'fic-mode)
(add-hook 'js2-mode-hook 'nl/javascript-mode-hook)
(add-hook 'js2-mode-hook 'my-common-prog-mode-settings)
;;(add-hook 'js2-mode-hook 'js2-imenu-extras-mode)


(defun nl/counsel-ag-js ()
  "Perform counsel-ag on the project's JavaScript files."
  (interactive)
  (counsel-ag "" (projectile-project-root) "--js"))

(global-set-key (kbd "C-c s j") 'nl/counsel-ag-js)



(provide '5hx-javascript)
