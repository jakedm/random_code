(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(c-basic-offset 2)
 '(c-default-style
   (quote
    ((c-mode . "")
     (java-mode . "java")
     (awk-mode . "awk")
	 (other . "gnu"))))
 '(custom-enabled-themes (quote (ahungry)))
 '(custom-safe-themes
   (quote
    ("8a5ac83a3807cbd06ba507d0756d0c926fd488850faabc23a271eeb1e02ca678" default)))
 '(inhibit-startup-screen t)
 '(red "#ffffff")
 '(s-set-offset (quote +))
 '(standard-indent 4)
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30)))
  '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white"
	        :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))


;; Require MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
;;(when (< emacs-major-version 24)
;; For important compatibility libraries like cl-lib
;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/elpa/")
(setq custom-safe-themes t)
;highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode 1)

;; Ido mode
(require 'ido)
(ido-mode 1)

;; C editing stuff
;;(windmove-default-keybindings)

;;(require 'cc-mode)
;;(require 'semantic)
;;(global-semanticdb-minor-mode 1)
;;(global-semantic-idle-scheduler-mode 1)
;;(semantic-mode 1)

;; Iffy packages

;; Projectiles
;;(require 'projectile)
;;(projectile-global-mode)

;; Company
;;(require 'company)
;;(add-hook 'after-init-hook 'global-company-mode)
;;(delete 'company-semantic company-backends)
;;(define-key c-mode-map  [(tab)] 'company-complete)
;;(define-key c++-mode-map  [(tab)] 'company-complete)
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; company-c-headers
;; (add-to-list 'company-backends 'company-c-headers)

;; Set Theme
(load-theme 'ahungry)

;; Turn on linum-mode by default
(add-hook 'prog-mode-hook 'linum-mode)

(setq auto-mode-alist
      (cons
       '("\\.m$" . octave-mode)
       auto-mode-alist))

(setq default-mode-line-format
      (list ""
	    'mode-line-modified
	    "<"
	    'mode-line-system-identification
	    "> "
	    "%14b"
	    " "
	    'default-directory
	    " "
	    "%[("
	    'mode-name
	    'minor-mode-alist
	    "%n"
	    'mode-line-process
	    ")%]--"
	    "Line %l--"
	    '(-3 . "%P")
	    "-%-"))

;; Build Cool directory tree
(require 'dirtree)
(dirtree-mode)

;; Major modes ;;
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;(add-to-list 'auto-mode-alist '("\\.c'" . cc-mode))
;;(add-to-list 'auto-mode-alist '("\\.h\\'" . cc-mode))
;;(add-to-list 'auto-mode-alist '("\\.cpp'" . cc-mode))
;; Set C default style (Also "gnu", "bsd", and "java"
(setq c-default-style "linux")

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; Delete trailing white space before closing
(add-hook 'before-save-hook
		  'delete-trailing-whitespace)

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
)
