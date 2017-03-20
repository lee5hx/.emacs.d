


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





(provide '5hx-programming)
