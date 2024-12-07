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

% Punto 3

esPropiedadBarata(loft(AnioConstruido)):-
    AnioConstruido < 2005.
esPropiedadBarata(casa(MCuadrados)):-
    MCuadrados < 90.
esPropiedadBarata(departamento(Ambientes, _)):-
    between(1, 2, Ambientes).

% esBarrioCaro(Barrio)

esBarrioCaro(Barrio):-
    vive(_, _, Barrio),
    forall(vive(_, Propiedad, Barrio), not(esPropiedadBarata(Propiedad))).

% Punto 4

sublista([], []).
sublista([_ | Cola], Sublista):-sublista(Cola, Sublista).
sublista([Cabeza|Cola], [Cabeza|Sublista]):-sublista(Cola, Sublista).

tasacion(juan, 150000).
tasacion(nico, 80000).
tasacion(alf, 75000).
tasacion(julian, 140000).
tasacion(vale, 95000).
tasacion(fer, 60000).

casasQuePuedoComprarCon(Dinero, PosiblesCasas):-
    findall(Propiedad, puedoComprarCasa(Propiedad, Dinero), ListaCasas),
    ListaCasas \= [],
    sublista(ListaCasas, PosiblesCasas).
    /* sumlist(ListaValores, TotalGastado),
    DineroRestante is Dinero - TotalGastado. */

puedoComprarCasa(Propiedad, Dinero):-
    tasacion(Propiedad, Valor),
    Dinero > Valor.

compra(Propiedad, Dinero, Restante):-
    tasacion(Propiedad, Valor),
    puedoComprarCasa(Propiedad, Dinero),
    Restante is Dinero - Valor.