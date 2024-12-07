% Punto 1

% vive(Persona, Propiedad, Barrio)
/*
Tipos de propiedades:
casa(MCuadrados)
departamento(Ambientes, Banios)
loft(AnioConstruido)
*/

vive(juan, casa(120), almagro).
vive(nico, departamento(3, 2), almagro).
vive(alf, departamento(3, 1), almagro).
vive(julian, loft(2000), almagro).
vive(vale, departamento(4, 1), flores).
vive(fer, casa(110), flores).

% vive(leandro, loft(2020), devoto).
% vive(pepe, departamento(1, 2), devoto).

% Punto 2

% esBarrioCopado(Barrio)

esBarrioCopado(Barrio):-
    vive(_, _, Barrio),
    forall(vive(_, Propiedad, Barrio), esPropiedadCopada(Propiedad)).
    

esPropiedadCopada(casa(MCuadrados)):-
    MCuadrados > 100.
esPropiedadCopada(departamento(Ambientes, _)):-
    Ambientes > 3.
esPropiedadCopada(departamento(_, Banios)):-
    Banios > 1.
esPropiedadCopada(loft(AnioConstruido)):-
    AnioConstruido > 2015.