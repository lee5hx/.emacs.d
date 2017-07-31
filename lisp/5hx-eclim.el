(require 'eclim)
(add-hook 'java-mode-hook 'eclim-mode)

(require 'eclimd)



(custom-set-variables
  '(eclim-eclipse-dirs '("/Users/lee5hx/Applications/Eclipse.app/Contents/Eclipse"))
  '(eclim-executable "/Users/lee5hx/Applications/Eclipse.app/Contents/Eclipse/eclim"))


(provide '5hx-eclim)
