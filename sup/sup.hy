(import [random [random]])
(import [cricket [sup-cricket]])
(import [news [sup-news]])
(import [music [sup-music]])

(defn clip [text]
  "Clip text to a limit"
  (let [limit 70]
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
    (cond [(> r 0.75) (follow-chain ((sup-music) (sup-cricket) (sup-news)))]
          [(> r 0.4) (follow-chain ((sup-cricket) (sup-news)))]
          [True (follow-chain ((sup-news)))])))