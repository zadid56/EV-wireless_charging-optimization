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

Integer Variable	n2	;
Integer Variable	n3	;
Integer Variable	n4	;
Integer Variable	n5	;
Integer Variable	n7	;
Integer Variable	n8	;
Integer Variable	n9	;
Integer Variable	n10	;
Integer Variable	n11	;
Integer Variable	n12	;
Integer Variable	n13	;
Integer Variable	n15	;
Integer Variable	n16	;
Integer Variable	n17	;
Integer Variable	n18	;
Integer Variable	n19	;
Integer Variable	n20	;
Integer Variable	n21	;
Integer Variable	n22	;
Integer Variable	n23	;
Integer Variable	n24	;
Integer Variable	n25	;
Integer Variable	n27	;
Integer Variable	n28	;
Integer Variable	n29	;
Integer Variable	n30	;
Integer Variable	n31	;
Integer Variable	n33	;
Integer Variable	n34	;
Integer Variable	n36	;
Integer Variable	n37	;
Integer Variable	n38	;
Integer Variable	n41	;
Integer Variable	n42	;
Integer Variable	n43	;
Integer Variable	n44	;
Integer Variable	n45	;
Integer Variable	n46	;
Integer Variable	n47	;
Integer Variable	n48	;
Integer Variable	n49	;
Integer Variable	n50	;
Integer Variable	n51	;
Integer Variable	n52	;
Integer Variable	n53	;
Integer Variable	n54	;
Integer Variable	n55	;
Integer Variable	n56	;
Integer Variable	n57	;
Integer Variable	n58	;
Integer Variable	n59	;
Integer Variable	n60	;
Integer Variable	n61	;
Integer Variable	n62	;
Integer Variable	n63	;
Integer Variable	n64	;
Integer Variable	n65	;
Integer Variable	n66	;
Integer Variable	n67	;
Integer Variable	n68	;
Integer Variable	n71	;
Integer Variable	n72	;
Integer Variable	n73	;
Integer Variable	n74	;
Integer Variable	n75	;
Integer Variable	n76	;
Integer Variable	n77	;
Integer Variable	n78	;
Integer Variable	n79	;
Integer Variable	n80	;
Integer Variable	n81	;
Integer Variable	n82	;
Integer Variable	n83	;
Integer Variable	n84	;
Integer Variable	n85	;
Integer Variable	n86	;
Integer Variable	n87	;
Integer Variable	n88	;
Integer Variable	n89	;
Integer Variable	n90	;
Integer Variable	n91	;
Integer Variable	n92	;
Integer Variable	n93	;
Integer Variable	n94	;
Integer Variable	n95	;
Integer Variable	n96	;
Integer Variable	n97	;
Integer Variable	n98	;
Integer Variable	n99	;
Integer Variable	n100;


Equation   obj   'objective function';
Equation   m1   'Constraint 1';


