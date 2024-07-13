;; Recentf mode
(recentf-mode 1)

;; electric-pairs
(electric-pair-mode t)

;; reducing line spacing
(setq-default line-spacing 1)

;; disable menu on startup
(menu-bar-mode -1)

;; disable tools bar on startup
(tool-bar-mode -1)

;; line numbers
(defvar display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; startup scratch message
(setq initial-scratch-message "
;    ---==Young buddha sitting under yin/yang trees==---
;                         (take 4)
; 
;         69696969                         69696969
;      6969    696969                   696969    6969
;    969    69  6969696               6969  6969     696
;   969        696969696             696969696969     696
;  969        69696969696           6969696969696      696
;  696      9696969696969           969696969696       969
;   696     696969696969             969696969        969
;    696     696  96969      _=_      9696969  69    696
;      9696    969696      q(-_-)p      696969    6969
;         96969696         '_) (_`         69696969
;            96            /__/  \\           69
;            69          _(<_   / )_          96
;           6969       (__\\_\\_|_/__)       9696
")

;; inhibit splash screen
(setq inhibit-splash-screen t)

;; dired
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; disable bell sound
(setq ring-bell-function 'ignore)

;; use-package setup
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; set up Melpa repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

;; use-package setup
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; dired
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; vertico
(use-package
  vertico
  :init (vertico-mode)
  (setq vertico-count 10)
  (setq vertico-resize t))

;; orderless completion style
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; enable corfu
(use-package
  corfu
  :custom
  (corfu-cycle t)	   ; Allows cycling through candidates
  (corfu-auto t)		   ; Enable auto completion
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.0)
  (corfu-preview-current 'insert)   ; Do not preview current candidate
  (corfu-preselect-first nil)
  (corfu-on-exact-match nil)        ; Don't auto expand tempel snippets
  (lsp-completion-provider :none)
  :bind (:map corfu-map
	      ("TAB"        .  corfu-insert)
	      ([tab]        .  corfu-insert)
	      ("RET"        . nil))
  
  :init
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode)		; Popup completion info
  
  :custom
  (add-hook 'eshell-mode-hook (lambda ()
				(setq-local corfu-quit-at-boundary t
					    corfu-quit-no-match t
					    corfu-auto t)
				(corfu-mode))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(fish-mode sudo-edit flymake-markdownlint markdown-mode denote flycheck-checkbashisms corfu orderless use-package vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; smooth scroll
(setq scroll-margin 8
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
