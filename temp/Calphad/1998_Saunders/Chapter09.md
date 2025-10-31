Chapter 9
Computational Methods

9.1, INTRODUCTION

Most of this book concerns the development and application of theoretical thermo-
dynamic models, as these are the basis of the CALPHAD method. However, none
of this would be possible without the existence of the computational methods and
software which allow these models to be applied in practice. In essence, the issues
involved in computational methods are less diverse and mainly revolve around
Gibbs energy minimisation. In addition, there are ‘optimiser’ codes which are used
for the thermodynamic assessment of phase equilibria. The essential aim of these
codes is to reduce the statistical error between calculated phase equilibria, thermo-
dynamic properties and the equivalent experimentally measured quantities.

It is also worthwhile to make some distinctions between methods of calculating
phase equilibrium. For many years, equilibrium constants have been used to express
the abundance of certain species in terms of the amounts of other arbitrarily chosen
species, see for example Brinkley (1946, 1947), Kandliner and Brinkley (1950) and
Krieger and White (1948). Such calculations suffer significant disadvantages in that
some prior knowledge of potential reactions is often necessary, and it is difficult to
analyse the effect of complex reactions involving many species on a particular
equilibrium reaction. Furthermore, unless equilibrium constants are defined for all
possible chemical reactions, a true equilibrium calculation cannot be made and, in
the case of a reaction with 50 or 60 substances present, the number of possible
reactions is massive.

CALPHAD methods attempt to provide a true equilibrium calculation by
considering the Gibbs energy of all phases and minimising the total Gibbs energy
of the system (G). In this circumstance G can be calculated either from knowledge
of the chemical potential (G;) of component i, by

G=>onG; (9.1)
i
where nj; is amount of component i, or alternatively by

G=>o Nes, (9.2)
@

261

===========
262 N. Saunders and A. P. Miodownik

where N¢ is the amount of phase ¢ and G% its Gibbs energy. The number of
unknowns is now considerably reduced in comparison to an equilibrium constant
approach,

This chapter will describe aspects of the computation of phase equilibria by
starting with the simple case of two-phase equilibria in binary and ternary systems.
This provides a good example by which the process of Gibbs energy minimisation
can be conceptualised and the principles are equally applicable to multi-component
systems. The extension to more general cases will then be discussed. One of the
most significant advantages of the CALPHAD methodology is that, because the
total Gibbs energy is calculated, it is possible to derive all of the associated
functions and characteristics of phase equilibria, e.g., phase diagrams, chemical
potential diagrams, etc. Examples of some graphical forms of representing such
functions will also be given. Finally, ‘optimiser’ programmes will be discussed
with particular emphasis on the two major codes currently used world-wide, the
Lukas programme (Lukas et al. 1977) and PARROT (Jansson 1984b).

9.2. CALCULATION OF PHASE EQUILIBRIA

9.2.1 Introduction

The actual calculation of phase equilibria in a multi-component, multi-phase system.
is a complex process involving a high level of computer programming. Details of
programming aspects are too lengthy to go into this chapter, but most of the
principles by which Gibbs energy minimisation is achieved are conceptually quite
simple. This section will therefore concentrate on the general principles rather than
go into detail concerning the currently available software programmes which, in
any case, often contain proprietary code.

9.2.2 Binary and ternary phase equilibria

9.2.2.1 Analytical solutions. It is possible to calculate certain two-phase equilibria
using analytical equations. The simplest such case is a eutectic system where there
is negligible solubility in the solid state of the terminal phases and there is ideal
mixing in the liquid (Fig. 9.1). The composition of the liquidus of a at any given
temperature can then be directly calculated by finding the composition where the
partial Gibbs energy of A in the liquid, Gia is equal to the Gibbs energy of the pure
solid component A (Fig. 9.2). Thus

Ge =Gier? (9.3)

or

 

References are listed on pp. 294-296.

===========
CALPHAD—A Comprehensive Guide 263

1400

  

1300

1200

1100

1000

TEMPERATURE_KELVIN

0 .. 0.4 0.6 08 10
MOLE_FRACTION B

Figure 9.1. Simple eutectic system with ideal mixing in the liquid and negligible
solid solubility in the terminal solid phases, a and 3.

2000

—

alii
3 a ||
= |
a 0
a
Zz
a
@
a
2
o

-2000
0 0.2 04 0.6 08 1.0

MOLE_FRACTION B

Figure 9.2. G/z diagram at 850 K for eutectic system in Fig, 9.1.

===========
264 N. Saunders and A. P. Miodownik

Gis - Girt =0 (9.4)

where Gi"? is the Gibbs energy of fusion of solid A with respect to a. In an
ideal solution Ge = RT log, x, and Eq. (9.4) becomes

 

RT log, t4 — Gy*** =0 (9.5)
which can be rewritten as
Giiane
tas vo oF ) (9.6)

where x, is the composition of the liquidus at a given temperature T. More
generally Eq. (9.4) can be written as

(ais - Ti) - (Ais-* - T3i-*) =o (9.7)

where aye and 5! are the partial enthalpy and entropy of solution of A in the
liquid at z4 and H,*°° and sive are the enthalpy and entropy of fusion of a in
pure A. This can be rearranged to give an expression for the liquidus temperature
T's, as

Fila _ pylia—
sie _ gisce
if A'S, 548, ANS and S'8~* are temperature-independent, the liquidus temp-
erature can also be defined exactly. This can be extended for the case of an inter-
metallic compound of fixed stoichiometry (Kaufman 1970, Ansara 1979) so that

oh A + ob Ae + 24H + oR Ahe — He

AR
¢ Hp
tb _s?

Tia = (9.8)

Tas (9.9)

' ‘Ake
2450 + 265 + 24 Feet
A

where x4 and zy are the compositions of A and B in the stoichiometric compound
¢, H® and S® are the enthalpy and entropy of formation of ¢, given with respect to
the A and Bin their standard states, and H™*, Si, Hf* and Si are the enthalpies
and entropies of fusion of A and B in their standard states. This expression can be
further extended for any number of components providing the compound, ¢, is
stoichiometric, and becomes

Slats + Sata — He
i i

Te=+—__*_,—_..
Sates at HE
i i i

(9.10)

 

References are listed on pp. 294-296.

===========
CALPHAD— A Comprehensive Guide 265

Again, providing the various H and S terms are temperature-independent, the
solution remains exact and provides a rapid method of calculating the liquidus
temperature. Equation (9.10) is generally applicable to any phase boundary between
a solution phase and stoichiometric compound, so could equally well be used for
solid-state solvus lines.

9.2.2.2 General solutions. In the case of a solution phase and stoichiometric
compound which have temperature-dependent enthalpies and entropies, an iterative
process by which T is varied can be utilised to find the liquidus by using the
following equation

AG" = > afGi8 — G* =0 (9.11)

where af is the mole fraction of component i in the compound ¢ and Gis is the
partial Gibbs energy of in the liquid. Figure (9.3) shows a schematic diagram for
how AG'® varies with temperature and becomes zero at the liquidus. This temp-
erature can be found by first choosing an arbitrary temperature and then iteratively
stepping the temperature until AG’ has a value which is below a small, defined,
accuracy limit. Rapid convergence can be achieved by using a Newton-Raphson
method. An initial arbitrary temperature (T;) is chosen and both AG!? and
AG'*/dT are calculated and then used to estimate a new temperature (T)) where

ac'®

ria

Figure 9.3. Schematic diagram showing variation in AG'* as a function of
temperature.

