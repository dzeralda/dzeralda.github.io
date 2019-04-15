function [q, t, x_min, f_min, task_islaidos, iteration, length] = islaidos(a, b) 
[x_min, f_min, a_reiksm, b_reiksm, iteration, length, xpoint, xvalue] = dalijimas_pusiau(a, b);
  % apskaiciuojam intervalo vidurio taška
  int_vid = (a_reiksm+b_reiksm)/2; 
  %randam int. vid. taško apatine riba
  int_apatinis = floor(int_vid);    
  % funkcijos reikšme int. vid. taško apatineje riboje
  f_int_apatinis = manofun(int_apatinis);
  % randam int. vid. taško viršutine riba ir apskaiciuojam funkcijos
  % reikšme joje
  int_virsutinis = ceil(int_vid);            
  f_int_virsutinis = manofun(int_virsutinis);      
  
  %Tikrinam salyga ar viršutine modelio reikšme didesne
  if(f_int_apatinis > f_int_virsutinis)  
  % jei taip -išsaugoma viršutine reikšme
    task_islaidos = f_int_virsutinis;                        
    t = int_virsutinis  
  %jei ne - išsaugoma apatine reikšme
  else 
    task_islaidos = f_int_apatinis;                        
    t = int_apatinis;                       
  end
 
  % Tada sudarom vektoriu ir randame išlaidas kiekviename taške
  x = a:1:b;                      
  y = manofun(t);                         
 
  %Taikome auksini pjuvi ir kvadratine interpoliacija
  optimization = optimset('Display', 'iter','MaxFunEvals', 1000,'PlotFcns', @optimplotfval , 'TolX', length);
  [xfminbnd, yfminbnd] = fminbnd(@manofun, a, b, optimization)
  
  %Atvaizduojame išlaidu kitima pagal t.
  figure 
  plot(x, y, '.-', xpoint, xvalue, '.-'), legend('Išlaidos kiekviename taške', 'Intervalo dalijimo pusiau metodas'); 
  xlabel('Laikas (t)');
  ylabel('Išlaidos per diena'); 
end