clc;
clear;

stud_id = 20171265; % Studento numeris
dd = 10; % dvi darbo savaitës
val = 780; % darbo laiko iðtekliai per 10 darbo dienø
y1 = 400+2*stud_id; % 100 Pirmos klasës sànaudos
y2 = 700+stud_id; % 300 Antros klasës sànaudos
y3 = 50; % Treèios klasës sànaudos
a = 250+stud_id; % 150 apribojimas
% "A"
x1_1 = 5+stud_id; % 2
x1_2 = 3+stud_id; % 7
x1_3 = 2+stud_id; % 13
x1_4 = 2+stud_id; % 6
x1_5 = 60+stud_id; % 11

% "B"
x2_1 = 4+stud_id; % 3
x2_2 = 4+stud_id; % 5
x2_3 = 7+stud_id; % 4
x2_4 = 4+stud_id; % 7
x2_5 = 50+stud_id; % 6

% "C"
x3_1 = 1+stud_id; % 4
x3_2 = 2+stud_id; % 9
x3_3 = 4+stud_id; % 9
x3_4 = 5+stud_id; % 6
x3_5 = 20+stud_id; % 21

% "D"
x4_1 = 5+stud_id; % 5
x4_2 = 5+stud_id; % 3
x4_3 = 3+stud_id; % 3
x4_4 = 1+stud_id; % 3
x4_5 = 70+stud_id; % 36

% Pateikiama pradine duomenu lentele
fprintf('-----------------------------------------------------------------------------------------------------------------------\n');
fprintf('                                                                      |     "A"   |     "B"   |     "C"   |     "D"   |\n');
fprintf('-----------------------------------------------------------------------------------------------------------------------\n');
fprintf(' Vieno darbininko darbo laikas, vienos rusies gaminio gamybai, (val.) |  %d |  %d |  %d |  %d |\n', x1_1, x2_1, x3_1, x4_1);
fprintf('-----------------------------------------------------------------------------------------------------------------------\n');
fprintf(' 1 klases sanaudos vienam gaminiui                                    |  %d |  %d |  %d |  %d |\n', x1_2, x2_2, x3_2, x4_2);
fprintf('-----------------------------------------------------------------------------------------------------------------------\n');
fprintf(' 2 klases sanaudos vienam gaminiui                                    |  %d |  %d |  %d |  %d |\n', x1_3, x2_3, x3_3, x4_3);
fprintf('-----------------------------------------------------------------------------------------------------------------------\n');
fprintf(' 3 klases sanaudos vienam gaminiui                                    |  %d |  %d |  %d |  %d |\n', x1_4, x2_4, x3_4, x4_4);
fprintf('-----------------------------------------------------------------------------------------------------------------------\n');
fprintf(' Pardavimo kaina, vnt.                                                |  %d |  %d |  %d |  %d |\n', x1_5, x2_5, x3_5, x4_5);
fprintf('-----------------------------------------------------------------------------------------------------------------------\n');

%Apskaiciuojami kintamieji max 
x = (50 * x1_4) - x1_5;
x1 = (50 * x2_4) - x2_5;
x2 = (50 * x3_4) - x3_5;
x3 = (50 * x4_4) - x4_5;
cout = [x x1 x2 x3];

nbr = 4; % Nustatomas skaicius, kiek bus naudojama lygciu
type = 1; % Nustatomas koks tipas bus naudojamas max = 1 ar min = 2

str1=struct('vari',{},'Type',{});
str2=struct('var_base',{},'valeur',{});

% Nustatomos nelygybes
p = char('<=');
 str1(1,1).Type = p;
 str1(1,2).Type = p;
 str1(1,3).Type = p;

p1 = char('<');
 str1(1,4).Type = p1;

% Sudaroma kintomuju matrica
sc = [x1_1 x2_1 x3_1 x4_1;
      x1_2 x2_2 x3_1 x4_2;
      x1_3 x2_3 x3_1 x4_3;
      -x1_4 -x2_4 -x3_1 -x4_4];
  
second = [val y1 y2 a];

M = 100*max(max(sc));
sc1=[];
v_a=zeros(1,length(cout));
%variacijos kintamøjø inicijavimas
v_e = [];
v_b = [];
v_ari = [];
sc2 = [];
j = 1;
for i = 1:nbr
    n = str1(1,i).Type;  
    switch str1(1,i).Type
        case '<=' 
            v_e = [v_e second(i)];
            sc1(j,length(v_e)) = 1;
            v_b = [v_b,second(i)];
            
        case '>='
            v_e = [v_e 0];
            sc1(j,length(v_e)) = -1; 
            v_ari = [v_ari second(i)];
            sc2(j,length(v_ari)) = 1;
            v_b = [v_b,second(i)];
              
        case'=' 
            v_ari = [v_ari second(i)];
              sc2(j,length(v_ari)) = 1;
              v_b = [v_b,second(i)];
        case'<' 
            v_e = [v_e second(i)];
            sc1(j,length(v_e)) = 0;
            v_b = [v_b,second(i)];
    end
    j=j+1;
end

sc = [sc, sc2];

vari=[];
vari_a=[];
vari_e=[];
vari_ar=[];
for i=1:size(sc, 2)
    str1(1,i).vari=['x',num2str(i)];
    vari=[vari,str1(1,i).vari,' '];
    if i<length(v_a)
        vari_a=[vari_a,str1(1,i).vari,' '];
    elseif i<=length(v_a)+length(v_e)
        vari_e=[vari_e,str1(1,i).vari,' '];
    else
        vari_ar=[vari_ar,str1(1,i).vari,' '];
    end
