(import [psutil [virtual_memory]])

(setv *thresh* 0.9)

(defn sup-panic []
  "Return memory panic status"
  (< 90 (. (virtual_memory) percent)))
