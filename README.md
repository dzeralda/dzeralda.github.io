# dzeralda.github.io
>> b=(mod(20171265,7)/2)+2,5;

b =

     3

>> c2=(mod(20171265,30))+150;
>> c2

c2 =

   165

>> c=(mod(20171265,5))+3

c =

     3

>> a=1;
>> b=30;
>> t=(a+b)/2

t =

   15.5000

>> L=b-a;
>> y=165/t+9*t

y =

  150.1452

>> x1=a+L/4

x1 =

    8.2500

>> x2=b-L/4;
>> x2

x2 =

   22.7500

>> y=165/x1+9*x1

y =

   94.2500

>> y=165/x2+9*x2

y =

  212.0027

>> 
>> if y(x1)<y(t)
t==x1;
L=b-a;
else 
if (y(x1)<y(t))
t==x1;
L=b-a;
else if(y(x1)>=y(t))
t=x2;
L=b-a;
else("neteisingai ivesti duomenys")
end
