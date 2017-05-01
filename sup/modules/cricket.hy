(import [random [randint]])
(import [sh [criclive]])

(setv *teams* '("india"
                "australia"
                "pakistan"
                "sri lanka"
                "new zealand"
                "england"
                "west indies"
                "south africa"
                "royal challenger bangalore"
                "rising pune supergiant"
                "kolkata knight riders"
                "gujarat lions"
                "delhi daredevils"
                "kings xi punjab"
                "mumbai indians"
                "sunrisers hyderabad"))

(defn sup-cricket []
  "Cricket scores"
  (let [prefix "ℭ | "
        criclive-lines (.splitlines (criclive))
        filtered (filter (fn [x]
                           (let [out False]
                             (for [team *teams*]
                               (if (in team (.lower x))
                                 (do (setv out True)
                                     (break))))
                             out)) criclive-lines)
        filtered-live (list (filter (fn [x]
                                      (not (in "[]" (.lower x))))
                                    filtered))]
    (if (> (len filtered-live) 0)
      (let [text (nth filtered-live (randint 0 (- (len filtered-live) 1)))]
        (+ prefix (.join " " (cut (.split text ". ") 1))))
      '())))
