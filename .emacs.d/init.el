;; Ensure package system is set up
;; to sync with init.el -> org-tangle-babel 
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))
(package-initialize)

;; Install use-package if not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Load use-package
(require 'use-package)

;; Install and configure Evil
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  :config
  (evil-mode 1))

;; Install and configure doom-themes
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

;; Install and configure Org mode
(use-package org
  :ensure org-plus-contrib
  :config
  (setq org-directory "~/Nextcloud/org"))

;; Install and configure Org-roam
(use-package org-roam
  :ensure t
  :after org
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 :map org-mode-map
	 ("C-M-i"   . completion-at-point))
  :config
  (require 'org-roam)
  (setq org-roam-directory "~/Nextcloud/org-roam") ;; Set your preferred directory for notes
  (org-roam-setup))

;; Install and configure Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (agenda   . 5))
        dashboard-startup-banner 'official
        dashboard-center-content t))

;; Install and configure org-bullets
(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode))

;; Install and configure Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

;; Install and configure Projectile
(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map)))

;; Install and configure Which-Key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))
