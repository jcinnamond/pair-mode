;;; pair-mode.el --- helper functions for pair programming

;; Copyright 2016 John Cinnamond

;; Author: John Cinnamond
;; Version: 1.0.0

;;; Commentary:
;;
;; This package contains functions to make the emacs friendlier when
;; pairing. It uses a higher contrast theme, enables line numbers,
;; makes the font size bigger.

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(defvar pair--state nil "indicates whether pair settings are on")
(defvar pair--previous-height nil "store the default face height before modifying")

(defun pair/toggle ()
  "Toggle pair programming settings"
  (if pair--state
      (pair/off)
    (pair/on)))

(defun pair/off ()
  (set-face-attribute 'default nil :height pair--previous-height)
  (setq pair--state nil)

  (global-linum-mode nil)
  (linum-mode -1)
  (load-theme 'zenburn))

(defun pair/on ()
  (load-theme 'manoj-dark)

  (setq pair--previous-height (face-attribute 'default :height))
  (set-face-attribute 'default nil :height 180)
  (setq pair--state t)

  (global-linum-mode t))

(define-minor-mode pair-mode
  "Make pairing friendlier"
  nil ; initially disabled
  " pairing"
  nil ; no keymap
  (pair/toggle))

(provide 'pair-mode)
