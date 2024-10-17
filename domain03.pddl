(define (domain blocksworld)
  (:requirements :typing)
  (:types brazo bloque)
  (:predicates
    (sin_nada_encima ?x - bloque)
    (encima_mesa ?x - bloque)
    (brazo_libre ?h - brazo)
    (sujeto ?h - brazo ?x - bloque)
    (encima_bloque ?x - bloque ?y - bloque)
  )

  (:action coger
    :parameters (?h - brazo ?ob - bloque)
    :precondition (and (sin_nada_encima ?ob) (encima_mesa ?ob) (brazo_libre ?h))
    :effect (and (sujeto ?h ?ob) (not (sin_nada_encima ?ob)) 
                 (not (encima_mesa ?ob)) (not (brazo_libre ?h)))
  )

  (:action soltar
    :parameters (?h - brazo ?ob - bloque)
    :precondition (and (sujeto ?h ?ob))
    :effect (and (sin_nada_encima ?ob) (brazo_libre ?h) 
                 (encima_mesa ?ob) (not (sujeto ?h ?ob)))
  )

  (:action apilar
    :parameters (?h - brazo ?ob - bloque ?underob - bloque)
    :precondition (and (sin_nada_encima ?underob) (sujeto ?h ?ob))
    :effect (and (sin_nada_encima ?ob) (brazo_libre ?h) 
                 (encima_bloque ?ob ?underob) (not (sujeto ?h ?ob)) 
                 (not (sin_nada_encima ?underob)))
  )

  (:action desapilar
    :parameters (?h - brazo ?ob - bloque ?underob - bloque)
    :precondition (and (encima_bloque ?ob ?underob) 
                       (sin_nada_encima ?ob) (brazo_libre ?h))
    :effect (and (sujeto ?h ?ob) (sin_nada_encima ?underob) 
                 (not (encima_bloque ?ob ?underob)) (not (sin_nada_encima ?ob)) 
                 (not (brazo_libre ?h)))
  )
)