Scalar	a2	/	38.10833333	/;
Scalar	a3	/	22.66666667	/;
Scalar	a4	/	36.89708333	/;
Scalar	a5	/	25.86608333	/;
Scalar	a7	/	84.92491667	/;
Scalar	a8	/	50.44608333	/;
Scalar	a9	/	6.1625	/;
Scalar	a10	/	16.32708333	/;
Scalar	a11	/	5.7375	/;
Scalar	a12	/	16.46875	/;
Scalar	a13	/	0.991666667	/;
Scalar	a15	/	7.720833333	/;
Scalar	a16	/	52.55833333	/;
Scalar	a17	/	4.852083333	/;
Scalar	a18	/	75.11875	/;
Scalar	a19	/	47.06875	/;
Scalar	a20	/	38.42708333	/;
Scalar	a21	/	19.69166667	/;
Scalar	a22	/	6.658333333	/;
Scalar	a23	/	7.047916667	/;
Scalar	a24	/	32.65416667	/;
Scalar	a25	/	31.69791667	/;
Scalar	a27	/	15.90208333	/;
Scalar	a28	/	23.05625	/;
Scalar	a29	/	51.88541667	/;
Scalar	a30	/	16.39791667	/;
Scalar	a31	/	12.07708333	/;
Scalar	a33	/	34.6375	/;
Scalar	a34	/	8.18125	/;
Scalar	a36	/	34.89722222	/;
Scalar	a37	/	2.925416667	/;
Scalar	a38	/	40.19791667	/;
Scalar	a41	/	0.389583333	/;
Scalar	a42	/	8.7125	/;
Scalar	a43	/	4.99375	/;
Scalar	a44	/	14.875	/;
Scalar	a45	/	3.966666667	/;
Scalar	a46	/	37.89583333	/;
Scalar	a47	/	7.508333333	/;
Scalar	a48	/	38.81666667	/;
Scalar	a49	/	12.99791667	/;
Scalar	a50	/	26.45058333	/;
Scalar	a51	/	10.03814583	/;
Scalar	a52	/	7.176833333	/;
Scalar	a53	/	1.634479167	/;
Scalar	a54	/	32.22916667	/;
Scalar	a55	/	16.96458333	/;
Scalar	a56	/	29.75	/;
Scalar	a57	/	81.13958333	/;
Scalar	a58	/	31.91041667	/;
Scalar	a59	/	30.56458333	/;
Scalar	a60	/	81.87058333	/;
Scalar	a61	/	44.40966667	/;
Scalar	a62	/	7.089	/;
Scalar	a63	/	73.78708333	/;
Scalar	a64	/	38.80675	/;
Scalar	a65	/	4.221666667	/;
Scalar	a66	/	44.09375	/;
Scalar	a67	/	30.70625	/;
Scalar	a68	/	11.08541667	/;
Scalar	a71	/	38.92291667	/;
Scalar	a72	/	31.34375	/;
Scalar	a73	/	60.67916667	/;
Scalar	a74	/	20.57708333	/;
Scalar	a75	/	59.42916667	/;
Scalar	a76	/	15.5125	/;
Scalar	a77	/	11.12083333	/;
Scalar	a78	/	1.9125	/;
Scalar	a79	/	23.87083333	/;
Scalar	a80	/	29.82083333	/;
Scalar	a81	/	5.41875	/;
Scalar	a82	/	49.97291667	/;
Scalar	a83	/	37.36458333	/;
Scalar	a84	/	40.26875	/;
Scalar	a85	/	25.25208333	/;
Scalar	a86	/	54.64791667	/;
Scalar	a87	/	40.44583333	/;
Scalar	a88	/	50.575	/;
Scalar	a89	/	26.20833333	/;
Scalar	a90	/	25.81875	/;
Scalar	a91	/	23.65833333	/;
Scalar	a92	/	0.495833333	/;
Scalar	a93	/	2.372916667	/;
Scalar	a94	/	6.339583333	/;
Scalar	a95	/	25.7125	/;
Scalar	a96	/	13.6	/;
Scalar	a97	/	0.672916667	/;
Scalar	a98	/	76.11041667	/;
Scalar	a99	/	45.82916667	/;
Scalar	a100	/	27.05833333	/;
Scalar	b2	/	-491.725	/;
Scalar	b3	/	-310.675	/;
Scalar	b4	/	-682.754	/;
Scalar	b5	/	-582.8195	/;
Scalar	b7	/	-1111.1795	/;
Scalar	b8	/	-715.632	/;
Scalar	b9	/	-73.7375	/;
Scalar	b10	/	-196.5625	/;
Scalar	b11	/	-70.7625	/;
Scalar	b12	/	-201.6625	/;
Scalar	b13	/	-11.9	/;
Scalar	b15	/	-93.925	/;
Scalar	b16	/	-709.1125	/;
Scalar	b17	/	-58.8625	/;
Scalar	b18	/	-947.1125	/;
Scalar	b19	/	-666.1875	/;
Scalar	b20	/	-503.2	/;
Scalar	b21	/	-257.125	/;
Scalar	b22	/	-80.75	/;
Scalar	b23	/	-85.425	/;
Scalar	b24	/	-398.225	/;
Scalar	b25	/	-432.225	/;
Scalar	b27	/	-194.225	/;
Scalar	b28	/	-284.1125	/;
Scalar	b29	/	-640.6875	/;
Scalar	b30	/	-198.05	/;
Scalar	b31	/	-162.775	/;
Scalar	b33	/	-417.9875	/;
Scalar	b34	/	-100.725	/;
Scalar	b36	/	-542.7108333	/;
Scalar	b37	/	-35.53	/;
Scalar	b38	/	-519.4633333	/;
Scalar	b41	/	-4.675	/;
Scalar	b42	/	-105.6125	/;
Scalar	b43	/	-60.5625	/;
Scalar	b44	/	-181.2625	/;
Scalar	b45	/	-49.0875	/;
Scalar	b46	/	-458.7875	/;
Scalar	b47	/	-95.4125	/;
Scalar	b48	/	-469.625	/;
Scalar	b49	/	-162.35	/;
Scalar	b50	/	-366.22675	/;
Scalar	b51	/	-121.394875	/;
Scalar	b52	/	-86.93375	/;
Scalar	b53	/	-19.788	/;
Scalar	b54	/	-389.3	/;
Scalar	b55	/	-206.125	/;
Scalar	b56	/	-388.2375	/;
Scalar	b57	/	-1007.25	/;
Scalar	b58	/	-392.9125	/;
Scalar	b59	/	-370.3875	/;
Scalar	b60	/	-1006.6465	/;
Scalar	b61	/	-551.28875	/;
Scalar	b62	/	-85.51425	/;
Scalar	b63	/	-922.46675	/;
Scalar	b64	/	-481.78425	/;
Scalar	b65	/	-50.8725	/;
Scalar	b66	/	-608.8125	/;
Scalar	b67	/	-430.1	/;
Scalar	b68	/	-134.5125	/;
Scalar	b71	/	-477.0625	/;
Scalar	b72	/	-551.65	/;
Scalar	b73	/	-1036.25	/;
Scalar	b74	/	-252.6625	/;
Scalar	b75	/	-776.9	/;
Scalar	b76	/	-189.125	/;
Scalar	b77	/	-133.875	/;
Scalar	b78	/	-24.0125	/;
Scalar	b79	/	-296.8625	/;
Scalar	b80	/	-377.1875	/;
Scalar	b81	/	-65.6625	/;
Scalar	b82	/	-619.225	/;
Scalar	b83	/	-513.6125	/;
Scalar	b84	/	-521.475	/;
Scalar	b85	/	-316.8375	/;
Scalar	b86	/	-684.8875	/;
Scalar	b87	/	-516.1625	/;
Scalar	b88	/	-663	/;
Scalar	b89	/	-339.7875	/;
Scalar	b90	/	-313.8625	/;
Scalar	b91	/	-291.975	/;
Scalar	b92	/	-5.95	/;
Scalar	b93	/	-30.175	/;
Scalar	b94	/	-77.35	/;
Scalar	b95	/	-321.725	/;
Scalar	b96	/	-164.05	/;
Scalar	b97	/	-8.2875	/;
Scalar	b98	/	-1020.425	/;
Scalar	b99	/	-659.175	/;
Scalar	b100	/	-345.3125	/;
Scalar	c2	/	2151.066667	/;
Scalar	c3	/	1529.433333	/;
Scalar	c4	/	4455.569667	/;
Scalar	c5	/	4435.144667	/;
Scalar	c7	/	4863.099333	/;
Scalar	c8	/	3615.905667	/;
Scalar	c9	/	284.325	/;
Scalar	c10	/	753.6666667	/;
Scalar	c11	/	287.725	/;
Scalar	c12	/	801.55	/;
Scalar	c13	/	47.88333333	/;
Scalar	c15	/	360.1166667	/;
Scalar	c16	/	3217.391667	/;
Scalar	c17	/	226.6666667	/;
Scalar	c18	/	3881.1	/;
Scalar	c19	/	3340.5	/;
Scalar	c20	/	2297.691667	/;
Scalar	c21	/	1179.233333	/;
Scalar	c22	/	315.9166667	/;
Scalar	c23	/	323.7083333	/;
Scalar	c24	/	1537.933333	/;
Scalar	c25	/	2107.008333	/;
Scalar	c27	/	779.5916667	/;
Scalar	c28	/	1122.85	/;
Scalar	c29	/	2525.633333	/;
Scalar	c30	/	754.6583333	/;
Scalar	c31	/	744.7416667	/;
Scalar	c33	/	1589.925	/;
Scalar	c34	/	406.725	/;
Scalar	c36	/	3268.656111	/;
Scalar	c37	/	138.0116667	/;
Scalar	c38	/	2255.418333	/;
Scalar	c41	/	21.39166667	/;
Scalar	c42	/	411.825	/;
Scalar	c43	/	243.95	/;
Scalar	c44	/	705.925	/;
Scalar	c45	/	203.0083333	/;
Scalar	c46	/	1794.491667	/;
Scalar	c47	/	414.0916667	/;
Scalar	c48	/	1824.383333	/;
Scalar	c49	/	656.9083333	/;
Scalar	c50	/	1817.764667	/;
Scalar	c51	/	463.9526667	/;
Scalar	c52	/	329.1511667	/;
Scalar	c53	/	75.35958333	/;
Scalar	c54	/	1484.383333	/;
Scalar	c55	/	808.4916667	/;
Scalar	c56	/	1714.875	/;
Scalar	c57	/	4003.641667	/;
Scalar	c58	/	1537.083333	/;
Scalar	c59	/	1425.166667	/;
Scalar	c60	/	3922.330667	/;
Scalar	c61	/	2221.902833	/;
Scalar	c62	/	334.8915	/;
Scalar	c63	/	3722.011167	/;
Scalar	c64	/	1926.4145	/;
Scalar	c65	/	193.1653333	/;
Scalar	c66	/	3030.25	/;
Scalar	c67	/	2122.025	/;
Scalar	c68	/	528.1333333	/;
Scalar	c71	/	1848.183333	/;
Scalar	c72	/	3534.725	/;
Scalar	c73	/	6297.383333	/;
Scalar	c74	/	1015.466667	/;
Scalar	c75	/	3348.433333	/;
Scalar	c76	/	734.4	/;
Scalar	c77	/	512.2666667	/;
Scalar	c78	/	99.875	/;
Scalar	c79	/	1252.191667	/;
Scalar	c80	/	1615.141667	/;
Scalar	c81	/	264.35	/;
Scalar	c82	/	2479.308333	/;
Scalar	c83	/	2475.766667	/;
Scalar	c84	/	2365.125	/;
Scalar	c85	/	1336.766667	/;
Scalar	c86	/	2802.733333	/;
Scalar	c87	/	2227.141667	/;
Scalar	c88	/	2913.8	/;
Scalar	c89	/	1486.791667	/;
Scalar	c90	/	1235.9	/;
Scalar	c91	/	1206.716667	/;
Scalar	c92	/	24.36666667	/;
Scalar	c93	/	140.9583333	/;
Scalar	c94	/	310.3916667	/;
Scalar	c95	/	1328.55	/;
Scalar	c96	/	640.05	/;
Scalar	c97	/	32.58333333	/;
Scalar	c98	/	4668.908333	/;
Scalar	c99	/	3435.133333	/;
Scalar	c100	/	1462.991667	/;
Scalar	d2	/	-1.27281E-12	/;
Scalar	d3	/	-6.45236E-13	/;
Scalar	d4	/	-1.88782E-13	/;
Scalar	d5	/	4.49809E-13	/;
Scalar	d7	/	-2.81086E-12	/;
Scalar	d8	/	-1.34578E-12	/;
Scalar	d9	/	-2.33634E-13	/;
Scalar	d10	/	-6.1945E-13	/;
Scalar	d11	/	-2.07458E-13	/;
Scalar	d12	/	-6.06533E-13	/;
Scalar	d13	/	-3.65798E-14	/;
Scalar	d15	/	-2.91635E-13	/;
Scalar	d16	/	-1.64999E-12	/;
Scalar	d17	/	-1.83017E-13	/;
Scalar	d18	/	-2.67167E-12	/;
Scalar	d19	/	-1.27106E-12	/;
Scalar	d20	/	-1.22486E-12	/;
Scalar	d21	/	-6.26409E-13	/;
Scalar	d22	/	-2.48768E-13	/;
Scalar	d23	/	-2.68491E-13	/;
Scalar	d24	/	-1.22673E-12	/;
Scalar	d25	/	-9.16594E-13	/;
Scalar	d27	/	-5.82669E-13	/;
Scalar	d28	/	-8.49757E-13	/;
Scalar	d29	/	-1.91357E-12	/;
Scalar	d30	/	-6.23578E-13	/;
Scalar	d31	/	-3.76414E-13	/;
Scalar	d33	/	-1.31902E-12	/;
Scalar	d34	/	-2.97451E-13	/;
Scalar	d36	/	-5.83423E-13	/;
Scalar	d37	/	-1.0971E-13	/;
Scalar	d38	/	-1.34962E-12	/;
Scalar	d41	/	-1.31173E-14	/;
Scalar	d42	/	-3.26245E-13	/;
Scalar	d43	/	-1.8317E-13	/;
Scalar	d44	/	-5.5614E-13	/;
Scalar	d45	/	-1.4153E-13	/;
Scalar	d46	/	-1.41716E-12	/;
Scalar	d47	/	-2.54725E-13	/;
Scalar	d48	/	-1.45809E-12	/;
Scalar	d49	/	-4.68589E-13	/;
Scalar	d50	/	-7.38861E-13	/;
Scalar	d51	/	-3.8085E-13	/;
Scalar	d52	/	-2.73607E-13	/;
Scalar	d53	/	-6.21135E-14	/;
Scalar	d54	/	-1.22507E-12	/;
Scalar	d55	/	-6.32296E-13	/;
Scalar	d56	/	-9.78653E-13	/;
Scalar	d57	/	-2.96906E-12	/;
Scalar	d58	/	-1.18417E-12	/;
Scalar	d59	/	-1.15396E-12	/;
Scalar	d60	/	-3.04772E-12	/;
Scalar	d61	/	-1.61017E-12	/;
Scalar	d62	/	-2.65326E-13	/;
Scalar	d63	/	-2.66402E-12	/;
Scalar	d64	/	-1.41441E-12	/;
Scalar	d65	/	-1.61025E-13	/;
Scalar	d66	/	-1.23081E-12	/;
Scalar	d67	/	-8.54617E-13	/;
Scalar	d68	/	-4.13159E-13	/;
Scalar	d71	/	-1.4562E-12	/;
Scalar	d72	/	-2.6697E-13	/;
Scalar	d73	/	-7.65116E-13	/;
Scalar	d74	/	-7.51425E-13	/;
Scalar	d75	/	-1.9932E-12	/;
Scalar	d76	/	-5.80888E-13	/;
Scalar	d77	/	-4.22443E-13	/;
Scalar	d78	/	-6.74502E-14	/;
Scalar	d79	/	-8.37654E-13	/;
Scalar	d80	/	-1.02509E-12	/;
Scalar	d81	/	-1.98906E-13	/;
Scalar	d82	/	-1.82145E-12	/;
Scalar	d83	/	-1.08647E-12	/;
Scalar	d84	/	-1.30122E-12	/;
Scalar	d85	/	-8.81713E-13	/;
Scalar	d86	/	-1.95149E-12	/;
Scalar	d87	/	-1.375E-12	/;
Scalar	d88	/	-1.66601E-12	/;
Scalar	d89	/	-8.72594E-13	/;
Scalar	d90	/	-9.59744E-13	/;
Scalar	d91	/	-8.45687E-13	/;
Scalar	d92	/	-1.80835E-14	/;
Scalar	d93	/	-7.56131E-14	/;
Scalar	d94	/	-2.32443E-13	/;
Scalar	d95	/	-9.13149E-13	/;
Scalar	d96	/	-5.10194E-13	/;
Scalar	d97	/	-2.48898E-14	/;
Scalar	d98	/	-2.38124E-12	/;
Scalar	d99	/	-1.15444E-12	/;
Scalar	d100	/	-9.32979E-13	/;