===========
266 N. Saunders and A, P. Miodownik

ac'*

 

Figure 9.4. Schematic diagram showing method used to calculate liquidus
temperature for compound ¢ from curve AG'*#/T.

AG'® is expected to be zero. If the new value of AG’? does not satisfy the
convergence criterion, a new temperature (73) is estimated. The process is repeated
if necessary, until the convergence criterion is satisfied. Figure (9.4) shows a
schematic diagram representing this process.

In the more general case both phases could exhibit significant stoichiometric
deviation, and so a further degree of freedom is added. A method for dealing with
this in the binary system Ni~Cu was suggested in Chapter 3.7 (Fig. 9.5). In this case
the temperature is set as a constant and the Gibbs energy where liquid and f.c.c.
phases are equal is taken as the start point of the minimisation process (Figs.
9.6(a,b)). A solution must be found such that the Gibbs energy of a mixture of the
f.c.c. and liquid phases gives the lowest Gibbs energy and the compositions of the
fcc. and liquid phases are xf, and xf, respectively. This can be achieved by
changing the compositions of the liquid and f.c.c. phases away from the start point
and calculating a new Gibbs energy based on the constraints of Eq. (9.2) which is
re-stated below:

G= Ontos, (9.2)
@

with general mass balance equations where

 

References are listed on pp. 294-296.

===========
CALPHAD— A Comprehensive Guide 267

1900

1800

liquid

1700
fectliquid

1600

TEMPERATURE_KELVIN

 

1200
0 0.2 0.4 0.6 08 1.0

MOLE_FRACTION CU
Figure 9.5. Ni-Cu phase diagram.

N=>oNP (9.12)
¢

and

SoNt=M (9.13)
@

where JN; is the total number of moles of component i in the system and N¢ is the
number of moles of component 7 in the phase ¢ and M is the total number of moles
in the system.

It is not necessary to use zo as a starting point and any composition z; can be
used which satisfies the lever rule, where

— 2?!

N®: is the amount of phase ¢, in moles and 2?" and a? are the compositions of
phases ¢, and ¢» respectively and x; is the composition of the alloy. A general
procedure for minimisation could then follow the process described below.

The alloy is first assumed to be either single-phase liquid or f.c.c., (in this case
f.c.c.), and an arbitrary amount of liquid introduced. To retain mass balance, a cor-
Tesponding change in composition of the f.c.c. phase is made and G is calculated.

===========
268 N. Saunders and A. P. Miodownik

GIBBS ENERGY (kJ/mol)

 

fee Xig

 

 

0 0.2 0.4 06 08 1.0
MOLE_FRACTION CU

~5550
-5560
-5570
-5580

~5590

-5610

5620

GIBBS ENERGY (J/mol)

 

-5630

-5640

 

-5650
0.45 050 0.55 060 065 0.70 0.75

MOLE_FRACTION CU

Figure 9.6. (a) G/z curves for Ni-Cu at 1523 K and (b) expanded to show a two-
phase region.

The composition of the f.c.c. phase is then kept constant and the amount of liquid
changed, with a corresponding change in its composition to maintain mass balance,
so that the Gibbs energy is reduced. The process is iterated (Fig. 9.7) until G
reaches a minimum value. Figure 9.8 shows a graph of G vs N"4 and the minimum

 

References are listed on pp. 294-296.

===========
CALPHAD—A Comprehensive Guide 269

~5550
~5560
-5570
-5580
-5590
-5600
-5610

-$620

GIBBS ENERGY (J/mol)

-5630

~5640

 

~5650
0.45 0.50 055 0.60 0.65 0.70 0.75

MOLE_FRACTION CU

Figure 9.7. Schematic diagram showing first iteration stage in the Gibbs energy
minimisation process of an alloy with composition zy in Ni~Cu at 1523K.

Nig —e

Figure 9.8. Schematic diagram showing the Gibbs energy as N* is varied in a
‘two-phase mixture as shown in Fig. 9.7.

===========
270 N. Saunders and A. P. Miodownik

is characterised by dG /d.V"" becoming zero. Because of the mass balance relationship
it would, of course, also be possible to vary the composition of the liquid, rather
than its amount, and obtain an identical answer. However, using the amount of phase
makes the process more generalised when extended to multi-component systems.

N"a can be varied in a similar way to that described in the previous section but,
as the lowest Gibbs energy is not known, the guess for the next amount of N"9 is
made by calculating the second differential to the curve shown in Fig. 9.8 so that a
composition where dG/dN"4 = 0 can be estimated (Fig. 9.9). The composition of
the liquid is now held constant and the previous process repeated, but this time by
changing the amount and composition of the f.c.c. phase (Fig. 9.10). A new value
of G is calculated and compared with the previous calculation. If the difference in
G is not within the defined convergence limit the cycle is repeated again (Figs 9.11
and 9.12) until the difference in calculated Gibbs energy between cycles falls below
the defined convergence limit.

The method described above is quite general. If an alloy is chosen outside the
equilibrium two-phase field, this will be automatically recognised and convergence
to the correct single phase equilibrium will be achieved. Figure 9.13(a) shows such
a case, again for Ni-Cu, where the composition 2; is in the single-phase f.c.c.
region. An amount of liquid is introduced and G is calculated. The amount of liquid
is then changed until a minimum value of G is obtained. The process is repeated but
with the amount of the f.c.c. phase being changed (Fig. 9.13(b)). In this case G is

 

Figure 9.9, Schematic diagram of the first derivative of the G/N'* curve in Fig. 9.8
showing the calculation of the minimum in the Gibbs energy as a function of N“,

 

References are listed on pp. 294-296.

===========
CALPHAD—A Comprehensive Guide 271

-$550

-5560

+

~5570
-5580
-5590
-5600
-5610

-5620

GIBBS ENERGY (J/mol)

-5630
-5640

