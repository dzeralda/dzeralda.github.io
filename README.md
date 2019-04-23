Pirmiausiai nuskaitome naudojama duomenu faila
```{r}
adresas<-"http://fmf.vgtu.lt/~trekasius/da/sdan_data05.txt"
d<-read.table(file=adresas, header = TRUE)
```
Susikuriame patogias naudoti darbui reiksmes(t.y. persivadinam savo turimus parametrus) 
```{r}
summary(d)
rank=data$rank
sco=data$score
plu=data$pluralism
gov=data$government
part=data$participation
cult=data$culture
liber=data$liberties
```
p_sco pazymime Y (t.y. score) prognoze
```{r}
p_sco = log(sco,exp(1)).
par(mfrow = c(1, 1))
plot(rank,sco)
```
A atvejis. Modeliui naudojame visus galimus parametrus. Ivertiname modelio parametrus, braizome histograma, QQ grafika, atliekame Shapiro testa.
```{r}
par(mfrow = c(1, 4))
qqnorm(sco)
qqline(sco, col = "lightcoral", lwd = 2)
hist(sco)
shapiro.test(sco)

par(mfrow = c(1, 2))
qqnorm(p_sco)
qqline(p_sco, col = "lightcoral", lwd = 2)
hist(p_sco)
lines(density(p_sco),col=2)
shapiro.test(p_sco)
```
Tiesines regresijos lygtis siuo atveju, kadangi naudojame visus duotus parametrus
```{r}
lm.rezultatas=lm(sco~rank+plu+gov+part+cult+liber)
summary(lm.rezultatas)
```
B atvejis. Tikriname kaip Y korealiuoja su kitais parametrais ir turime isskirti 3 labiausiai korealiuojancius.
```{r}
cor(rank, sco)
cor(plu, sco)
cor(gov, sco)
cor(part, sco)
cor(cult, sco)
cor(liber, sco)
```
Labiausiai su score korealiuoja rank, plu ir liber
```{r}
lm.rezultatas=lm(sco~rank+plu+liber)
summary(lm.rezultatas)
```
C atvejis. Siuo atveju turetume tikrinti, kuris modelis geriausias is 3. T.y. rank, plu ar liber.
```{r}
lm.rezultatas=lm(sco~rank)
summary(lm.rezultatas)
lm.rezultatas=lm(sco~plu)
summary(lm.rezultatas)
lm.rezultatas=lm(sco~liber)
summary(lm.rezultatas)
```
