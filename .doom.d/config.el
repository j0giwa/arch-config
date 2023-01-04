;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq fancy-splash-image (concat doom-user-dir "splash/doom-emacs-dracula-green.png"))

(beacon-mode t)

(setq user-full-name "Jonas Schwind"
      user-mail-address "jonasschwind20021@gmx.de")

(setq auto-save-default t make-backup-files t)

(setq doom-font (font-spec :family "SFMono Nerd Font" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu Nerd Font" :size 15)
      doom-big-font (font-spec :family "SFMono Nerd Font" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq doom-theme 'doom-dracula)

(setq display-line-numbers-type 'relative)

(+global-word-wrap-mode +1)

(after! org
  (setq org-directory "~/org/"
        org-hide-emphasis-markers t
        org-log-done 'time
        org-src-fontify-natively t
        org-src-tab-acts-natively t))

(with-eval-after-load 'org-faces
  (dolist
      (face
       '((org-level-1 1.7 "#51afef" ultra-bold)
         (org-level-2 1.6 "#c678dd" extra-bold)
         (org-level-3 1.5 "#98be65" bold)
         (org-level-4 1.4 "#da8548" semi-bold)
         (org-level-5 1.3 "#5699af" normal)
         (org-level-6 1.2 "#a9a1e1" normal)
         (org-level-7 1.1 "#46d9ff" normal)
         (org-level-8 1.0 "#ff6c6b" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config (setq org-auto-tangle-default t))
