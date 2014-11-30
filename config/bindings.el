;; Place personal bindings here
;;开启菜单栏
;(menu-bar-mode t)
;; 显示行号
(global-linum-mode t)
;; 设置默认工作目录
(setq default-directory "/home/qfp/workspace/rails")
;;取消备份文件
(setq make-backup-files nil)

;;设置css颜色，显示为当前颜色的值
(require 'rainbow-mode)

(dolist (hook '(css-mode-hook
                html-mode-hook))
  (add-hook hook (lambda () (rainbow-mode t))))
;;去掉换行的回转箭头符合
(global-visual-line-mode 1)

;;设置默认颜色主题
(add-to-list 'load-path "~/.emacs.d/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-aalto-light)


;;      最大化
; (defun my-maximized ()
; (interactive)
; (x-send-client-message
; nil 0 nil "_NET_WM_STATE" 32
; '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
; (x-send-client-message
; nil 0 nil "_NET_WM_STATE" 32
; '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
; )

;; 设置启动窗口最大化
;;(my-maximized)
;;设置字体大小
(set-default-font " -unknown-Droid Sans Mono-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1")

;; 回车缩进
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)

;; 设置字体和背景颜色
;(set-background-color "#0A101C")

;; 指针颜色设置为绿色
(set-cursor-color "green")

;;设置tab为2个空格的宽度
(setq default-tab-width 2)



;;显示括号匹配
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 实现全屏效果，快捷键为f11
(global-set-key [f11] 'my-fullscreen)
(defun my-fullscreen ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

;; 语法高亮
(global-font-lock-mode t)

;;rails
(setq load-path (cons "~/.emacs.d/rails" load-path))
(require 'rails)

;;rvm
(require 'rvm)
(rvm-use-default)

;;slim html template mode
(require 'slim-mode)
(require 'sass-mode)

;; 下面是关于cucumber的配置
(load "feature-mode")
;; load bundle snippets
(yas/load-directory "~/.emacs.d/lib/yasnippet/snippets")
(add-to-list 'auto-mode-alist '("\\.feature" . feature-mode))

(setq mumamo-background-colors nil)


;;----------设置slim语法高亮------------
;;(add-to-list 'load-path "~/emacs.d/rails")
;;(require 'slim-mode)

;;----------设置haml语法高亮------------
(add-to-list 'load-path "~/emacs.d/rails")
(require 'haml-mode)

(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
;;(add-to-list 'auto-mode-alist '("\\.slim$" . slim-mode)

;;--------------erb 高亮-------------------
(add-to-list 'auto-mode-alist '("\\.erb$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb$" . html-mode))

;;-------------markdown setting ------------------

(autoload 'markdown-mode "~/.emacs.d/lib/markdown-mode.el"
  "Major mode for editing Markdown files" t)
  (setq auto-mode-alist
    (cons '("\\.md" . markdown-mode) auto-mode-alist)
    )

;;----------yaml-mode--------------
(add-to-list 'load-path "~/emacs.d/lib")
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; turn off highlighting current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "white")




;;-----------绑定代码折叠的快捷键---------
;;(global-set-key [f1] 'hs-toggle-hiding)
(define-key global-map (kbd "M-,") 'hs-toggle-hiding)

;;----------coffee-mode--------------
(add-to-list 'load-path "~/emacs.d/lib")
(require 'coffee-mode)
    (add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

;;diplay time
(display-time)

;; 设置缩进线
(add-to-list 'load-path "~/emacs.d/lib")
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#AA5500")

;; 设置ruby代码风格检查器 rubocop
;(add-to-list 'load-path "~/emacs.d/lib")
;(require 'rubocop)

;;-------------------------------------------括号补全--------------------------------------

;; 填入大中小括号，双单引号的匹配
;; 详细格式可以参照C-h f skeleton-pair-alist
(setq skeleton-pair-alist
      '((?\" _ "\"" >)
        (?\' _ "\'" >)
        (?\( _ ")" >)
        (?\[ _ "]" >)
        (?\{ _ "}" >)))

(setq skeleton-pair t)

;; 绑定全局键值
;; 也可以绑定单独到某个mode，比如cc-mode (define-key cc-mode-map (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "(")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "{")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[")  'skeleton-pair-insert-maybe)
