(defn map [function iterable]
  (for (element iterable)
    (yield (function element))))

(defn filter [predicate iterable]
  (for (element iterable)
    (if (predicate element)
      (yield element))))

(defn fold-left [function iterable initial]
  (setv ret initial)
  (for (element iterable)
    (setv ret (function ret element)))
  ret)

(defn fold-right [function iterable initial]
  (fold-left (fn [x y] (function y x))
	     (reversed iterable)
	     initial))

(defn find [predicate iterable]
  (setv ret None)
  (for (element iterable)
    (if (predicate element)
      (do
       (setv ret element)
       (break))))
  ret)
