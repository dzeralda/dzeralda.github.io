# dzeralda.github.io
## Sudarykite uždavinio matematinį modelį.

![matematiniomodelioformule](https://latex.codecogs.com/gif.latex?min%20c%28t%29%3D%5Cfrac%7Bc2%7D%7Bt%7D&plus;c*t*b)

## Užrašykite tikslo funkciją.

Pirmiausiai susirandame c, c2, b reikšmes pagal duotas formules bei pagal mano studento numerį, kuris yra 20171265.

![prekestonomis](https://latex.codecogs.com/gif.latex?b%3D%5Cfrac%7BStudnr*mod*7%7D%7B2%7D&plus;2%2C5)

```javascript
>> b=(mod(20171265,7)/2)+2,5;

b =

     3
```

![partijoskaina](https://latex.codecogs.com/gif.latex?c2%3D%28studnr*mod*30%29&plus;150)

```javascript
>> c2=(mod(20171265,30))+150

c2 =

   165
```

![islaidos](https://latex.codecogs.com/gif.latex?c%3Dstudnr*mod*5&plus;3)

```javascript
>> c=(mod(20171265,5))+3

c =

     3
```
Gautas reikšmes dedame į matematinį modelį ir taip apskaičiuojame tikslo funkciją. 
Gautas rezultatas:

![tikslofunkcija](https://latex.codecogs.com/gif.latex?y%28t%29%3D%5Cfrac%7B165%7D%7Bt%7D&plus;9*t)

```javascript
function manofun = y(t)
manofun = 165/t + 9*t;
end
```
## Matlab aplinkoje suprogramuokite intervalo dalijimo pusiau metodą (tegu 𝑎 = 1, 𝑏 = 30). 

```javascript
iteration = 1; % pažymime iteraciją
    a=1;
    b=30;
    t=(a+b)/2; % randame intervalo vidurio taska
    L=b-a; %apskaiciuojame intervalo ilgi
```
Apskaičiuojame tikslo funkcijos reiksmę intervalo vidurio taške
```javascript
    manofun=y(t); 
    x1=a+L/4;
    x2=b-L/4;
    fx1=y(x1);
    fx2=y(x2);
```
po pirmos iteracijos gauname, kad f(x1)<f(t), todel  naikinam intervala (t,b)ir b perkeliama i t
```javascript
naujasb=t
naujasL=naujasb-a
```
Rašome funkciją dalijimo pusiau metodui
```javascript
function [x_min, f_min, a_reiksm, b_reiksm, iteration, lenght1, xpoint, xvalue] = dalijimas_pusiau(a, b)
    iteration = 1;               %iteracija nr.1
    t = (a + b)/2;             %randame intervalo vidurio taska
    L = b - a;                   %apskaiciuojame intervalo ilgi
    y = manofun(t);          %apskaiciuojame funkcijos reiksme intervalo vidurio taske
    x_min = t;                 %fiksuojame minimalu intervalo vidurio taska
```
Priskiriame naujas reikšmes
```javascript
    y1 = y;           
    y2 = y;               
    xpoint(iteration) = t;   %fiksuojame taška
    xvalue(iteration) = y1; %fiksuojame f-jos reikšmė t taške
```   
Nauja intervalo pradžia, pabaiga ir ilgis
```javascript
    a_reiksm = a;     
    b_reiksm = b;     
    lenght1 = L;            
```
Ciklą kartosime kol gausime norimus rezultatus
```javascript
    while y2 >= y1
    iteration = iteration + 1;
```
Dalijame intervalą į keturias lygias dalis. Kadangi t jau turime, tai apskaičiuosime dar x1 ir x2
```javascript
        x1 = a + L/4; 
        x2 = b - L/4;
```
Apskaičiuojame funkcijos reikšmę taške x1 ir x2
```javascript
        fx1 = manofun(x1); 
        fx2 = manofun(x2); 
```       
Toliau vertiname gautus rezultatus. 
Pradžioje lyginame funkcijos reikšmę x1 taške su t vidurio taško reikšme. Jeigu ji mažesnė, tada naikinam (t,b) intervalą
```javascript
        if(fx1 < y)
            b = t;           %vidurio taskas tampa intervalo pabaiga
            t = x1;          %nauju vidurio tasku tampa x1 
        else
```           
Jei f(x1)>=f(t)arba f(x2)<f(t) - naikiname (a,t) intervalą ir intervalo pradžią perkeliame į vidurio tašką.
```javascript
            if(fx2 < y)                
                a = t;       % prilyginam intervalo pradžia vidurio taškui
                t = x2;      %buvęs vidurio taškas tampa nauja intervalo pabaiga
```
Jei f(x2)>=f(t), vidurio taškas išlieka toks pats, tačiau perkeliame a ir b
```javascript
            else
                a = x1;    
                b = x2;     
            end
        end
```       
Kai gauname naują vidurio tašką, apskaičiuojame funkcijos reikšmę
```javascript
        y1 = manofun(t);  
        %issaugome naujas reiksmes 
        xpoint(iteration) = t;   
        xvalue(iteration) = y1; 
        L = b - a;  
```   
Tenkinant žemiau esančią sąlygą, ciklas per naujo leidžiamas ir naujos reikšmės yra išsaugomos
```javascript
        if(y2 > y1)        
            lenght1 = L;        
            a_reiksm = a; 
            b_reiksm = b; 
            x_min = t;       
            y2 = y1;       
        end
    end
 ```
Surandame modelio minimalią reikšmę
```javascript
    f_min = y2;                
end
```
## Raskite tikslo funkcijos minimumą (mažiausias prekybos bazės išlaidas) ir minimumo tašką (prekių vežimo intervalą).
```javascript
function [q, t, x_min, f_min, task_islaidos, iteration, lenght] = islaidos(a, b)
  [x_min, f_min, a_reiksm, b_reiksm, iteration, lenght, xpoint, xvalue] = dalijimas_pusiau(a, b);
  % apskaičiuojam intervalo vidurio tašką
  int_vid = (a_reiksm+b_reiksm)/2; 
  %randam int. vid. taško apatinę ribą
  int_apatinis = floor(int_vid);    
  % funkcijos reikšmė int. vid. taško apatinėje riboje
  f_int_apatinis = manofun(int_apatinis);
  % randam int. vid. taško viršutinę ribą ir apskaičiuojam funkcijos
  % reikšmę joje
  int_virsutinis = ceil(int_vid);            
  f_int_virsutinis = tikslo(int_virsutinis);      
  
  %Tikrinam sąlygą ar viršutinė modelio reikšmė didesnė
  if(f_int_apatinis > f_int_virsutinis)  
  % jei taip -išsaugoma viršutinė reikšmė
    task_islaidos = f_int_virsutinis;                        
    t = int_virsutinis  
  %jei ne - išsaugoma apatinė reikšmė
  else 
    task_islaidos = f_int_apatinis;                        
    t = int_apatinis;                       
  end
```
