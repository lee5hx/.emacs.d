

;;(load-theme 'monokai 1)
;;monokai-theme
;;cyberpunk-theme
(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 关闭缩进 (第二天中被去除)
;; (electric-indent-mode -1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 120)


(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;Mode line
;;Display the column number in the mode line.
(column-number-mode t)

;;Use the directory name to make buffer names unique.
(setq uniquify-buffer-name-style 'forward)

;;Do not show thees modes in the mode line.
;;(diminish 'visual-line-mode)
;;(diminish 'abbrev-mode)

;;powerline
(use-package powerline
  :ensure t
  :config
    (setq powerline-arrow-shape 'arrow14)
    (setq powerline-default-separator-dir '(right . left))

    ;;(custom-set-faces
     ;;'(mode-line ((t (:foreground "#030303" :background "#6b6b6b" :box nil))))
     ;;'(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#6b6b6b" :box nil)))))

    ;;(setq powerline-color1 "#49483E")
   ;; (setq powerline-color2 "#333333")
    (powerline-default-theme))



(provide '5hx-ui)
