Program Pzim ;
const
	max = 20;
var
	i,j,k,l,n,num,maior:integer;
	m,soma,temp:real;
	matriz:array[1..max,1..max] of real;
	b:array[1..max]of real;
	x:array[1..max]of real;	
	 
	
procedure Mostrar();
	Begin
		writeln;	 
		for i:=1 to n do
			begin
				for j:=1 to n do
					write(matriz[i,j]:12);
					if(j=n)then
						begin
							write(b[i]:12);
							writeln;
						end;	
				writeln();
			end;
	End;

procedure Permuta(var k:integer);
	Begin
		maior:=k;
		for i:=k+1 to n do
			begin
				if(abs(matriz[i][k]) > abs(matriz[i-1][k]))then  
					begin
						maior:=i;
					end;
			end;
		if(maior <> k) then
			begin	
				for i:=1 to n do
					begin
						temp:=matriz[k][i];
						matriz[k][i]:=matriz[maior][i];
						matriz[maior][i]:=temp;
					end;
				temp:=b[k];
				b[k]:=b[maior];
				b[maior]:=temp;	
				writeln('Matriz após permutação das linhas ',k,' e ',maior,':');
				Mostrar();	
			end;			 	
	End;					
						 
Begin
  write('Eliminação de Gauss com Pivoteamento Parcial');
  writeln();
  write('Digite o valor de n: ');
  read(n);
  writeln();
  while(n > 20) do
  	begin
  		write('Número maior do que 20. Digite um valor menor: ');
  		read(n);
  	end;
	for i:=1 to n do
		begin
			writeln('Linha ',i,':');
			for j:=1 to n do
				begin
					write('Digite um valor para o coeficiente da incógnita x',j,': ');
					read(num);
					matriz[i,j] := num;
					if(j=n)then
						begin
							write('Digite um valor para o coeficiente b',i,': ');
							read(num);
							b[i]:=num;
						end;	
				end;
				writeln();	
		end;
	writeln('Matriz Original');
	Mostrar();
	for k:=1 to n-1 do
		begin   
			Permuta(k);
		  for i:=k+1 to n do
		    begin
				  m:= matriz[i,k]/matriz[k,k];
			    matriz[i,k]:=0;
			    for j:=k+1 to n do
				    begin
					    matriz[i,j]:= matriz[i,j]-(m*matriz[k,j]);
				    end;	
			    b[i]:=b[i]-(m*b[k]);
			  end; 
		end;	  
		  x[n]:=b[n]/matriz[n,n];
	  for l:=n-1 downto 1 do
		  begin
		    soma:=0;
		    for j:=l+1 to n do
			    begin
			      soma:=soma+(matriz[l,j]*x[j]);
			    end;  
			  x[l]:=(b[l]-soma)/matriz[l,l];
		  end;
	writeln;
	writeln('Matriz após a eliminação de Gauss com Pivoteamento Parcial');
	writeln;
	Mostrar();		
	writeln;	
	writeln('Valor das variáveis:');	
	for i:=1 to n do
		writeln('x',i,' = ',x[i]);
End.