-5650
0.45 (0.50 0.55 0.60 0.65 0.70 0.75

MOLE_FRACTION CU
Figure 9.10. Schematic diagram showing second iteration stage in the Gibbs
energy minimisation process of an alloy with composition zp in Ni-Cu at 1523 K.

-5550

-5560

-5570
5580
5590
5600
-5610 >

-5620

GIBBS ENERGY (J/mol)

X

-5630
~$640

~$650
0.45 0.50 055 0,60 0.65 0.70 0.75

MOLE_FRACTION CU

Figure 9.11. Schematic diagram showing third iteration stage in the Gibbs energy
minimisation process of an alloy with composition zp in Ni-Cu at 1523K.

===========
272 N. Saunders and A. P, Miodownik
~5550
-5560
-5570
5580

-5590

5620

GIBBS ENERGY (J/mol)
‘
&

-5630

-5640

 

-5650 *
045 0.50 0.55 0.60 0.65 0.70 0.75

MOLE_FRACTION CU

Figure 9.12. Schematic diagram showing fourth iteration stage in the Gibbs
energy minimisation process of an alloy with composition zo in Ni-Cu at 1523 K.

minimised by the composition of the f.c.c. phase reaching x, and the amount of
liquid is therefore reduced to zero to maintain mass balance. Furthermore it is pos-
sible to check the stability of three phases to find which one, or which combination,
is the equilibrium state. In this case an estimate for compositions of the three phases
is made which satisfies the mass balance and a Gibbs energy calculated, giving
point A in Fig. 9.14. With the constraint of the other two phases being considered in
the total Gibbs energy calculation, the Gibbs energy of the system decreases as the
amount of the unstable third phase is decreased until a zero amount is present, at
point B. Finally the normal two-phase minimisation provides the final equilibrium
solution at C (Fig. 9.14). This process will also work with numerous phases being
considered as potentially in equilibrium.

The process has been described for a binary alloy but, essentially, this method of
minimisation holds for a teary system (Kaufman 1970). In the binary case the
amount of ¢ or 2 is altered by changing the composition of one of the respective
components, but in a ternary system the effect of the additional element must be
included as a further degree of freedom is introduced. Although in a ternary system
it is possible to have more than two phases in equilibrium, defining the two-phase
fields can still be used to delineate a three-phase triangle because the sides of the
three-phase field are defined by the tie-lines of the respective adjoining two-phase
fields (Fig. 9.15). Therefore, to plot an isothermal section it is only necessary to
calculate the possible two-phase equilibria and the three-phase fields are then easily

References are listed on pp. 294-296.

===========
CALPHAD—A Comprehensive Guide 273

(a)
5550 y
so I\
-5570
So
B -85e0
> 73590 4
& — |
& ~s600
a
Zz
wm -5610
a
f -5620
3
-5630
-5640
-5650
0.45 0.50 0.55 0.60 0.65 (0.70 0.75
s
&
=
>
3
s
a
Zz
w
2
ao
2
5

 

45 0,50 0.55 0.60 0.65 0.70 0.75
MOLE_FRACTION CU

Figure 9.13. Schematic diagrams showing (a) first iteration stage and (b) second
iteration stage in the Gibbs energy minimisation process of an alloy with
composition x, in Ni-Cu at 1523 K.

===========
274

GIBBS ENERGY (J/mol)

N. Saunders and A. P. Miodownik

-5550
-5560
5570
-5580
~$590
-5600
-5610
~5620
-5630
-5640

-5650
0.45 050 0.55 0.60 065 0.70 0.75

MOLE_FRACTION CU

 

Figure 9.14. Schematic diagram showing Gibbs energy minimisation process for
an alloy of composition zo in Ni-Cu at 1523 K including a metastable phase £.

 

20 40 60 80 100
MOLE_PERCENT B

Figure 9.15. Isothermal section in the ternary system A-B-C showing tie-lines in
the various two-phase fields and their intersection to form a three-phase field,

a+p+y.

 

References are listed on pp. 294-296.

===========
CALPHAD—A Comprehensive Guide 275

found where the three two-phase fields converge (Kaufman 1970). The calculation
method can be further extrapolated to a multi-component system but, unless the
problem specifically relates to two phases, cf. austenite/ferrite phase equilibria, it is
not useful as a general tool.

9.2.3 Calculation methods for multi-component systems

Essentially, the calculation must be defined so that (1) the number of degrees of
freedom is reduced, (2) the Gibbs energy of the system can be calculated, and (3)
some iterative technique can be used to minimise the Gibbs energy. The number of
degrees of freedom is reduced by defining a series of constraints, such as the mass
balance, electroneutrality in ionic systems, or the composition range in which each
phase exists. Preliminary estimates for equilibrium values must be given so that the
process can begin and subsequently proceed smoothly. These values are called the
start points and are critical in the minimisation process of finding true equilibrium
(see Section 9.2.5).

One of the earliest examples of Gibbs energy minimisation applied to a multi-
component system was by White et al. (1958) who considered the chemical
equilibrium in an ideal gas mixture of O, H and N with the species H, Hz, H20, N,
N2, NH, NO, O, O2 and OH being present. The problem here is to find the most
stable mixture of species. The Gibbs energy of the mixture was defined using Eq.
(9.1) and defining the chemical potential of species i as

G; = G? + RT log, a; (9.15)

where G? is the standard chemical potential of species i. Standard mass balance
equations were then introduced where

Mayz=ny G=1,2..-m) (9.16)

where aj; represents the number of atoms of element j in the species i, 2; the number
of moles of species i and n; the total number of moles of j in the system. These
authors presented two methods of Gibbs energy minimisation, one which utilised a
linear programming method developed by Dantzig et al. (1957) and one based on
the method of steepest descent using Lagrange’s method of undetermined
multipliers.

Their linear programming method used the following equation:

woe (é ) tne] (9.17)

where Ztotat = )0; 2i. This can be rewritten as

===========
276 N. Saunders and A. P. Miodownik

fe Fa(Z) ma d(E)m(S) om

G is then calculated as a linear function of (2;/2tota) log.(2;/2tota) and standard
Simplex code was used to find the Gibbs energy minimum.

The method of steepest descent provides a rapid solution to the minimisation
problem and was later used by Eriksson (1971, 1975) and Eriksson and Rosen
(1973) in the software codes SOLGAS and SOLGASMIX. SOLGAS, the earlier
code, treated a mixture of stoichiometric condensed substances and an ideal gas
mixture, while SOLGASMIX was able to further include non-ideal solution phases.
A Gibbs energy function G(Y) is first defined using Eqs (9.1) and (9.15) with a trial
set of composition inputs yf, yf,...,y%; yf,9s,---, ys, Where m is the number of
substances in the gas phases, s the number of condensed substances in the
equilibrium and where the various values of y are subject to the mass balance
constraints described by Eq. (9.16). A quadratic approximation of G(Y) is then
expanded using Taylor’s approximation and minimised utilising Lagrange multi-
pliers to incorporate the mass balance constraint. The relevant set of linear
equations are solved to produce interim values for x? and xf which are then used as.
estimates for y? and yf in the next iteration. Convergence is considered to have
been reached when the difference in Gibbs energy between the two steps is below a
predefined limit of accuracy. A short additional procedure eliminates the possibility
of obtaining negative values of x; and guarantees convergence; all mole numbers
are screened to remain positive and the directional derivatives has to remain
negative, i.e., the minimum point is not passed (White et al. 1958).

The minimisation methods used by later programmes such as ChemSage, the
successor to SOLGASMIK, (Eriksson and Hack 1990), F*A*C*T (Thompson et al.
1988), Thermo-Calc (Sundman 1991), MTDATA (Davies et al. 1991) and
PMLFKT (Lukas et al. 1982, Kattner et al. 1996) are, in the broadest sense, similar
in principle to that described above, although there are clear differences in their
actual operation. Thermodynamic models are now more complex, which makes it
necessary to consider further degrees of freedom but, essentially, constraints are
made to the system such that the Gibbs energy may be calculated as a function of
extensive variables, such as the amount of each phase present in the system. Initial
guesses are made for the Gibbs energy as a function of phases present, their
amounts and composition, etc. The Gibbs energy is then calculated and some
numerical method is used, whether it be through Lagrangian multipliers (Jansson
1984a) or a Newton-Raphson method (Hodson 1989), so that new values which
will cause the Gibbs energy to be decreased can be estimated. When the difference
in calculated Gibbs energy between the iterative steps reaches some small enough
value, the calculation is taken to have converged. Recently, Bogdanoff (1995) des-
cribed the development of new code which provides an interesting insight to some
of the computational problems which can arise during Gibbs energy minimisation.

 

 

References are listed on pp. 294-296.

===========
CALPHAD— A Comprehensive Guide 277

