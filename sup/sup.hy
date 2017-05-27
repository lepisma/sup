(import [random [random]])
(import [sup.modules [sup-cricket sup-news sup-music sup-panic]])
(import [sh [notify-send]])

(defn clip [text]
  "Clip text to a limit"
  (let [limit 100]
    (if (> (len text) limit)
      (+ (cut text 0 limit) "...")
      text)))

(defmacro follow-chain [sups]
  (if (not (empty? sups))
    `(let [text ~(car sups)]
       (if text (print (clip text))
           (follow-chain ~(cdr sups))))))

(defn main []
  (let [r (random)]
    (if (sup-panic) (notify-send "Memory alert" "High memory usage" :icon "dialog-error"))
    (cond [(> r 0.75) (follow-chain ((sup-music) (sup-cricket) (sup-news)))]
          [(> r 0.4) (follow-chain ((sup-cricket) (sup-news)))]
          [True (follow-chain ((sup-news)))])))
