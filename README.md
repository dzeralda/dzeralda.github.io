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
function dalijimas_pusiau
t=(a+b)/2; %randame intervalo vidurio taska
L=b-a; %randame intervalo ilgi
y=165/t+9*t; %apskaiciuojame f(t)
x1=a+L/4;
x2=b-L/4;
y=165/x1+9*x1; %apskaiciuojame f(x1)
y=165/x2+9*x2; %apskaiciuojame f(x2)
if (y(x1)<y(t))
t==x1;
L=b-a;
else if (y(x1)<y(t))
t==x1;
L=b-a;
else if(y(x1)>=y(t))
t=x2;
L=b-a;
else("neteisingai ivesti duomenys")
end
```
