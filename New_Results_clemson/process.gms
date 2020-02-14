$title Structural Optimization of Process Flowsheets (PROCSEL,SEQ=116)

$onText
The goal is the profitable production of chemical C.
which can be produced from chemical B where B may be
the raw material that can be purchased from the
external market or an intermediate that is produced
from raw material A. There are two alternative paths
of producing B from A. A mixed-integer nonlinear
formulation is presented to solve the optimal
production and capacity expansion problem.


Kocis, G R, and Grossmann, I E, Relaxation Strategy for the Structural
Optimization of Process Flow Sheets. Independent Engineering Chemical
Research 26, 9 (1987), 1869-1880.

Morari, M, and Grossmann, I E, Eds, Chemical Engineering Optimization
Models with GAMS. Computer Aids for Chemical Engineering Corporation,
1991.

   Process flowsheet


         A2    +-----+  B2      BP
        +----->|  2  |----->+    |
   A    |      +-----+      |    |  B1    +-----+    C1
   ---->|                   +----+------->|  1  |-------->
        |      +-----+      |             +-----+
        +----->|  3  |----->+
         A3    +-----+  B3


Keywords: mixed integer nonlinear programming, process flow, chemical
          engineering
$offText

$eolCom !

Variable   z   objective;

Integer Variable   g1   'max-green time 1';
Integer Variable   g2   'max-green time 2';

Positive Variable   gt   'gap-time';

Equation   obj   'objective function';
Equation   c1   'Constraint 1';
Equation   c2   'Constraint 2';
Equation   c3   'Constraint 3';
Equation   c4   'Constraint 4';
Equation   c5   'Constraint 5';
Equation   c6   'Constraint 6';

   
Scalar	a	/	0.87052788210683700	/;
Scalar	b	/	-0.00226521685201358	/;
Scalar	c	/	0.00658086792120217	/;
Scalar	d	/	0.03595244742039070	/;
Scalar	e	/	0.00338408024537925	/;
Scalar	f	/	-0.19471759536122800	/;
Scalar	g	/	2.50763375841303000	/;
Scalar	h	/	-0.33103888759787400	/;
Scalar	i	/	-0.06746886066556740	/;
Scalar	j	/	49.05435211403610000	/;



obj..  z =e= a*power(gt,2)+b*power(g1,2)+c*power(g2,2)+d*gt*g1+e*g1*g2+f*g2*gt+g*gt+h*g1+i*g2+j;
c1..  gt =g= 1;
c2..  gt =l= 3;
c3..  g1 =g= 20;
c4..  g1 =l= 50;
c5..  g2 =g= 20;
c6..  g2 =l= 50;

Model process / all /;

solve process minimizing z using minlp;