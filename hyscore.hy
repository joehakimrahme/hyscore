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

(defn reject [predicate iterable]
  (for (element iterable)
    (if (not (predicate element))
      (yield element))))

(defn head [iterable]
  (try
   (next (iter iterable))
   (catch [e StopIteration]
     None)))

(defn last [iterable]
  (setv ret None)
  (for (element iterable)
    (setv ret element))
  ret)
