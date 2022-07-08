
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 '(case-fold-search t)
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(show-paren-mode t nil (paren))
 )

;; directories
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; theme & interface
(tool-bar-mode 0)
(menu-bar-mode 0)
(define-key global-map [ns-drag-file] 'ns-find-file)

;; indentation
(setq-default indent-tabs-mode nil)
(setq
    web-mode-code-indent-offset 4
    web-mode-markup-indent-offset 4
    web-mode-css-indent-offset 2
    css-indent-level 2
    css-indent-offset 2
    web-mode-script-padding 0
    web-mode-style-padding 0
)

;; whitespace
(setq-default
    show-trailing-whitespace t
    show-tabs t
)

;; hotkeys
(global-set-key [?\C-;] 'goto-line)
(global-set-key [?\C-'] 'revert-buffer)
(add-hook 'c-mode-common-hook
  (lambda()
    (c-set-offset 'arglist-cont-nonempty 'c-lineup-math)
    (hs-minor-mode t)
  )
)

(add-hook 'python-mode-hook
  (lambda()
    (hs-minor-mode t)
  )
)

(add-hook 'hs-minor-mode-hook
  (lambda()
    (local-set-key (kbd "C-c s") 'hs-show-block)
    (local-set-key (kbd "C-c h") 'hs-hide-block)
    (local-set-key (kbd "C-c H") 'hs-hide-all)
    (local-set-key (kbd "C-c S") 'hs-show-all)
  )
)

;; buffer cleaning
(setq clean-buffer-list-delay-general 0)
(setq clean-buffer-list-delay-special 0)

;; file types
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; color theme http://github.com/bbatsov/zenburn-emacs
(load-theme 'zenburn t)

;; c mode for arduino
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c-mode))

;; php mode https://github.com/ejmr/php-mode
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

;; web mode http://web-mode.org/ https://github.com/fxbois/web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))

;; scss mode https://github.com/antonj/scss-mode
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; less mode https://github.com/purcell/less-css-mode
(autoload 'less-css-mode "less-css-mode")
(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))

;; Dockerfile
(require 'dockerfile-mode)

;; Godot
(require 'gdscript-mode)

;; GLSL
(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.shader\\'" . glsl-mode))

;; powershell mode https://github.com/jschaf/powershell.el
(require 'powershell)


(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


(global-set-key (kbd "C-c l") (lambda () (interactive) (shell-command "xdotool key --window $browser ctrl+r")))
(global-set-key (kbd "C-c k") (lambda () (interactive) (
    shell-command "xdotool key --window $terminal ctrl+p && xdotool key --window $terminal Return"
)))

(defun get-window (name)
  (setenv name
          (shell-command-to-string "xwininfo |grep 'Window id' |awk '{print $4}' |xargs printf '%d'")
  )
  )

(defun js2 () (setq js-indent-level 2))
(defun js4 () (setq js-indent-level 4))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
