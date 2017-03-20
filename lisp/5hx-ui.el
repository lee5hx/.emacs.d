

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
;;(require 'diminish)
;;(diminish 'visual-line-mode)
;;(diminish 'abbrev-mode)

;;ace-window
(use-package ace-window
  :init
  (ace-window-display-mode t))








;;powerline

(when (image-type-available-p 'xpm)
 (use-package powerline
     :config
   (setq powerline-display-buffer-size nil)
   (setq powerline-display-mule-info nil)
   (setq powerline-display-hud nil)

   (when (display-graphic-p)
     (powerline-default-theme)
    (remove-hook 'focus-out-hook 'powerline-unset-selected-window))))






;;(require 'micgoline)

; (use-package powerline
;  :ensure t
;  :config
;    (setq powerline-arrow-shape 'arrow14)
;    (setq powerline-default-separator-dir '(right . left))

;     (custom-set-faces
;     '(mode-line ((t (:foreground "#030303" :background "#6b6b6b" :box nil))))
;     '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#6b6b6b" :box nil)))))

;     (setq powerline-color1 "#49483E")
;     (setq powerline-color2 "#333333")
;    (powerline-default-theme))


;;(set-face-attribute 'mode-line-buffer-id nil :foreground "white")




;;spaceline
; ;;(use-package spaceline :ensure t)

; (use-package spaceline-config
;   :ensure nil
;   :after spaceline
;   :config
;   (setq-default powerline-default-separator 'wave
;                 powerline-height 18
;                 spaceline-highlight-face-func 'spaceline-highlight-face-modified)
;   (spaceline-toggle-persp-name-off)
;   (spaceline-toggle-workspace-number-off)
;   (spaceline-toggle-version-control-on)
;   (spaceline-emacs-theme)
;   (spaceline-define-segment version-control
;     "Version control information."
;     (powerline-raw (s-trim vc-mode))
;     :when vc-mode))


(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq-default powerline-default-separator 'wave
                powerline-height 20
                spaceline-highlight-face-func 'spaceline-highlight-face-modified)
  (spaceline-toggle-persp-name-off)
  (spaceline-toggle-workspace-number-off)
  (spaceline-toggle-version-control-on)
  (spaceline-emacs-theme)
  (spaceline-define-segment version-control
    "Version control information."
    (powerline-raw (s-trim vc-mode))
    :when vc-mode)






(use-package beacon
  :ensure t
  :diminish beacon-mode
  :init
  (setq beacon-push-mark 35)
  (setq beacon-color "#666600")
  :config
  (beacon-mode 1))





(provide '5hx-ui)
