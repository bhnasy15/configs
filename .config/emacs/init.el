
(set-frame-parameter (selected-frame) 'alpha '(100 . 50))
(add-to-list 'default-frame-alist '(alpha . (100 . 50)))

(set-face-attribute 'default t :font "FiraMono")

(defun arabic-input-font ()
  (interactive)
  (set-input-method "arabic")
  (face-remap-add-relative 'default :family "Amiri")
)
(global-set-key (kbd "C-c a") 'arabic-input-font)

;; define a function to toggle transparency and set key binding for it.
;(defun toggle-transparency ()
	;(interactive)
	;(let
		;((alpha (frame-parameter nil 'alpha)))
		;(set-frame-parameter
			;nil 'alpha
			;(if (eql 
					;(cond
						;((numberp alpha) alpha)
						;((numberp (cdr alpha)) (cdr alpha))
						;;; Also handle undocumented (<active> <inactive>) form.
						;((numberp (cadr alpha)) (cadr alpha))
					;)
					;100
				;)
				;'(85 . 50) '(100 . 100)
			;)
		;)
	;)
;)
;(global-set-key (kbd "C-c t") 'toggle-transparency)

