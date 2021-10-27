;; Keep customizations out of this file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; enable packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; install use-package if it isn't already
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; have use-package install a package if it is missing by default
(require 'use-package-ensure)
(setq-default use-package-always-ensure t)

;; compile settings
(org-babel-load-file (expand-file-name "settings.org" user-emacs-directory))