obj..  z =e= a2	*	power(	n2	,	3	)	+	b2	*	power(	n2	,	2	)	+	c2	*	power(	n2	,	1	)	+	d2	*	power(	n2	,	0	)	+
a3	*	power(	n3	,	3	)	+	b3	*	power(	n3	,	2	)	+	c3	*	power(	n3	,	1	)	+	d3	*	power(	n3	,	0	)	+
a4	*	power(	n4	,	3	)	+	b4	*	power(	n4	,	2	)	+	c4	*	power(	n4	,	1	)	+	d4	*	power(	n4	,	0	)	+
a5	*	power(	n5	,	3	)	+	b5	*	power(	n5	,	2	)	+	c5	*	power(	n5	,	1	)	+	d5	*	power(	n5	,	0	)	+
a7	*	power(	n7	,	3	)	+	b7	*	power(	n7	,	2	)	+	c7	*	power(	n7	,	1	)	+	d7	*	power(	n7	,	0	)	+
a8	*	power(	n8	,	3	)	+	b8	*	power(	n8	,	2	)	+	c8	*	power(	n8	,	1	)	+	d8	*	power(	n8	,	0	)	+
a9	*	power(	n9	,	3	)	+	b9	*	power(	n9	,	2	)	+	c9	*	power(	n9	,	1	)	+	d9	*	power(	n9	,	0	)	+
a10	*	power(	n10	,	3	)	+	b10	*	power(	n10	,	2	)	+	c10	*	power(	n10	,	1	)	+	d10	*	power(	n10	,	0	)	+
a11	*	power(	n11	,	3	)	+	b11	*	power(	n11	,	2	)	+	c11	*	power(	n11	,	1	)	+	d11	*	power(	n11	,	0	)	+
a12	*	power(	n12	,	3	)	+	b12	*	power(	n12	,	2	)	+	c12	*	power(	n12	,	1	)	+	d12	*	power(	n12	,	0	)	+
a13	*	power(	n13	,	3	)	+	b13	*	power(	n13	,	2	)	+	c13	*	power(	n13	,	1	)	+	d13	*	power(	n13	,	0	)	+
a15	*	power(	n15	,	3	)	+	b15	*	power(	n15	,	2	)	+	c15	*	power(	n15	,	1	)	+	d15	*	power(	n15	,	0	)	+
a16	*	power(	n16	,	3	)	+	b16	*	power(	n16	,	2	)	+	c16	*	power(	n16	,	1	)	+	d16	*	power(	n16	,	0	)	+
a17	*	power(	n17	,	3	)	+	b17	*	power(	n17	,	2	)	+	c17	*	power(	n17	,	1	)	+	d17	*	power(	n17	,	0	)	+
a18	*	power(	n18	,	3	)	+	b18	*	power(	n18	,	2	)	+	c18	*	power(	n18	,	1	)	+	d18	*	power(	n18	,	0	)	+
a19	*	power(	n19	,	3	)	+	b19	*	power(	n19	,	2	)	+	c19	*	power(	n19	,	1	)	+	d19	*	power(	n19	,	0	)	+
a20	*	power(	n20	,	3	)	+	b20	*	power(	n20	,	2	)	+	c20	*	power(	n20	,	1	)	+	d20	*	power(	n20	,	0	)	+
a21	*	power(	n21	,	3	)	+	b21	*	power(	n21	,	2	)	+	c21	*	power(	n21	,	1	)	+	d21	*	power(	n21	,	0	)	+
a22	*	power(	n22	,	3	)	+	b22	*	power(	n22	,	2	)	+	c22	*	power(	n22	,	1	)	+	d22	*	power(	n22	,	0	)	+
a23	*	power(	n23	,	3	)	+	b23	*	power(	n23	,	2	)	+	c23	*	power(	n23	,	1	)	+	d23	*	power(	n23	,	0	)	+
a24	*	power(	n24	,	3	)	+	b24	*	power(	n24	,	2	)	+	c24	*	power(	n24	,	1	)	+	d24	*	power(	n24	,	0	)	+
a25	*	power(	n25	,	3	)	+	b25	*	power(	n25	,	2	)	+	c25	*	power(	n25	,	1	)	+	d25	*	power(	n25	,	0	)	+
a27	*	power(	n27	,	3	)	+	b27	*	power(	n27	,	2	)	+	c27	*	power(	n27	,	1	)	+	d27	*	power(	n27	,	0	)	+
a28	*	power(	n28	,	3	)	+	b28	*	power(	n28	,	2	)	+	c28	*	power(	n28	,	1	)	+	d28	*	power(	n28	,	0	)	+
a29	*	power(	n29	,	3	)	+	b29	*	power(	n29	,	2	)	+	c29	*	power(	n29	,	1	)	+	d29	*	power(	n29	,	0	)	+
a30	*	power(	n30	,	3	)	+	b30	*	power(	n30	,	2	)	+	c30	*	power(	n30	,	1	)	+	d30	*	power(	n30	,	0	)	+
a31	*	power(	n31	,	3	)	+	b31	*	power(	n31	,	2	)	+	c31	*	power(	n31	,	1	)	+	d31	*	power(	n31	,	0	)	+
a33	*	power(	n33	,	3	)	+	b33	*	power(	n33	,	2	)	+	c33	*	power(	n33	,	1	)	+	d33	*	power(	n33	,	0	)	+
a34	*	power(	n34	,	3	)	+	b34	*	power(	n34	,	2	)	+	c34	*	power(	n34	,	1	)	+	d34	*	power(	n34	,	0	)	+
a36	*	power(	n36	,	3	)	+	b36	*	power(	n36	,	2	)	+	c36	*	power(	n36	,	1	)	+	d36	*	power(	n36	,	0	)	+
a37	*	power(	n37	,	3	)	+	b37	*	power(	n37	,	2	)	+	c37	*	power(	n37	,	1	)	+	d37	*	power(	n37	,	0	)	+
a38	*	power(	n38	,	3	)	+	b38	*	power(	n38	,	2	)	+	c38	*	power(	n38	,	1	)	+	d38	*	power(	n38	,	0	)	+
a41	*	power(	n41	,	3	)	+	b41	*	power(	n41	,	2	)	+	c41	*	power(	n41	,	1	)	+	d41	*	power(	n41	,	0	)	+
a42	*	power(	n42	,	3	)	+	b42	*	power(	n42	,	2	)	+	c42	*	power(	n42	,	1	)	+	d42	*	power(	n42	,	0	)	+
a43	*	power(	n43	,	3	)	+	b43	*	power(	n43	,	2	)	+	c43	*	power(	n43	,	1	)	+	d43	*	power(	n43	,	0	)	+
a44	*	power(	n44	,	3	)	+	b44	*	power(	n44	,	2	)	+	c44	*	power(	n44	,	1	)	+	d44	*	power(	n44	,	0	)	+
a45	*	power(	n45	,	3	)	+	b45	*	power(	n45	,	2	)	+	c45	*	power(	n45	,	1	)	+	d45	*	power(	n45	,	0	)	+
a46	*	power(	n46	,	3	)	+	b46	*	power(	n46	,	2	)	+	c46	*	power(	n46	,	1	)	+	d46	*	power(	n46	,	0	)	+
a47	*	power(	n47	,	3	)	+	b47	*	power(	n47	,	2	)	+	c47	*	power(	n47	,	1	)	+	d47	*	power(	n47	,	0	)	+
a48	*	power(	n48	,	3	)	+	b48	*	power(	n48	,	2	)	+	c48	*	power(	n48	,	1	)	+	d48	*	power(	n48	,	0	)	+
a49	*	power(	n49	,	3	)	+	b49	*	power(	n49	,	2	)	+	c49	*	power(	n49	,	1	)	+	d49	*	power(	n49	,	0	)	+
a50	*	power(	n50	,	3	)	+	b50	*	power(	n50	,	2	)	+	c50	*	power(	n50	,	1	)	+	d50	*	power(	n50	,	0	)	+
a51	*	power(	n51	,	3	)	+	b51	*	power(	n51	,	2	)	+	c51	*	power(	n51	,	1	)	+	d51	*	power(	n51	,	0	)	+
a52	*	power(	n52	,	3	)	+	b52	*	power(	n52	,	2	)	+	c52	*	power(	n52	,	1	)	+	d52	*	power(	n52	,	0	)	+
a53	*	power(	n53	,	3	)	+	b53	*	power(	n53	,	2	)	+	c53	*	power(	n53	,	1	)	+	d53	*	power(	n53	,	0	)	+
a54	*	power(	n54	,	3	)	+	b54	*	power(	n54	,	2	)	+	c54	*	power(	n54	,	1	)	+	d54	*	power(	n54	,	0	)	+
a55	*	power(	n55	,	3	)	+	b55	*	power(	n55	,	2	)	+	c55	*	power(	n55	,	1	)	+	d55	*	power(	n55	,	0	)	+
a56	*	power(	n56	,	3	)	+	b56	*	power(	n56	,	2	)	+	c56	*	power(	n56	,	1	)	+	d56	*	power(	n56	,	0	)	+
a57	*	power(	n57	,	3	)	+	b57	*	power(	n57	,	2	)	+	c57	*	power(	n57	,	1	)	+	d57	*	power(	n57	,	0	)	+
a58	*	power(	n58	,	3	)	+	b58	*	power(	n58	,	2	)	+	c58	*	power(	n58	,	1	)	+	d58	*	power(	n58	,	0	)	+
a59	*	power(	n59	,	3	)	+	b59	*	power(	n59	,	2	)	+	c59	*	power(	n59	,	1	)	+	d59	*	power(	n59	,	0	)	+
a60	*	power(	n60	,	3	)	+	b60	*	power(	n60	,	2	)	+	c60	*	power(	n60	,	1	)	+	d60	*	power(	n60	,	0	)	+
a61	*	power(	n61	,	3	)	+	b61	*	power(	n61	,	2	)	+	c61	*	power(	n61	,	1	)	+	d61	*	power(	n61	,	0	)	+
a62	*	power(	n62	,	3	)	+	b62	*	power(	n62	,	2	)	+	c62	*	power(	n62	,	1	)	+	d62	*	power(	n62	,	0	)	+
a63	*	power(	n63	,	3	)	+	b63	*	power(	n63	,	2	)	+	c63	*	power(	n63	,	1	)	+	d63	*	power(	n63	,	0	)	+
a64	*	power(	n64	,	3	)	+	b64	*	power(	n64	,	2	)	+	c64	*	power(	n64	,	1	)	+	d64	*	power(	n64	,	0	)	+
a65	*	power(	n65	,	3	)	+	b65	*	power(	n65	,	2	)	+	c65	*	power(	n65	,	1	)	+	d65	*	power(	n65	,	0	)	+
a66	*	power(	n66	,	3	)	+	b66	*	power(	n66	,	2	)	+	c66	*	power(	n66	,	1	)	+	d66	*	power(	n66	,	0	)	+
a67	*	power(	n67	,	3	)	+	b67	*	power(	n67	,	2	)	+	c67	*	power(	n67	,	1	)	+	d67	*	power(	n67	,	0	)	+
a68	*	power(	n68	,	3	)	+	b68	*	power(	n68	,	2	)	+	c68	*	power(	n68	,	1	)	+	d68	*	power(	n68	,	0	)	+
a71	*	power(	n71	,	3	)	+	b71	*	power(	n71	,	2	)	+	c71	*	power(	n71	,	1	)	+	d71	*	power(	n71	,	0	)	+
a72	*	power(	n72	,	3	)	+	b72	*	power(	n72	,	2	)	+	c72	*	power(	n72	,	1	)	+	d72	*	power(	n72	,	0	)	+
a73	*	power(	n73	,	3	)	+	b73	*	power(	n73	,	2	)	+	c73	*	power(	n73	,	1	)	+	d73	*	power(	n73	,	0	)	+
a74	*	power(	n74	,	3	)	+	b74	*	power(	n74	,	2	)	+	c74	*	power(	n74	,	1	)	+	d74	*	power(	n74	,	0	)	+
a75	*	power(	n75	,	3	)	+	b75	*	power(	n75	,	2	)	+	c75	*	power(	n75	,	1	)	+	d75	*	power(	n75	,	0	)	+
a76	*	power(	n76	,	3	)	+	b76	*	power(	n76	,	2	)	+	c76	*	power(	n76	,	1	)	+	d76	*	power(	n76	,	0	)	+
a77	*	power(	n77	,	3	)	+	b77	*	power(	n77	,	2	)	+	c77	*	power(	n77	,	1	)	+	d77	*	power(	n77	,	0	)	+
a78	*	power(	n78	,	3	)	+	b78	*	power(	n78	,	2	)	+	c78	*	power(	n78	,	1	)	+	d78	*	power(	n78	,	0	)	+
a79	*	power(	n79	,	3	)	+	b79	*	power(	n79	,	2	)	+	c79	*	power(	n79	,	1	)	+	d79	*	power(	n79	,	0	)	+
a80	*	power(	n80	,	3	)	+	b80	*	power(	n80	,	2	)	+	c80	*	power(	n80	,	1	)	+	d80	*	power(	n80	,	0	)	+
a81	*	power(	n81	,	3	)	+	b81	*	power(	n81	,	2	)	+	c81	*	power(	n81	,	1	)	+	d81	*	power(	n81	,	0	)	+
a82	*	power(	n82	,	3	)	+	b82	*	power(	n82	,	2	)	+	c82	*	power(	n82	,	1	)	+	d82	*	power(	n82	,	0	)	+
a83	*	power(	n83	,	3	)	+	b83	*	power(	n83	,	2	)	+	c83	*	power(	n83	,	1	)	+	d83	*	power(	n83	,	0	)	+
a84	*	power(	n84	,	3	)	+	b84	*	power(	n84	,	2	)	+	c84	*	power(	n84	,	1	)	+	d84	*	power(	n84	,	0	)	+
a85	*	power(	n85	,	3	)	+	b85	*	power(	n85	,	2	)	+	c85	*	power(	n85	,	1	)	+	d85	*	power(	n85	,	0	)	+
a86	*	power(	n86	,	3	)	+	b86	*	power(	n86	,	2	)	+	c86	*	power(	n86	,	1	)	+	d86	*	power(	n86	,	0	)	+
a87	*	power(	n87	,	3	)	+	b87	*	power(	n87	,	2	)	+	c87	*	power(	n87	,	1	)	+	d87	*	power(	n87	,	0	)	+
a88	*	power(	n88	,	3	)	+	b88	*	power(	n88	,	2	)	+	c88	*	power(	n88	,	1	)	+	d88	*	power(	n88	,	0	)	+
a89	*	power(	n89	,	3	)	+	b89	*	power(	n89	,	2	)	+	c89	*	power(	n89	,	1	)	+	d89	*	power(	n89	,	0	)	+
a90	*	power(	n90	,	3	)	+	b90	*	power(	n90	,	2	)	+	c90	*	power(	n90	,	1	)	+	d90	*	power(	n90	,	0	)	+
a91	*	power(	n91	,	3	)	+	b91	*	power(	n91	,	2	)	+	c91	*	power(	n91	,	1	)	+	d91	*	power(	n91	,	0	)	+
a92	*	power(	n92	,	3	)	+	b92	*	power(	n92	,	2	)	+	c92	*	power(	n92	,	1	)	+	d92	*	power(	n92	,	0	)	+
a93	*	power(	n93	,	3	)	+	b93	*	power(	n93	,	2	)	+	c93	*	power(	n93	,	1	)	+	d93	*	power(	n93	,	0	)	+
a94	*	power(	n94	,	3	)	+	b94	*	power(	n94	,	2	)	+	c94	*	power(	n94	,	1	)	+	d94	*	power(	n94	,	0	)	+
a95	*	power(	n95	,	3	)	+	b95	*	power(	n95	,	2	)	+	c95	*	power(	n95	,	1	)	+	d95	*	power(	n95	,	0	)	+
a96	*	power(	n96	,	3	)	+	b96	*	power(	n96	,	2	)	+	c96	*	power(	n96	,	1	)	+	d96	*	power(	n96	,	0	)	+
a97	*	power(	n97	,	3	)	+	b97	*	power(	n97	,	2	)	+	c97	*	power(	n97	,	1	)	+	d97	*	power(	n97	,	0	)	+
a98	*	power(	n98	,	3	)	+	b98	*	power(	n98	,	2	)	+	c98	*	power(	n98	,	1	)	+	d98	*	power(	n98	,	0	)	+
a99	*	power(	n99	,	3	)	+	b99	*	power(	n99	,	2	)	+	c99	*	power(	n99	,	1	)	+	d99	*	power(	n99	,	0	)	+
a100	*	power(	n100	,	3	)	+	b100	*	power(	n100	,	2	)	+	c100	*	power(	n100	,	1	)	+	d100	*	power(	n100	,	0	);

m1..  n2	+	n3	+	n4	+	n5	+	n7	+	n8	+	n9	+	n10	+	n11	+	n12	+	n13	+	n15	+	n16	+	n17	+	n18	+	n19	+	n20	+	n21	+	n22	+	n23	+	n24	+	n25	+	n27	+	n28	+	n29	+	n30	+	n31	+	n33	+	n34	+	n36	+	n37	+	n38	+	n41	+	n42	+	n43	+	n44	+	n45	+	n46	+	n47	+	n48	+	n49	+	n50	+	n51	+	n52	+	n53	+	n54	+	n55	+	n56	+	n57	+	n58	+	n59	+	n60	+	n61	+	n62	+	n63	+	n64	+	n65	+	n66	+	n67	+	n68	+	n71	+	n72	+	n73	+	n74	+	n75	+	n76	+	n77	+	n78	+	n79	+	n80	+	n81	+	n82	+	n83	+	n84	+	n85	+	n86	+	n87	+	n88	+	n89	+	n90	+	n91	+	n92	+	n93	+	n94	+	n95	+	n96	+	n97	+	n98	+	n99	+	n100 =l= 6;

Model process / all /;

solve process maximizing z using minlp;