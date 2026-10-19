(ns pcp.sw01)


(+ 1 (/ 1 (+ 1 1)))
(+ 1 (/ 1 (+ 1 (/ 1 (+ 1 1)))))
(+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 1)))))))

(def laenge 10)
(def breite 15)

(* laenge breite) ; Fläche
(+ (* 2 laenge) (* 2 breite)) ; Umfang

(defn square [x] (* x x))
(Math/sqrt (+ (square laenge) (square breite)))

(def height 30)
(* laenge breite height)

(+ (* 2 3) (/ 3 4))
'(+ - * /)
(str 1.0 2 true)
(+ (parse-long "123") (parse-double "0.45"))
(or "this" "is" "crazy")
(and "this" "is" "crazy")
((fn [x] (/ 1 x)) (/ 5 2))
(int? 3000000000)

(defn diskriminante [a b c]
  (- (* b b) (* 4  a c)))

(defn loesbar? [a b c]
  (>= (diskriminante a b c) 0))

(defn anzahl-loesungen [a b c]
  (cond
    (< (diskriminante a b c) 0) 0
    (= (diskriminante a b c) 0) 1
    :else 2))

(defn loesungen [a b c]
  (let [d (diskriminante a b c)]
    (cond
      (< d 0) []
      (= d 0) [(/ (- b) (* 2 a))]
      :else
      [(/ (+ (- b) (Math/sqrt d)) (* 2 a))
       (/ (- (- b) (Math/sqrt d)) (* 2 a))])))

(defn mitternacht [a b c] (/ (+ (- b) (Math/sqrt (diskriminante a b c))) (* 2 a)))

(def a '(* 3 4))
(def b 'a)
(def c 'b)
(eval (eval (eval c)))

(defn eur-chf [euro]
  (* euro 0.93))
(eur-chf 1)

(defn celsius-fahrenheit [celsius]
  (+ (* celsius (/ 9 5)) 32))
(celsius-fahrenheit 0)

(defn scale [x1 x2 y1 y2 x]
  (+ y1 (* (/ (- y2 y1) (- x2 x1))
           (- x x1))))
(scale 0.0 100.0 32.0 212.0 30.0)

(defn sum-range [a b]
  (if (= a b)
    a
    (+ a (sum-range (+ a 1) b))))
(defn sum-squares [a b]
  (if (= a b)
    (* a a)
    (+ (* a a) (sum-squares (+ a 1) b))))

(sum-range 1 5)
(sum-squares 1 4)


(defn huh [n]
  (if (> n 1)
    (do (println n)
      (if (even? n)
        (huh (/ n 2))
        (huh (+ (* n 3) 1))))))
(huh 3)