(ns day1.core)

(defn big [st n]
  (> (count st) n) )

(defn collection-type [x]
  (cond
    (list? x) :list
    (vector? x) :vector
    (map? x) :map))
