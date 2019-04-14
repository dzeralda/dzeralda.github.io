function [q, t, x_min, f_min, task_islaidos, iteration, lenght] = islaidos(a, b) 
[x_min, f_min, a_reiksm, b_reiksm, iteration, lenght, xpoint, xvalue] = dalijimas_pusiau(a, b);
  % apskai?iuojam intervalo vidurio ta�k?
  int_vid = (a_reiksm+b_reiksm)/2; 
  %randam int. vid. ta�ko apatin? rib?
  int_apatinis = floor(int_vid);    
  % funkcijos reik�m? int. vid. ta�ko apatin?je riboje
  f_int_apatinis = manofun(int_apatinis);
  % randam int. vid. ta�ko vir�utin? rib? ir apskai?iuojam funkcijos
  % reik�m? joje
  int_virsutinis = ceil(int_vid);            
  f_int_virsutinis = manofun(int_virsutinis);      
  
  %Tikrinam s?lyg? ar vir�utin? modelio reik�m? didesn?
  if(f_int_apatinis > f_int_virsutinis)  
  % jei taip -i�saugoma vir�utin? reik�m?
    task_islaidos = f_int_virsutinis;                        
    t = int_virsutinis  
  %jei ne - i�saugoma apatin? reik�m?
  else 
    task_islaidos = f_int_apatinis;                        
    t = int_apatinis;                       
  end
 
  % Tada sudarom vektori? ir randam i�laidas kiekviename ta�ke
  x = a:1:b;                      
  y = manofun(t);                         
 
  %Taikome aukso pj?v? ir kvadratin?s interpoliacij?
  optimization = optimset('Display', 'iter','MaxFunEvals', 1000,'PlotFcns', @optimplotfval , 'TolX', lenght);
  [xfminbnd, yfminbnd] = fminbnd(@tikslo, a, b, optimization)
  
  %Atvaizduojame i�laid? kitim? pagal t.
  figure 
  plot(x, y, '.-', xpoint, xvalue, '.-'), legend('I�laidos kiekviename ta�ke', 'Intervalo dalijimo pusiau metodas'); 
  xlabel('Laikas (t)');
  ylabel('I�laidos per dien?'); 
  
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