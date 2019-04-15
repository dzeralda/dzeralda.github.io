function [q, t, x_min, f_min, task_islaidos, iteration, length] = islaidos(a, b) 
[x_min, f_min, a_reiksm, b_reiksm, iteration, length, xpoint, xvalue] = dalijimas_pusiau(a, b);
  % apskaiciuojam intervalo vidurio ta�ka
  int_vid = (a_reiksm+b_reiksm)/2; 
  %randam int. vid. ta�ko apatine riba
  int_apatinis = floor(int_vid);    
  % funkcijos reik�me int. vid. ta�ko apatineje riboje
  f_int_apatinis = manofun(int_apatinis);
  % randam int. vid. ta�ko vir�utine riba ir apskaiciuojam funkcijos
  % reik�me joje
  int_virsutinis = ceil(int_vid);            
  f_int_virsutinis = manofun(int_virsutinis);      
  
  %Tikrinam salyga ar vir�utine modelio reik�me didesne
  if(f_int_apatinis > f_int_virsutinis)  
  % jei taip -i�saugoma vir�utine reik�me
    task_islaidos = f_int_virsutinis;                        
    t = int_virsutinis  
  %jei ne - i�saugoma apatine reik�me
  else 
    task_islaidos = f_int_apatinis;                        
    t = int_apatinis;                       
  end
 
  % Tada sudarom vektoriu ir randame i�laidas kiekviename ta�ke
  x = a:1:b;                      
  y = manofun(t);                         
 
  %Taikome auksini pjuvi ir kvadratine interpoliacija
  optimization = optimset('Display', 'iter','MaxFunEvals', 1000,'PlotFcns', @optimplotfval , 'TolX', length);
  [xfminbnd, yfminbnd] = fminbnd(@manofun, a, b, optimization)
  
  %Atvaizduojame i�laidu kitima pagal t.
  figure 
  plot(x, y, '.-', xpoint, xvalue, '.-'), legend('I�laidos kiekviename ta�ke', 'Intervalo dalijimo pusiau metodas'); 
  xlabel('Laikas (t)');
  ylabel('I�laidos per diena'); 
end