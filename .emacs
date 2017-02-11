(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Takaoゴシック" :foundry "IPA " :slant normal :weight normal :height 120 :width normal)))))
(setq-default indent-tabs-mode nil)
(global-linum-mode t)
(setq default-tab-width 4)
(set-frame-parameter nil 'fullscreen 'maximized)
(put 'upcase-region 'disabled nil)
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(global-set-key [f8] 'neotree-toggle)

;; indent-guide
(require 'indent-guide)
(indent-guide-global-mode)
(set-face-foreground 'indent-guide-face "cyan")
(setq indent-guide-recursive t)

;;
;; Auto Complete
;;
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t)          ;; 曖昧マッチ

;;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;flycheck-pos-tip
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;;左右に分割
(setq w (selected-window))
(setq w2 (split-window w nil t))

;; スクロールバーを非表示
(scroll-bar-mode 0)
