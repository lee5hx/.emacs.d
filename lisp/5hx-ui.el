;;(load-theme 'monokai 1)
;;monokai-theme
;;cyberpunk-theme
;;color-theme-sanityinc-tomorrow
; (use-package color-theme-sanityinc-tomorrow
;   :ensure t
;   :config
;   ('color-theme-sanityinc-tomorrow-night)


(require 'color-theme-sanityinc-tomorrow)
;;(color-theme-sanityinc-tomorrow-day t)
;;(load-theme 'color-theme-sanityinc-tomorrow-day 1)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;; 关闭启动帮助画面
;;(setq inhibit-splash-screen 1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
;;(set-face-attribute 'default nil :height 120)

(when (featurep 'ns-win)
  (custom-set-faces
   '(default ((t (:height 120 :width normal :family "Monaco"))))))


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

;;ace-windowa
(use-package ace-window
  :init
  (ace-window-display-mode t))








;;powerline

;; (when (image-type-available-p 'xpm)
;;  (use-package powerline
;;      :config
;;    (setq powerline-display-buffer-size nil)
;;    (setq powerline-display-mule-info nil)
;;    (setq powerline-display-hud nil)

;;    (when (display-graphic-p)
;;      (powerline-default-theme)
;;     (remove-hook 'focus-out-hook 'powerline-unset-selected-window))))






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


;;(use-package spaceline :ensure t)

;; (use-package spaceline-config
;;   :ensure nil
;;   :after spaceline
;;   :config
;;   (setq-default powerline-default-separator 'wave
;;                 powerline-height 18
;;                 spaceline-highlight-face-func 'spaceline-highlight-face-modified)
;;   (spaceline-toggle-persp-name-off)
;;   (spaceline-toggle-workspace-number-off)
;;   (spaceline-toggle-version-control-on)
;;   (spaceline-emacs-theme)
;;   (spaceline-define-segment version-control
;;     "Version control information."
;;     (powerline-raw (s-trim vc-mode))
;;     :when vc-mode))

;;(require 'spaceline)
(window-numbering-mode 1)

(require 'spaceline-config)
(spaceline-emacs-theme)
(setq-default powerline-default-separator 'wave
                powerline-height 18
                spaceline-highlight-face-func 'spaceline-highlight-face-modified
		;;powerline-default-separator 'utf-8-lang
		;;ns-use-srgb-colorspace nil
		)
(spaceline-toggle-window-number-on)
(spaceline-toggle-persp-name-off)
(spaceline-toggle-workspace-number-off)
(spaceline-toggle-version-control-on)


(spaceline-define-segment version-control
    "Version control information."
    (powerline-raw (s-trim vc-mode))
    :when vc-mode)
;;(spaceline-emacs-theme)






(use-package beacon
  :ensure t
  :diminish beacon-mode
  :init
  (setq beacon-push-mark 35)
  (setq beacon-color "#666600")
  :config
  (beacon-mode 1))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))



(require 'random-splash-image)
(setq random-splash-image-dir (concat (getenv "HOME") "/.emacs.d/splash-images"))
(random-splash-image-set)
(defun use-fancy-splash-screens-p ()
  "Return t if fancy splash screens should be used."
  (when (and (display-graphic-p)
             (or (and (display-color-p)
          (image-type-available-p 'xpm))
                 (image-type-available-p 'pbm)))
    (let ((frame (fancy-splash-frame)))
      (when frame
  (let* ((img (create-image (fancy-splash-image-file)))
         (image-height (and img (cdr (image-size img nil frame))))
         ;; We test frame-height so that, if the frame is split
         ;; by displaying a warning, that doesn't cause the normal
         ;; splash screen to be used.
         (frame-height (1- (frame-height frame))))
   ;; The original value added to the `image-height' for the test was 19; however,
   ;; that causes the test to fail on X11 by about 1.5 -- so use 17 instead.
    (> frame-height (+ image-height 17)))))))
(use-fancy-splash-screens-p)




;;(setq fancy-splash-image (expand-file-name "~/.emacs.d/splash-images/my_no001_picture.png"))



(provide '5hx-ui)
