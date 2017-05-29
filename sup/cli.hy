(import [random [random]])
(import [sup.modules [cricket news music panic]])
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
    (if (panic.sup-panic) (notify-send "Memory alert" "High memory usage" :icon "dialog-error"))
    (cond [(> r 0.75) (follow-chain
                       ((music.sup-music)
                        (cricket.sup-cricket)
                        (news.sup-news)))]
          [(> r 0.4) (follow-chain
                      ((cricket.sup-cricket)
                       (news.sup-news)))]
          [True (follow-chain ((news.sup-news)))])))
