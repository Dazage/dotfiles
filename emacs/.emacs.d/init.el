;; hide warnings due to deprecated package: https://github.com/kiwanami/emacs-epc/issues/35
(setq byte-compile-warnings '(cl-functions))

;; Configure package.el to include the MELPA repository.
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; Ensure that use-package is installed.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; follow symbolic links to their destinations on the filesystem
(setq vc-follow-symlinks t)

;; load org-mode config
(org-babel-load-file "~/.emacs.d/config.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" default))
 '(package-selected-packages
   '(yasnippet-snippet beacon yasnippet-snippets yaml-mode ansible auto-complete yasnippet magit expand-region mark-multiple elfeed-goodies elfeed which-key pretty-mode rainbow-delimiters rainbow-mode doom-themes doom-modeline all-the-icons helpful counsel ivy-rich swiper undo-tree use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
