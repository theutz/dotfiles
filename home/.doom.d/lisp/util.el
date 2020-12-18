(defun theutz/read-lines (filename)
  (with-temp-buffer
    (insert-file-contents filename)
    (split-string (buffer-string) "\n" t)))

(defun theutz/pick-random (items)
  "Pick a random element from a list of elements."
  (let* ((size (length items))
         (index (random size)))
    (nth index items)))

