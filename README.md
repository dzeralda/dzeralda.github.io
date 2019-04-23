# dzeralda.github.io
2 laboratoriniam darbui naudojama duomenu lentele sudaryta is Statistikos departamento tinklalapyje rastu duomenu.
```{r}
getwd()
setwd("C:")
data=read.table("data-table.txt", header=TRUE)
```
Pirmiausia su sia funkcija aprasome kainu kitima iki euro ivedimo Y(t) = a_0 + a_1*t + e(t), t <= k
cia k yra euro ivedimo momentas t.y. 20150101
```{r}
k=20150101
prieseura<-a_0 + a_1*t + e(t)
```
po euro ivedimo kainu kitimas aprasomas pagal sia funkcija
```{r}
k=20150101
poeuro<-b_0 + b_1*t + e(t)
```
Ivedamas apribojimas tam, kad lauzte tam tikru laiko momentu susikirstu. Jis aprasomas tokia funkcija: a_0 + a_1*k = b_0 + b_1*k
```{r}
apribojimas<-a_0 + a_1*k = b_0 + b_1*k
```
##PLANO MATRICOS SUDARYMAS
Pagal paskutine funkcija kur aprasomas apribojimas tam, kad lauzte susikirstu galima isskirti parametra b_0 ir isreiksti ji per kitus parametrus.
```{r}
b_0= a_0+(a_1-b_1)k
```
Y reiksmes gausime pagal pagal formule
```{r}
Y = Xβ + E.
```
Parametrai β = (a_o, a_1, b_1)T duoti. Uzrasom transponuota matrica. 
```{r}
β <- matrix(a_o, a_1, b_1)
tβ <- β(a)
```
Plano matricos X sudarymui galima taikyti ivairius metodus. Pasirinksime Empirini metoda.
##EMPIRINIS METODAS
Kadangi turime 3 nezinomuosius a_o, a_1 ir b_1. Tai bendras regresijos modelio pavidalas galetu atrodyti taip:
```{r}
yt=a_o*kt0+a_1*kt1+b_1kt2+et
```
Kol kas prediktoriai k0, k1, k2 yra nenusakyti, bet juos lengva nustatyti, remiantis tuo, kad,
kai kt=<k0, regresijos funkcija yra f1(k), kitais atvejais ji yra lygi f2(k). Be to turi būti
patenkinta sujungimo sąlyga:
```{r}
b_0= a_0+(a_1-b_1)k
```
Iš čia aišku, kad kol kt =< k0, kt0 ≡ 1, o kt1 ≡ kt ir t.t...
Taip pat turime patikrinti hipoteze ar kainos po euro ivedimo pradejo keistis greiciau ar leciau
##HIPOTEZES TIKRINIMAS
Kai hipoteze teisinga ir funkcija yra tiese
```{r}
teis_hip<-a_1 == b_1
```
Kai hipoteze neteisinga ir funkcija nera tiese
```{r}
net_hip<-a_1 != b_1
```
Taip pat tikrinama hipoteze ar po euro ivedimo ivyko kainu suolis.
Savo nuoziura isivedame kintami delta kuris zymi suolio dydi. Tai parinksime 0.1 kas reikstu 10 % kainos kitima.
```{r}
delta<-0.1
```
Kainu suolis ivyko
```{r}
suolis_yra<- b_0 - a_0 == delta
```
Kainu suolis neivyko
```{r}
suolio_nera<-b_0 - a_0 != delta
```
