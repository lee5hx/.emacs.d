(setq make-backup-files nil)

(delete-selection-mode 1)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))


(global-hl-line-mode 1)

(setq-default cursor-type 'bar)

;;(setq visible-bell t)
;;(setq visible-bell t)
(setq ring-bell-function 'ignore)

;Make searches case insensitive.
;(setq-default case-fold-search t)


;;Turn off the blinking cursor.
(blink-cursor-mode -1)

;;Display the running program and the selected buffer in the frame title.
(setq frame-title-format
      '("" invocation-name ": " (:eval (replace-regexp-in-string "^ +" "" (buffer-name)))))

;;End of file
;;Don’t add new lines past end of file, and indicate unused lines at the end of the window with a small image in the left fringe.
(setq next-line-add-newlines nil)
(setq-default indicate-empty-lines t)
;;Add \n to end of file if required.
;;(setq require-final-newline t)


;;Hi Lock todo 回头再折腾这个
;;(setq hi-lock-auto-select-face nil)


;;Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;dired
(require 'dired-x)
(setq dired-dwim-target t)
(put 'dired-find-alternate-file 'disabled nil)


(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)



(provide '5hx-better-defaults)
