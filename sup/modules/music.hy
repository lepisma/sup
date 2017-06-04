(import [sh [mpc]])
(import [sup.env [module-enabled?]])

(defn sup-music []
  "Return current music"
  (if (module-enabled? "MUSIC")
    (let [prefix "♫ | "
          song (first (.splitlines (str (mpc))))]
      (if (.startswith song "volume: ")
        '()
        (+ prefix song)))
    '()))
