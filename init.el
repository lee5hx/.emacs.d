 ;;; (package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)


;;拷贝环境变量到emacs-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))



(require 'pallet)
(pallet-mode t)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;;exec-path-from-shell
;; (use-package exec-path-from-shell
;;   :if (and (eq system-type 'darwin) (display-graphic-p))
;;   :ensure t
;;   :pin melpa-stable
;;   :config
;;   (progn
;;      (when (string-match-p "/zsh$" (getenv "SHELL"))
;;       ;; Use a non-interactive login shell.  A login shell, because my
;;       ;; environment variables are mostly set in `.zprofile'.
;;        (setq exec-path-from-shell-arguments '("-l")))

;;      (exec-path-from-shell-initialize)))


(require 'mac-port-keys)
(require '5hx-ui)
(require '5hx-better-defaults)
;;(require '5hx-meghanada)
(require '5hx-better-editor)
;;(require '5hx-shell)
(require '5hx-ELPA-packages)
(require '5hx-programming)

;;(require '5hx-java)
;;(require '5hx-eclim)
(require '5hx-lua)
(require '5hx-clj)
(require '5hx-org)
;;(require '5hx-javascript)
(require '5hx-keybinds)

;; 快速打开配置文件
;;(defun open-init-file()
;;  (interactive)
;;  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
;;(global-set-key (kbd "<f2>") 'open-init-file)

; 开启全局 Company 补全
;;(global-company-mode 1)



(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)

;;; init.el ends here
