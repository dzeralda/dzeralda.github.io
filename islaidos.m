function [q, t, x_min, f_min, task_islaidos, iteration, lenght] = islaidos(a, b) 
[x_min, f_min, a_reiksm, b_reiksm, iteration, lenght, xpoint, xvalue] = dalijimas_pusiau(a, b);
  % apskai?iuojam intervalo vidurio tašk?
  int_vid = (a_reiksm+b_reiksm)/2; 
  %randam int. vid. taško apatin? rib?
  int_apatinis = floor(int_vid);    
  % funkcijos reikšm? int. vid. taško apatin?je riboje
  f_int_apatinis = manofun(int_apatinis);
  % randam int. vid. taško viršutin? rib? ir apskai?iuojam funkcijos
  % reikšm? joje
  int_virsutinis = ceil(int_vid);            
  f_int_virsutinis = manofun(int_virsutinis);      
  
  %Tikrinam s?lyg? ar viršutin? modelio reikšm? didesn?
  if(f_int_apatinis > f_int_virsutinis)  
  % jei taip -išsaugoma viršutin? reikšm?
    task_islaidos = f_int_virsutinis;                        
    t = int_virsutinis  
  %jei ne - išsaugoma apatin? reikšm?
  else 
    task_islaidos = f_int_apatinis;                        
    t = int_apatinis;                       
  end
 
  % Tada sudarom vektori? ir randam išlaidas kiekviename taške
  x = a:1:b;                      
  y = manofun(t);                         
 
  %Taikome aukso pj?v? ir kvadratin?s interpoliacij?
  optimization = optimset('Display', 'iter','MaxFunEvals', 1000,'PlotFcns', @optimplotfval , 'TolX', lenght);
  [xfminbnd, yfminbnd] = fminbnd(@tikslo, a, b, optimization)
  
  %Atvaizduojame išlaid? kitim? pagal t.
  figure 
  plot(x, y, '.-', xpoint, xvalue, '.-'), legend('Išlaidos kiekviename taške', 'Intervalo dalijimo pusiau metodas'); 
  xlabel('Laikas (t)');
  ylabel('Išlaidos per dien?'); 
  
  %Gauname rezultatus
  b = (mod(20171265, 7)/2) + 2.5; 
  q = t * b; 
  q
  t
  x_min
  f_min
  task_islaidos
  iteration
  lenght
  
  xfminbnd 
  yfminbnd 
  
end