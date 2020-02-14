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

Integer Variable	n1	;
Integer Variable	n2	;
Integer Variable	n3	;
Integer Variable	n4	;
Integer Variable	n11	;
Integer Variable	n12	;
Integer Variable	n13	;
Integer Variable	n14	;
Integer Variable	n15	;
Integer Variable	n16	;
Integer Variable	n17	;
Integer Variable	n18	;
Integer Variable	n19	;
Integer Variable	n20	;
Integer Variable	n27	;
Integer Variable	n28	;
Integer Variable	n29	;
Integer Variable	n30	;
Integer Variable	n31	;
Integer Variable	n32	;
Integer Variable	n33	;
Integer Variable	n34	;
Integer Variable	n35	;
Integer Variable	n36	;
Integer Variable	n37	;
Integer Variable	n38	;
Integer Variable	n39	;
Integer Variable	n40	;
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
Integer Variable	n67	;
Integer Variable	n68	;
Integer Variable	n69	;
Integer Variable	n70	;
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


Equation   obj   'objective function';
Equation   m1   'Constraint 1';


Scalar	a1	/	80.46666667	/;
Scalar	a2	/	71.11666667	/;
Scalar	a3	/	40.23333333	/;
Scalar	a4	/	21.10833333	/;
Scalar	a11	/	130.79375	/;
Scalar	a12	/	28.40416667	/;
Scalar	a13	/	54.75416667	/;
Scalar	a14	/	43.42083333	/;
Scalar	a15	/	84.96458333	/;
Scalar	a16	/	91.55208333	/;
Scalar	a17	/	169.5395833	/;
Scalar	a18	/	70.30208333	/;
Scalar	a19	/	48.91041667	/;
Scalar	a20	/	-43.42083333	/;
Scalar	a27	/	-34.14166667	/;
Scalar	a28	/	-33.50416667	/;
Scalar	a29	/	-72.07291667	/;
Scalar	a30	/	-67.39791667	/;
Scalar	a31	/	232.9708333	/;
Scalar	a32	/	145.3854167	/;
Scalar	a33	/	73.06458333	/;
Scalar	a34	/	111.7395833	/;
Scalar	a35	/	96.2625	/;
Scalar	a36	/	7.897916667	/;
Scalar	a37	/	206.7270833	/;
Scalar	a38	/	41.15416667	/;
Scalar	a39	/	97.18333333	/;
Scalar	a40	/	75.8625	/;
Scalar	a41	/	27.90833333	/;
Scalar	a42	/	29.82083333	/;
Scalar	a43	/	173.7541667	/;
Scalar	a44	/	68.2125	/;
Scalar	a45	/	65.48541667	/;
Scalar	a46	/	66.44166667	/;
Scalar	a47	/	-1.416666667	/;
Scalar	a48	/	-118.68125	/;
Scalar	a49	/	0.991666667	/;
Scalar	a50	/	-81.10416667	/;
Scalar	a51	/	207.0104167	/;
Scalar	a52	/	123.4979167	/;
Scalar	a53	/	34.2125	/;
Scalar	a54	/	-48.73333333	/;
Scalar	a55	/	85.81458333	/;
Scalar	a56	/	14.80416667	/;
Scalar	a57	/	68.95625	/;
Scalar	a58	/	-127.2520833	/;
Scalar	a59	/	-16.75208333	/;
Scalar	a60	/	-78.2	/;
Scalar	a67	/	138.3020833	/;
Scalar	a68	/	-68.49583333	/;
Scalar	a69	/	133.2729167	/;
Scalar	a70	/	30.77708333	/;
Scalar	a71	/	44.27083333	/;
Scalar	a72	/	-3.1875	/;
Scalar	a73	/	28.01458333	/;
Scalar	a74	/	-28.93541667	/;
Scalar	a75	/	78.90833333	/;
Scalar	a76	/	68.14166667	/;
Scalar	a77	/	61.2	/;
Scalar	a78	/	-65.09583333	/;
Scalar	a79	/	-28.19166667	/;
Scalar	a80	/	-158.6666667	/;
Scalar	a81	/	84.11458333	/;
Scalar	a82	/	-77.66875	/;
Scalar	a83	/	115.3166667	/;
Scalar	a84	/	63.75	/;
Scalar	a85	/	204.2125	/;
Scalar	a86	/	86.55833333	/;
Scalar	a87	/	103.7708333	/;
Scalar	a88	/	60.73958333	/;
Scalar	a89	/	-101.3625	/;
Scalar	a90	/	18.52291667	/;
Scalar	a91	/	193.1625	/;
Scalar	a92	/	116.34375	/;
Scalar	a93	/	8.252083333	/;
Scalar	a94	/	-26.73958333	/;
Scalar	b1	/	-991.3125	/;
Scalar	b2	/	-762.875	/;
Scalar	b3	/	-608.6	/;
Scalar	b4	/	-774.9875	/;
Scalar	b11	/	-1844.075	/;
Scalar	b12	/	-1150.2625	/;
Scalar	b13	/	-691.475	/;
Scalar	b14	/	-472.6	/;
Scalar	b15	/	-1594.6	/;
Scalar	b16	/	-1495.15	/;
Scalar	b17	/	-2068.9	/;
Scalar	b18	/	-866.3625	/;
Scalar	b19	/	-660.45	/;
Scalar	b20	/	-51.6375	/;
Scalar	b27	/	-81.3875	/;
Scalar	b28	/	97.9625	/;
Scalar	b29	/	-441.3625	/;
Scalar	b30	/	-527.2125	/;
Scalar	b31	/	-2687.275	/;
Scalar	b32	/	-1759.5	/;
Scalar	b33	/	-1214.65	/;
Scalar	b34	/	-1469.225	/;
Scalar	b35	/	-1768.2125	/;
Scalar	b36	/	-780.5125	/;
Scalar	b37	/	-2680.475	/;
Scalar	b38	/	-1103.5125	/;
Scalar	b39	/	-1170.45	/;
Scalar	b40	/	-974.95	/;
Scalar	b41	/	-494.9125	/;
Scalar	b42	/	-396.95	/;
Scalar	b43	/	-2068.05	/;
Scalar	b44	/	-785.1875	/;
Scalar	b45	/	-734.1875	/;
Scalar	b46	/	-1325.7875	/;
Scalar	b47	/	-716.7625	/;
Scalar	b48	/	254.15	/;
Scalar	b49	/	-464.525	/;
Scalar	b50	/	-8.712499999	/;
Scalar	b51	/	-2562.75	/;
Scalar	b52	/	-1595.2375	/;
Scalar	b53	/	-580.7625	/;
Scalar	b54	/	134.0875	/;
Scalar	b55	/	-1152.6	/;
Scalar	b56	/	-693.3875	/;
Scalar	b57	/	-1052.725	/;
Scalar	b58	/	406.5125	/;
Scalar	b59	/	-546.7625	/;
Scalar	b60	/	21.4625	/;
Scalar	b67	/	-1683.2125	/;
Scalar	b68	/	-250.1125	/;
Scalar	b69	/	-1857.0375	/;
Scalar	b70	/	-1119.875	/;
Scalar	b71	/	-509.7875	/;
Scalar	b72	/	-687.8625	/;
Scalar	b73	/	-931.175	/;
Scalar	b74	/	-406.0875	/;
Scalar	b75	/	-1377.2125	/;
Scalar	b76	/	-1277.7625	/;
Scalar	b77	/	-915.2375	/;
Scalar	b78	/	332.5625	/;
Scalar	b79	/	-374.85	/;
Scalar	b80	/	683.1875	/;
Scalar	b81	/	-1693.625	/;
Scalar	b82	/	-186.7875	/;
Scalar	b83	/	-1339.8125	/;
Scalar	b84	/	-809.4125	/;
Scalar	b85	/	-2395.3	/;
Scalar	b86	/	-1404.4125	/;
Scalar	b87	/	-1184.2625	/;
Scalar	b88	/	-730.3625	/;
Scalar	b89	/	-12.5375	/;
Scalar	b90	/	-509.3625	/;
Scalar	b91	/	-2513.875	/;
Scalar	b92	/	-1664.3	/;
Scalar	b93	/	-98.8125	/;
Scalar	b94	/	-407.575	/;
Scalar	c1	/	4190.358333	/;
Scalar	c2	/	3270.233333	/;
Scalar	c3	/	3154.066667	/;
Scalar	c4	/	9237.091667	/;
Scalar	c11	/	9534.875	/;
Scalar	c12	/	10648.65833	/;
Scalar	c13	/	3557.533333	/;
Scalar	c14	/	2360.166667	/;
Scalar	c15	/	10518.89167	/;
Scalar	c16	/	9140.191667	/;
Scalar	c17	/	8076.841667	/;
Scalar	c18	/	3357.216667	/;
Scalar	c19	/	3280.858333	/;
Scalar	c20	/	10101.25833	/;
Scalar	c27	/	3985.791667	/;
Scalar	c28	/	7935.741667	/;
Scalar	c29	/	12175.96667	/;
Scalar	c30	/	11061.61667	/;
Scalar	c31	/	10334.01667	/;
Scalar	c32	/	7617.558333	/;
Scalar	c33	/	6806.941667	/;
Scalar	c34	/	9120.641667	/;
Scalar	c35	/	11200.875	/;
Scalar	c36	/	9502.433333	/;
Scalar	c37	/	13379.14167	/;
Scalar	c38	/	15700.20833	/;
Scalar	c39	/	4688.316667	/;
Scalar	c40	/	4587.45	/;
Scalar	c41	/	3349.141667	/;
Scalar	c42	/	1948.766667	/;
Scalar	c43	/	8087.183333	/;
Scalar	c44	/	2980.525	/;
Scalar	c45	/	2669.283333	/;
Scalar	c46	/	8219.358333	/;
Scalar	c47	/	7321.191667	/;
Scalar	c48	/	7133.625	/;
Scalar	c49	/	5736.933333	/;
Scalar	c50	/	6481.391667	/;
Scalar	c51	/	11033.70833	/;
Scalar	c52	/	7079.083333	/;
Scalar	c53	/	3269.525	/;
Scalar	c54	/	6716.558333	/;
Scalar	c55	/	5265.041667	/;
Scalar	c56	/	6361.258333	/;
Scalar	c57	/	5408.975	/;
Scalar	c58	/	6673.633333	/;
Scalar	c59	/	8508.783333	/;
Scalar	c60	/	7273.025	/;
Scalar	c67	/	10136.81667	/;
Scalar	c68	/	7809.658333	/;
Scalar	c69	/	8549.583333	/;
Scalar	c70	/	11690.19167	/;
Scalar	c71	/	1910.091667	/;
Scalar	c72	/	10808.175	/;
Scalar	c73	/	7356.041667	/;
Scalar	c74	/	7716.866667	/;
Scalar	c75	/	9029.691667	/;
Scalar	c76	/	9352.408333	/;
Scalar	c77	/	4695.825	/;
Scalar	c78	/	7867.458333	/;
Scalar	c79	/	6547.266667	/;
Scalar	c80	/	5335.591667	/;
Scalar	c81	/	10848.69167	/;
Scalar	c82	/	10965	/;
Scalar	c83	/	5205.258333	/;
Scalar	c84	/	3271.225	/;
Scalar	c85	/	9270.1	/;
Scalar	c86	/	7958.691667	/;
Scalar	c87	/	4551.891667	/;
Scalar	c88	/	3012.116667	/;
Scalar	c89	/	8557.375	/;
Scalar	c90	/	4161.883333	/;
Scalar	c91	/	11004.1	/;
Scalar	c92	/	9070.775	/;
Scalar	c93	/	377.1166667	/;
Scalar	c94	/	8415.708333	/;
Scalar	d1	/	-2.72848E-12	/;
Scalar	d2	/	-1.81899E-12	/;
Scalar	d3	/	-3.18323E-12	/;
Scalar	d4	/	-2.04636E-12	/;
Scalar	d11	/	-7.27596E-12	/;
Scalar	d12	/	-4.77485E-12	/;
Scalar	d13	/	4.54747E-13	/;
Scalar	d14	/	4.54747E-13	/;
Scalar	d15	/	-2.72848E-12	/;
Scalar	d16	/	-4.54747E-12	/;
Scalar	d17	/	-3.63798E-12	/;
Scalar	d18	/	-9.09495E-13	/;
Scalar	d19	/	-1.36424E-12	/;
Scalar	d20	/	2.72848E-12	/;
Scalar	d27	/	-2.27374E-12	/;
Scalar	d28	/	1.81899E-12	/;
Scalar	d29	/	0	/;
Scalar	d30	/	0	/;
Scalar	d31	/	-3.63798E-12	/;
Scalar	d32	/	-5.45697E-12	/;
Scalar	d33	/	-3.63798E-12	/;
Scalar	d34	/	-1.09139E-11	/;
Scalar	d35	/	-1.09139E-11	/;
Scalar	d36	/	-1.13687E-12	/;
Scalar	d37	/	-7.27596E-12	/;
Scalar	d38	/	1.36424E-12	/;
Scalar	d39	/	-2.72848E-12	/;
Scalar	d40	/	-2.72848E-12	/;
Scalar	d41	/	-6.82121E-13	/;
Scalar	d42	/	-4.54747E-13	/;
Scalar	d43	/	-7.27596E-12	/;
Scalar	d44	/	-3.63798E-12	/;
Scalar	d45	/	-1.81899E-12	/;
Scalar	d46	/	-8.18545E-12	/;
Scalar	d47	/	-9.80549E-13	/;
Scalar	d48	/	5.45697E-12	/;
Scalar	d49	/	-1.33582E-12	/;
Scalar	d50	/	0	/;
Scalar	d51	/	-1.45519E-11	/;
Scalar	d52	/	-5.45697E-12	/;
Scalar	d53	/	-1.81899E-12	/;
Scalar	d54	/	4.09273E-12	/;
Scalar	d55	/	-3.63798E-12	/;
Scalar	d56	/	-1.81899E-12	/;
Scalar	d57	/	-4.54747E-12	/;
Scalar	d58	/	0	/;
Scalar	d59	/	6.13909E-12	/;
Scalar	d60	/	-6.36646E-12	/;
Scalar	d67	/	-3.63798E-12	/;
Scalar	d68	/	0	/;
Scalar	d69	/	-1.81899E-12	/;
Scalar	d70	/	-7.7307E-12	/;
Scalar	d71	/	-1.81899E-12	/;
Scalar	d72	/	-6.99174E-12	/;
Scalar	d73	/	-1.36424E-12	/;
Scalar	d74	/	-2.72848E-12	/;
Scalar	d75	/	-6.36646E-12	/;
Scalar	d76	/	9.09495E-13	/;
Scalar	d77	/	-4.54747E-12	/;
Scalar	d78	/	-9.09495E-13	/;
Scalar	d79	/	1.36424E-12	/;
Scalar	d80	/	-3.63798E-12	/;
Scalar	d81	/	-3.63798E-12	/;
Scalar	d82	/	8.18545E-12	/;
Scalar	d83	/	-5.45697E-12	/;
Scalar	d84	/	-4.54747E-12	/;
Scalar	d85	/	-9.09495E-12	/;
Scalar	d86	/	9.09495E-13	/;
Scalar	d87	/	-4.54747E-12	/;
Scalar	d88	/	-9.09495E-13	/;
Scalar	d89	/	4.54747E-12	/;
Scalar	d90	/	-1.13687E-12	/;
Scalar	d91	/	-1.81899E-11	/;
Scalar	d92	/	1.81899E-12	/;
Scalar	d93	/	-5.68434E-13	/;
Scalar	d94	/	2.27374E-13	/;



