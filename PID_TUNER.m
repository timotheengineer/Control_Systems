s=tf('s');
f=800;m=1200;b=100;
G=f/(m*s+b);
H=1;
%%
Kp=0.3;Ki=0;Kd=0;
C=pid(Kp,Ki,Kd);
T=feedback(C*G,H);
step(T)