9.2.4 Stepping and mapping
The Gibbs energy minimisation process described in Sections 9.2.2 and 9.2.3 is
specific in that it gives a calculated phase equilibrium at a defined composition, temp-
erature and pressure. This can be modified so that phase equilibria are calculated as
one particular property is changed, for example, temperature. This would be
considered ‘stepping’ as only one variable is being considered. Plotting of various
calculated properties such as the amount of a phase (Fig. 9.16), composition of
phases (Fig. 9.17) and element distribution (Fig. 9.18) can then be made. Stepping
is probably the most valuable form of calculation for multi-component alloys.
Mapping is the process by which phase diagrams are plotted and is the most
common way for binary and ternary systems to be represented. Usually two degrees
of freedom are considered and diagrams are created by finding boundaries where
the phases in equilibrium differ on either side. The simplest forms are binary
temperature vs composition diagrams and ternary isothermal sections which are
easy to map. Figures 9.15 and 9.19 show, respectively, a ternary isothermal section
involving three phases and a simple binary eutectic diagram. In both of these cases
the tie-lines are in the plane of the figure and any calculation of a two- or three-
phase field defines the positions of these boundaries on the diagram. Essentially, all
that is required to map a phase boundary is a code which intelligently steps either
the composition or temperature of an alloy whose composition lies in a two-phase
field. It is then necessary to recognise when a new phase will appear and define the
position of the three-phase field.

Liq

80

2
3

MOLE % PHASE
&

20

 

ny 900 1200 1500
TEMPERATURE_CELSIUS

Figure 9.16. Mole % phase vs temperature plot for a ZERON 100 duplex
stainless steel.

===========
278 N. Saunders and A, P. Miodownik

WT% ELEMENT IN AUSTENITE

 

o&
600 800 1000 1200 1400
TEMPERATURE_CELSIUS.

Figure 9.17. Composition of --phase in ZERON 100 duplex stainless steel as a
function of temperature.

WEIGHT_PERCENT CR

 

0
600 900 1200 1500
TEMPERATURE_CELSIUS

Figure 9.18, Distribution of Cr in the various phases of a ZERON 100 duplex
stainless steel as a function of temperature.

 

References are listed on pp. 294-296.

===========
CALPHAD—A Comprehensive Guide 279

TEMPERATURE_CELSIUS

 

0 20 40 60 80 100

MOLE_PERCENT AG
Figure 9.19. Cu-Ag phase diagram showing tie-lines in the various two-phase
fields.

In a binary diagram the position of the three-phase line can be calculated
utilising a method whereby the step size is changed when a phase boundary is
reached. For example, the calculation begins with an alloy in the (a + 8) phase
field. The temperature is increased by 10°C steps and its composition maintained so
that it exists in the (a + @) phase field. At each new step the stability of the liquid is
checked. Once the liquid becomes stable the previous temperature is used as a start
point and the temperature step is decreased. This process is repeated with
subsequent decreased step sizes until a the temperature is defined within a critical
step size. This method is cumbersome and more intelligent searching routines can
be used. But in the end the temperature will be defined within a critical step size.
Alternatively, the temperature where the activity/chemical potential of A and B in
the three phases is equal can be explicitly calculated.

In a ternary isothermal section a similar procedure is used where an alloy is
stepped such that its composition remains in a two-phase field. The three-phase
field is now exactly defined by the composition of the phases in equilibrium and
this also provides the limiting binary tie-lines which can used as start points for
calculating the next two-phase equilibrium.

In vertical sections through ternary and higher-order systems or isothermal
sections for quaternary and higher systems, the position becomes more complex as
tie-lines do not lie in the plane of the diagram. They therefore cannot be used to
define the positions of phase boundaries and the procedures described above
become inoperative. New concepts are required, such as viewing the diagram in a

===========
280 N. Saunders and A. P. Miodownik

1500

8

