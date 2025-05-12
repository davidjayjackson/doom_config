;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(cd "~/Projects/")  ;; Replace with your actual path
(setq default-directory "~/Projects//")
(use-package! denote
  :init
  (setq denote-directory "~/notes/psalms/") ; You may change the path as needed
;; (setq denote-directory "~/Documents/Denote/psalms/")
;;  (setq denote-known-keywords
;;        '("worship" "praise" "thanksgiving" "exaltation"
;;          "lament" "grief" "distress" "cry-for-help" "despair"
;;          "trust" "refuge" "deliverance" "protection" "steadfast-love"
;;          "king" "messiah" "anointed" "ruler" "zion"
;;          "torah" "wisdom" "meditation" "instruction" "righteousness"
;;          "justice" "judgment" "wicked" "enemies"
;;          "prayer" "spiritual-thirst" "presence-of-God" "renewal"
;;          "psalm-type" "superscription" "selah" "ascent" "hymn"))

  (setq denote-known-keywords '("Worship & Praise" "Lament & Suffering" "Trust & Deliverance"
                                "Messianic & Kingship" "Law & Wisdom" "Justice & Judgment"
                                "Prayer & Spirtitual Longing" "Liturgical Structure"))
  (setq denote-infer-keywords t)
  :config
  (denote-rename-buffer-mode 1))

(map! :leader
      (:prefix ("n" . "notes")
       :desc "New note"               "n" #'denote
       :desc "New note (prompt title)" "N" #'denote-type
       :desc "Rename note"            "r" #'denote-rename-file
       :desc "Open note"              "o" #'denote-open-or-create
       :desc "Search notes"           "s" #'denote-search
       :desc "Link to note"           "l" #'denote-link
       :desc "Insert link"            "i" #'denote-link-add-links
       :desc "Backlinks"              "b" #'denote-link-backlinks
       :desc "Dired in notes dir"     "d" #'denote-dired))
