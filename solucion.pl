viveen(juan,casa(120)).
viveen(nico,ambiente(3,2)).
viveen(julian,loft(2000)).
viveen(vale,ambiente(4,1)).
viveen(fer,casa(110)).
barrio(alf,almagro).
barrio(juan,almagro).
barrio(nico,almagro).
barrio(julian,almagro).
barrio(vale,flores).
barrio(fer,flores).
quieremudarse(rocio,casa(90)).


barriocopado(Barrio):-
barrio(_,Barrio),
forall(barrio(Persona,Barrio),(viveen(Persona,Casa),propiedadcopada(Casa))).


propiedadcopada(casa(Metros)):-
    Metros>100.
propiedadcopada(ambiente(Cantidadambientes,_)):-
    Cantidadambientes>3.

propiedadcopada(ambiente(_,Cantiaddebanos)):-
    Cantiaddebanos>1.

propiedadcopada(loft(Anos)):-
    Anos>2015.


barriocaro(Barrio):-
barrio(_,Barrio),
forall(barrio(Persona,Barrio),(viveen(Persona,Casa),not(esbarato(Casa)))).


esbarato(loft(Ano)):-
    205>Ano.
esbarato(casa(Metros)):-
    90>Metros.
esbarato(ambiente(1,_)).
esbarato(ambiente(2,_)).


preciocasa(juan,150000).
preciocasa(nico,80000).
preciocasa(alf,75000).
preciocasa(julian,140000).
preciocasa(vale,95000).
preciocasa(fer,60000).






quecasapuedocomprar(Combinacion,Plata,Vuelto):-
    findall(Unapropiedad,(preciocasa(_,Precio),puedecomprar(Precio,Plata,Unapropiedad)),Listapropieddades),
    combinacionquecumple(Listapropieddades,Combinacion,Plata,Vuelto).

puedecomprar(Precio,Plata,Persona):-
    preciocasa(Persona,Precio),
    Plata>Precio.

combinacionquecumple(Listapropieddades,Combinacion,Plata,Vuelto):-
    sublista(Listapropieddades,Combinacion),
    calculoaux(Combinacion,Plata,Vuelto).

calculoaux(Combinacion,Plata,Vuelto):-
    findall(Precioindividual,(member(Persona,Combinacion),preciocasa(Persona,Precioindividual)),Listaprecio),
    sum_list(Listaprecio,Total),
    Plata>=Total,
    Vuelto is Plata-Total.
    

    


sublista([],[]).
sublista([_|Cola],Sublista):-sublista(Cola,Sublista).
sublista([Cabeza|Cola],[Cabeza|Sublista]):-sublista(Cola,Sublista).
