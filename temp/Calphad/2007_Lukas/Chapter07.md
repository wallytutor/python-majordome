7.1

7.1.1

Optimization tools

In this chapter, two of the most commonly used types of software for optimization,
BINGSS and PARROT, are described.

Common features

Handling bad starting coefficients

The definition of the “error” (v; in Eq. (2.52)) is based on the “calculated value”
(F,(C;, x,;)). Which is often defined by an equilibrium calculation with two or more
phases. The initial set of adjustable coefficients may result in improper Gibbs-energy
functions, with which this equilibrium cannot be calculated. As an example, in Fig. 7.1
such a situation is shown for a two-phase equilibrium, liquid + bcc. There GP at all
compositions is larger than G4“ and the construction of a common tangent is impossible,
so also no equilibrium can be calculated numerically.

The experimental information is either “at temperature 7, there is a two-phase equi-
librium, liquid + bec, for which the composition of the bec phase was measured as
(x? = x')” or “in a single-phase bec sample of composition x’ on heating the first liquid
appears at temperature 7,” (see Fig. 4.4).

In the least-squares calculation for Eq. (2.52) no “calculated value” (F;(C;, x;;)) can
be provided as long as the starting values for the Gibbs-energy descriptions of liquid
and bee phases behave as in Fig. 7.1. To find better starting values by trial and error
is not easy and is time-consuming. Therefore it is desirable to have a method whereby
this problem is avoided and that can start even with a very bad initial set of adjustable
coefficients.

Zimmermann (Zimmermann 1976, Lukas er al. 1977) defined the error of a two-phase
equilibrium by a linear expression relating the Gibbs energies and their derivatives with
respect to the composition x as shown in Fig. 7.2

dG’

GH (=x)

 

—G" =error (7.1)

The first two terms together give the point at x” on the tangent to the curve G’(x)
at x’. All three terms together thus give the distance between this point on the tangent

203

===========
204 Optimization tools

molar Gibbs energy

mole fraction B B

>

Figure 7.1 At fixed temperature T, no equilibrium between the phases can be calculated with the
Gibbs-energy curves in the diagram because the bec phase is more stable than the liquid at all
compositions. The experimental information is a tie-line between the compositions marked by
symbols.

molar Gibbs energy

>

mole fraction B B

Figure 7.2 Construction of the “alternate definition of error.” The difference taken at
composition x” between G" and the tangent touching G" at x! is taken to be the “error.”

and G” = G" at x” = x4. If the single-phase Gibbs energies are linear functions of the
adjustable coefficients, the error itself is a linear function of the adjustable coefficients.
The thus-defined error is zero if the common-tangent construction fits exactly with
the measured concentration x’. In the following Eq. (7.1) will be called the “alternate
definition of error.” In contrast to the “normal” definition of the error, using x’ calculated
by solving the equilibrium conditions, the alternate definition always has a result, even
if the two-phase equilibrium liquid + bec cannot be calculated. There is, however, also
a disadvantage: the alternate error depends on x”, which is either just estimated or
measured by other, independent, experiments. This may give an incorrect behavior of the
least-squares optimization.

 

===========
7.1 Common features 205

Therefore the alternate definition of error should be used only at the beginning. Mostly
then the result is good enough to serve as starting values using the “normal” error, i.e.,
the error obtained from a normal equilibrium calculation.

An alternate error can be defined also for other types of measurements. Generally
we define it as a linear expression relating Gibbs energies and their derivatives with
respect to independent variables that becomes zero if an equilibrium calculation using the
current set of adjustable coefficients exactly fits the experimental values. Auxiliary state
variables, like x” in the above example, may be used, but should have little influence on
the value of the alternate error in the vicinity of the final solution.

In BINGSS, besides measured T or x’ of a two-phase tie-line, alternate definitions
of error are used for measured chemical potentials 4; in two-phase equilibria and for
measured temperatures of invariant three-phase equilibria. In

Gx! —Giex'

alternate error = — 1, (measured) (7.2)

 

G"- (=x) —G'-(1=x")

alternate error = — (measured)

 

the common tangent is replaced by a line connecting G’ and G” calculated for the
compositions x’ and x", respectively, without specifying it as a tangent. If the optimized
Gibbs-energy descriptions of the two phases exactly fit the measurement, this line becomes
the common tangent, if also x’ and x” are correctly given. Even if x’ and x” slightly
deviate, the line is expected to be very near to the common tangent. For a three-phase
equilibrium the common tangent touches all three Gibbs energy versus mole fraction
curves. The alternate definition of error in BINGSS demands that “the three calculated
Gibbs energies must be on the same straight line” without specifying this line to be a
tangent:

