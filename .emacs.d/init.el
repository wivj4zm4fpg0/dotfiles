
;;; Code:
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(tool-bar-mode 0) ;ツールバーを隠す
(load-theme 'tango-dark)
(global-linum-mode t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(global-set-key "\C-x\C-b" 'buffer-menu)

(centered-cursor-mode t)
(global-centered-cursor-mode t)

(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'flycheck)
(flycheck-define-checker c/c++
                         "A C/C++ checker using g++."
                         :command ("g++-7" "`pkg-config --cflags opencv` `pkg-config --libs opencv`" source)
                         :error-patterns  ((error line-start
                                                  (file-name) ":" line ":" column ":" " エラー: " (message)
                                                  line-end)
                                           (warning line-start
                                                    (file-name) ":" line ":" column ":" " 警告: " (message)
                                                    line-end))
                         :modes (c-mode c++-mode))

(setq make-backup-files t)

(provide 'init)
;;; init.el ends here