Ja({L+Cu]'+Ag°y
B=([L+Ag]!+Cu%)
9=(L°4[Cu+Ag]')

1400

1300
an
2 1=(L'+cu®)
4 1200 a(LPecu!y
3 (ca) 3e(Lhsagi)
a 4=(L°+Ag!)
2 1000 S=(Cul+Ag®)
& 6=(CusAg!)
oe
a
a
a
&

 

0 30 60 90
MOLE PERCENT AG

Figure 9.20. Vertical section through Cu-Ni-Ag, at a constant 10at%Ni, showing
definition of phase-boundary lines.

topological way and considering what generally defines the lines/boundary
positions. A vertical section through a ternary system will be used as an example
(Fig. 9.20). The definition of the lines in this diagram is quite simple as they
delineate the positions where more than one phase is in equilibrium and the mole
fraction of one of the phases is zero. This definition is a general one and applicable
to phase diagrams of higher-order systems. Invariant reactions have their own
unique properties and occur at a fixed temperature. Mapping then requires that
these positions are found, which requires a further step in the computing routines.

The discussion above centred around diagrams where the axes were composition
or temperature. It is quite possible to use other variables in mapping routines, for
example, activity/chemical potential and pressure. Further, it is possible to consider
mapping other features, for example, the liquid invariant lines in a ternary system
(Fig. 9.21). In such cases the positions of the lines are defined by other criteria than
described above and new search routines are required.

A great strength of the CALPHAD approach is that various other properties are
automatically obtained during the calculation procedure and these can also be plotted.
Figure 9.22(a) shows the chemical potential of Mg (with respect to Mg liquid) as a
function of temperature in Cu-Mg and Fig. 9.22(b) shows the corresponding T'/x
diagram (Coughnanowr et al. 1991). The chemical potential diagram is interesting
because there are no two-phase fields since G; is constant in such a region and,
therefore, only varies in the single-phase fields. In a ternary system the extra degree
of freedom means that G; varies in the two-phase region but is constant in the

 

References are listed on pp. 294-296.

===========
CALPHAD—A Comprehensive Guide 281

WEIGHT_PERCENT MG

 

0 5 0 15 20 25 30 35 40
WEIGHT_PERCENT CU

Figure 9.21. Calculated liquidus surface for AI-Cu-Mg.

three-phase region. Figure 9.23 shows a diagram for Fe-Cr-N from Frisk (1990)
with the chemical potential axes converted to activity for the purpose of variety.
Although there is potential for plotting all types of axes, there is also considerable
danger that the diagram may become difficult to interpret. Hillert (1996) addressed
this problem and produced the following definition of what is a true phase diagram.
“‘A phase diagram may be defined as any diagram showing the range of existence of
individual phases and of combinations of phases. Each such range is a phase field and
it can have the same dimensionality as the diagram itself or a lower dimensionality.
By selecting conditions corresponding to a point in the diagram, one can directly read
what phases could be present at equilibrium. A diagram should not be regarded as a
true phase diagram if it does not give a unique answer.’’

Examples of diagrams which failed the above criteria were shown and a number of
conjugate pairs of variables which would satisfy the above definition were also
given. It is hoped that in future all software will have algorithms recognising which
axes will provide true equilibrium diagrams and warn users if this is not the case.

9.2.5 Robustness and speed of calculation

First a clear distinction must be made between robustness and speed of calculation,
although in certain cases they are clearly linked. Speed may be altered by straight-
forwardly changing factors such as the processing power of the computer, using a

===========
282

N. Saunders and A. P. Miodownik
(a)

TEMPERATURE_CELSIUS
2
3

500

 

400
-80 -70 -60 -50 -40 -30 -20 -10] 0
= aliq CuMg,
Sue” Ome
(b)

1100

1000
a
3
HR 900
a
a
9,
im! 800
4
2
& (cv)
a
a
&
= 600
a
eB

 

MOLE_PERCENT MG

Figure 9.22. (a) Chemical potential vs temperature diagram for Cu-Mg and (b)

phase diagram for Cu-Mg (Coughnanowr et al. 1991).

more efficient compiler, changing the operating system, etc. These are extrinsic
factors which, while making the calculation faster, do not ensure a more robust

calculation; a robust code being defined here as one which will ensure that true

References are listed on pp. 294-296.

===========
CALPHAD—A Comprehensive Guide 283

U-FRACTION CR

 

ACTIVITY N

Figure 9.23. Isothermal section for Fe-Cr-N using activity and U-fractions from
Frisk (1990).

equilibrium is obtained. By speeding up the calculation, and using a code which is
not robust, the wrong answer is only achieved faster, or the programme crashes
more quickly. Robustness and speed are linked, however, by choice of start points
which are the initial guesses for the amount and composition of each phase given to
the minimisation code. Clearly the more accurate the start points, the less work
needs to be done by the Gibbs energy minimisation sub-routine and the more
quickly the calculation is performed, Further, there is less likelihood of local
minima affecting the calculation.

If codes are based on local minimisation methods, such as steepest descent or
Newton-Raphson, problems will always arise due to the existence of unknown
local minima in Gibbs energy space. More robust codes based on global
optimisation methods can be designed, but these must sample a larger portion of
Gibbs energy space so that all of the local minima are recognised. Unfortunately,
computational times can then be greatly increased. If speed is required (which is
usually the case) it is necessary to use local minimisation methods and it is,
therefore, necessary to ensure that good guesses are provided for the phases which
are present and their compositions. This was one of the main problem areas for the
first attempts at producing sound code. Most programmes now address this
reasonably well, but it is the authors’ experience that it is still possible for the
minimisation routines to get caught in local minima, rather than find true
equilibrium. Therefore, the user should always be aware of this possibility and,
where necessary, apply some form of checking. Some programmes allow this by

===========
284 N. Saunders and A. P. Miodownik

providing a facility for the user to input alternative start points before calculations.

One of the main reasons for the occurrence of local minima is the presence of
miscibility gaps in various phases. In binary and ternary systems such effects are
well established and manifest themselves in phase separation. The minimisation
routines must then recognise their existence and account for them. It is possible to
have a datafile which contains two identical sets of parameters with phases called
FCC#1 and FCC#2; alternatively the software produces a ‘virtual’ FCC#2 phase
based on the pre-existing entry for FCC. The programme must then provide
different start points for FCC#1 and FCC#2 and ensure that that convergence
accounts for both sets of potential minima. However, this pre-supposes that the
potential occurrence of a miscibility gap is known. Such an approach can work
satisfactorily for a well-understood class of material but, as a generalised method, it
would fail if unknown miscibility gaps were present. In this circumstance it is
possible to look at the derivatives of the Gibbs energy as a function of composition
to check for potential local minima.

In some thermodynamic models there are also potential minima associated with
different site occupations, even though the composition may not vary, ¢.g., a phase
with an order/disorder transformation. This must be handled in a somewhat different
fashion and the variation in Gibbs energy as a function of site fraction occupation
must be examined. Although this is not, perhaps, traditionally recognised as a
miscibility gap, there are a number of similarities in dealing with the problem. In
this case, however, it is the occupation of sites which govern the local minima and
not the overall composition, per se.

There may be problems if the Gibbs energy of two phases converge either above
the temperature of the miscibility gap or above the ordering temperature. The
minimisation code will then see two phases with identical Gibbs energy, which can
cause considerable confusion. The problem is now one of strategy and programming.
Miscibility gaps are handled in all of the major software codes, but in different
ways. There is no one ideal solution to this problem whereby true robustness is
guaranteed. Searching derivatives of Gibbs energy vs composition for all phases is
potentially a robust solution, especially if a completely generalised method is
required, However, the time penalty to check all phases in a real, multi-component
material is huge and, in reality, impractical. Some knowledge of potential ordering
or miscibility gap formation is, therefore, always necessary to complete the
calculation in a reasonable time.

93. THERMODYNAMIC OPTIMISATION OF PHASE DIAGRAMS
9.3.1 Introduction

Thermodynamic optimisation is probably the largest single area of reported work in
the journal CALPHAD. It invariably concerns binary and ternary systems and can

 

References are listed on pp. 294-296.

===========
CALPHAD— A Comprehensive Guide 285

be defined as a fitting process whereby the adjustable coefficients in the Gibbs energy
equations are altered such that the best representation of both the experimentally
measured phase diagram and thermodynamic properties are obtained. The accuracy
of this representation can be defined mathematically through some form of least-
squares algorithm, and this forms the basis for optimisation software such as the
Lukas programme (Lukas et al. 1977), PARROT (Jansson 1984b), FITBIN
(Thompson et al. 1988) and ChemOpt (K6nigsberger and Eriksson 1995).

In earlier times, thermodynamic and phase diagram optimisation were often
separate exercises. For example, the compilations of binary diagrams by Hansen.
and Anderko (1958), Elliott (1965) and Shunk (1969) did not normally take into
account thermodynamic information. The compilations of Hultgren et al. (1973)
concentrated on thermodynamic measurements, but the phase diagram was also an
important factor in their assessment procedure. However, this was mainly for phase
identification purposes rather than for making a self-consistent assessment of both
phase diagram and thermodynamic measurement.

Essentially, any optimisation process requires good judgement. This is basically
because the errors which are incurred during measurement are not completely
random. There are systematic errors which can arise from, for example, faulty
calibration or unsuitability of a particular measurement technique. It is worth,
therefore, considering a question and answer session which succeeded a paper
presented by one of the present authors at the Royal Society (Saunders 1995):

“Q. You hinted at a rather remarkable claim. When there are several distinct
measurements of a phase equilibrium feature, you suggest you can pick out a
faulty measurement by comparison with a CALPHAD calculation. But surely
the precision of such a calculation is linked to the precision of the thermo-
chemical measurements which contribute the input. Shouldn’t a curve
calculated by CALPHAD actually show upper and lower confidence limits
depending on your judgement of the reliability of the input measurements?

‘*A. The answer to your question is yes and no. In an ideal world, where all experi-
mentation is reliable and of good quality, I would agree that the curve calculated
by a CALPHAD calculation could have such confidence limits imposed.
Unfortunately, this is not often the case and, for example, sets of measured
datapoints for a liquidus in a simple binary system can vary considerably. In
some high-melting-point systems it is not unusual for these differences to be
of the order of 100°C or higher. Sometimes a simple comparison of the
original datapoints can show that one particular set of results is obviously in-
consistent with other reported values and this forms the basis of experimental
phase diagram assessment work by people such as Hansen. Unfortunately in
others cases the position is not so clear cut. The CALPHAD calculation does
impose a self-consistency between the underlying thermodynamics and the phase
diagram and therefore can be used as an arbiter between conflicting values.””

===========
286 N. Saunders and A. P. Miodownik

In essence this summarises the position of optimisation. Hopefully, systematic
errors are exposed but this does rely on there being enough experimental infor-
mation available so that they are clearly shown. The general practice of
optimisation at the present time is performed through a process of trial-and-error
combinations of the adjustable parameters. Optimising codes such as the Lukas
programme or PARROT reduce the error using mathematical algorithms while a
‘manual’ procedure means that the user changes these parameters according to
personal judgement. Although a mathematical least-squares-type approach might
be considered as ideal, a great deal of judgement is still required in the process,
especially when there is little experimental information available.

A good example of an optimisation in practice is the assessment of Ga-~Te (Oh
and Lee 1992). The liquid phase was modelled using the ionic two-sublattice model
(see Section 9.5.3) which readily models systems with negative mixing enthalpies
but which also have high-temperature miscibility gaps. Figures 9.24-9.27 show
comparisons between calculated and experimental thermodynamic properties in the
liquid. It is interesting to note that a concentration structure factor could also be

+Castanet and Bergman (1977),1200K g
% Castanet and Bergman (1977),1238kf
Wi Said and Castanet (1979),1130K

@ Alfer et al. (1983),1130K

O Irle ef al. (1987),1139K;
Inte et af. (1987),1150K
A IMrle et al. (1987),1203K
() Irle et al. (1987),1233K

Mixing Enthalpy, ki/mole

 

0.0 0.2 0.4 0.6 0.8 1.0
Atomic Fraction Te

Figure 9.24. Comparison between experimentally determined and calculated
enthalpies of mixing of the liquid phase in Ga—Te at 1130 and 1230K (Oh and Lee
1992).

References are listed on pp. 294-296.

===========
CALPHAD— A Comprehensive Guide 287

4 Predel et al. (1975)

© Katayama et af. (1987)

‘OSrikanth and Jacob (1989)
08 4

2
&

Activity

2
=

0.2

 

0.0 0.2 04 06 08 1.0
Atomic Fraction Te

Figure 9.25, Comparison between experimentally determined and calculated
activities of Ga and Te in the liquid phase in Ga—Te at 1120 K (Oh and Lee 1992).

350

© Katayama et af. (1987)
1 Glazov et al. (1969)
300 x Srikanth & Jacob (1989)

250

200

 

150

100

50

 

 

900 1000, 1100 1200,
‘Temperature, K
Figure 9.26. Comparison between experimentally determined and calculated

EMF values as a function of temperature for various liquid alloys in Ga-Te (Oh
and Lee 1992).

===========
288 N. Saunders and A. P. Miodownik

1 Srikanth and Jacob (1989)
+ Katayama ef af. (1987)

 

Xq_(d1nag,/Xg,

S,<(0)5

 

“0.0 02 04 06 08 1.0

Atomic Fraction Te
Figure 9.27. Comparison between experimentally determined and calculated
concentration-concentration structure factors at 1120K in liquid phase of Ga—Te
at 1120K (Oh and Lee 1992).

1200

    
  
    

Liquid

+ Wobst (1971)

  

X Gtazov and Paviove (1977)
1 Alapini et al. (1979)
MM Tschirner et af. (1986)

Temperature, K

    

500

400

 

300
0.0 02 0.4 0.6 0.8 10

Ga Atomic Fraction Te Te

Figure 9.28, Comparison between experimentally determined and calculated
Ga-Te phase diagram (Oh and Lee 1992),

 

References are listed on pp. 294-296.

===========
CALPHAD— A Comprehensive Guide 289

 

Table 9.1. Invariant equi in the Ga-Te binary system from Oh and Lee (1992).

 

 

‘Concentration Temperature Reference
Phases (x72) (K)
Galliquid/GaTe — 302.9 Klemm and Vogel (1934)
5.8 1071! 302.9 This study
Liquid/iquid/GaTe —10.33 1013, Klemm and Vogel (1934)
—10.30 1019 Newman et al. (1961)
_ 1023 Alapini et al. (1979)
— 1019 Blachnik and Irle (1985)
0.09/0.30 1018 Wobst (1971)
0.088/0.302 1015 This study
GaTe/liquid/GasTe, - 1049 Blachnik and Irle (1985)
0.561 1061 This study
Liquid/GasTes/GazTes = 1057 Blachnik and Irle (1985)
0.570 1063 This study
GaTe/GayTes/liquid - 768 Alapini et al. (1979)
— 761 Blachnik and Irle (1985)
0.780 755 Tschimer et al. (1986)
0.862 761 This study
Ga;Tes/liquidTe 09 13 Alapini et al. (1979)
= 709 Blachnik and Irle (1985)
09 703 Tschimer et al. (1986)
0.937 703 This study
GaTe/Ga;Tes/Te _ 673, Alapini et al. (1979)
_ 684 Tschimner et al. (1986)
_ 677 This study
Critical point 0.20 1069 Wobst (1971)
0.183 1083 This study

 

plotted and compared with results from two separate studies. Table 9.1 shows the
comparison between various calculated and experimental quantities for the
compounds in the system. Finally the calculated phase diagram is shown in Fig.
9.28 with detailed comparison between calculated and experimentally measured
invariant reactions shown in Table 9.2.

Firstly, the optimisation shows how well the various thermodynamic quantities
are matched and the excellent agreement with the experimentally observed phase
diagram. It also shows a clear discrepancy between one set of experimental results
and the optimised values for the mixing enthalpy in the liquid, emphasising the
point that the combined thermodynamic and phase-diagram optimisation has been
able to differentiate between conflicting experiments.

‘The assessment of Oh and Lee (1992) utilised the PARROT programme (Jansson
1984b) and it is now worth discussing this programme and the one developed by
Lukas et al. (1977) as these are the main codes presently used for optimisation.

===========
290 N. Saunders and A. P. Miodownik

2, Thermodynamic quantities for GaTe and Ga,Tes phases (J/g-at.) from Oh and Lee (1992).

 
 

 

Value Method Reference
*GaTe
AHk, -39,400 Calorimetry Said and Castanet (1977)
-39,000 Calorimetry Said and Castanet (1977)
59,800 Calorimetry Hahn and Burow (1956)
62,800 Potentiometry _ Abbasov et al. (1964)
39,205 Calculated This study
Sq 42.7 Calorimetry __Kerimov et al. (1971)
413 Calculated This study
AH 19,100 Calorimetry Said and Castanet (197)
17,991 DTA Kuliev et al. (1976)
18,041 Calculated This study
Tm 1108 DTA Newman et al. (1961)
1123 DTA Alapini ef al, (1979)
1121 DTA Blachnik and Irle (1985)
1099 DTA Glazov and Pavlova (1977)
1107 Enthalpimetry Said and Castanet (197)
1107 Calculated This study
*Ga,Te,
AHL, -39,800 Calorimetry Said and Castanet (1977)
38,600 Calorimetry Said and Castanet (1977)
54,400 Calorimetry Hahn and Burow (1956)
55,000 Potentiometry _Abbasov ef al. (1964)
-37,879 Calculated This study
Sq 42.7 Calculated Mills (1974)
43.1 Calculated This study
AH 15,800 Calorimetry Said and Castanet (1977)
12,385 DTA Babanly and Kuliev (1976)
13,477 Calculated This study
Tn 1065 DTA Newman ef al, (1961)
1083 DTA Alapini et al. (1979)
1085 DTA Blachnik and Irle (1985)
1063 DTA Glazov and Pavlova (1977)
1071 Enthalpimetry Said and Castanet (1977)
1079 Calculated ‘This study

 

9.3.2 The Lukas programme

The Lukas programme (Lukas et al. 1977) was one of the first dedicated optimising
programmes for use by CALPHAD practitioners. It is freely available, on request,
and forms the basis for a substantial amount of work published in CALPHAD. Two
main forms of the Lukas programme are now available, BINGSS and TERGSS,
which are applicable to binary and temary systems respectively. The original code
used a Gaussian least-squares method (Zimmerman 1976) but later versions also
include a method suggested by Marquardt (1963). The programme separates the

 

References are listed on pp. 294-296.

===========
CALPHAD— A Comprehensive Guide 291

experimental measurements into three distinct types. (1) Calorimetric measure-
ments, which are usually enthalpies; (2) EMF and vapour pressure measurements,
which provide partial Gibbs energy; and (3) phase-diagram information. Each of
these types of measurements is given a different equation of error.

For calorimetric measurements these equations are governed by the number of
phases involved and the temperature of the measurement. Three types of equations
are defined. If one phase only is programmed, the measured value describes the
heat of formation of a phase from its pure components. As the enthalpy of the pure
components are defined before the optimisation takes place, there is only one
unknown. The equation of error for two phases applies to enthalpies of melting and
transformation. In this case there are two unknowns; which are the enthalpies of the
phases involved in the transformation. Enthalpic changes involving three phases
can also be considered, for example the enthalpy change on mixing two liquids of
different compositions. In this case the enthalpy of the two original liquids and the
final liquid are needed.

For phase diagrams, a phase boundary is one end of a tie-line and, therefore, is
dependent on the phase which exists at the other end of the tie-line. In a binary
system, two independent measurements are therefore needed to define the tie-line;
in the case of a liquid/solid phase boundary this would be 2%! and zie at
temperature T’. Ideally it would be desirable to have these two compositions as
independent variables giving rise to two independent equations of error. The Lukas
programme does this by making two equations but where the dependence of error
on one of the measurements is weak. This is important if the two concentrations have
different accuracies. For some types of experimental values newer versions of the
Lukas programme offer different kinds of equations of error (Lukas and Fries 1992).

EMF and vapour pressure measurements are dependent on the temperature, the
number of phases involved and, importantly, the reference state of the component
in question. The problem with the reference state is important as experimentally stated
values of partial Gibbs energies will be dependent on this value. The standard states
are fixed before optimisation and may actually have values different from those used
by the original author. Therefore, as far as possible like should be compared with like.

Once the equations of error are defined, ‘weighting factors’, in terms of estimated
accuracy of the experiment, are included. These are either taken as the accuracy of
the corresponding measurement as given by the original author or estimated by the
person who is doing the optimisation. The error is then divided by these weighting
factors to provide a dimensionless relative error for all types of experimental
measurement. In addition to this, the sensitivity to the measured value of changes in
temperature and composition are considered.

If the Lukas programme is run with all experimental data, including reasonable
estimates for accuracy, it performs its fitting operation by assuming that errors arise
from random effects rather than systematic inaccuracies. Systematic errors can be
taken into account in at least two ways. Firstly, it is possible to ignore the particular

===========
292 N. Saunders and A. P. Miodownik

experiments completely, and there is a command in the programme which allows
this to be done. Secondly, the estimated experimental error can be increased by
increasing the corresponding value in the data file which contains the experimental
information. Both routes emphasise the fact that a purely mathematical approach to
optimisation is usually not possible and some form of personal judgement is
required.

9.3.3 The PARROT programme
The PARROT programme (Jansson 1984b) is integrated into the Thermo-Calc soft-
ware package. It relies on principles different from those applied in the Lukas
programme although it has the same aim of reducing the error between calculated
and experi-mental quantities. Primary governing principles in PARROT involve
establishing a criterion for the best fit, separating data into sets of different
accuracies and making a distinction between independent and dependent variables.
The criterion for best fit is based on the maximum likelihood principle (Fisher
1922) where the best estimates of the model parameters should maximise the likeli-
hood function, L, for the observation of N different experimental observations,

N
L=]]A@, w) (9.19)

it
where F; is the multi-variable density function for the distribution of the measured
values in experiment i, 2°, are measured experimental values which might differ
significantly from their true value and wj is used to denote the statistical parameters
in the probability density function concerning experiment i. Equation (9.19)
requires that the joint probability density function of all experimental data is
known. However, the available data rarely allow the determination of probability
functions. Therefore, in order to apply Eq. (9.19) it is assumed that the statistical
density functions of the experiments is Gaussian in form. The normal distribution
of experimental data (the probability of observing the values Z?) given that their

true values are ji; is then expressed by

Fy = 20S (det V)"exp(-3(@ - Vi (HP —H)) (0.20)

where V; is the variance-covariance matrix of the measured variable in experiment
i. The maximisation of Eq. (9.19) combined with Eq. (9.20) is complex and the
problem was simplified by assuming that the maximum of L coincides with the
minimum of the exponential factors in Eq. (9.20). Their product, which is the
estimator of the goodness of fit, is then represented by exponent S where

$= 50 ((e- A)" V-"(2 A) (021

 

References are listed on pp. 294-296.

===========
CALPHAD— A Comprehensive Guide 293

Further simplifications can be made by assuming the off-diagonal elements of V,,
which represent the covariance between the measured quantities, are zero; this
effectively means that there is no coupling between the different experimental
determinations in the experimental procedure, which is reasonable.

PARROT allows for the fact that, in addition to the experimental quantities 2?
which exhibit significant deviations from their true value, there is another set of
quantities @? which are considered free from significant inaccuracy. Also,
independent and dependent variables are defined, where independent variables
are measured values which can be considered to define the conditions for the
equilibrium state while dependent variables are regarded as the responses of the
system to the these prescribed conditions. Independent variables should come
primarily from the a? set, but if recourse has to be made to the Z? set the latter can
be further divided into two sets, one which contains independent variables Z? and
the other containing dependent variables 9°. Whether a measured independent
variable should be included in the @; or 2; ee depends on the sensitivity of the 9;
quantities to fluctuations in that value. If the fluctuations in the 9; quantities are less
than the accuracy of the experimental measurement when the a; or Z; value is
varied within its own accuracy limit, then it should be included in the a; set.

Taking these additional features into account, the estimator of the goodness of fit
then becomes the weighted sum of the squared deviation of the observed values
from their calculated values.

ny _ ae Aty\2
ECT ELEY) om

i=1 =

where * denotes an estimated value, A is a vector with its elements equal to the
model parameters to be estimated, ox;; and oy,; are respectively the standard
deviations of the jth independent and dependent variable in experiment i and 9f;

the calculated dependent variable. The minimisation of Eq. (9.22) in PARROT
utilises neither the Gaussian method or the Marquardt modification, which are the
normal methods of the Lukas programme. Instead a finite difference approximation
method after Powell (1965) is implemented via a subroutine VA05O from the
Harwell Subroutine Library (Hopper).

The PARROT programme uses the Poly-3 subroutine in Thermo-Calc to
calculate Gibbs energies of the various phases and find the equilibrium state. In
such equilibrium calculations the temperature, pressure and chemical potentials are
treated as independent variables, and preselected state variables are used to define
the conditions for an equilibrium calculation. The dependent state variables, i.e.,
the responses to the system, can then be given as a function of the independent state
variable and the model parameters. It is thus possible to use almost any type of
experimental information in the evaluation of the model parameters.

===========
294 N. Saunders and A. P. Miodownik

9.3.4 Summary

It must always be remembered that optimisation is not an exact science and,
therefore, it is sometimes difficult to define confidence limits in the final optimised
vaiues for the coefficients used in the thermodynamic models. The final outcome is
at least dependent on the number of experimental measurements, their accuracy and
the ability to differentiate between random and systematic errors. Concepts of
quality can, therefore, be difficult to define. It is the author’s experience that it is
quite possible to have at least two versions of an optimised diagram with quite
different underlying thermodynamic properties. This may be because only
experimental enthalpy data were available and different entropy functions were
chosen for the different phases. Also one of the versions may have rejected certain
experimental measurements which the other version accepted. This emphasises the
fact that judgement plays a vital role in the optimisation process and the use of
optimising codes as ‘black boxes’ is dangerous.

REFERENCES

Abbasov, A. S., Nikolskaia, A. V., Gerasimov, Y. I. and Vasilev, V. P. (1964) Dokl. Akad.
Nauk, SSSR, 156, 1140.

Alapini, F., Flahaut, J., Guittarad, M., Jaulmes, S. and Julien-Pouzol, M. (1979) J. Solid State
Chem., 28, 309.

Al’fer, S. A., Mechkovski, L. A. and Vecher, A. A. (1983) Thermochimica Acta, 88, 493.

Ansara, I. (1979) Int. Met. Reviews, 22, 20.

Babanly, M. B. and Kuliev, A. A. (1976) Izv. Akad. Nauk, AzSSR, Ser. Fiz.-Tekh. Mat. Nauk,
4, 145.

Blachnik, R. and Irle, E. (1985) J. Less Common Metals, 113, L1.

Bogdanoff, P. (1995) M.Sc. Thesis, University of Cambridge, UK.

Brebrick, R. F. (1976) Met. Trans. A, 7A, 1609.

Brebrick, R. F. (1977) Met. Trans. A, 8A, 403.

Brinkley, S. R. (1946) J. Phys. Chem., 14, 563.

Brinkley, S. R. (1947) J. Phys. Chem., 15, 107.

Castanet, R. and Bergman, C. (1977) 9, 1127.

Coughnanowr, C. A., Ansara, I., Luoma, R., Hamalainen, M. and Lukas, H. L. (1991) Z.
Metallkde., 82, 574.

Dantzig, G. B., Johnson, S, M. and White, W. B. (1957) The RAND Corporation, Paper
P-1060, April 15.

Davies, R. H., Dinsdale, A. T., Hodson, S. M., Gisby, J. A., Pugh, N. J., Barry, T. L. and
Chart, T. G. (1991) in User Aspects of Phase Diagrams, ed. Hayes, F. H. (Inst. Metals,
London), p. 140.

Elliott, R. P. (1965) Constitution of Binary Alloys, Ist Supplement (McGraw-Hill, New
York).

Eriksson, G. (1971) Acta Chem. Scand., 25, 2651.

Eriksson, G. (1975) Chemica Scripta, 8, 100.

===========
CALPHAD—A Comprehensive Guide 295

Erikkson, G. and Rosen, E. (1973) Chemica Scripta, 4, 193.

Eriksson, G. and Hack, K. (1990) Met. Trans. B, 21B, 1013.

Fisher, R. A. (1922) Phil. Trans. A, A222, 309.

Frisk, K. (1990) Met. Trans. A, 21A, 2477.

Glazov, V. M. and Pavlova, L. M. (1977) Inorg. Mater., 13, 184.

Glazov, V. M., Chizhevskaya, S. N. and Glagoleva, N. N. (1969) ‘‘Liquid Semiconductors’’
(Plenum, New York).

Hahn, H. and Burow, F. (1956) Angew. Chem., 68, 382.

Hansen, M. and Anderko, K. (1958) Constitution of Binary Alloys (McGraw-Hill, New
York).

Hillert, M. (1996) ‘‘How to select axes for a phase diagram’’, presented at CALPHAD
XXXV, Erice, Sicily, May 26-31.

Hodson, S. M. (1989) ‘‘MTDATA handbook: multiphase theory’, NPL report, 3 February.

Hopper, M. J. Harwell Subroutine Library, A.E.R.E., Harwell, Didcot, UK.

Hultgren, R., Desai, P., Hawkins, D. T., Gleiser, M. and Kelley, K. K. (1973) Selected Values
of the Thermodynamic Properties of Binary Alloys (ASM, Metals Park, OH).

Irle, E., Gather, B., Blachnik, R., Kattner, U., Lukas, H. L. and Petzow, G. (1987) Z.
Metallkde., 78, 535.

Jansson, B. (1984a) ‘*A general method for calculating phase equilibria under different types
of conditions’’, TRITA-MAC-0233, Division of Physical Metallurgy, Royal Institute of
Technology, Stockholm, Sweden.

Jansson, B. (1984b) ‘‘Evaluation of parameters in thermochemical models using different
types of experimental data simultaneously”, TRITA-MAC-0234, Division of Physical
Metallurgy, Royal Institute of Technology, Stockholm, Sweden.

Kandiner, H. J. and Brinkley, S. R. (1950) Ind. Eng. Chem., 42, 850.

Katayama, I., Nakayama, J.-I., Nakai, T. and Kozuka, Z. (1987) Trans JIM, 28, 129.

Kattner, U. R., Boettinger, W. J. and Coriell, S. R. (1996) Z. Metallkde., 87, 522.

Kaufman, L. and Bernstein, H. (1970) Computer Calculation of Phase Diagrams (Academic
Press, New York).

Kerimov, I. G., Mamedov, K. K., Mekhtiev, M. I. and Kostryukov, V. N. (1971) J. Phys.
Chem., 45, 1118.

Klemm, W. and Vogel, H. U. V. (1934) Z. Anorg. Chem., 219, 45.

K6nigsberger, E and Eriksson, G. (1995) CALPHAD, 19, 207.

Krieger, F. G. and White, W. B. (1948) J. Chem. Phys., 16, 358.

Kuliev, A. A., Babanly, M. B. and Kagrammanian, S. G. (1976) Azerb. Khim. Zh., 2, 113.

Lukas, H. L., Henig, E. Th. and Zimmerman, B. (1977) CALPHAD, 1, 225.

Lukas, H. L., Weiss, J. and Henig, E.-Th. (1982) CALPHAD, 6, 229.

Lukas, H. L. and Fries, S. G. (1992) J. Phase Equilibria, 13, 532.

Marquardt, D, W. (1963) SIAM J., 11, 431.

Meijering, J. L. (1957) Acta Met., 5, 257.

Mills, K. C. (1974) ‘‘Thermodynamic Data for Inorganic Sulfides, Selenides and Tellurides’”
(Butterworth, London).

Newman, P. C., Brice, J. C. and Wright, H. C. (1961) Philips Res. Rept., 16, 41.

Oh, C.-S. and Lee, D. N. (1992) CALPHAD, 16, 317.

Powell, M. J. D. (1965) Comput. J., 7, 303.

Predel, B., Piehi, J. and Pool, M. J. (1975) Z. Metallkde., 66, 268.

===========
296 N. Saunders and A. P. Miodownik

Said, H. and Castanet, R. (1979) J. Less Common Metals, 68, 213.

Saunders, N. (1995) Phil. Trans. R. Soc. (Lond,) A, 351, 543.

Shunk, F. A. (1969) Constitution of Binary Alloys, 2nd Supplement (McGraw-Hill, New
York).

Srikanth, S. and Jacob, K. T. (1989) Thermochimica Acta, 153, 27.

Sundman, B. (1991) in User Aspects of Phase Diagrams, ed. Hayes, F. H. (Inst. Metals,
London), p. 130.

Thompson, W. T., Eriksson, G., Pelton, A. D. and Bale, C. W. (1988) Proc, Met. Soc. CIM,
11, 87.

Tschirer, K.-U., Garlipp, B. and Rentzsch, R. (1986) Z. Metallkde., 77, 811.

White, W. B., Johnson, S. M. and White, W. B. (1958) J. Chem. Phys., 28, 751.

Wobst, M. (1971) Scripta Met., 5, 583.

Zimmerman, B. (1976) Ph.D. Thesis, University of Stuttgart, Germany.
