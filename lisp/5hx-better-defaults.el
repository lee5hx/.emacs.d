(setq make-backup-files nil)

(delete-selection-mode 1)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

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
      '("" invocation-name ": " (:eval (replace-regexp-in-string
                                        "^ +" "" (buffer-name)))))

;;End of file
;;Don’t add new lines past end of file, and indicate unused lines at the end of the window with a small image in the left fringe.
(setq next-line-add-newlines nil)
(setq-default indicate-empty-lines t)
;;Add \n to end of file if required.
;;(setq require-final-newline t)


;;Hi Lock todo 回头再折腾这个
;;(setq hi-lock-auto-select-face t)


;;Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)




(provide '5hx-better-defaults)
