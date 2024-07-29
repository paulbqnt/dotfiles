;; Initialize package sources
(require 'package)

;; Add MELPA to the list of package archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Initialize the package system
(package-initialize)


;; Install Evil if it's not already installed
(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil))

;; Enable Evil mode
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "d7bf35cbf07fe90b420ca85625d4e1baff08fd64282562dde9dc788ed89c8242" default))
 '(package-selected-packages '(org-journal spacemacs-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(load-theme 'spacemacs-dark t)

;; Install Org if it's not already installed
(unless (package-installed-p 'org)
  (package-refresh-contents)
  (package-install 'org))

;; Require Org mode
(require 'org)

;; Automatically enable Org mode for .org files
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; Basic Org mode settings
(setq org-log-done t)  ;; Log the time when a task is marked DONE

;; Keybindings for Org mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files '("~/org/todo.org" "~/org/projects.org"))

;; Install org-journal
(unless (package-installed-p 'org-journal)
  (package-install 'org-journal))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'org-journal)

;; General org-journal settings
(setq org-journal-date-format "%A, %Y-%m-%d")

;; Function to switch to work journal
(defun my-org-journal-work ()
  (interactive)
  (setq org-journal-dir "~/org/journal/work/")
  (setq org-journal-file-format "%Y-%m-%d.org")
  (message "Switched to Work Journal"))

;; Function to switch to personal journal
(defun my-org-journal-personal ()
  (interactive)
  (setq org-journal-dir "~/org/journal/personal/")
  (setq org-journal-file-format "%Y-%m-%d.org")
  (message "Switched to Personal Journal"))

;; Keybindings to switch between journals
(global-set-key (kbd "C-c j w") 'my-org-journal-work)
(global-set-key (kbd "C-c j p") 'my-org-journal-personal)

;; Keybinding to create a new journal entry (will use the current journal context)

(global-set-key (kbd "C-c j j") 'org-journal-new-entry)
(defun my-org-journal-work ()
  (interactive)
  (setq org-journal-dir "~/org/journal/work/")
  (setq org-journal-file-format "%Y-%m-%d.org")
  (setq org-journal-date-format "%A, %d %B %Y")
  (setq org-journal-file-header "#+TITLE: Work Journal Entry\n#+STARTUP: showeverything\n\n")
  (message "Switched to Work Journal"))

(defun my-org-journal-personal ()
  (interactive)
  (setq org-journal-dir "~/org/journal/personal/")
  (setq org-journal-file-format "%Y-%m-%d.org")
  (setq org-journal-date-format "%A, %Y-%m-%d")
  (setq org-journal-file-header "#+TITLE: Personal Journal Entry\n#+STARTUP: showeverything\n\n")
  (message "Switched to Personal Journal"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
