(define (domain blocksword)
(:predicates
(sin_nada_encima ?x)
(encima_mesa ?x)
(encima_bloque ?x ?y)
)

(:action apilar
:parameters (?ob ?underob)
:precondition (and (sin_nada_encima ?underob))
:effect (and (sin_nada_encima ?ob) (encima_bloque ?ob ?underob) (not (sujeto
?ob))(not (sin_nada_encima ?underob)))
)
(:action desapilar
:parameters (?ob ?underob)
:precondition (and (encima_bloque ?ob ?underob) (sin_nada_encima ?ob))
:effect (and (sujeto ?ob) (sin_nada_encima ?underob) (not (encima_bloque ?ob ?underob)) (not
(sin_nada_encima ?ob))))
)