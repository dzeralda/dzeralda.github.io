# dzeralda.github.io
## 1. Sudarykite uždavinio matematinį modelį.

![matematiniomodelioformule](https://latex.codecogs.com/gif.latex?min%20c%28t%29%3D%5Cfrac%7Bc2%7D%7Bt%7D&plus;c*t*b)

## 2. Užrašykite tikslo funkciją.

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
## 3. Matlab aplinkoje suprogramuokite intervalo dalijimo pusiau metodą (tegu 𝑎 = 1, 𝑏 = 30). 

```javascript
iteration = 1; % pažymime iteraciją
    a=1;
    b=30;
    t=(a+b)/2; % randame intervalo vidurio taska
    L=b-a; %apskaiciuojame intervalo ilgi
    manofun=y(t); % apskaiciuojame tikslo funkcijos reiksme intervalo vidurio taske
    x1=a+L/4;
    x2=b-L/4;
    fx1=y(x1);
    fx2=y(x2);
%po pirmos iteracijos gauname, kad f(x1)<f(t), todel  naikinam intervala
%(t,b)ir b perkeliama i t
naujasb=t
naujasL=naujasb-a
```
## 4.  Raskite tikslo funkcijos minimumą (mažiausias prekybos bazės išlaidas) ir minimumo tašką (prekių vežimo intervalą). 
Rastas optimalus prekių vežimo periodas bus intervalas. Paimkite jo
vidurinę reikšmę ir suapvalinkite ją iki sveikojo skaičiaus į vieną ir kitą pusę. Iš gautų dviejų
reikšmių išrinkite optimalų sprendinį (kad tikslo funkcijos reikšmė būtų mažesnė). Taip pat
apskaičiuokite optimalią prekių partijos apimtį. 

Tam, kad rastumėme tikslo funkcijos minimumus funkciją turime diferencijuoti t.y. ieškome funkcijos išvestinės. 

![tikslo_funkcija](http://latex.codecogs.com/gif.latex?y%28t%29%3D165/t&plus;9*t)

![isvestine](http://latex.codecogs.com/gif.latex?y%5E%7B%27%7D%28t%29%3D%5Cfrac%7B165%5E%7B%27%7D*t-165*t%5E%7B%27%7D%7D%7Bt%5E%7B2%7D%7D%20&plus;9%3D%5Cfrac%7B0*t-165*1%7D%7Bt%5E%7B2%7D%7D&plus;9%3D9-%5Cfrac%7B165%7D%7Bt%5E%7B2%7D%7D)

```javascript
>> diff(y(t))
 
ans =
 
9 - 165/t^2
```
Įsistatome mažiausią intervalo reikšmę 1. 

```javascript
>> 9-165/1^2

ans =

  -156
```
Ir gauname, kad mažiausios prekybos bazės išlaidos yra 156.


## 5. Nustatykite, kiek iteracijų reikia atlikti, norint gauti rezultatą norimu tikslumu (tikslumas nurodomas intervalo ilgiu). Čia viena iteracija – funkcijos vienos reikšmės apskaičiavimas. 

Atliekame 1 iteraciją:
Intervalas (1,30), jo ilgis L1=30
Skaičiuojame y1=t=1

```javascript
>> y(1)

ans =

   174
```
Skaičiuojame
![y2_reiksme](http://latex.codecogs.com/gif.latex?y_%7B2%7D%3D30-1%3D29%5E%7B2%7D)
```javascript
>> y(841)

ans =

   7.5692e+03
```
## 6. Nubraižykite tikslo funkcijos grafiką, nurodykite jo pavadinimą, x ir y ašių pavadinimus.
P. S. Turi būti suprogramuotos trys funkcijos:

• pirmoje apskaičiuojama tikslo funkcijos reikšmė;

• antroje įgyvendintas intervalo dalijimo pusiau metodas;

• trečioje kreipiamasi į antrąją funkciją esant įvairioms tikslumo (intervalo ilgio) reikšmėmis;
taip pat papildomi veiksmai, nurodyti 4 žingsnyje; grafiko braižymas. 

```javascript
>> plot(y(t))
>> plot(dalijimas_pusiau)
```
## 7. Raskite funkcijos minimumą auksinio pjūvio metodu ir kvadratine interpoliacija naudojant Matlab funkciją fminbnd. 
Nustatykite, kiek kartų reikia skaičiuoti funkcijos reikšmes, kad
gautume tą patį tikslumą, kaip ir intervalo dalijimo pusiau metodu.
P. S. Turi būti papildyta trečia funkcija kreipiniu į funkciją fminbnd. 
```javascript
>> t = fminbnd(y(t),1,30)
```
