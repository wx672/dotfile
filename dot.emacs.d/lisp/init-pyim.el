;;; init-pyim.el --- pinyin input method

;;; Commentary: https://github.com/tumashu/pyim

;;; Code:

(require 'pyim)
(require 'pyim-basedict)

(use-package pyim
  :ensure nil
  :demand t
  :diminish pyim-isearch-mode
  :config
  ;; 激活 basedict 拼音词库
  (use-package pyim-basedict
    :ensure nil
    :config (pyim-basedict-enable))

  (setq pyim-dicts
  		'((:name "bigdict" :file "~/.emacs.d/pyim/pyim-bigdict.pyim")))

  (setq default-input-method "pyim")

  ;; 我使用全拼
  (setq pyim-default-scheme 'quanpin)

  ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
  ;; 我自己使用的中英文动态切换规则是：
  ;; 1. 光标只有在注释里面时，才可以输入中文。
  ;; 2. 光标前是汉字字符时，才能输入中文。
  ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  ;pyim-probe-isearch-mode ; troubles PDF viewer
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))

  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))

  (setq pyim-punctuation-translate-p '(auto yes no))

  ;; 开启拼音搜索功能
;  (pyim-isearch-mode 1) ; troubles PDF viewer

  ;; 使用 pupup-el 来绘制选词框
  (setq pyim-page-tooltip 'popup)
  (setq pyim-page-style 'one-line)
  ;; 选词框显示5个候选词
  (setq pyim-page-length 5)

  ;; 让 Emacs 启动时自动加载 pyim 词库
  ;; (add-hook 'emacs-startup-hook
  ;;           #'(lambda () (pyim-restart-1 t)))

  :bind
  (("M-j" . pyim-convert-code-at-point) ;与 pyim-probe-dynamic-english 配合
   ("C-;" . pyim-delete-word-from-personal-buffer)))

(provide 'init-pyim)
;;; init-pyim.el ends here
