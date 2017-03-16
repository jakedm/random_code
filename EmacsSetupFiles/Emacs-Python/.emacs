;------------------------;
;;;  Custom Set Faces  ;;;
;------------------------;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ein:cell-input-area ((t (:background "#042028"))))
 '(ein:cell-input-prompt ((t (:inherit header-line :background "#002b35" :foreground "#859900" :inverse-video nil :weight bold))))
 '(ein:cell-output-prompt ((t (:inherit header-line :background "#002b35" :foreground "#dc322f" :inverse-video nil :weight bold))))
 '(font-lock-comment-face ((t (:foreground "#6171c4" :inverse-video nil :underline nil :slant italic :weight normal))))
 '(font-lock-function-name-face ((t (:foreground "#2075c7" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "#cb4b16" :inverse-video nil :underline nil :slant normal :weight normal))))
 '(font-lock-type-face ((t (:foreground "#d33682" :inverse-video nil :underline nil :slant normal :weight normal))))
 '(fringe ((t (:background "#002b35" :foreground "#465a61"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 210))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 190))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 170))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 150))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :slant italic :weight bold))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :slant italic :weight normal))))
 '(markdown-math-face ((t (:inherit font-lock-string-face :foreground "#cb4b16" :slant italic))))
 '(py-variable-name-face ((t (:inherit default :foreground "#268bd2")))))


;-------------------------;
;;;  Package/Sys Setup  ;;;
;-------------------------;

;; Add Melpa
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein ;; Emacs IPython Notebook; open REPL in new emacs window, run current code  with C-c C-c
    elpy ;; Basic python mode
    flycheck ;; Better syntax checking
    py-autopep8 ;; Error display/automatic fixing
    ;;distinguished-theme ;; Dark theme, a lot of grey
    cyberpunk-theme ;; Dark theme with bright colors
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)


(add-to-list 'load-path "~/.emacs.d/plugins")
;---------------;
;;;  Display  ;;;
;---------------;

(setq inhibit-startup-message t) ;; hide the startup message

;;(load-theme 'distinguished t)
(load-theme 'cyberpunk t)


;; Linum Mode setup
(global-linum-mode 1)
(setq linum-format "%3d \u2502")

;-----------;
;;; Modes ;;;
;-----------;

(elpy-enable)
(add-hook 'python-mode-hook 'elpy-mode)

;; Ido mode
(require 'ido)
(ido-mode 1)

(require 'php-mode)
(add-hook 'php-mode-improved-hook
          '(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))

;; Python Error Checking/Dispay
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--ignore=E501,W293,W391,W690,E241"))

(when (require 'flycheck nil t)
  ;;(setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'json-mode)

;; Auto-modes ;;
(setq auto-mode-alist
   (append
     '(("\\.py\\'" . python-mode)
       ("\\.cpp\\'" . c++-mode)
       ("\\.php\\'" . php-mode)
       ("\\.json\\'" . json-mode)
       ("\\.css\\'" . web-mode)
       ("\\.html\\'" . web-mode))
    auto-mode-alist))

;-------------------------;
;;; Functions/Utilities ;;;
;-------------------------;

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

(defun kill-whitespace ()
  "Kill the whitespace between two non-whitespace characters"
  (interactive "*")
  (save-excursion
    (save-restriction
      (save-match-data
        (progn
          (re-search-backward "[^ \t\r\n]" nil t)
          (re-search-forward "[ \t\r\n]+" nil t)
          (replace-match "" nil nil))))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(python-indent-offset 2)
 '(python-shell-interpreter "python3"))
