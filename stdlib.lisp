; stdlib
(def {std-version} "stdlib version 0.1")

; Atoms
(def {nil} {})
(def {true} 1)
(def {false} 0)

; Function Definitions
(def {fun} (\ {f b} {
                 def (head f) (\ (tail f) b)
                 }))

; Logical functions
(fun {not x}   {- 1 x})
(fun {or x y}  {+ x y})
(fun {and x y} {* x y})

; Unpack list for function
(fun {unpack f l} {
     eval (join (list f) l)
     })

; Pack list for functions
(fun {pack f & ks} {
     f xs
     })

; Curied and Uncurried aliases
(def {curry} unpack)
(def {uncurry} pack)

; Perform several operations in sequence
(fun {do & l} {
     if (== l nil)
     {nil}
     {last l}
     })

; Open new scope
(fun {let b} {
     ((\ {_} b) ())
     })

; List functions
(fun {first l} {
     eval (head l)
     })

(fun {last} {
     nth (- (len l) 1) l
     })

(fun {len l} {
     if (== l nil)
     {0}
     {+ 1 (len (tail l))}
     })

(fun {sum l}     {foldl + 0 l})
(fun {product l} {foldl * 1 l})

(fun {nth n l} {
     if (== n 0)
     {first l}
     {nth (- n 1) (tail l)}
     })

; Take n items
(fun {take n l} {
     if (== n 0)
     {l}
     {drop (- n 1) (tail l)}
     })

; Drop n items
(fun {drop n l} {
     if (== n 0)
     {l}
     {drop (- n 1) (tail l)}
     })

; Element of list
(fun {elem x l} {
     if (== l nil)
     {false}
     {if (== x (first l))
     {true}
     {elem x (tail l)}}
     })

; Split at n
(fun {split n l} {list (take n l) (drop n l)})

; Apply function to list
(fun {map f l} {
     if (== l nil)
     {nil}
     {join (list (f (first l))) (map f (tail l))}
     })

; Apply filter to list
(fun {filter f l} {
     if (== l nil)
     {nil}
     {join (
            if (f (first l))
            {head l}
            {nil}
            )
     (filter f (tail l))
     }
     })

; Fold left
(fun {foldl f z l} {
     if (== l nil)
     {z}
     {foldl f (f z (first l)) (tail l)}
     })


; Misc functions

(fun {flip f a b} {f b a})
(fun {comp f g x} {f (g x)})

