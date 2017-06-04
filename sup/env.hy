(import [os [environ]])

(defn module-enabled? [name]
  "Key not set defaults to 'enabled'."
  (try
   (= "true" (get environ (+ "SUP-" name)))
   (except [KeyError]
     True)))
