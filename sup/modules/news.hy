(import [random [randint]])
(import [sh [hn]])
(import [sup.env [module-enabled?]])

(defn sup-news []
  "Return random top news from hacker news"
  (if (module-enabled? "NEWS")
    (let [prefix "ℋ | "
          hn-lines (.splitlines (hn.top))
          selected (nth hn-lines (* 2 (randint 0 9)))
          text (second (.split selected "\x1b[0m"))]
      (+ prefix (.strip text)))
    '()))
