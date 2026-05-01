%Tham số mô hình
M = 0.5;
m = 0.2;
b = 0.1;
I = 0.006;
g = 9.8;
l = 0.3;
para=[M, m, b, I, g, l];

%Khai báo ma trận
A=zeros(4,4);
B=zeros(4,1);
C=zeros(2,4);
D=zeros(2,1);
init=[0,0,pi,0]; %Ma trận trạng thái ban đầu

%Biến phụ
b1=M+m;
d1=I+m*l^2;
den=I*(M+m)+M*m*l^2;

%Giá trị các ô
A(1,2)=1;
A(3,4)=1;
A(2,2)=(-b)*d1/den;
A(2,3)=-(m*l)^2*g/den;
A(4,2)=b*m*l/den;
A(4,3)=m*g*l*b1/den;
B(2,1)=d1/den;
B(4,1)=-m*l/den;
C(1,1)=1;
C(2,3)=1;

%LQR
gain_Q_x=1000;
gain_Q_theta=5000;

%gain_Q_x=1;
%gain_Q_theta=1;

gain_R_u=2;
%gain_R_u=1;

Q=diag([gain_Q_x,10,gain_Q_theta,10]);
%Q=diag([gain_Q_x,1,gain_Q_theta,1]);

R=gain_R_u;
Q(1,1)=gain_Q_x;
Q(3,3)=gain_Q_theta;
K=lqr(A,B,Q,R);

%simscape_data
rail_length=6;
