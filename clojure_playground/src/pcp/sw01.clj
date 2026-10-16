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