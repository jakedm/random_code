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
 '(custom-enabled-themes (quote (ahungry-theme)))
 '(custom-safe-themes
   (quote
    ("8a5ac83a3807cbd06ba507d0756d0c926fd488850faabc23a271eeb1e02ca678" default)))
 '(inhibit-startup-screen t)
 '(red "#ffffff")
 '(s-set-offset (quote +))
 '(standard-indent 2)
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30)))
  '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(default ((t (:inherit nil :stipple nil :background "black" :foreground "white"
 ;;        :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 )


;; Require MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
;;(when (< emacs-major-version 24)
;;;; For important compatibility libraries like cl-lib
;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)  

;; Set Default Mode for All Files
(setq-default major-mode 'text-mode)

(add-to-list 'load-path "~/.emacs.d/plugins/")
(require 'dirtree)

;; Linum Mode setup
(global-linum-mode 1)
(setq linum-format "%3d \u2502")

(require 'php-mode)
(add-hook 'php-mode-improved-hook
					'(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))

;highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode 1)  

;; Ido mode
(require 'ido)
(ido-mode 1)

;; Load ahungry theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/color-theme-ahungry/")

;; Only set this if you wish to retain your own font settings
;; otherwise, leave it out.
(setq ahungry-theme-font-settings nil)

(load-theme 'ahungry t)

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


;; Major modes ;;

(setq auto-mode-alist
      (cons
       '("\\.m$" . octave-mode)
       auto-mode-alist))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Python Mode Setup
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(defun turn-on-anaconda () (anaconda-mode 1))
(defun enable-elpy ()  (elpy-enable))
(add-hook 'python-mode-hook 'turn-on-anaconda)
(add-hook 'python-mode-hook 'enable-elpy)

;; PHP mode
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

