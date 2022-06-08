%Funci�n que recibe un sudoku como par�metro y devuelve el sudoku resuelto
%o un mensaje de "NO SE ENCONTR� SOLUCI�N" 
%La funci�n se encarga de evaluar un n�mero y modificar el sudoku para
%permitirle a la funci�n Check de encontrar una soluci�n parcialal
%problema. Este proceso se repite hasta solucionar el sudoku por completo o
%hasta llegar a cierto n�mero de iteraciones sin encontrar soluci�n.

function S = solveSudoku(S)
% g=n�mero siendo evaluado
g=0;
% banderas necesarias en el algoritmo
f=0;
F=0;
%Contador de intentos fallidos
contFail=0;
while ~f
    %Se aumenta el n�mero siendo evaluado si no se encontr� una soluc�on
    %con el n�mero anterior
    if ~F
        g=g+1;
    end
    %Se ubican las celdas donde se encuentre g
    [row,col]=find(S==g);
    %Se escriben 100's en filas, columnas y subcuadrantes donde se
    %encuentre g, esto para permitirle a la funci�n Check a encontrar una
    %soluci�n.
    for i =1:size(row,1)
        x=find(~S(row(i),:));
        S(row(i),x)=100;
        y=find(~S(:,col(i)));
        S(y,col(i))=100;
        if rem(col(i),3)==0
            if rem(row(i),3)==0
                c=[2 1 0];
                r=[2 1 0];
                [m,n]=find(~S(row(i)-r,col(i)-c));
                for u=1:size(m,1)
                    S(row(i)-(3-m(u)),col(i)-(3-n(u)))=100;
                end
            elseif rem(row(i)+1,3)==0
                c=[2 1 0];
                r=[1 0 -1];
                [m,n]=find(~S(row(i)-r,col(i)-c));
                for u=1:size(m,1)
                    S(row(i)-(2-m(u)),col(i)-(3-n(u)))=100;
                end
            else
                c=[2 1 0];
                r=[0 -1 -2];
                [m,n]=find(~S(row(i)-r,col(i)-c));
                for u=1:size(m,1)
                    S(row(i)-(1-m(u)),col(i)-(3-n(u)))=100;
                end
            end
        elseif rem(col(i)+1,3)==0
            if rem(row(i),3)==0
                c=[1 0 -1];
                r=[2 1 0];
                [m,n]=find(~S(row(i)-r,col(i)-c));
                for u=1:size(m,1)
                    S(row(i)-(3-m(u)),col(i)-(2-n(u)))=100;
                end
            elseif rem(row(i)+1,3)==0
                c=[1 0 -1];
                r=[1 0 -1];
                [m,n]=find(~S(row(i)-r,col(i)-c));
                for u=1:size(m,1)
                    S(row(i)-(2-m(u)),col(i)-(2-n(u)))=100;
                end
            else
                c=[1 0 -1];
                r=[0 -1 -2];
                [m,n]=find(~S(row(i)-r,col(i)-c));
                for u=1:size(m,1)
                    S(row(i)-(1-m(u)),col(i)-(2-n(u)))=100;
                end
            end
        else
            if rem(row(i),3)==0
                c=[0 -1 -2];
                r=[2 1 0];
                [m,n]=find(~S(row(i)-r,col(i)-c));
                for u=1:size(m,1)
                    S(row(i)-(3-m(u)),col(i)-(1-n(u)))=100;
                end
            elseif rem(row(i)+1,3)==0
                c=[0 -1 -2];
                r=[1 0 -1];
                [m,n]=find(~S(row(i)-r,col(i)-c));
                 for u=1:size(m,1)
                    S(row(i)-(2-m(u)),col(i)-(1-n(u)))=100;
                end
            else
                c=[0 -1 -2];
                r=[0 -1 -2];
                [m,n]=find(~S(row(i)-r,col(i)-c));
                for u=1:size(m,1)
                    S(row(i)-(1-m(u)),col(i)-(1-n(u)))=100;
                end
            end
        end
    end
    %Se eval�a sudoku modificado en funci�n Check
    [S,F]=Check(S,g);
    %Se borran los 100's escritos
    S(S==100)=0;
    %Si g llega a 9 se reinicia
    if g==9
        g=0;
    end
    %Condici�n de para de caso exitoso, levanta bandera si ya no hay 0's en
    %el sudoku
    if size(find(~S),1)==0
        f=1; 
    end
    %Condici�n de para de caso no exitoso, se levanta bandera despu�s de
    %1000 intentos fallidos (Si el algoritmo pudiera encontrar la soluci�n
    %ya lo hubiera hecho).
    if F==0
        contFail=contFail+1;
        if contFail==1000
            display("NO SE ENCONTR� SOLUCI�N");
            f=1;
        end
    end
    end
end