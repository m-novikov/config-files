(when (>= emacs-major-version 24)
    (load "package")
    (add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
    (add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
    (package-initialize))

(add-to-list 'load-path "~/.emacs.d/use-package")

(menu-bar-mode -1)
(tool-bar-mode -1)
(setq tab-width 4)
(global-hl-line-mode)
(global-linum-mode 1)

(require 'use-package)

;; Colors
(use-package solarized
    :ensure solarized-theme
    :pin melpa
    :init
    (load-theme 'solarized-dark t))


;; Helm
(use-package helm-config
    :ensure helm
    :init
    (helm-mode 1))

(use-package helm-ag
    :ensure t)

(use-package projectile
    :ensure t
    :init
    (projectile-global-mode 1)
    (setq projectile-completion-system 'helm))

(use-package helm-projectile
    :ensure t
    :pin melpa
    :init
    (helm-projectile-on))

;; Evil mode
(use-package evil
    :ensure t)

(use-package evil-nerd-commenter
    :ensure t)

(defun my/edit-emacsrc ()
  (interactive)
  (find-file user-init-file))

(defun my/reload-emacsrc ()
  (interactive)
  (load-file user-init-file))

(use-package evil-leader
    :ensure t
    :init
    (global-evil-leader-mode)
    (evil-set-initial-state 'info-mode 'normal)
    (evil-mode 1)
    (define-key evil-normal-state-map ";" 'evil-ex)
    (define-key evil-normal-state-map ":" 'evil-repeat-find-char)
    (evil-leader/set-leader ",")
    (evil-leader/set-key-for-mode 'python-mode
      "jh" 'jedi:show-doc
      "jd" 'jedi:goto-definition
      "jD" 'jedi:goto-definition-pop-marker)
    (evil-leader/set-key
      "F" 'helm-find-files
      "f" 'helm-projectile-find-file
      "r" 'helm-recentf
      "b" 'helm-buffer
      "t" 'helm-semantic-or-imenu
      "at" 'find-tag
      "ec" 'my/edit-emacsrc
      "sc" 'my/reload-emacsrc
      "p" 'helm-projectile
      "g" 'helm-projectile-ag
      "s" 'magit-status
      "ci" 'evilnc-comment-or-uncomment-lines
      "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
      "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
      "cc" 'evilnc-copy-and-comment-lines
      "cp" 'evilnc-comment-or-uncomment-paragraphs
      "cr" 'comment-or-uncomment-region
      "cv" 'evilnc-toggle-invert-comment-line-by-line))

(use-package evil-matchit
    :ensure t
    :config
    (global-evil-matchit-mode 1))

;; Python
(use-package python-environment
    :ensure t)

(use-package virtualenvwrapper
    :ensure t
    :init
    (venv-initialize-interactive-shells)
    (setq venv-location "~/.virtualenvs"))

(use-package jedi
    :ensure t
    :init
    (defun my/python-mode-hook ()
        (company-mode -1)
	(jedi:setup))
    (setq jedi:complete-on-dot t)
    (add-hook 'python-mode-hook 'my/python-mode-hook))

;; Js
(use-package tern
    :ensure t)

(use-package js2-mode
    :ensure t
    :mode "\\.js\\'"
    :config
    (defun my/js-mode-hook ()
        (add-to-list 'company-backends 'company-tern)
	(tern-mode))
    (add-hook 'js2-mode-hook 'my/js-mode-hook))
    

;; Autocomplete (Company)
(use-package yasnippet
    :ensure t)

(use-package company
    :ensure t
    :init
    (add-hook 'after-init-hook 'global-company-mode))

(use-package rainbow-delimiters
    :ensure t
    :init
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package magit
    :ensure t)

(use-package evil-magit
    :ensure t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((flycheck-flake8rc . "tox.ini")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
