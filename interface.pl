:-dynamic(fact/1).



menu:- nl,nl , 	write('\e[H\e[2J'),
				write('******************************************************************************************************************'), nl,
				write('Bem-vindo, sou um assistente de suporte a decisão do meio de transporte indicado para o seu percurso!   '),nl,
				write('Deseja iniciar?  '),nl,
				write('1. Sim'), nl,
				write('2. Nao'), nl,nl,
				read(X0),
				((X0 == 1), retractall(fact(_)), retractall(origem(_)), retractall(destino(_)) , questao1;
				 (X0 == 2), fim).
				
fim :- 			write('******************************************************************************************************************'), nl,
	   			write('Volte sempre, obrigado!').			


							 

				
questao1:- 		write('******************************************************************************************************************'), nl,
				write('Sendo assim, qual sera a origem do seu percurso?'), nl,
				write('1. Braga'), nl,
				write('2. Porto'), nl,
				write('3. Viseu'), nl,
				write('4. Guimaraes'), nl,
				write('5. Lisboa'), nl,
				write('6. Coimbra'), nl,
                write('7. Faro'), nl, nl,
				read(X1), 
				((X1 == 1),  assert(origem(braga)), questao2;
				 (X1 == 2),  assert(origem(porto)), questao2;
				 (X1 == 3),  assert(origem(viseu)), questao2;
				 (X1 == 4),  assert(origem(guimaraes)), questao2;
				 (X1 == 5),  assert(origem(lisboa)), questao2;
				 (X1 == 6),  assert(origem(coimbra)), questao2;
                 (X1 == 7),  assert(origem(faro)), questao2).															
				 
								
questao2:-      write('******************************************************************************************************************'), nl,
				write('Qual sera o destino?'), nl, 
				write('1. Braga'), nl,
				write('2. Porto'), nl,
				write('3. Viseu'), nl,
				write('4. Guimaraes'), nl,
				write('5. Lisboa'), nl,
				write('6. Coimbra'), nl,
                write('7. Faro'), nl, nl,
				read(X1), 
				((X1 == 1),  assert(destino(braga)), questao3;
				 (X1 == 2),  assert(destino(porto)), questao3;
				 (X1 == 3),  assert(destino(viseu)), questao3;
				 (X1 == 4),  assert(destino(guimaraes)), questao3;
				 (X1 == 5),  assert(destino(lisboa)), questao3;
				 (X1 == 6),  assert(destino(coimbra)), questao3;
                 (X1 == 7),  assert(destino(faro)), questao3).			
				 

 
questao3:-     	write('******************************************************************************************************************'), nl,
			 	write('                                                                                                        '), nl,
			 	write('                                                                                                        '), nl,
            	write('                                       Resultado obtido                                      '), nl, 
             	origem(X1), destino(X2), caminhocurto(X1,X2,Caminho,Modos), reverse_list(Caminho, Caminho2), reverse_list(Modos, Modos2),
				write('Melhor percurso: '),write(Caminho2), nl, 
				write('Transportes utlizados: '), write(Modos2).
			