alternate error | = G(x" =x") 4G" (x — x) 46" (x — 2") (73)

 

In PARROT there is no limitation in definition of the error for each experiment, thus
in principle the alternate definition can be chosen freely, too. The PARROT module of
Thermo-Cale provides a setting called “set alternate mode,” by use of which alternate
errors can be calculated from a “normal” experimental data file as differences of Gibbs
energies rather than differences between the measured and calculated quantity. More
about that is given in section 7.3 and in the user manual of Thermo-Calc.

Usage of calculated phase-diagram information during

optimization

In optimization by least squares, only single pieces of information are used as experimental
data, but it is important to calculate the complete phase diagram several times during
the assessment. Such calculations show how the thermodynamic properties interpolate

  

===========
206

TA21

7.2

7.2.1

Optimization tools

between the experimental points and such calculations may show that some phases
appear in regions where they should not be stable. In PARROT it is possible to add as
experimental data that a phase should not be stable, as described in section 7.3.7.9.

Using calculations of metastable phase diagrams and other diagrams

The temperature—composition phase diagram, T—x, is the normal presentation of metallic
phase diagrams and it is common to overlay the calculated diagram with the experimen-
tal data.

It is also useful to calculate metastable phase diagrams if, e.g., all phases except the
liquid and the terminal solution phases have been suspended. It may also be interesting to
calculate the metastable solubility lines between the liquid and each solid phase including
the terminal phases.

When there are measured values of the chemical potential in two-phase regions, one
may calculate T-y diagrams, and add the experimental data to them. With Thermo-Calc,
many different diagrams can be plotted using various types of axes in the post-processing
of the same phase-diagram calculation. In BINGSS, this type of diagram is particularly
useful to elucidate regions where the T—x diagram contains metastable parts, which are
not automatically recognized by BINGSS. Calculating the T—y diagram by BINFKT
enables one to distinguish between stable and metastable regions of the two-phase fields.

How to use BINGSS

General features of BINGSS

BINGSS is restricted to binary systems. For ternary systems there is a similar program
called TERGSS. Quasibinary systems can often be treated like binary systems by BINGSS.

BINGSS was initially constructed for phases described by the RK formalism, with the
assumption that the molar functions of state of a phase are completely determined by
T, p, and the mole fractions of the components. Site fractions as used in the CEF and
similar variables initially were not used. Later, most of the models defined for binary
phases in the CEF were implemented. However, there is now a distinction between cases
in which the site fractions are already defined by the mole fractions of the components
(for example austenite, the interstitial solution of C in fec Fe) and cases in which one or
more degrees of freedom remain when the site fractions are related to the mole fractions.
Models in which the number of degrees of freedom is more than one are not implemented
in BINGSS. Also pressure dependence is not implemented in BINGSS. Since these cases
are not often modeled, most of the binary assessments can be done by BINGSS.

The equilibrium conditions are used in BINGSS as formulated in Eq. (2.22), with all
functions of state formulated as functions of 7, p, and x? (not y/"). The site fractions are
related to the x# and a single site fraction is selected as the independent one and called
y. They are calculated for internal equilibrium of the @ phase by solving the condition
0G /dy = 0. With the resulting site fractions, all molar functions of state of phase a and

  

===========
7.2.2

7.2 How to use BINGSS 207

all their derivatives can be calculated using the concept of implicitly defined functions
(see section 2.3.1).

The data necessary to run the program are collected in two input files, which must
be prepared by a text editor before running the program. One of these files contains
the analytical descriptions of all the phases, namely the model selected for each of the
phases and the selection of which coefficients shall be adjusted and which kept fixed.
It has FORTRAN file code 01 and is called “xxxx.coe.” The second file contains the
experimental data; it has FORTRAN file code 03 and is called “xxxx.dat.” The name
“xxxx” is arbitrary, but must be the same for both files; usually the symbols of the two
elements are taken for it.

Some decisions regarding how to start the calculation and how to continue are either
provided in an extra file, FORTRAN file code 04, “xxxx.bgl,” or given interactively from
the terminal, if file xxxx.bgl does not exist or is empty. Mostly the program is started
with file xxxx.bgl and continued interactively.

For the data output also two files are used, “store.coe” and “output.Ist.” The file
store.coe has the same structure as xxxx.coe, but contains the final numerical values of
the adjusted coefficients. If the calculation was successful, it is copied on request to
XXXX.coe, overwriting the former file. To avoid overwriting with unsatisfactory results, it
is not automatically copied.

The file output.lst contains information about how the calculation progressed in the
various steps. Its content is determined by a variable “LAUF” in file xxxx.bgl or given
interactively. By use of the selection LAUF=4 a table can be prepared, giving for each
measurement the difference between the measured value and the value calculated with
the current set of adjustable coefficients.

The coefficient file xxxx.coe

This file is created and modified by a text editor. It is usually prepared as a formatted
file using FORTRAN format specifications. Free format (integers, fixed-point real values,
floating-point real values, or strings (“abc123xyz”) separated by blanks or commas) is
also supported by BINGSS. Lines starting with the symbol “$” are comments and are not
used by the computer. Such lines may appear everywhere in the file.

If the unary systems are elements and their descriptions are taken from Dinsdale
(1991), these may be copied from a file called “unary0x.atd,” where 0x denotes the year
of the last update. Please check the SGTE website for the latest update. This file contains
also templates for all formats of file xxxx.coe. To use these templates most effectively, the
text editor should be switched into overwrite (or replace) mode rather than insert mode.

For quasibinary systems the “quasiunary” descriptions may be taken from the SGTE
substance database (Ansara 1999), or from another appropriate source.

In the first line of the file some dimensions are given. This line is usually edited
successively after the corresponding parts are finished. The line looks like

45 CaMg 3 2 9 1 3000.00

===========
208

Optimization tools

The first integer, NP = 4, is the number of phase descriptions in the “excess-term part”
of the file. The second integer, NT = 5, is the number of terms used in the “excess-term
part” to describe the temperature dependence of parameters according to Eq. (5.2). It is
restricted to the six terms explicitly given by Eq. (5.2). After one blank there follow two-
character names of the two components. These names are used only for table headings
in the file output.Ist, not for the identification of the components. These are identified
as components | and 2 in the sequence given here. Therefore this sequence must be
kept throughout all the files; it also determines the sign of odd RK terms. The following
integers, 3, 2 and 9 are the variables NPREF(1), NPREF(2) and NTU of the following
“reference states part.” The integer 1 specifies that Eq. (5.2) is used to describe the
temperature dependence of G. Initially another formulation of this equation was used,
which was derived from the description of C, by a polynomial in T:

G=b,—by-T+b;-T-[1—In(T)] — by T?/2—bs -T | /2— bg 73/6 (7.4)

 

This description of temperature dependence can be selected by integer 0. Finally, the
real number 3000.00 is the maximum temperature for which it is recommended that the
dataset should be used.

The following “reference-state part” contains Gibbs-energy descriptions of the stable
phases of the unary systems, called reference phases in the following text. They are
functions of temperature after Eq. (5.2), here not restricted to six terms. Also here several
different sets of coefficients a; may be used for different temperature ranges. The number
of different reference phases is given in the first line for both elements separately as
integers NPREF(1) and NPREF(2). Also the maximum number of different coefficients
a; is given in the first line as the integer NTU. The description for each reference phase
starts with a line giving the number of different temperature ranges and a name. This
name is not used by the computer and may be considered as a comment. Then, for each
temperature range, depending on NTU, there follow one (NTU < 4), two (5 < NTU < 9),
or three (10 < NTU) lines giving the lower limit of the temperature range and the
coefficients a;. An example for NTU=9 is

3Al_(fcc)
298.00 -7.97615000D+03 1.37093038D+02 -2.43671976D+01 -1.88466200D-03
7.4092000D+04 -8.7766400D-07 0.000000D+00 0.000000D+00 0.000000D+00
700.00 -1.12762400D+04 2.23048446D+02 -3.85844296D+01 1.85319820D-02
7.4092000D+04 -5.7642270D-06 0.000000D+00 0.000000D+00 0.000000D+00
933.47 -1.12783780D+04 1.88684153D+02 -3.17481920D+01 0.00000000D+00
0.0000000D+00 0.0000000D+00 0.000000D+00 0.000000D+00 -1.231000D+28
3 Al liquid

298.00 3.02887900D+03 1.25251171D+02 -2.43671976D+01 -1.88466200D-03
7.4092000D+04 -8.7766400D-07 0.000000D+00 7.933700D-20 0.000000D+00
700.00 -2.71210000D+02 2.11206579D+02 -3.85844296D+01 1.85319820D-02
7.4092000D+04 -5.7642270D-06 0.000000D+00 7.933700D-20 0.000000D+00
933.47 -7.95996000D+02 1.77430178D+02 ~3.17481920D+01 0.00000000D+00
0.0000000D+00 0.0000000D+00 0.000000D+00 0.000000D+00 0.000000D+00

===========
7.2 How to use BINGSS 209

The first line specifies three temperature ranges and the name “Al_(fcc),” the next pair of
lines gives the lower temperature limit and the nine coefficients a, to dg, the following
pair of lines is for the temperature range starting at 700 K, and the last pair is for the range
above 933.47K. The last range is the range of the metastable solid above the melting
temperature containing the term a) -7~° (Andersson 1985). The following reference phase
is liquid Al, containing the term ag- 77 (Andersson 1985) in the ranges below the melting
temperature.

The various reference phase descriptions are identified by integer numbers indicating
their sequence in the file. They are counted starting with No. 1 first for the first element
and starting again with No. 1 for the second element.

The following part of the file is the “excess-term part.” It consists of descriptions
of each phase of the binary system. For each phase in one line the model is chosen
and a name is given. Several models need some stoichiometric coefficients for complete
description, which are also given in this line. Finally, the reference states of both elements
used in the **G° part of the description of G®, in Eq. (5.1) are selected by two integers
from the “reference phases” of the previous part of this file. The following lines give the
parameters for this phase as functions of T in accord with Eq. (5.2), using the coefficients
a, to ay. The parameters are identified by their sequence, differently for each type of
description. For each of these coefficients a one-digit integer is used as a logical variable
to decide whether the coefficient will be adjusted during the optimization or kept constant.
For a phase described by the RK formalism with terms 1 to t the description of
the excess part may be as follows:

Sphi 1200000021
000000 0.00 0.00000 0.000000 0.000000 0. 0.00000
000000 0.00 0.00000 0.000000 0.000000 0. 0.00000
110000 0.00 0.00000 0.000000 0.000000 0. 0.00000
110000 0.00 0.00000 0.000000 0.000000 0. 0.00000
100000 0.00 0.00000 0.000000 0.000000 0. 0.00000

In the first line the number “5” means that there are five parameters for this phase; “phi”
is the name; and “12” is the code for Redlich—Kister. By this code also the parameters are
defined as °G$ —°GN', °G2 —°GE, OL? ,, ‘LS, and 2L% ,. The following four zeros
are reserved for stoichiometric constants and are not used for the RK formalism. The
next two zeros are for counting the parameters of a magnetic description (here, 0) and the
parameter p (given as integer 1000- p). The next two numbers indicate that for element
A the second reference phase is chosen and for element B the first reference phase is
chosen, The reference phases correspond to °G"" — HS°® for element i.

The following lines give the six one-digit integers and six coefficients of the five
parameters. Both °G? —°G"™ are zero here. For °L%, and 'L® , two coefficients are
adjusted and for Lt , only one. The number of coefficients to be adjusted must be less
than or equal to the maximum number of coefficients used per line, which is given by
the integer NT in the first line of the file.

For referencing in file xxxx.dat and everywhere else during the calculations, the phases
are identified by integer numbers denoting their sequence in the file. There may appear

===========
210

7.2.3

Optimization tools

several different descriptions for the same phase, which in calculations by BINFKT may
be used to compare these different descriptions on the same plot using different line styles
(dashings or colors).

In the last part linear constraints relating the coefficients being adjusted can be intro-
duced. These constraints are of the form Acoeff = factor: AV,, where V, are the “indepen-
dent coefficients” to be adjusted and “factor” means the factor by which an independent
coefficient contributes to the coefficient appearing in the formalism of the description.
Each “independent coefficient” is identified by an integer and each “coefficient of the
formalism” by its line and column number in the “excess-term part” of this file. As
an example the correlation of the two coefficients a, and a, of parameter °L (line 3)
according to the estimate of Tanaka er al. (1990) with a factor of Ty = 8400 K is shown
below:

13 1 8.40000000D+03
1 3 2-1.00000000D+00

The file is finished by a line containing only zeros and blanks. Behind that line
comments may be added. A set of items useful for complete documentation is given in
the file “unary.atd.” It is strongly recommended that all these comments be added, as
long as they are available without needing to search for them again in old protocols.

The experimental data file xxxx.dat

The file containing the experimental data, xxxx.dat, must be created in parallel to the xxxx.coe
file. The sequence of the components and the numbering of the phases must be common
to xxxx.coe and xxxx.dat. That must be decided before starting to construct the files.

Each experiment must be completely described by the FORTRAN variables NTYP,
NPHA, ITU(1) to ITU(4), W2DW, T£DT, TT, DTT, and X(1) to X(6), some of which
are not used for some types of experiments. The experiments are classified into types
by NTYP and NPHA, where NTYP distinguishes between partial Gibbs energies of
element A (1) or B (2), enthalpy differences between single-phase samples at the same
temperature (3) or different temperatures (4, 12), enthalpy differences between two-phase
equilibrium samples (5), entropy differences (9, 10, 11), phase-diagram mole fractions
(6) or temperatures (8), equilibrium phase amounts (7), equilibrium mole fractions at
isopiestically given chemical potentials (14, 15), or site fractions of a species on a
sublattice (13). NPHA gives the number of phases involved in the experiment. Reference
states need not be counted in NPHA, although they must be specified as phases. The
array ITU(|) identifies the phases including the reference states. W++DW is the measured
value in SI units. T£DT and, if necessary, TT are temperatures in kelvins. If TT is used,
DTT describes the accuracy of (T—TT), not of TT itself. The X(I) are mole fractions.

Experiments are classified into standard types, for which the equations of error
(Eg. (2.52)) are summarized in Table 7.1. This classification covers nearly all possible
experiments giving quantitative information connected with thermodynamic functions,
except pressure dependence. Which of the above variables are used and their specific
meanings depend on NTYP and NPHA, as summarized in Table 7.2.

 

===========
7.2 How to use BINGSS 211

Table 7.1 Equations of error related to binary experimental data

 

 

 

   

 

      

 

 

 

 

    

 

 

Type IVERS Calculated value ~ measured value
1 1 All Hy —°GT =,
1 2 13,567 Gx" (x) + Gx! /(x — 2x") — GP = py
1 22489 wily —°G — wy
2 1 All 1) —°GS! — py
2 2 1,3,5,6,7 Gi Wier 2")4G-(a" = D/la" x) °F
2 2 24,89 Mae —°GS! — by
3 1 All H'(T) — (1-x')- HT) x HE (T) —
3 2 All H'(T)—H"(T) —
3 3. All H'(T)-(1 Oy NT) =m H"(T) —
4 2 All H'(T)—H"(T))—H
4 3. All H'(T)—(1—m")-H"(T;) —m"-H"(T)) —H
4 4 All H(T)—[(l—m" =m") H" +m" 4m” H"\(T,) —
5 3029 HY Ts -#H
5 4 29
HY Tes -H
6or8 2 1,3,5-9 G(T) + (e"—¥)-0G" jax(P) — G(T)
6 2 24 Kael) = -x
6or8 2 24 ifx’ =x",extremum, Taye —T.
6or8 3 1,3,5,6,8 [G(x — x") 4G" (x — xX") 4G" -(x" — X(T)
6or8 3 2,4,7,9 Toate —
7 2 29 Miye(T, 2°) = mm!
8 2 2,4 Toate — T
9 1 All S(T) — =x’) Se (7 Ss
9 2. All S(T) — 8"(T) =
9 3. All S(T) — (1=m'")-8"(T) =m" -S"(T) — $
10 2 All S(T) — 8"(T,) — $
10 3. All S'(T) — (L=m")-8"(T,) —m" -S"(Ty) — $
u 3. All S(T) — (L=m'")-8"(T) = m'"-S"(T;) — $
12 3. All H'(T) — (1=m")-H"(T) = m"-H'"(T)) —
1B 1 29 (T=0) —— Waeate(T) — Wa
13 1 29 (1,40) Yacate(T) — Wacate(T2) — a(T) = YoalT))
14,15 1 1,3,5,6,.7 9 wi —°GS — py! (i=NTYP-13)
14,15 1 24,89 Xute(Mi) — XG)

 

 

The underlined symbols are the measured values. All other symbols are either independent variables,
given in file xxxx.dat as specified by Table 7.2, or calculated from the current set of adjustable
Coefficients. The subscript “calc” indicates the result of a Newton-Raphson calculation of a two-
or three-phase equilibrium. Va denotes vacancies.

===========
212

 

Optimization tools

Table 7.2. A summary of binary experimental values used in the file xxxx.dat

 

 

 

 

  

 

TYP W DW T DT TY DTT X(1) X(2) X(3) X(4) X(5) X@) n
Tl op, Am T AT - - ox Ax 1
12 @ Mw T ar - - ox AX ox AR - 2
21 pw Am T AT - - ox Ax 1
22 @ Am T ar - - ox AX ox AR - 2
3.1 H AH T AT - - x Ax’ 1
3.2 H AH T AT - - oy Ax (v=x") 1
33 H AH T AT - - om” Am" x" x” Ax” 2
42 H AH T AT T, AAT x Ax (v=x") 1
43 H AH T AT T, AAT mm” Am” x" x” Ax” 2
44 H AH T AT T, AAT m” Am m™ x xh xm 2
53 H AH T AT T, AAT x Axo xh x” (=x) 2
54 H AH T AT T; AAT x8 Axo we xt x ym 2
62 - - T ar - - x Ax 2
62 - - 7 ar - - oy Ax 2
63 - - far - - x - 3
72 m Am T Ar - - x8 Ax? 2
82 - - ar - - xy Ax 2
83 - - far - - x - 2
91 AS oT ar - - x Ax 1
92 AS oT ar - - xy Ax 1
93 AS oT ar - =m” Am” 2
10 2 AS oT AT T AAT x Ax 1
10 3 AS oT AT T; AAT mm” Am" 2
13S AS T AT T, AAT mm” Am” 2
123 H AH T AT T, AAT m” Am” 2
13-1 yy. Avy T AT (fT, AAT) x Ax 1
1441 p, Aw, T AT - - x Ax’ 1
15 1 py, Ap T AT - - x Ax 1

 

 

The measured quantities are underlined. The other values are independent variables or used as
starting values of a Newton-Raphson calculation.

H+AH, w+ Ap =value in J mol! of atoms

T AT, T, = temperatures (K)

AAT =accuracy of T—T,

mole fraction of phase ITU(1)

verall mole fraction

m’ + Am’ =amount of phase ITU(1) in moles of atoms per total amount
-=value is not used

TYP =two integers, NTYP and NPHA

n=number of lines used in file xxxx.dat for this value

  

Compiling experimental values using the program BINDAT

The file xxxx.dat can, in principle, be written as an ASCII file by any text editor. Usually
several calculations are necessary in order to get the values for the variables in the file
from the data reported in a publication, such as transformations from mass fractions to

===========
7.2 How to use BINGSS 213

mole fractions or changing units to SI units. To facilitate this, a program called BINDAT
was written.

This program is constructed so that one need enter only once data that usually are
equal throughout a set of measured values, thus minimizing the input for a single value
to the few numbers characteristic for this value. Values that are equal only for a subseries
may be prompted intermediately. Because of the manifold different ways to report data
of the same kind, this idea may turn out not to be used 100% consequently. At each level
of (sub)series a condition is prompted, by which the program switches to the previous
level. This condition is an input that is impossible for the variables prompted, namely
a “phase number” zero, a “mole fraction” outside the range 0-1, or a “temperature”
below 0K.

For the accuracies of the measurements a standard estimation procedure is used. The
estimated accuracy of each value is additively composed of a part proportional to the
value and of a constant part, v = v+ Av, with Av = v- DWP + DWA. The constant part
reflects the minimum quantity detectable by the method applied and the proportional
part reflects the usual trend that the inaccuracy of large measured quantities increases
proportionally to the quantity itself. The factor of proportionality as well as the constant
part are given once for a series of measurements. The accuracy of mole fractions is
estimated similarly. Since a mole fraction near unity corresponds to a small mole fraction,
the proportional part is taken as a fraction of (1 —x)-x rather than as a fraction of the
mole fraction x itself. Since the maximum of (1 — x) -x is 1/4 in this context, this fraction
is multiplied by 4 in order to make the maximum estimated inaccuracy equal to the factor
plus the constant value given by x = x+ Ax with Ax = x-(1—x)-DXP+ DXA. For the
accuracy of the temperature only a constant value AT = DT is estimated. For the variables
DWP, DWA, DT, DXP, and DXA default values of 0.05, 0.0, 5.0, 0.004, and 0.001 are
proposed. It is necessary to estimate these accuracies to be equal for experimental data of
similar quality, even if the accuracies given in the papers are different. If all the values
of the inaccuracies were changed by the same factor, this would not change the result
of the least-squares calculation, since it is just equivalent to a change of meaning of the
inaccuracies, for example from a mean error to a limit of the 99% confidence range.

Since equivalent values may be reported differently in the literature, besides the
variables NTYP and NPHA a third variable ISELEC is used to select the proper type for a
series of measured values. For each series a two-character label is requested. This label
in BINGSS is used to change the weighting by multiplying it by a dimensionless factor
(including zero for omitting this series). In BINFKT the label is used to select different
symbols for plotting the measured points. Therefore, if data of the same kind and the
same origin might need to be distinguished later, they should be compiled as different
series with different labels.

During the interactive input to BINDAT all the data input is collected into a file
called yyyy.out. This file may be renamed to yyyy.bin and BINDAT can be executed
again, using this file as input rather than interactive input. Typing errors may be corrected
and new values added to yyyy.bin by a text editor. The formatted experimental data
file appears as file yyyy.app. Several of these files with different names “yyyy” may be
merged by a text editor to give a single file “xxxx.dat.”

===========
214

7.2.3.2

Optimization tools

An example of running BINDAT

Starting BINDAT gives the following messages on the screen (the first two questions are
answered by “0” and “MgY”, respectively):

 

Give: from terminal (0)
from file 01="sys".bin (1)

 

Give: 2 element names
(2 characters each without blank between and before)
MgY

 

Give: LABEL, NTYP, NPHA, ISELEC

 

NTYP = 0: Stop =

LABEL: 2 characters without blank before

NTYP=lor2, NPHA=lor2, ISELEC=1: my (emf, RTlna,..)
lor2 lor2 2: my asA+BT+CT1nT
lor2 lor2 3: vapor pressure by dew point
lor2 lor2 4or 5: like 1...2, but excess my
lor2 lor2 6: activity
NTYP = 3, NPHA = 1, ISELEC = 1: H(mix) or H(form)
NTYP=3o0r4, NPHA=2, ISELEC = 1: Delta-H of two phases
4 2 2: Cp-values
NTYP = 3,4 0r12,NPHA=3o0r4, ISELEC = 1: Enthalpies of mixing
(series)
3 3 2: partial enthalpies
3 3o0r4 3: Series, reported as H(mix)
NTYP=6o0r8, NPHA=2or3, ISELEC=1: phase diagram
6or8 1 1: for plot by BINFKT only
LABEL Comment

  

0 000

This is a short list of all the types of experiment implemented in BINDAT and their
usual descriptions in the literature.

The most effective way of running BINDAT is to give interactively some few values
and interrupt the program as done here by giving four items “0 0 0 0” with 0 for NTYP.
BINDAT creates a file MgY.out, which can be used as a template for adding more input
data by a text editor. The file is then renamed MgY.bin. Starting BINDAT again and
answering the first two questions by “1” and “MgY” compiles the data. The file MgY.out
contains at the end of each line, after the relevant numbers, the names of the data given
in that line.

===========
7.2 How to use BINGSS 215

Part of the file MgY.bin is listed here containing two series of calorimetric measure-
ments, for which cold samples (298 K) were thrown into a calorimetric bath at T = 955
or 974 K containing initially Y1 moles of Mg and Y2 moles of Y. Each sample contained
Y3 moles of pure Y (X3 = 1, ITU(3) = 3), the measured heat effects were HM J. (ITU(3)
= 3 is defined by the file MgY.coe to be the phase hcp_A3.) This type of measurements
is explained in Fig. 4.2.

MgY Element names
$ FA [95Aga] R. Agarwal, H. Feufel, F. Sommer, J. Alloys Comp. 217
$ (1995) 59-64
FA 12 3 1 LABEL,NTYP,NPHA, ISELEC
1 2 1 1ICONC,IELEM, ITEMP, IVAL

-050000 -00 5.00 .004000 .001000 DWP,DWA,DT,DXP,DXA

2 2 955.00 298.00 5.00 ITU(1),ITU(2),T,TT,DTT
+240880 -000000 yY1, Y2
-003580 -123.3000 1.000000 3 Y¥3,HM,X3,ITU(3)
-003930 -115.4000 1.000000 3 Y¥3,HM,X3,ITU(3)
005200 -141.3000 1.000000 3 Y¥3,HM,X3,ITU(3)
005200 -118.6000 1.000000 3 Y¥3,HM,X3,ITU(3)
-006270 -112.5000 1.000000 3 Y¥3,HM,X3,ITU(3)
005660 -42.8000 1.000000 3 Y3,HM,X3,ITU(3)
-007330 35.8000 1.000000 3 Y3,HM,X3,ITU(3)

0.0. 0. 0 new series

-1.-1. new phases, newtemp.

2 2 974.00 298.00 5.00 ITU(1),ITU(2),T,TT,DTT
+ 142330 .000000 Yl, Y2
-001260 -65.0000 1.000000 3 Y3,HM,X3,ITU(3)
001490 -48.4000 1.000000 3 Y3,HM,X3,ITU(3)
001150 -48.1000 1.000000 3 Y3,HM,X3,ITU(3)
001610 -63.6000 1.000000 3 Y3,HM,X3,ITU(3)
001990 -19.7000 1.000000 3 Y3,HM,X3,ITU(3)
001910 -54.1000 1.000000 3 Y3,HM,X3,ITU(3)
001920 -47.7000 1.000000 3 Y3,HM,X3,ITU(3)
001940 -44.1000 1.000000 3 Y3,HM,X3,ITU(3)
-001870 -30.4000 1.000000 3 Y3,HM,X3,ITU(3)

0. 0.0. 0 newseries

-1.-1. new phases, new temp.

000.0. 0. new LABEL, NTYP, NPHA

0000 End of input, stop

Now running BINDAT, giving the two answers “1” and “MgY,” results in

Give: from terminal (0)
from file 01 = "sys".bin (1)

===========
216 Optimization tools

1
Please give file (+ path) name (without apostrophes)
MgY

16 values

Sixteen experimental items were created and compiled into a newly created file,
MgyY.app, listed here:

$ FA [95Aga] R. Agarwal, H. Feufel, F. Sommer, J. Alloys Comp. 217
$ (1995) 59-64
FA 2 2 3 012 3 -504.38 25.22 95500 500 29800 500 1464452 123088
0 100000100000000 100000
FA 2 2 3 012 3 -464.59 23.23 95500 500 29800 500 1582189 124914
1464452 123088100000000 100000
FA 2 2 3 012 3 -557.20 27.86 95500 500 29800 500 2050554 132136
3023471  146913100000000 100000
FA 2 2 3 012 3 -458.29 22.91 95500 500 29800 500 2009351 131504
5012027 176173100000000 100000
FA 2 2 3 012 3 -424.43 21.22 95500 500 29800 500 2365502 136953
6920669  203067100000000 100000
FA 2 2 3 012 3 -158.10 7.90 95500 500 29800 500 2090721 132752
9122463  232644100000000 100000
FA 2 23.012 3 128.75 6.44 95500 500 29800 500 2636217 141068
11022459  256920100000000 +~—-100000
FA 2 2 3 012 3 -452.68 22.63 97400 500 29800 500 877498 113917
0 100000100000000 100000
FA 2 2 3 012 3 -333.61 16.68 97400 500 29800 500 1027020 116264
877498  113917100000000 100000
FA 2 2 3 012 3 -328.93 16.45 97400 500 29800 500 786432 112484
1895506 | 129753100000000 100000
FA 2 2 3 012 3 -430.19 21.51 97400 500 29800 500 1089015 117234
2667031  141534100000000 100000
FA 2 2 3 012 3 -131.48 6.57 97400 500 29800 500 1328172 120969
3727002 157410100000000 100000
FA 2 2 3 012 3 -356.53 17.83 97400 500 29800 500 1258732 119886
5005673 | 176082100000000 100000
FA 2 2 3 012 3 -310.43 15.52 97400 500 29800 500 1249512 119742
6201397 193069100000000 100000
FA 2 2 3 012 3 -283.42 14.17 97400 500 29800 500 1246787 119700
7373422  209276100000000 100000
FA 2 2 3 012 3 -193.05 9.65 97400 500 29800 500 1187528 118775
8528278 224815100000000 100000
00000000000000000000000000000000000000000000000000000000000000000000000

Each measurement is represented by two lines, which, by the FORTRAN format
specification,

FORMAT (A2,612,F9.1,F7.1,2(F7.2,F5.2),8P,2F9.0/T2,8P,4F9.0)

are related to the variables given in Table 7.2. A list giving these variables in a more-
readable form can be created by BINGSS by specifying the variable LAUF = 3.

===========
7.24

7.2 How to use BINGSS 217

Running BINGSS

BINGSS is open-source code; it is available from the website of this book. There BINGSS
can be used and tested following the instructions on line.

If the files xxxx.coe and xxxx.dat are ready, BINGSS can be run interactively by
following the prompt commands. The first standard answers on these prompt commands
preferably are given by a file xxxx.bgl looking like

100
1329101.000E-11 1.000E+00
osv
9321001.000E-11 1.000E+07

The first integer in the first line is non-zero and specifies that the file xxxx.bgl exists.
The two following integers, 0 0, specify that files xxxx.coe and xxxx.dat are to be
formatted. Non-zero integers specify free-format input from the corresponding file.

The second line contains six integers named LAUF, IVERS, IALGOR, NMAX,
NOTAUT, and NOTPHA, and two real numbers, EPS and PMARQ.

e LAUF determines the amount of output given in file output.Ist: “1” gives the minimal
output, the mean square of error after each complete run of the optimization algorithm;
“7” allows one to copy the current set of coefficients into the file “store.coe”; and
“9” switches to interactive input.

e IVERS defines the use of the “alternate mode” (section 7.1.1): “1” selects only
alternate mode (data for which no alternate mode is defined are skipped); “2” selects
normal mode for all values; and “3” is like “1,” but values without definition of
alternate mode are kept and used in normal mode. Other integers define a mixture
of alternate and normal mode, which sometimes is useful in intermediate steps. The
corresponding equations of error are given in Table 7.1.

e  IALGOR selects between Gauss (1) and Marquardt (2) algorithms. Usually the
Marquardt algorithm is selected.

e NMAX gives the number of complete runs of the optimization algorithm before the
next prompt asks for continuation.

e NOTAUT gives the number of different “labels” for which the weighting defined by
Eq. (2.60) is multiplied by a dimensionless factor.

e NOTPHA: to improve convergence, some phases may be suspended during the first
optimization steps, this integer declares how many.

e EPS is a convergence criterion. If the corrections of all coefficients are smaller than
the absolute value of the coefficient times EPS, the calculation is defined to have
“converged” and stops.

¢ PMARQ is the Marquardt parameter (see section 2.4.3). It is decreased by a factor
of 10 after each successful step and increased by a factor of 10 after each diverging
step.

The following line is formatted. It contains NOTAUT groups of a four-digit integer
(0 to 9999) and a two-character label. The weighting of the values in xxxx.dat marked

===========
218

7.2.5

7.2.6

Optimization tools

by this label is multiplied by this integer taken as percent. There may be eight such
groups in the line, up to three lines. If NOTPHA is not zero, there follows a line defining
the phases to be suspended by three-digit integers (numbers defined by the sequence of
phase descriptions in xxxx.coe).

In the above example the following line gives LAUF = 9 and thus switches to interactive
input.

Plotting of diagrams for comparison with
experimental data

The result of an optimization must be checked by comparing all experimental data with
the corresponding values calculated using the optimized dataset. This is usually done by
plotting diagrams.

For this purpose the program BINFKT is provided in the BINGSS package. It enables
one to calculate tables and to produce plots of molar functions of state of single phases
versus temperature or mole fraction, of invariant equilibria (three-phase equilibria or
azeotropic points of two-phase equilibria), or of two-phase equilibria between two selected
temperatures. “Mapping” of phase diagrams is not provided. All equilibria are calcu-
lated between specified phases irrespective of whether they are the most stable ones.
This allows plotting of metastable two-phase equilibria. BINFKT also enables one to
introduce experimental data compiled in the file xxxx.dat into various types of suitable
diagrams.

To check the stability ranges by use of BINFKT, the calculation of T versus jz; plots
is recommended (two-phase equilibrium chemical potentials

BINFKT uses the same files as BINGSS, namely xxxx.coe and xxxx.dat, as well as an
extra file called xxxx.bfl defining all the tables and curves to be calculated. This file may
be created by running BINFKT interactively, but usually it is easier to take an existing
such file as template and create xxxx.bfl by use of a text editor.

  

Some differences from PARROT

BINGSS cannot be used for ternary or higher-order systems.

BINGSS has some restrictions regarding the usage of less-common models.
BINGSS has built-in equations of error for most types of experimental data.
BINGSS can start an optimization with all parameters set to ZERO without any extra
preparation of the experimental data used (start with IVERS = 1). If only models
in which the number of independent site fractions does not exceed the number of
independent mole fractions are selected, this guarantees convergence in very few
steps. This procedure creates a set of starting values that will usually give the final
optimization in a few steps.

5. BINGSS outputs a complete list of final errors (differences between calculated and
measured values) on request (LAUF = 4).

Pey»e

===========
7.3

7.3.1

7.3 The PARROT module of Thermo-Calc 219

The PARROT module of Thermo-Calc

With the program PARROT, which is part of the Thermo-Calc software system, one can
fit thermodynamic model parameters to all kinds of experimental information that can
be measured at an equilibrium, stable or metastable. Any kind of model parameter can be
optimized, including magnetic and pressure-dependent parameters, in all models that have
been implemented in the Gibbs Energy System (GES), which is also a part of Thermo-
Calc. A special version of PARROT, not described here, can also optimize mobilities and
activation energies for diffusion.

PARROT is not limited to binary systems but can handle experimental information
for systems with up to twenty components. In practice systems with more than five
components have never been used in an assessment and in most of those cases binary and
ternary parameters only were adjusted or added to fit the multicomponent information.

PARROT is a fully interactive program. It is possible to give all information about the
system to be assessed directly from the keyboard to the program, but it is recommended
that the user start by creating a number of text files for data and commands, of which
the most important are the setup file and the experimental data file. PARROT has a main
module for manipulating the optimizing conditions and a special EDIT-EXPERIMENT
module for manipulating each individual experimental equilibrium.

This chapter does not replace the user’s guide, which is available together with the
software, but it contains practical advice based on experience and will convey the flavor
of the system. The user must be aware of the fact that it is his own judgment that is
critical. The software is only a tool for trying out various options of model selection
and weighting of experimental data. It requires a user with a good understanding of
thermodynamics and phase diagrams and some experience of modeling.

The optimization method

For equilibria for which all independent state variables are determined with negligible
inaccuracies, the criteria for the best fit, derived from the maximum-likelihood principle,
will be minimum in the sum of squares of weighted residuals. Inaccuracies in experimental
conditions can be taken into account in two ways in PARROT.

1. The inaccuracies in conditions, i.e., independent state variables, can be prescribed
in the POLY-3 interface. In this case an equilibrium will be calculated with the
experimental values of independent state variables. The standard deviations of the
dependent state variables will be calculated by use of the error-propagation law,
presuming linear dependences of the dependent state variables on the independent
state variables.

2. The “true” value of the condition can be optimized by using one of the defined
variables as the condition. This can be obtained by the IMPORT command in the
experimental data file. In this case the experimental observations of the independent
state variable should be specified in the EXPERIMENT command in the experimental

 

===========
220

7.3.2

Optimization tools

data file. The commands that can be used in the experimental data file are a subset
of the commands available in the POLY-3 module, with a few extensions.

Both methods can be transformed to the problem of finding the minimum of the sum
of squares. Method 2 can be used when several experiments have been performed under
the same, badly determined, conditions. The two methods can be mixed in the same
optimization run.

The set of adjustable coefficients, in PARROT called variables, that give a minimum
of the sum of squares is found by a numerical subroutine called VAOSA from the Harwell
Subroutine Library.

The use of PARROT

The assessor should prepare a number of files that will be used during the assessment.
These will be briefly described here. They are

POP file with experimental data,

SETUP file with models and known and unknown parameters,
EXP file with experimental data to be plotted, and

MACRO files for quick calculation of various diagrams.

These files will be described below in more detail. A simple description of the flow
of the assessment work would be as follows.

1. Prepare the SETUP and POP and EXP files with a text editor (not a word processor!).

2. Start PARROT and run the SETUP file once to create the work file, usually called
the PAR file since its extension is “.PAR.” The PAR file is machine-dependent and
cannot be read by a text editor. It can be manipulated only through the PARROT
module. The PAR file will always contain the last results and is automatically
updated whenever it is used in PARROT. Whenever a user wants to “freeze”
a reasonable set of model parameters but perhaps continue trying to change the
weightings or set of model parameters, it is advisable to make a copy of the PAR
file.

3. COMPILE the POP file inside the PARROT module. The experimental data will

be stored on the PAR file.

Select which variables to optimize.

SET-ALTERNATE-MODE ON and optimize all equilibria until they have con-

verged.

RESCALE the variables to set the start values to the final values.

Optimize and rescale until no more changes occur.

SET-ALTERNATE-MODE OFF.

Calculate diagrams and compare the results with experimental data. This should

be done whenever needed during the steps below also. The sum of errors is not a

sufficient measure of the overall fit. You may find it convenient to make MACRO

files to calculate several diagrams.

ws

eo enn

===========
7.3.3

7.3 The PARROT module of Thermo-Calc 221

10. Use the EDIT-EXPERIMENT module to COMPUTE-ALL equilibria. Some equi-
libria might not converge or may converge to results far away from the experimental
data. Some hints on how to handle that are given below. Experimental data that
cannot be calculated should have SET-WEIGHT zero. SAVE when finished with
the EDIT module.

11. Optimize the variables zero times and check the errors carefully, using the LIST-
RESULT command. This output gives an overview of the current fit to all experi-
mental data. You may have to use the EDIT module again to correct or remove
(SET-WEIGHT zero) some equilibria.

12. Optimize and rescale the variables until the calculation has converged. You may
find that some variable becomes very large or very small. That may be due to a lack
of experimental information. You may have to increase or decrease the number of
optimized variables and also use the EDIT module to select the weightings of the
various experimental equilibria until you get reasonable results.

13. You may have to optimize “in parts,” keeping the variables for some phases fixed
and optimizing others with respect to selected sets of experimental data. The selec-
tions of experiments are made in the EDIT module.

14. You may have to iterate several times through all points above, even editing the
POP and SETUP files, before you are satisfied. You may try various models for
the phases and various numbers of variables for each phase.

15. A final optimization with all variables and all experiments with their selected
weightings should be carried out.

16. Write the report. When you do this, you may find that you cannot explain some
decisions made during the optimization; and you may have to go back to optimize
and try various new options.

The experimental data file, the POP file

The experimental data on a system, taken from the literature or measured by the assessor,
should be written onto a file called a “POP” file (because the default extension is .POP).
The experimental equilibria and measurements are described with POLY commands, with
some additional features. The commands that are legal in a POP file are described in a
special section of the POLY manual. It is very important to understand the state-flexible
variable notation used in POLY and PARROT.

The POP file is a very important form of documentation because it describes the
known experimental data for a system. The POP file is intended to be self-documenting
and readable both to a human and to the computer. The experimental data are described
independently of the models selected for the phases. It is thus possible to use the same
POP file to assess a system using different models for the phases. It is not uncommon that
a system must be reassessed some years later when new information is available, or if a
model for a phase should be changed. Since the reassessment may be done by someone
other than the person who created the POP file, it is important that the information in the
POP file is well organized and documented.

===========
222

7.33.1

Optimization tools

The recommended way to specify an experimental equilibrium is to document as
closely as possible the actual experimental conditions. Usually the set of stable phases is
known and also the temperature, pressure, and some or all compositions. We will now
describe how to enter some typical experimental data.

Single-phase experiments

Experiments with a single stable phase most often concern enthalpies of mixing or
chemical potentials. As an example, the following describes an experiment on the Au-Cu
system:

CREATE-NEW-EQUILIBRIUM 1 1

CHANGE-STATUS LIQUID=FIX 1

SET-CONDITION T=1379 P=1E5 X(LIQUID,AU)=0.0563
SET-REFERENCE-STATE AU LIQ * 1E5

SET-REFERENCE-STATE CU LIQ * 1E5

COMMENT Measurement by Kopor and Teppa, Met, Ann. Phys. 1927 p 123
LABEL ALH

EXPERIMENT HMR=-1520:200

GRAPHICS 5 1379 -15201

The first five commands in this example are standard POLY commands described
in the user’s guide, but the first command, CREATE, is rarely used in POLY and may
deserve some comments. Each experimental equilibrium must start with the CREATE
command and the first integer given after the command is a unique identifier that is later
used interactively to set weightings, for example. The second integer is an initialization
code; 0 means that all components and phases are initially suspended, 1 means that all
components are entered but all phases suspended, and 2 means that all components and
phases are entered initially.

The last four commands, COMMENT, LABEL, EXPERIMENT, and GRAPHICS are
available only for the POP file and in the EDIT-EXPERIMENT module. EXPERIMENT
specifies the quantity to be fitted by the optimization. The syntax of this command is
similar to that of the command SET-CONDITION. It is followed by a state variable or a
function name and a value and an uncertainty. The EXPERIMENT command is described
in detail in the section of the POLY command manual about the EDIT-EXPERIMENT
module.

The command COMMENT is followed by a text that will be saved in the work file
of the optimization. One may also give comments after a dollar sign, “$”, but these
comments are lost when the experimental data file is compiled; see section 7.3.7.1.

The command LABEL provides a way to specify a set of equilibria that the user wants
to treat as one entity when setting weightings. A label can have at most four characters
and must start with the letter A.

The command GRAPHICS can be used to create automatically an experimental data
file, the EXP file, when the POP file is compiled. This is a new feature from version
P of Thermo-Calc. Read the documentation in the Thermo-Cale manual to understand

===========
 

7.3.3.3

7.3 The PARROT module of Thermo-Calc 223

this file format. The first integer after the command is the dataset number; the next two
numbers are the horizontal and vertical coordinates, respectively. The final integer is the
symbol to plot.

Two-phase experiments

Most experimental information, for example from the phase diagram, involves two or
more phases. For example, the melting temperature of an Au—Cu alloy can be described
as follows:

CREATE-NEW-EQUILIBRIUM 1 1

CHANGE-STATUS PHASE FCC=FIX 1
CHANGE-STATUS PHASE LIQUID=FIX 0
SET-CONDITION X(FCC,CU)=0.14 P=1E5
EXPERIMENT T=970:2

COMMENT H E Bens, J Inst of Metals 1962 p 123
LABEL ALS

GRAPHICS 1 0.14 970 2
SET-ALTERNATE-CONDITION X(LIQUID,CU)=0.16

All commands except the last have been described above. The last command specifies
an estimated value of the liquid composition at the equilibrium. This command is not
necessary except during the alternate-mode calculation described in section 7.3.7.3.

Note that the information in this case was the temperature. One could equally well
describe the same melting point with the temperature as condition and the composition as
experimental information because both are measured quantities. The selection of quantities
used as conditions should be based on the experimental technique. Those known with the
least accuracy should be used as experimental data.

Experiments on invariant equilibria

It is a peculiarity of PARROT that invariant equilibria are the most important experimental
information to be provided for an assessment. It is thus advisable to have all invariant
equilibria for a system on the POP file, even if some of them have not been measured
explicitly. A reasonable estimate from the available experimental data can often be
sufficient, but one should be careful using phase diagrams drawn when there is little
data to limit the imagination of the artist. At the end of the assessment such estimated
equilibria should be excluded, but they are very useful for obtaining a set of initial values
for the model parameters.
An example of a three-phase equilibrium in a binary system follows:

CREATE-NEW-EQUILIBRIUM 1 1
CHANGE-STATUS PHASE FCC BCC LIQUID=FIX 1
SET-COND P=1E5

EXPERIMENT T=912:5

===========
224

7.3.34

Optimization tools

SET-ALTERNATE-CONDITION X(FCC,B)=0.1 X(BCC,B)=0.4 X(LIQ,B)=0.2
LABEL AINV

COMMENT Estimated compositions

GRAPHICS 1 0.19123

GRAPHICS 1 0.2 9123

GRAPHICS 1 0.4 9123

The alternate conditions are needed only for alternate-mode calculations. Another
example of an invariant equilibrium is a congruent transformation when the composition
of both phases is the same (but may be unknown):

CREATE-NEW-EQUILIBRIUM 1 1
CHANGE-STATUS PHASE BCC LIQUID=FIX 1
SET-COND P=1E5 X(BCC,B)-X(LIQ,B)=0
EXPERIMENT T=1213:10
SET-ALTERNATE-CONDITION X(B)=0.52
LABEL AINV

COMMENT Estimated compositions
GRAPHICS 1 0.52 1213 2

With some experience from phase-diagram evaluation, it is possible to estimate
metastable invariant equilibria. In particular, such estimated metastable equilibria are
useful to reduce the number of phases to be assessed simultaneously. One may, for
example, assume that a certain intermediate phase does not form and extrapolate the
liquidus curves below the stable three-phase equilibrium and estimate temperatures and
compositions of metastable three-phase equilibria between two other phases and the
liquid.

Another useful technique is to extrapolate a liquidus line from a peritectic equilibrium
to estimate the congruent melting temperature of the compound that melts peritectically.

Ternary and higher-order experiments

PARROT can handle optimization of ternary or higher-order information in the same
way as binary. The only thing to note is that one more condition is needed for each
component added. In practice quaternary and higher-order information is used mainly to
optimize binary or ternary parameters. In ternary systems it may be more important to
use the feature that one may have uncertainties also on conditions. A tie-line in a binary
system is determined if the two phases, the temperature, and the pressure are known
and the composition of one of the phases has been measured. For a tie-line in a ternary
system, one must have measured at least two compositions, which often have the same
uncertainty. One may then assign an uncertainty to the composition selected as condition.
For example,

 

CREATE-NEW-EQUILIBRIUM 1 1
CHANGE-STATUS FCC BCC=FIX 1
SET-CONDITION T=1273 P=1E5 X(FCC,B)=0.1:0.02

===========
7.3.3.5

 

7.3 The PARROT module of Thermo-Calc 225

EXPERIMENT X(FCC,C)=0.12:.02

LABEL AFB

SET-ALTERNATE-COND X(BCC,B)=0.17 X(BCC,C)=0.07
GRAPHICS 10.10.12 2

GRAPHICS 1 0.17 0.073

The alternate conditions will be explained in section 7.3.7.3.

One problem with binary assessments is that the experimental information can often be
described almost equally well by very different sets of model parameters. It is often the
extrapolation of these assessments into ternary systems that gives decisive information
about which set of model parameters is the best. Sometimes information from several
ternary systems may be needed in order to decide on the best description of a binary
system.

Simultaneous use of binary and ternary experiments

PARROT allows simultaneous optimization of binary and ternary (and higher-order)
information. By using the CHANGE-STATUS COMPONENT command, one may have
experimental data from binary and ternary systems on the same POP file. Note that it is
not good technique to set the fraction of a third component to zero for binary experimental
information. The CHANGE-STATUS COMPONENT C=SUS is fragile, however, and
may need manual setting for it to work properly. An example of a binary three-phase
equilibrium in a ternary system is

CREATE-NEW-EQUILIBRIUM 1 0
CHANGE-STATUS COMPONENT A B = ENTERED
CHANGE-STATUS PHASE FCC BCC LIQ=FIX 1
SET-COND P=1E5

EXPERIMENT T=1177:10

LABEL AAB

COMMENT from A-B system

Note the use of initialization code 0 in the CREATE-NEW-EQUILIBRIUM command.
This means that all components must be entered.

Experimental data given as inequalities

For some experimental data one does not know the actual value, just that it must be
lower or higher than a certain value. It is possible to use such information in the POP
file by using “>” or “<” instead of the equals sign in EXPERIMENT. The number after
the colon in a factor for the “penalty function” specifies how big the error should be if
the value is on the wrong side of the inequality. The smaller the number the quicker the
error will rise. The inequality experiment is useful, for example, when a phase appears
where it should not be stable, see section 7.3.7.9, but also in other cases, for example
when a temperature or composition is not known, but it is known that it should be below
or above a certain value.

===========
226

7.34

7.3.5

7.35.1

Optimization tools

The graphical experimental file

For plotting calculated diagrams together with experimental data, it is recommended that
the experimental data be written into the POP file so that they can be used to create a file
according to the “dataplot” format automatically. This can be done with the GRAPHICS
command shown above. The graphical format is described in the Thermo-Cale manual.
The default extension of a dataplot file is exp. More elaborate graphics can be edited
directly in this file by use of a text editor. The command looks like

GRAPHICS <dataset> <x-coordinate> <y-coordnate> <GOC>

Use different datasets for different types of data, i.e., phase diagrams, enthalpies,
activities, etc. Each dataset can be selected separately to be overlayed on the calculated
data in the post-processor with the APPEND-EXPERIMENTAL-DATA command. The
Graphical Operation Code (GOC) can be just a number representing the symbol plotted
at the coordinate or a D, meaning draw a line from the previous coordinate to this point
(which is useful to indicate tie-lines, for example). See the Thermo-Calc manual for more
examples.

The model setup file

The second step is to create a “setup” file with the names of the elements and phases,
the models for the phases, and all known information such as “lattice stabilities” and
Gibbs energies of formation. Most values for the pure elements can be found in the
collection amassed by the Scientific Group Thermodata Europe (SGTE) and published
by Alan Dinsdale (Dinsdale 1991) or from the SGTE website (http://www.sgte.org).
These parameters can also be extracted from the PURE database, which is distributed
free with Thermo-Calc. In the Gibbs-energy module there is a command LIST-DATA
with option P that can be used to create a template setup file after extracting the data
from the PURE database. This template must be edited and new phases and param-
eters must be added. The default extension of a setup file is .TCM; this is short for
“Thermo-Calc MACRO” file. At the end of the setup file, the work file is created
with the PARROT command CREATE-NEW-STORE-FILE. The work file cannot be
edited directly and it is hardware-dependent. The default extension of the work file
is PAR.

 

Models for phases

The literature with experimental data collected for the POP file usually contain information
useful for modeling the phases. If an assessment should be compatible with an existing
database, the models for most solution phases often have to be taken from the database.
For intermetallic phases it may be important to determine whether the phase has the same
structure as a phase in another system.

===========
7.3.5.2

7.3 The PARROT module of Thermo-Calc 227

 

In the chapter on methodology, chapter 6, the criteria for model selection are discuss'
in detail. In summary, one requires

physical soundness,

as few parameters as possible that must be optimized,
reasonable extrapolations of the model, and
consistency with previous assessments.

Model parameters

PARROT has 99 variables, also called coefficients or parameters in this book, for opti-
mization and can handle up to 1000 experimental measurements, but there are limits to
the simultaneous number of variables and experiments. At each optimization the program
will list these limits. The variables are called V1 to V99 and they are used when entering
functions and parameters to be optimized. For example,

ENTER-PARAM L(LIQUID,AU,CU;0) 298.15 V1+V2*T; 6000 N
ENTER-PARAM L(LIQUID,AU,CU;1) 298.15 V3+V4*T; 6000 N
ENTER-PARAM L(LIQUID,AU,CU;2) 298.15 V5+V6*T; 6000 N

makes it possible to use three RK parameters, each linearly temperature-dependent, to
describe the excess Gibbs energy for the liquid phase in the Au-Cu system. The variables
V1 to V6 can be optimized to describe the experimental information. In the setup file
one often introduces more variables than will be needed, since it is convenient to have
them in sequential order for each phase. In some cases the model requires that several
thermodynamic parameters are related, which can conveniently be handled by using the
same variables for several parameters. For example, the ordering parameters for a B2
ordered phase can be described by

ENTER-FUNCTION GAB 298.15 V10+V11*T+GHSERAA+GHSERBB; 6000 N
ENTER-PARAMETER G(B2,A:B) 298.15 GAB; 6000 N
ENTER-PARAMETER G(B2,B:A) 298.15 GAB; 6000 N

A stoichiometric compound with measured heat-capacity data may require several
variables to describe its temperature dependence, for example

ENTER-PARAMETER G(MG2SI,MG:SI) 298.15 V20+V21*T+V22*T*LN(T)+
V23*T** (-1)+V24*T**2+V25*T**3; 6000 N

It is possible to optimize all kinds of parameters in the Gibbs-energy systems that
can be described as functions of temperature and pressure. Examples of this are Curie
temperatures for magnetic transformations, molar volumes, and thermal expansivities,

ENTER-PARAMETER TC (SPINEL, FE+2:FE+3:0-2) 298.15 V50+V51*P; 6000 N

===========
228

7.3.6

7.3.7

73.71

Optimization tools

File names and relations

Since all files have different extensions, it is possible to use the same name for all files
for an assessment. Thus one may have aucu.POP, aucu.TCM, aucu.exp, and aucu.PAR.
In particular, the work file (PAR) may exist in several copies during the assessment; but
it is advisable to update the text files POP, TCM, and exp to reflect all changes made
interactively in the PAR file.

The text files, ie., the POP file, the TCM files, and the exp file, are important
documentation of the assessment. At the end these should be updated in such a way that
it is possible to run the setup file, compile the experiments, and optimize to get the final
result directly. This requires that the final weightings be entered into the POP file and the
final set of variables used as initial values. With such a set of files, it is easier to reassess

 

 

the system using new experimental data or new models.

Some care must also be taken with the work (PAR) file. This always contains the
last optimized set of variables and the weightings of the selected experimental data. The
work file contains a workspace for POLY and for GES. When a diagram is calculated
from the current work file, a POLY file is created. This POLY file will have a copy of
the current set of variables. If some further optimization is done and the user then by
accident tries to READ the old POLY file, he may destroy the new set of variables and
overwrite them with the old set. Thus one must never READ a POLY or GES file while
running PARROT, but one may, of course, SAVE new POLY or GES files, for example
when calculating diagrams from the current set of variables.

Interactive running of PARROT

With the three files POP, setup, and dataplot, the user can start running PARROT
interactively. This can be divided into some initial separate steps. Usually these steps
have to be repeated cyclically, modifying weightings, modifying models, adding new
information, etc. It is actually difficult to decide when an assessment is finished. Quite
often the deadline for the publication sets the limit for the work.

The commands on the setup file are executed by the MACRO command. There is
usually a number of error messages and the setup file must be corrected and re-run until
there are no errors. In the PARROT module one can list interactively the description
of the phases, the parameters’ expressions, and the values of the optimizing variables.
After a successful run of the setup file, this should be done to check that all models and
parameters have been entered correctly.

Compilation of experiments

The next step is to “compile” the experimental data file. The command to do this is
COMPILE. This compilation will usually also result in a number of error messages due
to syntax errors. The compilation normally stops when it detects an error and gives
an understandable message. These must be corrected and the file compiled again. It
is convenient to use several windows for this, one for editing and one for compiling.

===========
7.3.7.2

7.3.7.3

7.3.74

7.3 The PARROT module of Thermo-Calc 229

Sometimes an error message is less understandable and the error may have occurred some
lines before the program actually discovers it. Consultation with an expert is usually the
best way to correct these problems quickly, since it can be difficult to find the right place
to look in the manual. Since the setup file and the POP file are text files, they can easily
be E-mailed to experts anywhere in the world.

Global equilibrium calculations

The global equilibrium calculation is a new feature in Thermo-Calc version R. By default
it is turned off in PARROT and, when using POLY from PARROT, one must explicitly
turn it on if one wants to use it. Be very careful doing that, since the reason it is turned
off is that global equilibrium calculations may automatically create new composition sets
and that will destroy the experimental equilibria in the PAR file.

Setting alternate mode

When the experimental data file has been compiled correctly, the first really big problem
arises. This is that one must try to calculate the experimental information from the models
of the phases. Initially all model parameters are zero and in many cases it might not
be possible to calculate a measured value from the model unless the parameters have
some reasonable values. In PARROT the alternate mode makes it possible to calculate
most of the experimental equilibria even with zero values of the variables. The command
SET-ALTERNATE-MODE ON means that experimental equilibria involving two or
more phases are calculated with an approximate technique described in section 7.3.9
below. Some extra information may be needed in the alternate mode, as described in
section 7.3.9.2. The user may exclude some of the experimental information to be used
by setting weights in the EDIT module.

The OPTIMIZE command in PARROT is then used with the alternate mode until it
has converged. Several OPTIMIZE commands are usually needed and the user may have
to change the selection of experimental data. This is again done in the EDIT module. The
result of an optimization is obtained in a form readable by a human with the command
LIST-RESULT. The workfile is continuously updated and always contains the last set of
optimized variables and calculated results. Sometimes the user may want to save a copy
of the current workfile when trying various selections of experimental data or models.
This is done by making a copy of the workfile and giving the copy another name.

Plotting intermediate results

Reading the output from LIST-RESULT is usually not enough to understand how good
(or bad) a fit one has obtained. Since PARROT is part of Thermo-Cale, it is possible to use
POLY directly to calculate the phase diagram and other diagrams with thermodynamic
properties and plot them together with the experimental data from the dataplot file. It
is important to have MACRO files with the command sequences for such calculations
because this should be done frequently. Calculating and plotting the phase diagram may

===========
230

7.3.75

7.3.7.6

Optimization tools

give many surprising results when the variables to be optimized are far from their final
values! Also the fit to activities, chemical potentials, and enthalpy data can be checked
with MACRO files by comparing calculated values with the data on the EXP files.

Selection of experimental data

Initially it can be difficult to know which experimental data are good and which are
problematic; see section 6.1.2 for advice. It is also important to determine a reasonable
number of variables to be optimized; see section 6.3.

Optimization with the alternate mode using all data may give a set of initial values
for the variables that reproduces the main features of the system. If not, one may have to
exclude data and maybe phases; see section 7.3.10 for some hints.

When a first set of variables reproducing the main features of the system has been
obtained using the ALTERNATE mode, the user should SET-ALTERNATE OFF and
thenceforth calculate all equilibria using the normal mode. After turning off ALTERNATE
and entering the EDIT module, calculate all experiments with the COMPUTE-ALL
command. Several experimental equilibria may still fail to converge and the user may
have to provide initial values manually or even remove some equilibria (by setting the
weighting to zero). At a later stage in the optimization, when the optimizing variables are
closer to their final values, the user may be able to restore and calculate all experimental
equilibria.

When the selected set of equilibria can be calculated in the EDIT module, the user
should calculate all experiments once again in the PARROT module using the OPTIMIZE
command with only 0 iterations. The output from LIST-RESULT should be examined
carefully.

In this output the experimental information that is badly fitted will be marked with
an asterisk “*” in the rightmost column. It is not a problem that many experimental data
are badly fitted at this stage, but one should be careful with errors that the optimizer
may not be able to solve by itself. A typical case of such a problem is when a phase
undergoes congruent melting and there is experimental information on both sides of the
congruent transformation. If the composition of the phase is the experimental information,
it may happen that the calculated equilibrium is on the “wrong” side of the congruent
point and thus gives a large error. The user must correct such problems manually in
the EDIT module. A similar error may occur for miscibility gaps when the experi-
mental information is from one side and the calculation gives the composition of the
other side.

The listing of results

The LIST-RESULT command gives a list of the current set of optimizing variables and
their values and the fit to each selected experimental point. This may look like Table 7.3.

In the first section the variables are listed. The first column is the variable symbol as
used in the model parameters; one may use variables V1 to V99. The second column is the
current optimized value and the third column is the initial value of the variable. If they are

===========
7.3 The PARROT module of Thermo-Calc 231

Table 7.3 A variable and result listing produced by the LIST-RESULT command

 

 

VAR. VALUE START VALUE SCALING FACTOR REL.STAND.DEV
v1 -3.51671367E+04 -3.51671367E+04 -3.51671367E+04 1.78212695E-02
v2 4.53814089E+00 4.53814089E+00 4.53814089E+00 1.91804677E-01
v3 -5.56268264E+03 © -5.56101433E+03  -5.56101433E+03 2.54804276E-01
v4 -5.35543298E+00 -5.35382683E+00 -5.35382683E+00 2.90371977E-01
v20 -2.70811726E+04 -2.70811726E+04 -2.70811726E+04 1.06182097E-02
v22 -2.77312502E+03  -2.77312502E+03  -2.77312502E+03  9.25739632E-01
v23 -1.61636716E+01  -1.61636716E+01 -1.61636716E+01  1.98209960E-01
v32 -4.76078712E+04 -4.76078712E+04 -4.76078712E+04 1.63612167E-02
v33 3.58242251E+02 3.58242251E+02 3.58242251E+02 2.04819326E-03
v34 -6.92764170E+01

v35 -5.19246000E-04

v36 1.43502000E+05

v37 -5.65953000E-06

NUMBER OF OPTIMIZING VARIABLES : 9

ALL OTHER VARIABLES NOT LISTED ARE FIX WITH THE VALUE ZERO

‘THE SUM OF SQUARES HAS CHANGED FROM 2.95795193E+02 TO 2.95795094E+02
DEGREES OF FREEDOM 106. REDUCED SUM OF SQUARES 2.79051976E+00

16 MUR(MG)=-6368 -6988. 4.18E+02 -619.8 1.483

 

 

17 MUR(MG -4161. 3.03E+02 -109.3 -0.3606
18 MUR(MG -2268. 2.16E+02 48.39 0.2240
100 HMR=-3700 -3566. 6. 00E+02 134.4 0.2241
-6161. 6.00E+02 -550.8 -0.9179

-7852. 6. 00E+02 -1052. -1.754

316 T=1278 1273. 5.0 -5.370 1.074
317 T=1303 1306. 5.0 2.567 0.5134
370 X(LAVES_C15,MG)=0.313 0.3169 8.00E-03 3.8732E-03 0.4841
+346 0.3411 8.00E-03 -4.8968E-03 -0.6121

 

371 X(LAVES_C15,MG)

 

 

almost the same, the optimization may be almost finished. The scaling factor is usually
the same as the initial value and it is needed because the variables can be very different
in magnitude and, by dividing the values by the scaling factor, the variables’ values will,
at least initially, all be set to unity. The final column is the relative standard deviation
(RSD), which is an indication of the significance of the variable for the assessment. If the
RSD is larger than 0.5, it may be possible to set this variable to zero and still have about
the same reduced sum of squares (the last line of the second section in Table 7.3). It is
also important to know the number of significant digits in the RSD; see section 7.4.4.
Some of the variables have been kept constant during the last optimization.

After the list of variables, there follows some general information, the number of
variables last optimized, that all variables not listed are zero, and how much the sum of
squares was changed by the last optimization. The number of degrees of freedom here
means the number of experimental points minus the number of optimizing variables. The
reduced sum of squares is the sum of squares from the line above divided by the number
of degrees of freedom. If this is less than unity, it means that, on average, all experimental
data have been fitted to within their estimated uncertainties.

 

 

===========
232

73.7.7

Optimization tools

 

Calculated
5

 

 

 

6-4 2 0 2
10° Experimental

 

Figure 7.3 Calculated versus experimental values for all experiments from a LIST-RESULT
command. If all points are on the diagonal, one has a perfect fit. Since the experimental values
have a very wide range, one may have to magnify parts in order to see details. This kind of graph
gives a clear indication of whether some experimental datasets are inconsistent with each other.

Finally, there follows one line for each selected experimental point. Only a few are
listed. The first column in this list is the number assigned to the experiment with the
CREATE command. Then comes the experimental quantity and the measured value, like
MUR(MG) = —6368. The exact meaning of the experimental value is not self-evident
from the listing; one must use the EDIT module in order to see all the conditions. The
third column shows the calculated values for the current set of variables, the fourth
column shows the estimated uncertainties, divided by the weightings assigned, and the
fifth column presents the differences between the calculated and experimental values. The
final column gives the quotient relating the fifth column and the fourth column; if this is
less than unity, it means that one has fitted the experimental value to within the estimated
uncertainty. It is the sum of the values in this column squared that is minimized.

It is sometimes useful to plot the experimental data versus the calculated data and
there is a graphical option of the LIST-RESULT command that achieves this. Such an
output is shown in Fig. 7.3.

Critical sets of experimental data and of parameters

Following the advice in section 6.1.2, a weighting for each experiment that specifies its
importance relative to all the other experiments must be determined. The following points
should be taken into account when determining this set.

The reliability of the experimental technique.

The agreement between independent measurements of the same quantity.

The agreement between data obtained with different experimental methods.

One should use only experimentally determined properties, not quantities that have
been converted.

===========
73.7.8

7.3 The PARROT module of Thermo-Calc 233

One should be careful about the estimated accuracy of the experiments.

One must correct systematic errors (in the temperature scale, for example).

One should bring experience from previous sments to bear.

One should make use of “negative” information, for example that a phase should not
be stable within a certain composition or temperature region.

 

When a sensible weighting of the experimental data has been found, this is called the
“critical set.”

The assessor may at any time change the set of model parameters to be optimized. On
using more adjustable variables, the sum of errors usually decreases, but at the same time
the variables become less well determined. A measure of the significance of the variable
is given by the column RSD, which is listed for each variable optimized. The RSD is
important only at the end of an assessment. The meaning of the RSD is that the variable
can be changed by plus or minus this factor without changing the reduced sum of error
by more than one unit. A large RSD thus means that the variable is badly determined.
The RSD for all variables should be less than 0.5 in an acceptable assessment.

The value of the RSD is significant only when the user has run the optimization after
a RESCALE and it has converged almost immediately, when the “scaling factor” is the
same as the “value.” If there are variables with RSDs larger than unity, it means that too
many variables have been used. It is not necessarily the variable with the largest RSD
that should be removed, although that is quite likely.

The value of the RSD depends also on the weighting of the experiments. It may be
possible to reduce the RSD by changing the weightings.

If one has one or more variables with RSDs larger than unity, one should try to
remove one or more optimizing variables by setting them to zero, or to some value that
can be determined from other information, for example by semi-empirical estimation
methods.

Optimize and continue to optimize

Using the critical set of experiments, which may be modified now and again, and trying
various numbers of model parameters to be optimized, the user must use his skills to
get the best possible result. The smaller the sum of errors the better and, by giving the
command OPTIMIZE, CONTINUE, RESCALE, and OPTIMIZE again, the user may
finally reach a point at which PARROT states that it cannot improve the set of optimizing
variables. This should not be trusted, however, so a few more OPTIMIZE runs should be
done. If PARROT converges with the same number of iterations as there are variables to
optimize, one has to accept this set.

A problem with using OPTIMIZE several times to make the optimization converge
is that sometimes a variable may suddenly start to change by several orders of mag-
nitude. This behavior may lead to impossible values of variables and requires careful
reconsideration of the weighting of the critical set of experimental data and of the model
parameters that are being optimized. There is a reasonable range to which the values of
variables should be restricted. Finding interaction parameters of the order of 107 for the

===========
234

73.7.9

Optimization tools

temperature-independent part and 10? for the temperature dependence is a clear indication
of a bad weighting of the experimental data or the use of too many parameters.

If the user is still not satisfied with the overall fit, he has to change the weights or
add more information to force the optimization in the right direction. The success of such
manipulations depends on the skill of the assessor.

Wrong phases at wrong places

During the optimization it may happen that a phase appears at the wrong temperature or
composition in the phase diagram. Typically a phase may be stable only on one side of
the diagram, but on calculating the diagram using the optimized variables, it may appear
also on the other side. This can be handled most easily by the DGM state variable.

For example, if fec becomes stable at high Mg content in an assessment of the Ag—-Mg
system, one may modify an experimental equilibrium on the high-Mg side by adding
as experimental data the criterion that the driving force for fec should be negative. For
example,

CREATE-NEW-EQUILIBRIUM 900 1
CHANGE-STATUS PHASE HCP LIQ=FIX 1
SET-COND P=1E5 X(LIQ,AG)=0.12
EXPERIMENT T=900:10

LABEL AHL

can be modified by adding two lines as below:

CREATE-NEW-EQUILIBRIUM 900 1
CHANGE-STATUS PHASE HCP LIQ=FIX 1
CHANGE-STATUS PHASE FCC=DORMANT
SET-COND P=1E5 X(LIQ,AG)=0.12
EXPERIMENT T=900:10

EXPERIMENT DGM(FCC)<-.001:.001
LABEL AHL

 

The DGM experiment will give a contribution to the sum of errors if fee is stable
at this equilibrium and this will make the optimizer try to decrease the stability of fcc.
One should give a small negative number rather than zero, since fcc is stable also when
the driving force is zero. Thus fcc is set as dormant and will not affect the calculated
equilibrium, but the driving force for forming fcc will be calculated.

This type of error is common when phases are modeled for the whole composition
range but may be stable only on one side. If many RK coefficients, see section 5.6.2.1,
are used to describe the phase, then these may have unexpected and unwanted effects on
the other side.

The DGM experiment makes use of the feature in PARROT that one may specify a
limit rather than a fixed value as experimental data, as described in section 7.3.3.6.

One may use a similar method if a phase is not stable over the whole temperature
range within which it should exist. For example, when there are several intermediate

===========
7.3.7.10

 

7.3 The PARROT module of Thermo-Calc 235

phases in a system it may be difficult to make stable those that should be stable at room
temperature. One may then use fictitious experimental data with just the DGM experiment
to enforce the correct set of stable phases at room temperature. In many cases there are no
experimental data for the enthalpy of formation of an intermediate phase, so one should
be careful not to trust blindly hand-drawn extrapolations of stability lines.

Unwanted miscibility gaps

During an optimization it is possible that the model parameters for some phases create
unwanted miscibility gaps in the phase. A typical example is that the liquid sometimes
has a miscibility gap at high temperatures. It is possible to keep control of this by adding
some “experimental” data that should be outside the spinodal, see section 2.1.10, at a
certain temperature and composition like in this example:

CREATE-NEW-EQUILIBRIUM 910 1
CHANGE-STATUS PHASE LIQ=FIX 1
SET-COND T=4000 P=1E5 X(LIQ,AG)=0.4
EXPERIMENT QF (LIQUID)>1:.001

LABEL AQL

This equilibrium will calculate the single liquid at 4000 K and X(AG) = 0.4 and, if the
liquid is inside the spinodal, the value of QF(LIQUID) will be negative. Here it is required
that QF(LIQUID) be larger than unity in order to be on the safe side. QF is a “state
variable” in PARROT and POLY that has the value of the smallest eigenvalue of the
determinant of all second derivatives of the Gibbs energy with respect to all constituents.

One should be careful with added “experiments” like DGM and QF since they may
restrict the optimization severely. Toward the end of the optimization, when one should
be close to having found a global minimum, one should try to remove them.

Phases with order—disorder transitions

A model for a phase that can be ordered like the B2 and L1, phase will have several
sublattices with the same set of constituents; see section 5.8.4. For an experimental
equilibrium involving an ordered phase, the disordered state may become more stable than
the ordered any time during the optimization. To have control of the state of order in a
phase, one can add a function that calculates the difference between the site fractions and
returns an error if the state of order is wrong. For example, the congruent transformation
of Lly to Al in the Au—Cu system can be written

  

ENTER FUNCTION DL10=¥ (FCC#3, CU) -Y¥(FCC#3 ,CU#3) ;
ENTER FUNCTION DHTR=HMR (FCC) -HMR(FCC#3) ;
CREATE 320 1

CHANGE-STATUS PHASE FCC FCC#3=FIX 1
SET-CONDITION P=1 X(FCC,CU)-X(FCC#3,CU)=0
EXPERIMENT T=683:2

===========
236

7.3.7.12

7.3.8

Optimization tools

EXPERIMENT DHTR=4000:1000
EXPERIMENT X(CU)=.5:.01
EXPERIMENT DL10>0.1:0.001

The model for the ordered (and disordered) FCC phase is
(Au, Cu)o.25(Au, Cu)o.25(Au, Cu)ors(Au, Cu)oas

and the L1, ordering (indicated as FCC#3) has a high site fraction of Au on two sublattices
and a high site fraction of Cu on the other two. The disordered phase (indicated as FCC)
has all site fractions equal in all sublattices. The congruent transformation is specified by
giving as a condition the stipulation that the two phases should have the same composition.
As experimental data the temperature, enthalpy of transformation (FUNCTION DHTR),
and overall composition are used. Additionally, a function called DL10 is used to calculate
the difference between the site fractions of Cu on the first and third sublattices. If these
are equal, the phase is disordered, which is wrong, and the value will be zero, which will
give a large error in the EXPERIMENT DL10>0.1:0.001.

One should not use the “partition model,” see section 5.8.4.2, for ordering when assess-
ing a phase with an order—disorder transformation unless one has extensive information
both on the ordered and on the disordered phase throughout the whole composition range,
as in the Au-Cu system, for example. In other cases the partitioning will create problems
because there is an ambiguity regarding how much enthalpy should be in the disordered
state and how much in the ordered. The split can be made without any ambiguity when
the assessment is added to a database.

Some more hints

Many problems and errors may occur and it is not possible to give simple explanations of
how to handle them. The main recommendation is that one should exclude all experimental
data that give strange results but make sure that all important invariant equilibria are
reasonably calculated. If some invariant equilibria cannot be calculated, it may be better
to exclude the phases that are involved in these, if they are intermediate phases, and
just optimize the liquid and the most important solution phases in a first step with a
full equilibrium calculation. When reasonable results have been obtained with the most
important phases, the intermediate phases may be put back and optimized, keeping
the model parameters for the already-optimized liquid and solid phases fixed. Consult
section 7.3.10 for more hints, since it is impossible to give any more general advice at
this stage.

Changes made interactively that require recompilation

It is possible to change almost everything from the initial setup and POP file interactively.
For example, one may add more variables to be optimized, and modify, or add more,
experimental information, but there are some changes that will destroy the data structure
and thus require that the experimental data file be recompiled. An example of such a
change is adding more composition sets to a phase. This actually changes the number of

===========
7.3.9

7.3.9.1

7.3 The PARROT module of Thermo-Calc 237

phases, which will destroy the links between the experimental data and the thermodynamic
models. Thus the POP file must be recompiled and it is then important that the POP file
reflect the changes made interactively in the EDIT-EXPERIMENT module.

One practical problem with recompiling the POP file may also be that the experi-
mental equilibria will be calculated with the default initial values of all compositions.
In some systems the equilibria require manual input of initial values and recompilation
of the POP file may then require careful massaging of the experimental equilibria to
make them converge again. To simplify the recompilation, it is recommended that one
use the command AMEND-PHASE in the GES module to set the major constituents for
the phases, since these are used as the default initial values (see the GES user’s guide for
details). It is possible to provide initial values of the constitutions of the phases in the
POP file. It is possible to make a new POP file from the current PAR file by giving
the command MAKE-POP-FILE in the EDIT module. However, this file does not contain
the initial tables, etc.

 

The alternate mode

The information that PARROT uses to optimize the thermodynamic model parameters
represents measurements at equilibrium in the system. The measurements can be made
in a single-phase region, for example activities or enthalpies, in two-phase regions,
for example solubilities or transformation temperatures, or with more than two phases
involved. At each equilibrium, at least one quantity must have been measured in addition
to those necessary to determine the equilibrium state. For a binary system in a single-phase
region, one may have measured the temperaure, pressure, composition, and chemical
potential. Three of these quantities are necessary in order to specify the equilibrium
state and the fourth can be used as experimental information to model the phase. In a
two-phase region at given temperature and pressure, one may have determined the stable
phases and the composition of one or both phases. The temperature, pressure, and set of
phases are sufficient to determine the equilibrium and the compositions can then be used
as experimental data.

 

Common-tangent construction

It is easy to understand that it may be difficult to calculate an equilibrium between
two or more phases when the model parameters for the phases are badly determined.
The equilibrium calculation requires that one can find a “common tangent,” i.e., that
the chemical potentials for all components are the same in all phases. Such a common
tangent might not exist or may be at a completely wrong composition or temperature for
the initial set of model parameters; see section 7.1.1.

Instead of requiring that an equilibrium should be calculated between two or more
phases, PARROT supports an “alternate” technique to use such experimental information.
The alternate technique calculates the thermodynamic properties for each phase sepa-
rately and the program uses as “experimental information” the difference in chemical
potential for the components in each phase. The model parameters are then adjusted to

===========
238

7.3.9.2

Optimization tools

make the chemical potentials of all components the same. This is not a new technique;
it was possible to describe equilibria in this way in PARROT earlier, but it was cum-
bersome and difficult. In the BINGSS software the options IVERS=1 or IVERS=3 have
been available from the beginning, and these make use of the same technique as the
alternate mode to calculate chemical potentials for each phase separately rather than the
full equilibrium.

Preparation of the POP file for the alternate mode

Alternate calculation of the experimental equilibria with two or more stable phases is set
by the SET-ALTERNATE-MODE Y command in the PARROT module. The POP file
will usually require additional information to handle this option because there must be
enough information to calculate each phase separately. For example, if both compositions
of a binary tie-line have been measured, this may be given in the POP file as

CREATE 1 1

CH-ST PH FCC BCC=FIX 1

SET-COND P=1E5 T=1000

EXPERIMENT X(BCC,B)=.2:.01 X(FCC,B)=

 

01

The equilibrium above can be calculated with the alternate mode without any mod-
ification. PARROT will use the values given as EXPERIMENT as conditions when
calculating the thermodynamic properties of each phase, but, if just one side of the tie-line
has been measured, one must provide an estimate of the composition of the other phase.
This can be added by the SET-ALTERNATE-CONDITION command in the POP file.
A command SET-ALT-COND is ignored unless the alternate mode is set. The same
example as above would then be

CREATE 11

CH-ST PH FCC BCC=FIX 1
SET-COND P=1E5 T=1000
EXPERIMENT X(BCC,B)=.2:.01
SET-ALT-COND X(FCC,B)=.3

When PARROT calculates the thermodynamic properties of the bec phase, it will use
the composition provided as EXPERIMENT. When calculating for the fec, it will use the
composition provided with SET-ALT-COND.

A three-phase equilibrium may have some compositions determined experimentally,
with others provided as alternate conditions,

CREATE 1 1

CH-ST PH FCC BCC LIQ=FIX 1

SET-COND P=1E5

EXPERIMENT T=912:5 X(LIQ,B)=0.2:.02
SET-ALT-COND X(FCC,B)=0.1 X(BCC,B)=.4

The experiment below cannot be converted to alternate mode:

===========
7.3.10

7.3 The PARROT module of Thermo-Calc 239

CREATE 11

CH-ST PH BCC LIQ=FIX 1
SET-COND P=1E5 T=1111
SET-REF-STATE B LIQ * 1E5
EXPERIMENT MUR(B)=-4300:500

The reason is that there is no information about the compositions of the two phases
and, even if these were added as SET-ALT-COND, the alternate mode will end up with
five conditions for each phase instead of the correct four because the alternate mode will
keep the condition MUR(B) for both phases. The alternate mode may be able to handle
this situation in a future release.

A composition of a stoichiometric phase must be given with seven correct digits:

CREATE 11

CH-ST PH LIQ A2B=FIX 1

SET-COND P=1E5 X(LIOQ,B)=0.2
EXPERIMENT T=992:5
SET-ALT-COND X(A2B,B)=.6666667

Experimental equilibria with phases with status ENTERED or DORMANT will be
ignored by the alternate mode.

The alternate mode should be used at the beginning of an assessment only, before
reasonable model parameters have been determined. When it is possible to calculate the
experimental equilibria in the normal way, the alternate mode should be turned off.

The tricks and treats

Each assessor will develop his personal relation to PARROT because it is such a rich
item of software with many unique features. However, there are some common tricks that
it may be useful to know even before the user has developed a more intimate relation
with PARROT.

1. If you have trouble, use initially as few experimental data as possible to get a
reasonable overall fit. In particular, the invariant equilibria are useful. You can also
use metastable invariant equilibria that can be estimated by excluding some phases.
These estimated equilibria should be excluded from the final optimization!

2. If you have 100 activity measurements and 10 points from the phase diagram, you
may have to decrease the weightings of the data from activity experiments.

3. It may be practical to exclude some or all intermediate phases initially and
just optimize the liquid and the terminal phases (for the pure components); see
section 6.2.4.4. In later stages of the optimization, it can be interesting to calculate
the metastable phase diagram with just these phases in order to check that the
metastable solubility lines do not have any strange kinks or turns.

4. Phases with miscibility gaps, stable or metastable, are often problematic; see
section 6.2.7. Try to keep control of the gap by use of some real or estimated
experimental information. Unfortunately, PARROT cannot calculate the top of a

===========
240

7.3.11

74

Optimization tools

miscibility gap as a single experimental equilibrium. Use the stability function QF
to have control of any unwanted (or wanted) miscibility gaps.

5. Phases with order—disorder transformations are also problematic. They quite often
require manual input of initial values and sometimes the ordered state may disappear
during the optimization. It may help to add an experimental criterion that controls
the state of order; see section 7.3.7.11.

6. The alternate mode, section 7.3.9, is a new feature in PARROT, so no-one has
much experience with it. It should be used only to find an initial set of values
for the adjustable variables that can be used to make it possible to calculate the
experimental equilibria in the normal mode. It may also be used to get an initial
set of variables for an intermediate phase that was initially excluded, keeping the
values of already-fitted variables fixed.

7. When the liquid and some solution phases have been fitted reasonably well, the
optimizing variables describing these phases can be set fixed and the variables for
the intermediary phases optimized.

8. Check continually that the optimized variables fall within reasonable ranges. When
a variable starts to change by several orders of magnitude in the later stages of an
optimization, one must reconsider the experimental weightings or check whether
too many variables are being used.

9. Phases that appear in wrong places can be handled with the DGM experiment; see
section 7.3.7.9.

10. A final optimization with all variables and all selected experimental information,
with the appropriate weightings, should be done. This file should be saved as
documentation of the assessment.

Time taken for stages of an assessment using PARROT

A rough and maybe very personal estimate of the time spent on various stages of an
assessment is

25% on collecting experimental data and creating, correcting, and updating the POP,
setup, and dataplot files;

25% on “optimizing the weights” to find the correct balance among various types of
experimental information and selecting a critical set of experimental information;

25% on optimizing the adjustable variables; and

25% on writing the report.

Quite often one has to go back and reoptimize when one finds that a selection or decision
made during the optimization cannot be explained or defended in the report.

Final remarks

Most of the information here can also be found in chapter 6, but repetition is one way

of learning important facts. It is rarely the case that the assessor finishes an assessment

 

===========
7.4.1

74.2

7.4.3

7.4 Final remarks 241

with the feeling that it cannot be improved. It is usually money or time that determines
when the assessment is finished.

Conflicting data

In some cases one may find measurements of the same quantity that are widely different.
All such data should be entered into the experimental data file unless there are obvious
reasons (impurity of samples, for example) why some set can be rejected. However,
during the optimization one should not include two conflicting sets at the same time but
rather use only one at a time together with the rest of the data. This follows from a
simple rule formulated by Bo Jansson, the creator of PARROT: if you have two con-
flicting datasets then either one or the other may be correct or both may be wrong.
A fitted curve in between is most certainly wrong. It is to be hoped that the optimiza-
tion can clarify which dataset is most in agreement with the other information on the
system.

There are also cases in which conflicting data cannot be detected directly. For example,
it might not be possible to reconcile activity data with solubility data from the phase
diagram. This is indicated by large errors in the fit when both datasets are included. Thus
it may be necessary to try to optimize with some datasets excluded in order to find these
inconsistencies. For more discussion on this, see section 6.4.2.

The number of adjustable coefficients

Usually an assessment is considered better the fewer adjustable coefficients are needed
to get the same fit, although it does not matter much whether 12 or 13 coefficients were
needed. However, if one can get almost the same fit with 8 instead of 12 coefficients, then
the assessment with 8 can be considered a superior fit. More of this topic is discussed
in section 6.3. However, in an assessment one may put different weightings on different
kinds of information and it is very difficult to compare assessments.

It is important to use a small number of coefficients also for the reason that the
assessment will be used for extrapolations to higher-order systems. From experience it
has been found that the fewer coefficients are used for binary systems the fewer problems
occur with higher-order systems.

Analysis of results

In section 6.6 the points to check are listed, including the analysis of the final result,
which should include the following.

A satisfactory description of the critical set of experiments.

A satisfactory description of data not included in the critical set.

A reasonable set of values of the adjustable coefficents.

Reasonable extrapolations of the thermodynamic properties, also to higher-order

 

systems.
e A comparison with the results obtained using other critical sets or models.

===========
242

744

745

Optimization tools

Rounding off of coefficients

At the end of the optimization all optimized coefficients have several digits that must
be truncated. There is a simple method by which to round them off when dealing with
metallic systems, by keeping as many digits as will give less than 1 J mol~' difference at
1000 K. For aqueous systems or systems assessed for very different temperature ranges,
one may have to use other criteria. Rounding off that gives differences larger than
1Jmol! may give detectable changes in the phase diagram or for other experimental
data.

If the coefficients have many digits, this can give an impression of high accuracy,
which fact has led to another philosophy for rounding off. In PARROT one starts this
rounding off by considering the optimized variable with the highest RSD, which is usually
larger than 0.1. This means that this variable has only one significant digit. One may
thus round it off to just one digit and trailing zeros. However, this will change the sum
of errors and the remaining variables must be reoptimized with the rounded variable
kept fixed. One should reach almost the same reduced sum of errors with the remaining
variables; otherwise the variable set fixed was not the best one to round off.

When rounding off the first variable has been successful, one may continue to round
off the new variable with the largest RSD in the remaining set by setting it fixed and
reoptimizing the rest. The RSD for the remaining variables will decrease for each variable
set fixed and, if 0.1 > RSD > 0.01, the variable has two significant digits and so on.
This can continue until there is just one variable left. The final sum of errors should not
deviate significantly from the initial one obtained when all variables were optimized. The
rounded variables are easier to handle than those just rounded with many non-zero digits.

The SGTE raw data format for experimental data

The SGTE has decided on a format for storing experimental data for use in an assessment
program. All software that is used for such a purpose should be able to read and write a
file in this format. It is important that all decisions made by the assessor on the quality
of the data and the final selection are reflected in this file, also those made interactively.
In this way it is possible to reproduce the assessment at a later time, possibly together
with new experimental data or to test a new thermodynamic model or new software. This
format is available on the website for this book.
