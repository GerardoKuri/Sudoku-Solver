%Función que recibe un sudoku y el número de que la función solveSudoku
%está evaluando y revisa si alguna celda cumple los requisitos para ser
%llenada con ese número, de igual maner revisa filas, columnas y
%subcuadrantes a los que solo les falta un valor y los llena. Devuelve el
%sudoku parcialmente más resuelto y un bandera que avisa si encontró una
%solución o no.
function [S,F]=Check(S,t)
% Se inician banderas y contadores necesarios.
flag=0;
contEval=0;
F=0;
while ~flag
    contControl=0;
    %Se recorren las filas de manera horizontal, Si esta llena de cifras y
    %al menos un 100 se cuenta que ya se cumplió el requisito de la filas.
    %Si tiene 8 celdas llenas y ningún 100 se llena con el número faltante.
    for i = 1:9
        contCeldas=0;
        val=0;
        for j = 1:9
            if not(S(i,j)==0)
                contCeldas=contCeldas+1;
                val=val+S(i,j);
            end
        end
        if contCeldas==8
            pos=find(~S(i,:));
            switch val
                case 36
                    S(i,pos)=9;
                case 37
                    S(i,pos)=8;
                case 38
                    S(i,pos)=7;
                case 39
                    S(i,pos)=6;
                case 40
                    S(i,pos)=5;
                case 41
                    S(i,pos)=4;
                case 42
                    S(i,pos)=3;
                case 43
                    S(i,pos)=2;
                case 44
                    S(i,pos)=1;
                otherwise
                    %if ~size(find(S(i,:)==10))
                        %S(i,pos)=t;
                        flag=1;
                        contEval=contEval+1;
                        break
                    %end
            end
        else
            contControl=contControl+1;
        end
    end
    %Se recorren las filas de manera vertical, Si esta llena de cifras y
    %al menos un 100 se cuenta que ya se cumplió el requisito de la columnas.
    %Si tiene 8 celdas llenas y ningún 100 se llena con el número faltante.
    for i = 1:9
        contCeldas=0;
        val=0;
        for j = 1:9
            if not(S(j,i)==0)
                contCeldas=contCeldas+1;
                val=val+S(j,i);
            end
        end
        if contCeldas==8
            pos=find(~S(:,i));
            switch val
                case 36
                    S(pos,i)=9;
                case 37
                    S(pos,i)=8;
                case 38
                    S(pos,i)=7;
                case 39
                    S(pos,i)=6;
                case 40
                    S(pos,i)=5;
                case 41
                    S(pos,i)=4;
                case 42
                    S(pos,i)=3;
                case 43
                    S(pos,i)=2;
                case 44
                    S(pos,i)=1;
                otherwise
                        contEval=contEval+1;
                        flag=1;
                        break
            end
        else
            contControl=contControl+1;
        end
    end
    %Se recorren los subcuadrantes, Si esta lleno de cifras y
    %al menos un 100 se revisa si los requisitos anteriores se cumplieron, 
    %se escribe el número siendo evaluado por la función solveSudoku.
    %Si tiene 8 celdas llenas y ningún 100 se llena con el número faltante.
    for i = 1:3
        ver=3*(i-1);
        for j = 1:3
            contCeldas=0;
            val=0;
            hor=3*(j-1);
            x=0;
            y=0;
            for k= 1:3
                for l=1:3
                    if not(S(ver+k,hor+l)==0)
                        contCeldas=contCeldas+1;
                        val=val+S(ver+k,hor+l);
                    else
                        x=ver+k;
                        y=hor+l;
                    end
                end
            end
            if contCeldas==8
                switch val
                    case 36
                        S(x,y)=9;
                    case 37
                        S(x,y)=8;
                    case 38
                        S(x,y)=7;
                    case 39
                        S(x,y)=6;
                    case 40
                        S(x,y)=5;
                    case 41
                        S(x,y)=4;
                    case 42
                        S(x,y)=3;
                    case 43
                        S(x,y)=2;
                    case 44
                        S(x,y)=1;
                    otherwise
                        if contEval==2
                            S(x,y)=t;
                            F=1;
                        else
                            F=0;
                        end
                        flag=1;
                        break;
                end
            else
                contControl=contControl+1;
            end
        end
    end
    %Si ya se recorrieron las 9 filas, las 9 columnas y 9 subcuadrantes sin
    %éxito, se levanta bandera de salida
    if contControl==27
        flag=1;
    end
end
end