;;(package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require '5hx-ui)
(require '5hx-better-defaults)
(require '5hx-better-editor)
;(require '5hx-shell)
(require '5hx-ELPA-packages)

(require '5hx-keybinds)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
;;(global-set-key (kbd "<f2>") 'open-init-file)

; 开启全局 Company 补全
(global-company-mode 1)



(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
