(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq tab-width 4)
(setq evil-want-C-i-jump nil)
(require 'evil)
(require 'evil-leader)
;; Evil leader must be initialized before evil mode
(global-evil-leader-mode)
(evil-mode 1)
(require 'color-theme)
(require 'color-theme-solarized)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Theme
(color-theme-solarized)
;; Helm
(require 'helm-config)
(helm-mode 1)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-w") 'backward-kill-word)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-w") 'backward-kill-word)
;(global-set-key (kbd "M-x") 'helm-M-x)
;; JEDI
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi)
  (jedi:setup)
  (set (make-local-variable 'compile-command)
       (concat "python -m doctest " (shell-quote-argument buffer-file-name))))

; (set (make-local-variable 'company-backends)
;     '((company-dabbrev-code company-yasnippet)))
;;(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'my/python-mode-hook)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'go-mode-autoloads)
(require 'company-go)

(defun my/c-mode-hook ()
  (add-to-list 'company-backends 'company-c-headers)
  (set (make-local-variable 'company-backends)
     '((company-dabbrev-code company-yasnippet))))

(add-hook 'c-mode-hook 'my/c-mode-hook)
(setq flycheck-highlighting-mode 'lines)

(require 'yasnippet)
;(yas-global-mode 1)
;(setq tab-always-indent 'complete)

(global-set-key (kbd "C-<tab>") 'company-complete)
(evilnc-default-hotkeys)

(require 'neotree)

(global-set-key [f8] 'neotree-toggle)
(require 'evil-matchit)
(global-evil-matchit-mode 1)
(define-key evil-normal-state-map ";" 'evil-ex)
(define-key evil-normal-state-map ":" 'evil-repeat-find-char)
(define-key evil-normal-state-map ",f" 'find-file)
(define-key evil-normal-state-map ",r" 'helm-recentf)
(define-key evil-normal-state-map ",p" 'helm-projectile)
(define-key evil-normal-state-map ",t" 'helm-semantic-or-imenu)
(define-key evil-normal-state-map ",at" 'find-tag)

(defun my/edit-emacsrc ()
  (interactive)
  (find-file user-init-file))

(defun my/reload-emacsrc ()
  (interactive)
  (load-file user-init-file))

(define-key evil-normal-state-map ",ec" 'my/edit-emacsrc)
(define-key evil-normal-state-map ",sc" 'my/reload-emacsrc)

(require 'evil-exchange)
;; change default key bindings (if you want) HERE
;; (setq evil-exchange-key (kbd "zx"))
(evil-exchange-install)

(projectile-global-mode)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
