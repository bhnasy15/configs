
(set-frame-parameter (selected-frame) 'alpha '(100 . 50))
(add-to-list 'default-frame-alist '(alpha . (100 . 50)))

(push "/home/yarob/.config/emacs/load/" load-path)
(require 'bidi)
