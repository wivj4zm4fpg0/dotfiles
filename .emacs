(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (molokai)))
 '(custom-safe-themes
   (quote
    ("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" default)))
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
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
(set-frame-parameter nil 'fullscreen 'maximized) ;最大化
(put 'upcase-region 'disabled nil)

;パッケージ管理プラグインCaskの導入
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;neotree
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

;; 外部カラーテーマを読み込む(molokai)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'molokai t)
(enable-theme 'molokai)

;;expand-region
(require 'expand-region)
(global-set-key (kbd "C-,") 'er/expand-region)

;;クォートやブラッケットを一括で括る
(defun region-to-single-quote ()
  (interactive)
  (quote-formater "'%s'" "^\\(\"\\).*" ".*\\(\"\\)$"))
(defun region-to-double-quote ()
  (interactive)
  (quote-formater "\"%s\"" "^\\('\\).*" ".*\\('\\)$"))
(defun region-to-bracket ()
  (interactive)
  (quote-formater "\(%s\)" "^\\(\\[\\).*" ".*\\(\\]\\)$"))
(defun region-to-square-bracket ()
  (interactive)
  (quote-formater "\[%s\]" "^\\(\(\\).*" ".*\\(\)\\)$"))
(defun quote-formater (quote-format re-prefix re-suffix)
  (if mark-active
      (let* ((region-text (buffer-substring-no-properties (region-beginning) (region-end)))
             (replace-func (lambda (re target-text)(replace-regexp-in-string re "" target-text nil nil 1)))
             (text (funcall replace-func re-suffix (funcall replace-func re-prefix region-text))))
        (delete-region (region-beginning) (region-end))
        (insert (format quote-format text)))
    (error "Not Region selection")))
;; 2016/12/15 追記
;; リージョン選択時のみアクティブになるregion-bindings-mode(マイナーモード)を教えてもらいました
;; こちらで設定する方がグローバルなキーバインドを節約でき良いと思います
(require 'region-bindings-mode)
(region-bindings-mode-enable)
(define-key region-bindings-mode-map (kbd "M-'") 'region-to-single-quote)
(define-key region-bindings-mode-map (kbd "M-\"") 'region-to-double-quote)
(define-key region-bindings-mode-map (kbd "M-9") 'region-to-bracket)
(define-key region-bindings-mode-map (kbd "M-[") 'region-to-square-bracket)

;;bm
(require 'bm)
(global-set-key (kbd "M-p") 'bm-previous)
(global-set-key (kbd "M-p") 'bm-next)

;;anzu
(require 'anzu)
(global-anzu-mode +1)
(set-face-attribute 'anzu-mode-line nil
                    :foreground "yellow" :weight 'bold)
(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000)
 '(anzu-replace-to-string-separator " => "))
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;;ace-jump-mode
(require 'ace-jump-mode)
(global-set-key (kbd "C-;") 'ace-jump-word-mode)
(global-set-key (kbd "C-:") 'ace-jump-line-mode)

;;スクロールの調整
(setq scroll-conservatively 1)

;;highlight-symbol
(require 'highlight-symbol)
(setq highlight-symbol-colors '("LightSeaGreen" "HotPink" "SlateBlue1" "DarkOrange" "SpringGreen1" "tan" "DodgerBlue1"))
(global-set-key (kbd "C-x C-l") 'highlight-symbol-at-point)

;; 1 画面スクロール時にカーソルの画面上の位置をなるべく変えない
 (setq scroll-preserve-screen-position t)

;ファイラーを最初から表示
(neotree-toggle)

;真ん中でスクロールする
(global-centered-cursor-mode)
(global-hl-line-mode)
