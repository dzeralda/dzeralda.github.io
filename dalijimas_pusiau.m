function [x_min, f_min, a_reiksm, b_reiksm, iteration, lenght1, xpoint, xvalue] = dalijimas_pusiau(a, b)
    iteration = 1;               %iteracija nr.1
    t = (a + b)/2;             %randame intervalo vidurio taska
    L = b - a;                   %apskaiciuojame intervalo ilgi
    y = manofun(t);          %apskaiciuojame funkcijos reiksme intervalo vidurio taske
    x_min = t;                 %fiksuojame minimalu intervalo vidurio taska
    
    %priskiriame naujas reiksmes 
    y1 = y;           
    y2 = y;              
    
    xpoint(iteration) = t;   %fiksuojame taška
    xvalue(iteration) = y1; %fiksuojame f-jos reikšm? t taške 
    %nauja intervalo pradžia, pabaiga ir ilgis
    a_reiksm = a;     
    b_reiksm = b;     
    lenght1 = L;            
 
    %cikl? kartosime kol gausime norimus rezultatus
    while y2 >= y1
    iteration = iteration + 1; 
    %dalijame intervala i keturias lygias dalis. Kadangi t jau turim, tai
    %apskaiciuosim dar x1 ir x2
        x1 = a + L/4; 
        x2 = b - L/4; 
        % apskaiciuojam funkcijos reiksme taske x1 ir x2
        fx1 = manofun(x1); 
        fx2 = manofun(x2); 
        
%Toliau vertiname gautus rezultatus. 
%Pradzioje lyginame funkcijos reiksme x1 taske su t vidurio tasko reiksme. 
%Jeigu ji mazesne, tada naikinam (t,b) intervala ir:
        if(fx1 < y)
            b = t;           %vidurio taskas tampa intervalo pabaiga
            t = x1;          %nauju vidurio tasku tampa x1 
        else
            
%Jei f(x1)>=f(t)arba f(x2)<f(t) - naikinam (a,t) intervala ir
%intervalo pradzia perkeliam i vidurio taska.
            if(fx2 < y)                
                a = t;       % prilyginam intervalo pradžia vidurio taškui
                t = x2;      %buv?s vidurio taškas tampa nauja intervalo pabaiga
%Jei f(x2)>=f(t), vidurio taskas islieka toks pats, taciau perkeliam a ir b:
            else
                a = x1;    
                b = x2;     
            end
        end
        
        %Kai gauname nauja vidurio taska, apskaiciuojame funkcijos reiksme.
        y1 = manofun(t);  
        %issaugome naujas reiksmes 
        xpoint(iteration) = t;   
        xvalue(iteration) = y1; 
        L = b - a;  
        
        % Tenkinant zemiau esancia salyga, ciklas per naujo leidziamas ir
        % naujos reiksmes yra issaugomos
        if(y2 > y1)        
            lenght1 = L;        
            a_reiksm = a; 
            b_reiksm = b; 
            x_min = t;       
            y2 = y1;       
        end
    end
 %surandame modelio minimalia reiksme
    f_min = y2;                
end