obj..  z =e= a1	*	power(	n1	,	3	)	+	b1	*	power(	n1	,	2	)	+	c1	*	power(	n1	,	1	)	+	d1	*	power(	n1	,	0	)	+
a2	*	power(	n2	,	3	)	+	b2	*	power(	n2	,	2	)	+	c2	*	power(	n2	,	1	)	+	d2	*	power(	n2	,	0	)	+
a3	*	power(	n3	,	3	)	+	b3	*	power(	n3	,	2	)	+	c3	*	power(	n3	,	1	)	+	d3	*	power(	n3	,	0	)	+
a4	*	power(	n4	,	3	)	+	b4	*	power(	n4	,	2	)	+	c4	*	power(	n4	,	1	)	+	d4	*	power(	n4	,	0	)	+
a11	*	power(	n11	,	3	)	+	b11	*	power(	n11	,	2	)	+	c11	*	power(	n11	,	1	)	+	d11	*	power(	n11	,	0	)	+
a12	*	power(	n12	,	3	)	+	b12	*	power(	n12	,	2	)	+	c12	*	power(	n12	,	1	)	+	d12	*	power(	n12	,	0	)	+
a13	*	power(	n13	,	3	)	+	b13	*	power(	n13	,	2	)	+	c13	*	power(	n13	,	1	)	+	d13	*	power(	n13	,	0	)	+
a14	*	power(	n14	,	3	)	+	b14	*	power(	n14	,	2	)	+	c14	*	power(	n14	,	1	)	+	d14	*	power(	n14	,	0	)	+
a15	*	power(	n15	,	3	)	+	b15	*	power(	n15	,	2	)	+	c15	*	power(	n15	,	1	)	+	d15	*	power(	n15	,	0	)	+
a16	*	power(	n16	,	3	)	+	b16	*	power(	n16	,	2	)	+	c16	*	power(	n16	,	1	)	+	d16	*	power(	n16	,	0	)	+
a17	*	power(	n17	,	3	)	+	b17	*	power(	n17	,	2	)	+	c17	*	power(	n17	,	1	)	+	d17	*	power(	n17	,	0	)	+
a18	*	power(	n18	,	3	)	+	b18	*	power(	n18	,	2	)	+	c18	*	power(	n18	,	1	)	+	d18	*	power(	n18	,	0	)	+
a19	*	power(	n19	,	3	)	+	b19	*	power(	n19	,	2	)	+	c19	*	power(	n19	,	1	)	+	d19	*	power(	n19	,	0	)	+
a20	*	power(	n20	,	3	)	+	b20	*	power(	n20	,	2	)	+	c20	*	power(	n20	,	1	)	+	d20	*	power(	n20	,	0	)	+
a27	*	power(	n27	,	3	)	+	b27	*	power(	n27	,	2	)	+	c27	*	power(	n27	,	1	)	+	d27	*	power(	n27	,	0	)	+
a28	*	power(	n28	,	3	)	+	b28	*	power(	n28	,	2	)	+	c28	*	power(	n28	,	1	)	+	d28	*	power(	n28	,	0	)	+
a29	*	power(	n29	,	3	)	+	b29	*	power(	n29	,	2	)	+	c29	*	power(	n29	,	1	)	+	d29	*	power(	n29	,	0	)	+
a30	*	power(	n30	,	3	)	+	b30	*	power(	n30	,	2	)	+	c30	*	power(	n30	,	1	)	+	d30	*	power(	n30	,	0	)	+
a31	*	power(	n31	,	3	)	+	b31	*	power(	n31	,	2	)	+	c31	*	power(	n31	,	1	)	+	d31	*	power(	n31	,	0	)	+
a32	*	power(	n32	,	3	)	+	b32	*	power(	n32	,	2	)	+	c32	*	power(	n32	,	1	)	+	d32	*	power(	n32	,	0	)	+
a33	*	power(	n33	,	3	)	+	b33	*	power(	n33	,	2	)	+	c33	*	power(	n33	,	1	)	+	d33	*	power(	n33	,	0	)	+
a34	*	power(	n34	,	3	)	+	b34	*	power(	n34	,	2	)	+	c34	*	power(	n34	,	1	)	+	d34	*	power(	n34	,	0	)	+
a35	*	power(	n35	,	3	)	+	b35	*	power(	n35	,	2	)	+	c35	*	power(	n35	,	1	)	+	d35	*	power(	n35	,	0	)	+
a36	*	power(	n36	,	3	)	+	b36	*	power(	n36	,	2	)	+	c36	*	power(	n36	,	1	)	+	d36	*	power(	n36	,	0	)	+
a37	*	power(	n37	,	3	)	+	b37	*	power(	n37	,	2	)	+	c37	*	power(	n37	,	1	)	+	d37	*	power(	n37	,	0	)	+
a38	*	power(	n38	,	3	)	+	b38	*	power(	n38	,	2	)	+	c38	*	power(	n38	,	1	)	+	d38	*	power(	n38	,	0	)	+
a39	*	power(	n39	,	3	)	+	b39	*	power(	n39	,	2	)	+	c39	*	power(	n39	,	1	)	+	d39	*	power(	n39	,	0	)	+
a40	*	power(	n40	,	3	)	+	b40	*	power(	n40	,	2	)	+	c40	*	power(	n40	,	1	)	+	d40	*	power(	n40	,	0	)	+
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
a67	*	power(	n67	,	3	)	+	b67	*	power(	n67	,	2	)	+	c67	*	power(	n67	,	1	)	+	d67	*	power(	n67	,	0	)	+
a68	*	power(	n68	,	3	)	+	b68	*	power(	n68	,	2	)	+	c68	*	power(	n68	,	1	)	+	d68	*	power(	n68	,	0	)	+
a69	*	power(	n69	,	3	)	+	b69	*	power(	n69	,	2	)	+	c69	*	power(	n69	,	1	)	+	d69	*	power(	n69	,	0	)	+
a70	*	power(	n70	,	3	)	+	b70	*	power(	n70	,	2	)	+	c70	*	power(	n70	,	1	)	+	d70	*	power(	n70	,	0	)	+
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
a94	*	power(	n94	,	3	)	+	b94	*	power(	n94	,	2	)	+	c94	*	power(	n94	,	1	)	+	d94	*	power(	n94	,	0	);

m1..  n1 	+	n2	+	n3	+	n4	+	n11	+	n12	+	n13	+	n14	+	n15	+	n16	+	n17	+	n18	+	n19	+	n20	+	n27	+	n28	+	n29	+	n30	+	n31	+	n32	+	n33	+	n34	+	n35	+	n36	+	n37	+	n38	+	n39	+	n40	+	n41	+	n42	+	n43	+	n44	+	n45	+	n46	+	n47	+	n48	+	n49	+	n50	+	n51	+	n52	+	n53	+	n54	+	n55	+	n56	+	n57	+	n58	+	n59	+	n60	+	n67	+	n68	+	n69	+	n70	+	n71	+	n72	+	n73	+	n74	+	n75	+	n76	+	n77	+	n78	+	n79	+	n80	+	n81	+	n82	+	n83	+	n84	+	n85	+	n86	+	n87	+	n88	+	n89	+	n90	+	n91	+	n92	+	n93	+	n94 =l= 6;

Model process / all /;

solve process maximizing z using minlp;