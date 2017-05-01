(import [sh [mpc]])

(defn sup-music []
  "Return current music"
  (let [prefix "♫ | "
        song (first (.splitlines (str (mpc))))]
    (if (.startswith song "volume: ")
      '()
      (+ prefix song))))
