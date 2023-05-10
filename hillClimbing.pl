caminhocurto(X, Y, Caminho, Modos) :- caminho(X, Y, Caminho), % gerar
                                       maiscurto(X, Y, Caminho, Modos).% testar
maiscurto(X, Y, Caminho, Modos) :- custo(Caminho, NC, Modos),
                                   \+ menor(X, Y, NC, _),
                                   extrair_modos(Caminho, Modos).
menor(X, Y, NC, Modos) :- caminho(X, Y, C1),
                          custo(C1, NC1, Modos),
                          NC1 < NC,
                          extrair_modos(C1, Modos).
extrair_modos([], []).
extrair_modos([_], []).
extrair_modos([_, B | C], [Modo | Modos]) :- viagem(B, _, Modo, _, _),
                                             extrair_modos([B | C], Modos).

caminho(X,Z,Caminho):-caminho(X,Z,[X],Caminho).
caminho(X,X,Caminho,Caminho).
caminho(X,Z,Visitado,Caminho) :- arco(X,Y),
                                 \+ member(Y,Visitado),
                                caminho(Y,Z,[Y | Visitado],Caminho).

custo([_], 0, []).
custo([A,B|C], Custo, [Modo|Modos]) :- viagem(B, A, Modo, Tempo, CustoSegmento),
                                       custo([B|C], CustoRestante, Modos),
                                       Custo is Tempo*CustoSegmento + CustoRestante.

reverse_list([], []).
reverse_list([X|Xs], Reversed) :-
    reverse_list(Xs, ReversedXs),
    append(ReversedXs, [X], Reversed).