;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 '(case-fold-search t)
 '(inhibit-startup-screen t)
 '(show-paren-mode t nil (paren))
 )

;; directories
(add-to-list 'load-path "~/.emacs.d/includes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; theme & interface
(tool-bar-mode 0)
(menu-bar-mode 0)
(define-key global-map [ns-drag-file] 'ns-find-file)
(set-default-font "-*-terminus-medium-r-*-*-15-*-*-*-*-*-*-*")

;; indentation
(setq-default indent-tabs-mode nil)
(setq
    web-mode-code-indent-offset 4
    web-mode-markup-indent-offset 4
    web-mode-css-indent-offset 2
    css-indent-level 2
    css-indent-offset 2
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

;; web mode http://web-mode.org/ https://github.com/fxbois/web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))

;; Dockerfile
(require 'dockerfile-mode)

;; Godot
(require 'godot-gdscript)

(global-set-key (kbd "C-c l") (lambda () (interactive) (shell-command "xdotool key --window $browser ctrl+r")))
(global-set-key (kbd "C-c k") (lambda () (interactive) (
    shell-command "xdotool key --window $terminal ctrl+p && xdotool key --window $terminal Return"
)))