end
%Tableau 0
x=[v_a,v_e,v_ari];
if isempty(v_ari)
    v_ar=ones(1,length(v_ari));
    if type==1
        v_ar=-M*length(v_ari).*v_ar;
    else
       v_ar=M*length(v_ari).*v_ar;
    end
else  v_ar=[];
end
Cj=[cout];
Vb=[];
Q=v_b;
Ci=[];
tabl=[];
for i=1:length(Q)
    tabl = [tabl; ' | '];
    str2(1,i).valeur = Q(i);
    ind = i;
    str2(1,i).var_base=str1(1,ind).vari;
    Vb=[Vb,str2(1,i).var_base,' '];
    Ci=[Ci,Cj(ind)];
end
Z=sum(Ci.*Q);
for i=1:length(Ci)
    Zj(i)=sum(Ci'.*sc(:,i));
end
Cj_Zj=Cj-Zj;
l=[];
for i=1:nbr
    if length(str2(1,i).var_base)==2
        l=[l;str2(1,i).var_base,' '];
    else
         l=[l;str2(1,i).var_base];
    end
end
fprintf('\n');
disp('===========================Programa standartine forma===========================');
disp(['Kintamieji                   : ',vari]);
disp(['   -Aktyvumo kintamieji      : ',vari_a]);
disp(['   -Dispersijos kintamieji   : ',vari_e]);
disp(['   -Dirbtiniai kintamieji    : ',vari_ar]);
disp('============================Lentele 0==================================');
disp(['Kintamuju inicijavimas       : ',vari]);
disp(['  -Aktyvumo kintamieji       : ',num2str(v_a)]);
disp(['  -Dispersijos kintamieji    : ',num2str(v_e)]);
disp(['  -Dirbtiniai kintamieji     : ',num2str(v_ar)]);
disp(['Cj                 : ',num2str(Cj)]);
disp('_______________________________________________________________________');
disp([tabl,num2str(Ci'),tabl,l,tabl,num2str(Q'),tabl,num2str(sc),tabl]);
disp('_______________________________________________________________________');
disp(['Zj                 : ',num2str(Zj)]); 
disp(['Cj-Zj              : ',num2str(Cj-Zj)]);        
disp(['Z                  : ',num2str(Z)]);  
t=1;
arret=1;
while arret==1
    if type==1
        num=max(Cj_Zj);num=num(1);
        num1=find(Cj_Zj==num);num1=num1(1);
        V_ent=str1(1,num1).vari;
    else
      g=min(Cj_Zj);g=g(1);
        num1=find(Cj_Zj==g);num1=num1(1);
        V_ent=str1(1,num1).vari;                ['x',num2str(num1)];
    end
    b=sc(:,num1);
    k=0;d=10000;
    for i=1:length(Q)
        if b(i)>0
            div=Q(i)/b(i);
            if d>div
                d=div;
                k=i;
            end
        end
    end
    if k~=0
        num2=k;
    else
        disp('Negalima rasti O.U: sprendimas yra begalinis');
        break;
    end
    V_sort=str2(1,num2).var_base;
    str2(1,num2).var_base=str1(1,num1).vari;
    pivot=sc(num2,num1);
    Ci(num2)=Cj(num1);
    sc(num2,:)=sc(num2,:)./pivot;
    Q(num2)=Q(num2)/pivot;
    h=size(sc,1);
    for i=1:h
        if i~=num2
            Q(i)=Q(i)-sc(i,num1)*Q(num2);
            sc(i,:)=sc(i,:)-sc(i,num1).*sc(num2,:);
            
        end
    end
    Z=sum(Ci.*Q);
    for i=1:size(sc,2)
        Zj(i)=sum(Ci'.*sc(:,i));
    end
    Cj_Zj=Cj-Zj;
    l=[];V=[];
    for i=1:nbr
        if length(str2(1,i).var_base)==2
            l=[l;str2(1,i).var_base,' '];
            V=[V,l(i,:),' '];
        else
          l=[l;str2(1,i).var_base];
          V=[V,l(i,:),' '];
        end
    end
    Vb=V;
disp(['===========================Lentele ',num2str(t),'===========================']);
disp(['V.E           : ',num2str(V_ent)]);
disp(['V.S           : ',num2str(V_sort)]);
disp(['Asis          : ',num2str(pivot)]);
disp(['Var baze      : ',num2str(Vb)]);
disp(['Cj            : ',num2str(Cj)]);
disp('_______________________________________________________________________');
disp([tabl,num2str(Ci'),tabl,l,tabl,num2str(Q'),tabl,num2str(sc),tabl]);
disp('_______________________________________________________________________');
disp(['Zj            : ',num2str(Zj)]); 
disp(['Cj-Zj         : ',num2str(Cj-Zj)]);        
disp(['Z             : ',num2str(Z)]);  
t=t+1;
if type==1
    a=max(Cj_Zj);a=a(1);
    if a<=0
        break;
    end
else
a=min(Cj_Zj);a=a(1); 
if a>=0 
    break;
end
end
end
p = num2str(Z);
k = msgbox( p,'COUT OPTIMAL :');