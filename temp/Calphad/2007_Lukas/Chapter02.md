2

2.1

2.1.1

Basis

Thermodynamics

A short overview on the rules of thermodynamics shall be given here, with special
emphasis on their consequences for computer calculations. This part will not replace a
textbook on thermodynamics, but shall help the reader to remember its rules and maybe
present them in a more practically useful way, which facilitates the understanding of
thermodynamic calculations.

Thermodynamics deals with energy and the transformation of energy in various ways.
In thermodynamics all rules are deduced from three principal laws, two of which are based
on axioms expressing everyday experiences. Even though these laws are very simple,
they have many important consequences.

Thermodynamics can strictly be applied only to systems that are at equilibrium,
ie. in a state that does not change with time. As noted in the introduction, the
thermodynamic models can be extrapolated outside the equilibrium state and provide
essential information on thermodynamic quantities for simulations of time-dependent
transformations of systems.

The equation of state

The concept of thermodynamic state must be introduced before beginning with the
principal laws. This can be done by invoking the principle of the “equation of state.”
This is connected with the introduction of temperature as a measurable quantity. If
pressure-volume work is the only work considered, then one can state that in a homoge-
neous unary system the state is defined by two variables. Of the three variables temperature
T, pressure p, and volume V in a unary system, only two are independent, i.e. there exists
a condition

F(T, p, V) =0 (2.1)
which means that one of the three variables is determined by the other two:

V=fT.p);  T=f(V.p); or p=f(T,V) (2.2)

===========
Basis

A unary system consists of a single component, either an element from the periodic
table or a molecule that will not form any other molecules under the conditions considered.
For the definitions of the terms “homogeneous,” “system,” etc., any general textbook on
thermodynamics, for example Hillert et al. (1998), can be consulted.

For each additional kind of work considered, e.g. magnetic or electric, an additional
variable is necessary to define the state. Nevertheless, the above consideration is very
useful and, if the pressure dependence can be neglected, the state functions of pure
substances (unary phases) are functions of the temperature only.

For practical reasons a “state” may be defined for inhomogeneous systems, but that
can be taken as a simplified notation for the sum or integral of (eventually infinitesimally
small) homogeneous systems, for each of which the state has to be defined separately.

To define the state of non-unary (binary, ternary, ... ) systems, one needs additional
variables, for example the amounts of the components. These may be replaced by mole-
or mass-fractions together with the total amount.

The first law of thermodynamics

This law is derived from the axiom of conservation of energy. A formulation well suited
for our purpose is the following: the sum of the heat and work transferred to an otherwise
closed system defines a function not depending on the way in which this transfer took
place. The function defined in this way is called the internal energy U. A “closed system”
means a system that does not exchange any heat, work, or matter with its surrounding.
Besides constant internal energy U, it has constant volume V and a constant amount of
matter (expressed as constant amounts N, of different components i). All these quantities
depend only on the “state” of the system and they are called state variables or state
functions. The concept of state functions is very important in thermodynamics. A feature
of the internal energy U, which must be kept in mind for numerical calculations, is that
only differences between the values of this function for two well-defined states have a
physical meaning. No absolute value of U can be defined.

If the system is opened and either heat, g, or work, w, is transferred to it from the
surroundings, the above rule can be formulated in terms of a change of the internal
energy:

AU =q+w (2.3)

Neither ¢ nor w is itself a state variable. Transferring either only heat or only work
may be different ways of bringing about the same change of state.

The second law of thermodynamics

This law is derived from the axiom that a complete conversion of heat to work is not
possible. It may be formulated as follows: a function of state, called entropy and denoted
S, can be defined, which can increase, but never decrease, in a closed system. The state

===========
2.1 Thermodynamics 9

in which the entropy of the closed system has its maximum is the equilibrium state.
No further change of state can happen in this system as long as it remains closed.

The difference between the entropies of two well-defined states of a system (that is
not closed) is defined by the integral

state 2 /
S,-S,= (2) (2.4)

   

state 1 T

dQ is the infinitesimal amount of heat transferred to the system on the way from
state 1 to state 2. The subscript “rev” indicates that the path from state 1 to state 2
must be reversible, which means that it is restricted to a sequence of equilibrium states.
On going in non-reversible ways from state | to state 2, some work is added instead of
heat. All real changes of state are irreversible, but a reversible change of state may be
simulated by a Gedankenexperiment, i.e., an experiment that one may think of doing, but
which it is impossible to do in reality.

The third law of thermodynamics

This law is derived from the axiom that it is impossible to reach the temperature of 0K.
This temperature can be approached only asymptotically. A consequence of this axiom
is that the change in entropy of a reversible reaction approaches 0 when the reaction
temperature approaches 0K. By virtue of this law an absolute value can be defined for
the state function entropy, S, in contrast to the internal energy U. By convention S is set
to zero at OK.

Definition of some terms and symbols

A number of symbols will be used and the most important are summarized here. In most
cases they refer to just one phase. Whenever more than one phase is involved, a superscript
like @ or B will be used to distinguish the phases involved. A superscript tot will be used
when it is emphasized that the symbol refers to the total value for the system, summed
over all phases. A phase is distinguished by its crystal structure (see section 2.2), and at
equilibrium its composition is homogeneous in space. The gas, liquid, and the amorphous
or glass phase are also phases, even though they have no crystal structure. Names of
phases are discussed in section 8.4.

The term “constituent” means any species that can be treated as an independent entity
to describe the constitution of a phase, for example molecules in a gas or a defect in a

 

crystalline phase; see section 5.3.

the absolute temperature.

the gas constant, 8.31451 Jmol~! K~!.
the pressure.

the volume.

the heat.

the number of moles of component i.

ZO<cs P48

===========
2.1.6

Basis

N the total number of moles, N = D/L, Nj.

Nx Avogadro’s number, 6.023 x 10” atoms per mole.

x; the mole fraction of component i, x; = N,/N.

y; _ the fraction of constituent 7. The sum of the constituent fractions is unity; however,
since y, depends on the solution model for the phase, there may be more constituents
than components, with the consequence that there is no general relation between
the constituent fractions and the mole fractions.

Y _ short for denoting the constitution, i-e., all constituent fractions in a phase.

G _ the total Gibbs energy of a system.

G,, the Gibbs energy per mole of components of a system.
G® the Gibbs energy per mole of components of phase 0.
G® the partial Gibbs energy of component i in phase 0.
°G? the Gibbs energy for the pure component i in phase 0.

b, the chemical potential of component i.

a, _ the activity of component i, a; = exp[u;/(RT)]-

There are often several specifications to these symbols placed as superscripts and
subscripts. The superscript is reserved for the phase, power, or sublattice indication.
As subscript one can have the normalization “m” or the specification of a component
or other things. The “pre”-superscript is used to specify that the symbol is for a pure
element, “°”, an excess quantity “"” or anything else that does not fit as a subscript.

Equilibrium conditions and characteristic features

A first condition of equilibrium is that all parts of a system have the same tempera-
ture and the same pressure. Inhomogeneities at equilibrium may occur only on having
different “phases,” each of which, however, must be homogeneous in itself. This is a
direct consequence of the second law. A system with a temperature gradient may be
simplified by dividing it into hotter and colder parts. By transferring heat from a hotter
part to a colder part, according to Eq. (2.4) the entropy loss in the hotter part is less
than the entropy gain in the colder part, and thus the total entropy of the system is
increased. Similarly, equilibration of composition gradients increases entropy. This can
be shown by “van ’t Hoff’s equilibrium box,” as is explained in most textbooks on
thermodynamics.

Experimentally, pressure differences can be maintained for quasi-infinite times and
thus equilibrium with different pressures inside a system would seem possible. However,
such a pressure barrier means that the system is divided into parts forming independent
closed systems. Considering it as a single closed system implies that the pressure barrier
can be opened.

Systems in equilibrium have single scalar values for temperature and pressure, the
temperature and pressure of the system. A general system, in contrast, may have a
temperature and a pressure field, i.e., temperature and pressure may vary with coordinates
in space and the expression “temperature of the system” would be meaningless.

 

 

 

===========
2.1 Thermodynamics 11

In an open system the differential of the internal energy can be expressed as a sum of
products of an intensive variable and the differential of its “conjugate” extensive variable:

dU = T dS —pdV+> dN, (2.5)

The conjugate pairs of an intensive and an extensive variable are thus temperature
and entropy, T and S, negative pressure and volume, —p and V, as well as the chemical
potential and amount of component i, 4; and N,.

Dividing Eq. (2.5) by T and exchanging the left-hand side with the first term on the
right-hand side gives another series of conjugate pairs of variables:

1 "
ds = =du+2av-y Man, (2.6)
T or

 

with the conjugate pairs 1/7, U; p/T, V; and q;/T, N,.

From section 2.1.3, the equilibrium condition can be formulated as follows: in a
closed system equilibrium is reached when the entropy reaches its maximal value. This
formulation is difficult to use practically because a “closed system” is very difficult to
realize experimentally, since it must have constant internal energy, constant volume, and
constant amounts of components.

However, under other conditions (in non-closed systems), one or more intensive
variables may be kept constant. If the temperature is kept constant, then the internal
energy U is no longer constant, since heat or work has to be exchanged with the sur-
roundings in order to keep the temperature constant. The role of being kept constant is
thus taken away from U and given to its “conjugate intensive variable,” which is 1/T.
Then the function which has a maximum at equilibrium is the state function derived by a
Laplace transformation from the entropy by subtracting the product of these conjugated
extensive and intensive variables, see for example Callen (1985) or Hillert et al. (1998).
This leads to Massieu’s and Planck’s function (Table 2.1).

In practice another series of state functions, starting with the internal energy U, is
preferred. The other members of this series are formed by Laplace transformations using
the conjugate pairs of Eq. (2.5). For U the equilibrium condition is formulated as follows:
at constant values of entropy, volume, and amounts of the components, equilibrium is
characterized by a minimum of the internal energy. Because the sign of this series of
functions is defined to be opposite to that of S, VY, or ®, these state functions have a
minimum at the equilibrium state. The state variables which have to be kept constant in
searching for the minimum are called characteristic state variables. They are given in the
last column of Table 2.1.

A state function in which all the characteristic variables are intensive variables must
always be zero. It is called the Gibbs—Duhem equation. At least one extensive variable
is necessary in order for us to be able to distinguish the “system” from its surroundings
or, in other words, to define the size of the system.

 

===========
12

2.1.7

Basis

Table 2.1 State functions having an extremum at equilibrium, if the characteristic state variables
are kept constant

 

 

 

 

  

 

Name Symbol or definition Characteristic state variables
Entropy U v N,
Massieu’s function S—U/T 1/T v N,
Planck’s function ®=S-U/T—p-V/T 1/T p/T N,
Internal energy U Ss V N,
Enthalpy H=U+p-V Ss —p N,
Helmholtz free energy F=U-T-S T v N,
Gibbs energy G=U+p-V-T-S T =p N,
Grand potential —p:-V=U-T-S—Y\p;-N, T Vv By;
Gibbs—Duhem equation O0=Utp-V-T-S- 1, N, T P H,

 

 

 

The most commonly used of these functions is the Gibbs energy, G, and, using it,
the equilibrium conditions are explicitly specified: in an isothermal isobaric system with
constant amounts of all components, the equilibrium is reached when the Gibbs energy
reaches its minimal value.

 

The function enthalpy, H, is often used in evaluating calorimetric measurements
because its change under isobaric conditions is, with few exceptions, equal to the heat
received, AQ, if this change is performed in a reversible way. Thus, for isobaric changes
of state Eq. (2.4) results in

ce 2 (=) p =constant @7)

state 1 T

 

Functions of state

In the preceding section several functions were mentioned. The values of all these func-
tions are defined if the “state” of a system is defined. Therefore they are called state
functions or state variables. There are two classes of state variables, the “extensive” ones,
the values of which are proportional to the size of the system, and the “intensive” ones,
which at equilibrium have the same value everywhere inside a system. Extensive state
variables include the volume, V, the number of moles, N, the number of moles of com-
ponent i, N;, the internal energy, U, the entropy, S, the Gibbs energy, G, and Planck’s
function, &. Some intensive state variables are the pressure, p, the chemical potential of
component i, j4;, the temperature, 7, and the variable ,/T.

Extensive variables depend on the size of a system; they must be distinguished from
the “integral molar” functions, which are examples of a more general class of functions,
namely the “quotients of extensive variables.” These are independent of the size of the
system, but, in contrast to the intensive variables, have different values in different phases
of the same equilibrium. Examples of this type of state variables or state functions are
the molar volume, V/N, the molar Gibbs energy, G/N, the mole fractions x, = N;,/N, the
molar entropy, S/N, and the Gibbs energy per volume, G/V. The symbol G initially is
reserved for the extensive variable “Gibbs energy of the system” (measured in joules, J).

   

===========
2.1 Thermodynamics 13

In the literature, however, very often it is used instead of G/N or G,, for the “integral
molar Gibbs energy,” which is a quotient of extensive variables and is measured in J mol”.

Besides the “integral molar” quantities Z/N, there are “partial molar” quantities defined
as dZ/AN,, where Z represents any extensive function of state and the partial derivative
is taken at constant values of the other characteristic variables. The partial Gibbs energy
thus defined as the partial derivative of the total Gibbs energy with respect to the
amount of component i, (9G/AN,)y, 7.p: is identical to the chemical potential 4, which
is the intensive state variable conjugate to the amount of component i. 4; can also be
obtained as the partial derivative of the total enthalpy H with respect to the amount
of component i, (0H/AN,)y,s.»» but taken at constant entropy S, p, and Nj (j # i).
This, however, is less interesting, because it is difficult to perform an experiment at
constant S, p, and N;.

Gibbs’ phase rule

The number of independent state variables in a system determines the maximum number
of phases that can be stable simultaneously. Gibbs was the first to formulate this and it
is known as Gibbs’ phase rule:

f=ct2-p (2.8)

where f is the degree of freedom, c is the number of components, and p is the number
of stable phases. The number 2 represents the state variables T and p, since they appear
as state variables in all thermodynamic systems. If there are types of work other than pV
work, for example electric or magnetic work, there are additional state variables and the
degree of freedom increases by one for each additional type of work.

If either T or p is fixed, the 2 is reduced to 1. If both T and p are fixed, the 2 is
reduced to zero. Thus, in a system with one component at fixed T and p, just a single
stable phase can exist. If T or p is variable, one or two stable phases can exist, and if
there are two phases stable the degree of freedom is zero, i.e., this can occur only at a
single value of T or p. If both T and p are variable in a single-component system, then at
most three phases can be stable and this can happen only at a specific value of each of T
and p, and thus is called an invariant equilibrium. For example, the triple point of H,O,
at which ice, water, and vapor are stable simultaneously, is an invariant equilibrium. If
there are two phases stable in a unary system, the degree of freedom is | and it is called
a monovariant equilibrium. Here T can be expressed as a function of p or vice versa,
represented as a one-dimensional curve in a diagram. The T—p diagram for pure Fe is
shown in Fig. 2.6(a) later.

Most of the diagrams of binary or higher-order systems discussed below are drawn
for a fixed value of pressure and thus the maximum number of stable phases is three
in a binary system, four in a ternary system, etc. In an isothermal section of a ternary
system, i.e., at constant pressure and temperature, the maximum number of phases is
again three. In a phase diagram with potentials (intensive state variables) as axes the
degree of freedom defines the number of conditions that can be changed simultaneously

 

===========
14

Basis

(at least by a small amount). Thus, for invariant equilibria no condition can be changed,
for monovariant equilibria one condition can be changed. In a binary system at fixed
pressure the degree of freedom is two only in single-phase regions. In a binary diagram
with a potential plotted versus temperature single-phase regions appear as areas and two-
phase regions as lines, see Fig. 2.6(b) later. In a composition-temperature diagram the
two-phase regions also appear as areas, but the degree of freedom is only one there, as
shown in Fig. 2.6(c). This reflects the fact that phase compositions but not phase amounts
are counted as variables in Gibbs’ phase rule.

The degree of freedom is an important quantity when determining the number of
conditions necessary to define the equilibrium, as will be discussed in section 2.3.2.

Statistical thermodynamics

In statistical thermodynamics the rules of phenomenological thermodynamics are
explained as resulting from the mechanics of all the atoms or molecules present in matter.
The main topic not included in mechanics itself is the statistical explanation of the entropy.
The entropy was explained by Boltzmann as being given by

 

S=k-In(w) (2.9)

where k = R/N, is Boltzmann’s constant and W is the number of different microscopic
states leading to the same macroscopic state. The assumptions necessary in order to
enumerate W were more clearly specified by quantum mechanics.

Statistical thermodynamics is the physical background of modeling expressions to
describe the Gibbs energy of a phase. The energy terms of the models are usually defined
by energies of formation of molecules or building units of crystal lattices. The entropy
terms are divided into vibrational terms, which are treated similarly to the energy terms,
and entropies of mixing.

Statistical treatment of vibrational entropy has been used successfully for two topics,
the calculation of the entropy of molecules in the gas phase, where the possible states
of rotation, vibration, and excitation can be related to spectroscopical experimental data,
and to low-temperature heat capacities of solids. The latter are normally not explicitly
used in the assessments described here, but appear in integrated form as entropies at the
“standard temperature” (298.15 K).

The entropy of mixing in many of the models in chapter 5 is derived from the following
question: what is the increase in entropy due to Boltzmann’s law, if two or more kinds of
different atoms are randomly mixed at N fixed places? Let N, and N, be the numbers of
A and B species randomly mixed at N = N, + Ng places. Then the number W of possible
different configurations is

N!

— 2
Nal Ng! (2.10)

===========
2.1.10

2.1 Thermodynamics 15

After using Stirling’s formula In(N!) © N- In(N) —N, neglecting —N for large N,
identifying N,/N and Ng/N with the mole fractions x, and xg and taking Avogadro’s
number for N, kN = R, it follows that


This formula is used extensively in chapter 5. Since chapter 5 deals with applied
statistical thermodynamics, no further details are mentioned here. For a better understand-
ing of other features of statistical thermodynamics used in the modeling, textbooks on
statistical thermodynamics may be consulted.

Important thermodynamic relations

Only very simple thermodynamics is needed in order to describe the models. Since most
thermodynamic data are measured at known temperature, pressure, and composition,
it is convenient to choose the Gibbs energy, denoted G, as the basic modeling func-
tion. If the Gibbs energy is known, one may derive other quantities from this in the
following way:

 

 

Gibbs energy G=G(T, p,N,)
entropy (“)
aT),
0G
enthalpy H=G+TS=G-T =)
oF ),,»,
dG
volume v=(2
Op Jr,
chemical potential of component i ) (2.12)
Tigi
heat capacit! #6
capacity ?),.
PN
. &G
thermal expansion —
ap aT ),
1/(&G
isothermal compressibility c=--(“2
V\ AP? Jr,
bulk modulus B=1/«

All of the above quantities are valid for all thermodynamic systems. The partial
derivatives with respect to the characteristic variables of G are taken at constant values of
all the other characteristic variables. In solutions one may additionally define the partial
Gibbs energy for component i:

6=(4) G#) 2.13)

 

ON;

===========
16

Basis

In solution modeling we will use the Gibbs energy per mole of formula units,
Gy =G/N (2.14)

To use the above relations for molar functions, the derivatives are taken from the molar
Gibbs energy G,, at constant values of the mole fractions x; = N,/N and constant total
amount N = | mol.

In modeling the thermodynamic properties of a system, one must model each phase
in the system separately. The properties of the system at equilibrium are then functions
of the properties of the individual phases, if surface effects can be neglected.

Since many models yield expressions for the molar Gibbs energy as a function of mole
fractions, it is useful to transform Eq. (2.13) into a function of these quantities:

Fa

The molar Gibbs energy of a phase is often formulated not as a function of the mole
fractions x;, but rather, for example, as a function of the constituent fractions y,. In
this case derivatives with respect to temperature used in the above relations must be

calculated as
8Gu\ (Gm IGm dy; .
(GP), Ge), 2G), Gar), #29 9
PX psy TN OG J repre Poe

This equation means that the entropy and heat capacity have a contribution from the
speciation of the phase; see Fig. 9.8(b) later.
The second derivative of the Gibbs energy with respect to mole fractions is

 

Z ) k#i, 1A) (2.15)

T.p.xy

 

 

 

 

  

(k#i, k#D (2.17)

 

The second derivatives are used for the thermodynamic factor in diffusion calculations
and they are also used to calculate the stability function. A phase is stable against
fluctuations in its compositions if det|Q| > 0. In some systems the stability function
changes sign and the locus of det|Q| = 0 is called the spinodal. If the phase composition
is inside this spinodal, i.e., det|Q| <0, it can lower its Gibbs energy spontaneously by
decomposing into two phases with the same structure but different compositions across a
miscibility gap. A “composition-set number” is commonly used as a suffix, e.g., bec#2,
to a phase that can be stable with two different compositions at the same equilibrium. In
Figs. 2.1(a)-(c) the Gibbs energy, chemical potential, and stability function as functions
of the mole fraction of Cr are shown for the miscibility gap in the Cr—Fe system at 600 K,
using data from Andersson and Sundman (1987). The phase diagram for Cr—Fe is shown
in Fig. 5.4(a) later.

 

 

 

===========
2.2

2.2.1

2.2 Crystallography

 

Gibbs energy (kJ mot")
=

 

 

 

0 02 04 06 08 1.0
Mole fraction Cr

(a)

 

s

 

Q
hoo

 

eo bk

 

Chemical potential of Cr (kJ mol~')

4
3

0 02 04 06 08 1.0
Mole fraction Cr

(b)

 

Stability function (kJ mol)

 

 

 

02 04 06 08 1.0
Mole fraction Cr

(c)

A?

17

The Gibbs-energy curve for the bec phase in the
Cr-Fe system at 600K. The stable equilibrium
for compositions between the A symbols (at the
common tangent) consists of two bcc phases, one
with mainly Fe and the other with mainly Cr.
The spinodal points where the stability function
is zero are marked with 0 symbols on the verti-
cal dashed lines. For compositions between the
dashed lines, the bec phase may decompose spin-
odally, i.e. without nucleation, to the two equi-
librium compositions.

The chemical potential of Cr for the Gibbs-
The equilibrium composi-
tions are marked with A symbols and have the

energy curve in (a).

same chemical potential for both compositions.
The spinodal compositions are indicated by the
dashed lines and coincide with the maxima and
minima of the chemical-potential curve.

The stability function det|Q| for the Gibbs-

energy curve in (a). This curve pe through

 

zero at the spinodal compositions, which are in-
dicated by the dashed lines. The second deriva-
tives of the Gibbs energy are also the “thermo-
dynamic factor” in the diffusion coefficient. The
strong cusp in the stability function originates

 

  

from the ferromagnetic transition.

Figure 2.1. The Gibbs-energy curve for the bec phase in Cr-Fe at 600 K and its first and second
derivatives with respect to composition.

Crystallography

Connection with thermodynamics

The modeling of thermodynamic functions of solid phases must be done in a manner
closely related to the crystal structure, because thermodynamic modeling is the application

===========
18

2.2.2

Basis

of statistical thermodynamics and the crystal structure is one of the bases which must be
considered in statistical treatment of solid phases. In particular, the sublattices defined in
the compound-energy formalism in section 5.5.1 have to be related to crystallographic
sublattices. The occupation of crystallographic positions by constituents defined in this
formalism can have some physical reality only if it has crystallographic reality.

The terminology of crystallography, insofar as it is useful for the modeling of thermo-
dynamic functions, shall be summarized here. It is used in section 6.2.5.5 and chapter 9.
For a deeper review of crystallography, the comprehensive treatment by Ferro and Saccone
(1996) is recommended.

Crystal symmetry

In crystalline solids the atoms are arranged in a “lattice,” which exhibits the same pattern
of atoms periodically in three dimensions. Three nonplanar vectors selected in accord
with the spatial periodicity define the “unit cell.” Since sums and differences of these
vectors are also periods of the lattice, the unit cell is not uniquely defined. The smallest
possible unit cell is called the “primitive unit cell.”

The primitive unit cell is not uniquely defined either, since a parallelepiped with the
vectors (@+5), b, and @ has the same volume as a parallelepiped with the vectors @,
b, and ¢. The commonly used unit cell is selected according to symmetry. The periodic
lattice usually contains a periodic set of “symmetry elements” (rotation axes, screw axes,
mirror planes, glide mirror planes, centers of symmetry).

The number of possible combinations of symmetry elements in a periodic lattice is
limited to 230 different “space groups.” The space groups are ordered according to the
“erystal systems,” which are defined in terms of the “highest” symmetry element. Also
the coordinate system of the unit cell is chosen according to the crystal system (Table 2.2).

The coordinates given in Table 2.2 do not always allow one to describe a prim-
itive unit cell. In the cubic coordinate system, for example, the vectors (@+5)/2,
(@+¢)/2, and (b+0)/2 may define a primitive unit cell with one quarter of the vol-
ume of the unit cell with three perpendicular equal vectors a, b, and @. This case is
called “face-centered cubic” (fcc). After these differences, the 14 “Bravais lattices”
are distinguished: primitive cubic, body-centered cubic (bec), face-centered cubic (fcc),
primitive tetragonal, body-centered tetragonal (bet), primitive hexagonal, rhombohedral,
primitive orthorhombic, body-centered orthorhombic, one-face-centered orthorhombic,
all-faces-centered orthorhombic, primitive monoclinic, face-centered monoclinic, and
(primitive) triclinic.

The position of an atom inside the unit cell is given by three parameters, x, y, and
z, giving fractions of the unit cell parameters a, b, and c, respectively. The symmetry
elements of the space group for any position x, y,z produce images at several other
positions, called “equipoints.” For special positions, for example on a mirror plane or on a
rotation axis, several of the equipoints coincide. These special positions are distinguished
by the Wyckoff notation. The coordinates of all equivalent general and special positions
of all space groups are given in the International Tables for X-Ray Crystallography
(Henry and Lonsdale, 1965) or can be obtained from the website of the International

 

===========
2.2 Crystallography 19

Table 2.2. Highest symmetry elements and coordinate systems for the crystal systems

 

 

 

Crystal system Symmetry element Coordinate system
Cubic 4- and 3-fold axes Three perpendicular equal axes
Tetragonal One 4-fold axis Three perpendicular axes, two equal
Hexagonal One 3- or 6-fold axis Two equal axes at 120° and

a third one perpendicular to them
Orthorhombic Three perpendicular 2-fold axes Three unequal perpendicular axes
Monoclinic One 2-fold axis Two oblique unequal axes and

one perpendicular to them
Triclinic No symmetry axis Three unequal oblique axes

 

 

Table 2.3. Example of a space group description, (C 2/m 2/c 2,/a), Cmca, D'8

 

 

 

  

Number Wyckoff Point
of sites notation symmetry Equivalent positions 00.0; 440+
16 (g) 1 XYZ IT
XYZ XYZ
8 / m O.y,z; 0, 9,25
8 (e) 2 PME ET
8 (d) 2 0,0; 3,0, 0: Ly
8 ©) I pp PPO Pah
4 (b) 2/m $,0,0; 4.4.5
4 (a) 2/m 0,0,0; 0, 4,4

 

 

Union of Crystallography (http://www.iucr.org). Another useful website is that of the
Bilbao crystallographic server (http://www.cryst.ehu.es).

In Table 2.3, as an example, all the symmetry elements and equipoints of space group
Cmca, D3}, with their Wyckoff notations are given. x is used as an abbreviation of 1 — x.
There are three different notations for the same space group: the “full Herrmann—Mauguin
notation,” C 2/m 2/c 2,/a, shows most of the symmetry elements: C-centered Bravais
lattice, two-fold axes (2) in three directions, one of them a screw axis (2,), mirror planes
(m) and glide planes (c, a) with glide vectors ¢/2 and G/2 perpendicular to the three axes,
respectively. The “abbreviated Herrmann—Mauguin notation,” Cmca, shows all symmetry
elements necessary to identify the space group. The Schénflies symbol, D3$, is based on
the macroscopic symmetry or “point symmetry,” D,,, with the counter “18.” In the “point
symmetry” mirror planes are not distinguished from glide planes, and screw axes and
rotation axes are treated as equivalent, i.e. only the macroscopic symmetry is taken into
account, neglecting details on the microscopic scale of atomic distances.

The symmetry elements in Henry and Lonsdale (1965) are given by figures and in
Table 2.4 all these symmetry elements are tabulated for the space group Cmca.

 

===========
20

2.2.3
2.2.3.1

Basis

Table 2.4 Symmetry elements in space group Cmca, D's

 

 

 

  

 

 

Bravais lattice Orthorhombic, C-centered

Symmetry-center 000 440 404 of4 442 004 Of0 400
atx yes g9 930 953 Gg; G33 473 730 490
Two-fold rotational axis, yz= 00 40 of 33

Mirror plane, x = 0 +

Glide plane, b/2. t 3

Two-fold rotational axis, xz= 14 13 31 33

Glide plane, 2/2, } 3

Glide plane, (@+2)/2, y= 0 +

Two-fold screw axis, x y to 3 th 3s of OF) GE 3
Glide plane, a/2, <= t 3

Glide plane, 6/2, z= ; 3

 

 

Crystal structures
Definition

A “crystal structure” is described by giving the space group, the lattice parameters
(lengths of axes of the unit cell and angles between them), the number of constituents
per unit cell, the coordinates of one site of each set of equivalent positions, and the type
of constituent occupying each such site. An example is given in Table 2.5.

The crystal structures form families of (more or less closely) related structures. The
main argument of relationship is similarity of the geometry of the coordination of all the
atoms by other (like and unlike) atoms. For binary metallic phases a good classification
is given in Schubert (1964). A more recent review of crystal-structure classification is
the series of three papers by Daams et al. (1992) and Daams and Villars (1993, 1994).
It has to be mentioned, however, that the symmetry (space group, Bravais lattice, etc.)
does not show these relationships. It may be different for closely related structures and
identical for very different structures.

There exists computer software that can visualize the structures and make understand-
ing of the crystal structure and its use for thermodynamic modeling much easier.

Table 2.5 An example of a crystal-structure description

 

 

PdSn,-type (Schubert ef al. 1959) Pearson symbol: 0C32
Space group: Cmea (equivalent to Bbam)
Lattice parameters: a=17l7pm, b=646pm, c=649pm
8 Pd in 8(d) xyz=0.084 0 0
8 Sn in 8(f) 0.17 0.33
16 Sn in 16(g) 0.168 0.33 0.17

 

 

 

===========
2.2.3.2

2.2.3.3

2.2 Crystallography 21

Nomenclature of crystal structures

Several nomenclature systems for the identification of crystal structures are in use.
The “prototype” is the name of the phase for which this crystal structure was
first determined. The “Strukturbericht” notation gave letters and counters to crystal
structures in the sequence in which they were classified. This classification stopped
around 1950 and thus this nomenclature does not cover all the crystal structures
determined later.

The “Pearson symbol” is a short description of the structure, denoting the Bravais
lattice by two letters (c, t, h, 0, m, a for cubic, tetragonal, hexagonal, orthorhombic, mono-
clinic or triclinic; P, I, F, C, R for primitive, body-centered, face-centered, C-centered or
rhombohedral) and the number of atoms in the unit cell. Since these two specifications
may be the same for different crystal structures, this nomenclature is not unique, but
reflects explicitly the most important details of the crystal structure.

Mineral names very often are uniquely connected with a crystal structure and used
as a name for this structure type, like “spinel.”

In some thermodynamic databases the phase names used for several important crystal
structures do not belong to any of the above nomenclature systems. Some of these
names are ambiguous. The names fec and bee were initially designated for Bravais
lattices (face-centered cubic and body-centered cubic), but they are very commonly used
as names for the crystal structures denoted by prototype, Strukturbericht, and Pearson
symbols as Cu-type, Al, cF4, and W-type, A2, cI2, respectively. Even derivatives of
these structures are sometimes denoted by these two names, although they no longer have
the corresponding Bravais lattice. For example “ordered bec” is used for the CsCl-type
(B2, cP2) and FeAl,-type (cF16) structures having cubic primitive or face-centered cubic
Bravais lattices, respectively; “ordered fec” is in use for the CuAu-type (LI, tP2) and
Cu,;Au-type (L1,, cP4) structures having tetragonal or cubic primitive Bravais lattices
respectively.

The nomenclature systems are compared for a few important crystal structures in
Table 2.6. A more detailed table is given in Westbrook and Fleischer (1995).

Sublattice modeling

The crystal structure of a phase is very important for modeling its Gibbs energy by statis-
tical thermodynamics, for example in the compound energy formalism (see section 5.5.1).
All atoms in equivalent positions have the same coordination of neighboring atom:
Therefore each set of equivalent positions (sites belonging to the same Wyckoff po
tion) may be treated as a “sublattice.” This means that, if one of these atoms can
be substituted by another one, the whole set of equivalent positions can be randomly
substituted. To simplify the thermodynamic modeling, several sets of equivalent posi-
tions with similar coordination may be combined and treated as a single sublattice. The
contrary, however, namely treating atoms of the same set of equivalent positions differ-
ently in the compound energy formalism, is usually not allowed. The chemical ordering,
to be described in section 2.2.3.4, does not contradict this rule,

 

    

 

ince in the ordered

 

===========
22

2.2.3.4

Basis

Table 2.6 Examples for the nomenclature of crystal structures

 

 

 

Prototype Struktur- Pearson Mineral Other

bericht symbol names names
Cu Al cF4 fec (austenite)
Ww A2 cl2 bee (ferrite)
Mg A3 hP2 hep
NaCl BL cF8 Halite,

Periclase (MgO)

CsCl B2 cP2 Ordered bee
Cu,Au LI, cP4 Ordered fee
CuAu Lly 1P2 Ordered fee
Ni,Sn D0j5 hPs Ordered hep
CaF, cl cF12 Fluorite
MgCu, cis cF24 (Cubic) Laves phase
MgZn, cl4 P12 (Hexagonal) Laves phase
MgNi, C36 P24 Laves phase
Diamond A4 cF8 Diamond

 

 

structure the symmetry is diminished, splitting the set of equivalent positions into dif-
ferent ones having also different Wyckoff notations in the space group of the ordered
structure. Inside these Wyckoff positions the substitution has to be treated as identical
for all sites.

There is only one exception to this rule: if several atoms of the set belong to a molecule,
substituting one of them changes the molecule and may prohibit the substitution of the
remaining atoms. For example, if the four O atoms of a SO} ion in a sulfate crystal
structure are on equivalent positions, substituting one of them by S gives a thiosulfate
ion SO;S?-. Random substitution of the O atoms by S atoms would yield ions with
two O atoms substituted, S(S,O,)°~, which do not exist. To describe a solid solution
of sulfate with thiosulfate in the compound energy method, the positions of the whole
anions SO} and S(SO;)*~ should be treated as single positions forming one sublattice.
Similar situations may occur, but less obviously, in other crystal structures with homopolar
bondings, such as silicates, carbides, nitrides etc.

Chemical ordering

Another feature of crystallography needed in modeling of Gibbs energies is the description
of order—disorder transitions, also called superstructure formation. Ordering means in
general that a set of equivalent positions, occupied randomly by different atoms, splits
into two or several different sets of positions, each preferably occupied by one kind of
the different atoms. This is possible only with loss of some of the symmetry elements
of the space group that in the disordered state provide equivalence of the positions. This
loss of symmetry elements may happen in the following ways.

e Without changing the unit cell, just losing sets of mirror planes or glide planes.
An example is hep with interstitials, space group P6,/mmc, with two metal atoms

===========
2.3

2.3.1

2.3 Equilibrium calculations 23

in Wyckoff position 2(c), and two octahedral voids in position 2(a), which can
be occupied by interstitial atoms. Neither position has any variable parameter. By
omitting a set of mirror planes and a set of glide planes the symmetry diminishes to
space group P3m1, whereby the position of the octahedral voids splits into the two
independent positions (a) and 1(b). The position of the metal atoms in this space
group has Wyckoff notation 2(d) with a variable parameter x. If x > 0.25, the voids
in position I(a) become larger than those in 1(b) and may be preferably occupied
by the interstitial atoms, thus reducing the strain energy. The structure now is called
Cr,C-type.

e Diminishing the symmetry may be accompanied by going to a lower crystal system
(cubic + tetragonal, hexagonal > orthorhombic, hexagonal > monoclinic, . .. ).
Examples are the CuAu structure and martensite, in which the ordered phase is
tetragonal, but derived from a cubic disordered phase.

e = The primitive unit cell of the ordered phase is composed of several primitive unit
cells of the disordered phase. The simplest example is the CsCl-type ordering, in
which the cubic unit cell is identical with the primitive unit cell of the ordered phase,
but contains two primitive unit cells of the disordered W-type (bcc) phase, although
the commonly used cubic unit cell is the same in the ordered and disordered states.
A second step of ordering of this type gives the MnCu,Al-type (Heussler phase) or
Fe,Al-type, in which the commonly used cubic unit cell (fcc) contains eight unit
cells of the CsCl-type, i.e., the primitive unit cell is twice as large as that in the
CsCl-type and four times that of the W-type.

A modeling of chemical order, using some simplifications proposed by Bragg and
Williams (1934), is described in section 5.8.4.

Equilibrium calculations

Minimizing the Gibbs energy

In section 2.1.6 various equilibrium conditions were described. Each of these conditions
can be used to calculate an equilibrium, but the most commonly used method is to find
the minimum of the Gibbs energy G at constant values of temperature T, pressure p, and
amounts of components N,. Instead of amounts of the components one may use the mole
fractions, x; = N;,/N, of all but the major component and the total amount N = > N;. The
usage of these conditions for a calculation needs an analytical expression of the molar
Gibbs energy for each phase a, Gé, as a function of these and sometimes also other
internal variables such as the fraction of molecules or site occupancies, generally called
site fractions or constituent fractions.

The Gibbs energy may have several minima compatible with these conditions. That
with the most negative value of G is the “global minimum” and corresponds to the “stable
equilibrium”; the other ones are “local minima” and correspond to “metastable equilib-
ria.” They differ in terms of the phases and their compositions present at equilibrium,
sometimes only by the compositions of the same set of phases.

===========
24

2.3.2

Basis

The above conditions do not yet specify which and how many phases are present.
Analytical expressions of Gibbs energies, however, exist only for phases and thus an
equilibrium calculation can be performed only for selected sets of phases. Thermo-Calc
uses the “driving force,” see section 2.3.6, to search automatically to determine whether
another set of phases has a minimum with a lower value of the Gibbs energy. In BINGSS
it is assumed that experimental equilibrium data are reliable only if the phases present
are known. Thus, the calculated value to be compared with an experimental one must be
an equilibrium involving just the phases present in the experiment. Of course, finally it
must be checked whether, by extrapolation of a phase description, this phase appears to
be stable in areas where experimentally it was found not to be stable.

In chapter 5 analytical expressions for integral molar Gibbs energies of phases, Gf,
are given. The total Gibbs energy is derived from these expressions by summing them
up, multiplied by the fractions or amounts of the phases, m“:

G=Dom". Ge (2.18)

with the constraint m* > 0.

The analytical expressions of the molar Gibbs energies of the phases are expressed
as functions of 7, p, and either the mole fractions x of the components i in this
phase a, or the fractions yt? of constituents k on sublattices / of phase @ (constituent
fractions). The mole fractions x* are definite functions of the site fractions yl”, but
the inverse relation may contain additional variables. The amounts of phases, m“, are
definite functions of the mole fractions x* and the amounts of components N, = N -x?,
expressed by the (generalized) lever rule. The lever rule states that the amount of each
stable phase in the equilibrium multiplied by the mole fraction of the component in
that phase, summed over all stable phases, must be equal to the overall fraction of the
component:

 

Yomext (2.19)

The equilibrium condition may now be written

min(G) = nin( mG (T, p, x" or yt" ») (2.20)

The variables m* and x* or yt ” are usually the unknowns, the values of which have

to be calculated from the conditions of the energetic minimum.

Equilibrium conditions as a set of equations

The minimum of Eq. (2.20) is found either by hill-climbing methods or by setting the
derivatives with respect to the unknowns to zero, but keeping in mind the constraints
interrelating these variables. This set of nonlinear equations is solved for the unknowns
by an appropriate iteration algorithm.

===========
2.3 Equilibrium calculations 25

For the latter method Gibbs gave a formulation in which the constraints relating m*,
xj, and N, were used to eliminate the variables m* and N,:

Ge(T, p.x*) =GE(T,p,.x8) (@= 1... =1,...,p—-1, B=atl,...p) (221)

In equilibrium the partial Gibbs energies, defined in Eq. (2.13), of all components i
in each pair of different phases @ and B are equal. A variation of this formulation of the
equilibrium conditions is that the partial Gibbs energies G# of all phases are identical
to the equilibrium chemical potentials 44;, which are defined as the intensive variables
conjugated to the extensive variables N;. By their definition as derivatives of the total
Gibbs energy with respect to the Nj, they are defined as partial Gibbs energies of the
whole system:

GUT, p.x)=p, (i=l. se, @=1,...,p) (2.22)

Besides the x# in Eq. (2.22), also the 4; now belong to the unknowns to be calculated
from the minimization of the total Gibbs energy.

The formulations Eq. (2.21) and, especially, Eq. (2.22) are very useful, if the G* are
given as functions of the x#, because then all relevant constraints are already included
in the equations. For a stoichiometric phase the equations concerning this phase must be
modified, which will be discussed later.

If the G@ are given as functions of site fractions yi? instead of mole fractions x?,
however, Eqs. (2.22) are difficult to use, because then the constraints interrelating the
x* and the y\' have to be considered. Eriksson (1971) and Hillert (1981) used the
Lagrange-multiplier method to derive a formulation whereby all the variables in Eq. (2.20)
are treated as independent. There are three types of constraints: (1) the total amount of
each component, N,, has to be kept constant; (2) the site fractions in each sublattice sum
up to unity; and (3) the charges of ionic species sum up to zero in each phase:

Ym® Da Ye? -y?—N, = 0 (all components) (2.23)
7 TF
y= 1 =0 (all sublattices) (2.24)
ft
Ya Y ").y? = 0 (all phases with charged species) (2.25)
Te

Each constraint is multiplied by a “Lagrange multiplier,” and added to the total Gibbs
energy in Eg. (2.20) to get a sum L. If all the constraints are satisfied, L is equal to G
and a minimum of L is equivalent to a minimum of the total Gibbs energy G. The a »
are the stoichiometric numbers of component i in species k on sublattice / of phase a,
the a are the fractions of sites of sublattice / referred to all sites of the phase, and
the ve ” are the charges of ionized species k on sublattice / of phase a. The Lagrange
multipliers are treated as additional unknowns. The derivatives of L with respect to the
Lagrange multipliers yield the constraints, but the derivatives of L with respect to the m*

and yr? are now all independent. The Lagrange multipliers of constraints in Eq. (2.23)

===========
26

Basis

were shown to be identical to the chemical potentials 1; (Hillert 1981). The Lagrange
multipliers of Eq. (2.24) and Eq. (2.25) are called A‘: and AS, respectively. Some of
the resulting equations may be simplified by replacing the unknowns A‘ and A% by
a) = MN) /m* and 7 = Af /m*, respectively. It was shown that these quotients remain
finite, even when m* approaches zero (Lukas er al. 1982).

Setting the derivatives of L with respect to the unknowns to zero yields the following
set of equations as equilibrium conditions additionally to Eqs. (2.23), (2.24), and (2.25):

aC

a)
aye?

 

$Y aja) Be? 4) 4 72a = 0 (all species) (2.26)
=
G2 Dw Da Ye? -y? = 0 (all phases) (2.27)
ToT Ck

The set of equations (2.23)—(2.27) is a set of nonlinear equations with the unknowns
m*, y", and the Lagrange multipliers .;, 7, and 7 as well as the variables T, p,
and N,. The latter values have to be kept constant during searching for the minimum,
meaning that no derivatives of the total Gibbs energy or of the function L with respect to
these variables are formed, but nevertheless they may be treated as unknowns according
to the question “at which (constant) values of 7, p, and N, does there exist a solution
for the equilibrium conditions?” The number of independent equations must equal the
number of unknowns. Thus, if any of T, p, and N, are treated as unknowns, some other
conditions must be set, which are explained in section 2.3.5.

These equilibrium conditions are used in Thermo-Calc. In the following text they will
be referred to as “Hillert’s equilibrium conditions.”

If the molar Gibbs energies of the phases are expressed as functions of the mole
fractions x? without considering constituent fractions, as for example in substitutional
solutions, Hillert’s equilibrium conditions reduce to

 

 

= +p,+7* =0 (all components in each phase) (2.28)
GE-Y py -x* = 0 (all phases) (2.29)
Ym". =0 (all components) (2.30)

Yxe-1=0 (all phases) (2.31)

Multiplying the i Eqs. (2.28) for phase a by x/ and subtracting them from Eq. (2.29)
results (keeping in mind that >; x = 1) in

aC

a =0 (all phases) (2.32)
axe

 

 

 

Gu-Da
j

This relation identifies the variable 7* with G& — 7, x* -(dG¢,/dx?) (Hillert 1981).
On replacing 7 in Eq. (2.28) by this expression and using Eq. (2.15), one can obtain
Eq. (2.22).

===========
2.3 Equilibrium calculations 27

The set of equations (2.22), (2.30), and (2.31) is a set of nonlinear equations alter-
native to “Hillert’s equilibrium conditions” if the molar Gibbs energies are expressed
as functions of the mole fractions x‘. In the following, this set will be referred to as
“modified Gibbs equilibrium conditions.” They are used in BINGSS, BINFKT, TERGSS,
and TERFKT.

The further modification of this set in the case of a stoichiometric phase a is now
easy. Since the mole fractions of a stoichiometric phase are not unknown, Egg. (2.28) are
not used and the equation for phase a@ from the set (2.29) is used, because here it is not
used up to eliminate 7°.

For semi-stoichiometric phases, equations intermediate between Eq. (2.22) and
Eq. (2.29) may be formulated. As an example the two equations replacing Eqs. (2.28)
and (2.29) for a line compound with constant mole fraction of A in a ternary system are

 

 

 

wa a, (IG IG ay ye «
G38. (S — TE) ~ +80) tena =0 (2.33)
wa x (2Gin IG ey ya «
Go axe. ine Ok = (26 +28) MexR Ha = 0 (234)

In Thermo-Cale the equations are not modified with respect to the model of the phase,
and, for example, if a quasibinary section of a ternary system is considered, the “extra”
degree of freedom must be removed by assigning an arbitrary activity to the component
that is outside the quasibinary section. For example, in the ternary system Ca—Si-O,
CaO-SiO, is a quasibinary system and, with the components CaO and SiO,, the activity
of O, can be set to an arbitrary value, since all phases in the quasibinary system have
their oxygen contents determined already by the Ca: Si ratio.

In “Hillert’s conditions” as well as in the “modified Gibbs equilibrium conditions”
the number of unknowns is larger than the number of equations by c +2, where c is
the number of components, because, for each unknown, except the c+2 ones N,, T,
and p, there is just one equation. This means that the number of degrees of freedom
is ¢ +2, which looks like a contradiction to Gibbs’ phase rule insofar as the number
of phases is not mentioned. The explanation is that the phase rule is derived from the
set of equations (2.21), from which the variables m* and N, have been eliminated and
a free change of these variables is not counted as a degree of freedom. For example, a
two-phase field in an isobaric binary system is treated in the phase rule as monovariant.
Nevertheless, after fixing the single variable 7, the N, still may be independently changed,
yielding different m*. The success of the phase rule shows that ignoring the variables
m* and N, in counting the number of degrees of freedom has its advantage. In the
above sets this can be done by ignoring the c equations (2.23) or (2.30), respectively,
which are the only ones containing the p+ c variables m* and N,. On losing c+ p
variables and c equations, the number of degrees of freedom changes to c— p+2, in
agreement with the phase rule. This is also a reason why in Eq. (2.26), contrary to Hillert
(1981), A“? and Ag are replaced by zr“ and 7 in order to eliminate m* from these
equations.

To calculate a state of equilibrium, for each degree of freedom an independent condition
must be added to the set of equations, reducing the number of degrees of freedom to

===========
28

2.3.3

Basis

zero. These additional conditions and their purposes will be discussed in section 2.3.5.
In section 2.3.3 the solution of these sets of equations is described.

The Newton-Raphson method

Several methods for solving the sets of equations described in the previous section with
respect to the unknowns are known. In Thermo-Calc, as well as in BINGSS/BINFKT and
TERGSS/TERFKT, the Newton-Raphson iteration method is used, so this method alone
shall be described here.

It is a generalization of Newton’s method for finding the abscissa, where the value of
a function is zero (Fig. 2.2).

At a starting point x, the function f(x) and its derivative df/dx are calculated. The
intersection between the tangent to the function and the x-axis is taken as the next iteration
point and the procedure is repeated until f(x) is below a preselected limit €. The (i+ 1)th
iteration step, x;,;, is calculated from the previous one, x;, by

(i). Ax =—fl%); Xi =x + Ax; (2.35)

Figure 2.2 gives the impression that Newton’s method converges very rapidly. Usually
that is the case, but there exist also cases in which the method diverges. This is explained
in Fig. 2.3 with the function f,(x) = tanh(x). Starting at x, yields a step far to the right
and the following step would be much further to the left. Starting at x,, however, would
lead to convergence.

The function f,(x) in Fig. 2.3 has different solutions for x for the condition f(x) = 0.
Which of them is found depends on the starting value of x. Starting with x, will result

1(x)

 

Figure 2.2. Newton's method.

===========
2.3.4

2.3 Equilibrium calculations 29

A) £9)

x % x % Xe x5

 

Figure 2.3 Divergence, or different solutions, of Newton's method.

in the solution on the left and starting with x, will give the solution on the right. x;
will result in a first step far to the left and will finally result in the solution on the left.
X» may give a first step to the vicinity of x, and thus also will result in the solution
on the left. This illustrates that the influence of the starting value on the result may be
complicated.

The Newton-Raphson method is the extension of Newton’s method to more than one
variable. If, for example, the values of the variables x and y are to be determined, where
two functions, f(x, y) and f,(x, y), are zero, Eq. (2.35) is replaced by the following two
equations:

AG yi)

1 = AC») (2.36)

 

iy = tb ANS Yin = NFAY;

The method is extended similarly to a set of n equations with n unknowns.

Global minimization of the Gibbs energy

All iterative techniques like the Newton-Raphson one need an initial constitution for each
phase in order to find the minimum of the Gibbs energy surface for the given conditions.
If a phase has a miscibility gap and its initial constitution is on the “wrong” side of the
miscibility gap, the phase may be metastable when it should be stable or may become
stable with the wrong composition; see Fig. 2.4.

===========
30

Basis

4500
4000
3500
3000
2500
2000
1500 fec
1000

500

 

bec

Gibbs energy (J mot

 

 

-500
A © 02 04 06 08 1.0
Mole fraction B

 

Figure 2.4. The Gibbs-energy curves for two phases with miscibility gaps. If the initial
constitution of the phases is on the “wrong” side of the miscibility gap when starting the search
for the equilibrium, one may find the metastable equilibrium represented by the upper tangent,
whereas the stable equilibrium is represented by the lower tangent.

 

Miscibility gaps can occur only in solution phases. For a system in which all phases
are compounds with fixed compositions, the equilibrium set of phases is given by the
tangent “hyperplane” defined by the Gibbs energies of a set of compounds constrained
by the given overall composition and with no compound with a Gibbs energy below this
hyperplane. There must be exactly as many compounds in this set as there are components
in the system and this equilibrium is “global.”

There are several minimization techniques that can be used to find the global equi-
librium (Connolly and Kerrick 1987, Chen et al. 1993) from a set of compounds; one
such has been implemented in Thermo-Calc, also for systems with solution phases. In
this case the Gibbs energy surface of all solution phases is approximated with a large
number of “compounds,” each of which has the same Gibbs energy as the solution phase
at the composition of the compound. The compositions of the compounds are selected
to cover the whole surface in a reasonably dense grid, often more than 10* compounds
are used for each phase. In a multicomponent system with many solution phases, this
may generate more than 10° such compounds. A search for the hyperplane representing
the equilibrium for the compounds is then carried out. When this has been found, the
compounds in this equilibrium set must be identified with regard to which solution phase
they belong to; many may be inside the same phase and Thermo-Cale may then automat-
ically create new composition sets. Each compound in the equilibrium set gives an initial
constitution of the solution phase, which can be used in a Newton—Raphson calculation
to find the equilibrium for the solution phases. This technique of approximating solution
phases with compounds can thus be considered as a method by which to obtain good
initial constitutions for the Newton—Raphson method and avoid the risk of starting from
a constitution of a phase that is on the “wrong” side of a miscibility gap.

The main limitation of the “global” method is that the conditions for the equilibrium
must be such that T, p, and the overall composition are known. If other conditions are
used, for example the value of the activity of a component, that a phase should be stable,
or that a composition of a phase is known rather than the overall composition, then it is

 

  

===========
2.3.5

2.3 Equilibrium calculations 31

not possible to calculate the global equilibrium directly. However, after an equilibrium
calculation according to a Newton-Raphson technique, the overall composition can be
calculated and used in a global minimization to check whether the result is correct; if it is
not, one can use the global minimum as a starting point for a new equilibrium calculation.

Conditions for a single equilibrium

The equilibrium conditions described above as sets of equations contain fewer equations
than unknowns. The difference is the number of degrees of freedom f, so f extra
equations (conditions) must be added in order to select definitely a single equilibrium. This
corresponds, for example, to the selection of a single tie-line from a monovariant binary
two-phase equilibrium. In the optimization procedure the “calculated value” corresponding
to a measured one is selected in this way.

One means of selection is by fixing some of the unknowns to given values. This may
be counted as diminishing the number of unknowns, but formally it can also be counted as
adding an equation of the type “unknown state variable” = “constant value,” for example

T=1273, — p=101325; =, = 0.1; ~— p; = —40000 (2.37)

With the constraints Eqs. (2.23)-(2.27) the simplest additional conditions are to fix
temperature 7, pressure p, and the amounts of all components N,. For each calculation
step, however, it must be selected which and how many phases are present, since Gibbs-
energy descriptions exist only for phases. Calculation steps with different sets of phases
may be compared. The phase set with the lowest Gibbs energy describes the stable
equilibrium.

If the equilibrium is calculated with a given set of phases, the equilibrium p-values
describe a simplex (straight line in binary, plane in ternary, hyperplanes in higher-order
systems), as shown in the next section. Whenever another phase has a positive “driving
force,” see section 2.3.6, there exists an equilibrium containing this phase, which is more
stable than that calculated for the selected set of phases. In the next calculation step this
phase must be added. If the calculation finds a negative amount for one of the selected
phases, this phase must be removed from the selected set. Phases with miscibility gaps
may have more than one driving force at different compositions and this test must be
performed separately for each of these compositions.

In Thermo-Cale this comparison of equilibria of different sets of phases i:
automatically. As initial values an arbitrary set of phases is selected, either by explicitly
setting starting values or by using “automatic starting values.” In BINGSS and BINFKT
the set of phases is selected by the user. Experimental data with undefined phases (for
example, a liquidus temperature with undefined primarily crystallizing solid phase) thus
cannot be used in BINGSS. For the calculated value to be compared with an experimental
one, the phases must thus be determined. A check is necessary only if, in the finally
assessed dataset, some phases appear to be stable where they were experimentally found
not to be stable.

 

done

===========
32

Basis

In the set of equations (2.22) the phase amounts and amounts of components are
eliminated. The same is true for the set (2.24)-(2.27) without (2.23). The degree of
freedom is that defined by Gibbs’ phase rule and thus depends on the number of stable
phases. The elimination of the amounts of components includes the elimination of an
overall composition from the equations.

Instead of just fixing single unknowns, other conditions may give relationships involv-
ing several unknowns. By the use of such conditions an overall composition may be
re-introduced into the set of equations (2.22).

A point of the boundary between the a field and the a + field in the isopleth through
a ternary system may be selected by adding one of the following two sets of two equations
to the six equations of the form of Eq. (2.22) for finding the eight values T, wi, wo", we,
xg, x2, x8, and x2 describing the isobaric a + equilibrium,

a _ yo.
xg =XRs

xia x8 (2.38)
or

[a8 xe xe |
T=T; fa? oy? a? | =0 (2.39)
[x2 x2) so

Equations (2.38) fix the composition of @ to xg, x2, which, of course, must be on
the isopleth, whereas Eqs. (2.39) fix the temperature and give the condition that the
composition of @ is on the straight line defined by the two points (1) and (2), which is
the abscissa of the isopleth. Thus the abscissa is given by Eqs. (2.38) and the ordinate
calculated; with Eqs. (2.39) the ordinate is given and the abscissa calculated. Therefore
Eqs. (2.38) are valid for the calculation of a steep boundary, whereas Eqs. (2.39) are well
suited to calculate flat boundaries. In BINGSS and BINFKT this can be selected by the
user. Thermo-Calc does that automatically.

The condition of three points being on a straight line can be used in BINGSS and
BINFKT to find the single point where phase a of a ternary three-phase equilibrium
passes through the isopleth defined by points (1) and (2),

(2.40)

 

xe]
jak x8 xh) =0 (2.41)
|r at ar |
I B “cl

===========
2.3.6

2.3 Equilibrium calculations 33

or to find in a ternary isothermal section the a+ f tie-line passing through the point

0 0.
XB ACE

[ak xg *|
is xf xf | =0 (2.42)
| |

oO 0
Xa XB XC

Thermo-Cale does not support these nonlinear conditions between mole fractions.
Nevertheless, the same equilibria can be calculated. The first one is found during
“mapping” of the isopleth and can be picked out from tabulated output of this mapping.
The second is obtained by “stepping” one mole fraction of one phase of the three-phase
equilibrium across this azeotropic extremum and selecting the equilibrium with maximal
or minimal temperature, respectively, in the tabulated output. The third one is just the
equilibrium at the fixed overall composition (x, x, x2).

Generally, boundaries in an isopleth can be found as “zero-phase-fraction” lines. The
boundary between the a+ 6+ y and B+ y fields is found by searching for the a+ B+y
three-phase equilibrium using Eqs. (2.23)-(2.27) with the condition m* = 0. The N, in
Eq. (2.23) must be selected in such a way as to define a point on the abscissa of the
isopleth; then T, the ordinate of the isopleth, can be calculated or vice versa.

Maxima and minima of binary two-phase fields (azeotropic points) are found by setting
conditions between the mole fractions of the phases equal. The single condition

xt x8 =0 (2.43)
selects an azeotropic extremum of the binary a +B two-phase field. The two conditions
xg—xg=0;  xf—-a8=0 (2.44)

select azeotropic extrema of a ternary two-phase field.

If no azeotropic extrema exist, the corresponding sets of equations must, of course,
have no solution, except purely mathematical solutions outside the range 0 < x; <1
(i= a, B, y; j=A, B, C).

In quaternary systems conditions similar to those used for isopleths are valid as a means
to find boundaries in plane sections through an isothermal-composition tetrahedron. All
the other conditions in quaternary and higher systems are constructed in accord with the
same ideas as Eqs. (2.37)-(2.44).

The driving force for a phase

At equilibrium the partial Gibbs energies for each component have the same value in all
stable phases, i.e. the Gibbs-energy curves of the stable phases touch the same tangent
(hyper)plane of chemical potentials. The Gibbs energy surfaces of all metastable phases
are above this plane. For each metastable phase one can determine the distance in terms
of Gibbs energy between the stable tangent plane and a tangent plane parallel to the

===========
34

 

Basis

 

 

 

 

 

 

 

 

2000 4 L . A
1500 foc
2 1000 /
B 500
2
5 o
2 0 Jee
3 bee AG’
© _s00
4 ast
Se
1000 7 1 7 1
A © 02 04 06 08 10
Mole fraction Cr

Figure 2.5 The Gibbs-energy curves for some stable and metastable phases in the Cr-Fe system
at 500K. In the middle of the system the stable phases are the two bcc phases on either side of
the miscibility gap which are connected with a common tangent. The endpoints of this tangent
represent the chemical potentials of the components, z;. The triangular symbols on the tangent
represent the equilibrium compositions of the two bec phases. The other two phases, fec and o are
metastable since their Gibbs energies are always above the stable tangent.

metastable phase. This distance is regarded as the “driving force” and is illustrated in
Fig. 2.5. Tangents to the Gibbs-energy curves for fee and o phases that are parallel to the
stability tangent have been drawn and the compositions of the fee and o phases at the
tangents are marked by a square and a diamond, respectively; fec or o phases with these
compositions are closest to being stable. The differences in chemical potentials between
these tangents and the stability tangent are called the driving forces of these two phases
and denoted AG® and AG*. Most often the driving force is divided by RT and thus
rendered dimensionless.

The driving force is an important quantity in the theory of nucleation of a phase and,
as mentioned in the previous subsection, it can be used during minimization of the Gibbs
energy to find whether there is another phase that is more stable than the calculated
equilibrium set of phases.

Phase diagrams
Definition and types

If two or three of the conditions mentioned in section 2.3.5 are systematically changed
within certain intervals, the resulting two- or three-dimensional manifold of equilibria
can be visualized as a phase diagram. Also four-dimensional and “higher-order” phase
diagrams are possible, but usually these are represented by two- (or three-)dimensional
sections. The largest dimension of a phase diagram is the number of free variables under
the equilibrium conditions, for example T, p, and N; in Eq. (2.20), which is two more than
the number of components. This maximal number is diminished by one, since extensive
variables are represented as relative values by dividing them by one of them, usually N.
For example, the amounts of components N, are replaced by the overall compositions

===========
2.3 Equilibrium calculations 35

x, = N,/N, the total enthalpy of the system, H, by the molar enthalpy of the system
H/N, etc. The variable used as divisor (the total amount N in the above examples) is
of interest only as a measure of the size of the system. By keeping one of those relative
variables or an intensive variable constant, the dimension of the corresponding phase
diagram is again diminished by one. An isobaric binary system thus has two-dimensional
phase diagrams.

A phase diagram differs from a “normal” diagram (called a property diagram here), in
which one quantity is expressed as a function of another quantity. In a phase diagram the
coordinate axes all represent independent variables and the coordinate space shows the
“state of the system,” i.e. how many and which phases are in equilibrium at a selected
coordinate point. In a phase diagram also the points between the lines are meaningful; in
a two-dimensional phase diagram they describe the existence of a divariant equilibrium.
In a property diagram, in contrast, only points on the curve have meaning.

Lines in a phase diagram nevertheless can be interpreted as functional dependences.
Under the condition of monovariant equilibrium of a set of specified phases, one coordi-
nate of the phase diagram is an implicitly defined function of the other one. This will be
explained in more detail in the next subsection.

The coordinates as well as the state variables kept constant in a phase diagram must
satisfy some restrictions. Hillert et al. (1997a) elaborated the rules regarding possible
combinations of coordinates and fixed state variables. From each pair of conjugate vari-
ables of a set, Eq. (2.5) or (2.6), one variable must be selected and it can either be used

 

as an axis or kept constant.

Schmalzried and Pelton (1973) classified plane phase diagrams into three types in
terms of the type of coordinate axes: a first type with two intensive variables, a second
type with an intensive variable and a quotient of extensive variables, and a third type
with two quotients of extensive variables. Examples of these types are given in Fig. 2.6.

The two-dimensional phase diagrams in Fig. 2.6 belong to a unary system, a binary
system at a constant value of one intensive variable (p), or a ternary system with con-
stant values of two intensive variables (p, T). Similar plane phase diagrams exist for
n-component systems with n—1 intensive variables kept constant.

Lines in phase diagrams represent monovariant equilibria, which in all the diagrams
of Fig. 2.6 are two-phase equilibria. The intensive variables are the same for all phases
in equilibrium, but the extensive variables differ. Therefore, in diagrams of the first type
(Figs. 2.6(a) and (b)), from Fernandez Guillermet and Gustafson (1984) and Coughanowr
et al. (1991), respectively, the image of each monovariant equilibrium is a single line.
Coordinates, being quotients of extensive variables, represent overall state variables of
the whole system as well as individual state variables of the phases. In diagrams of the
second and third type (Figs. 2.6(c)-(f)), those of the latter type from Liang et al. (1998),
the variables of the individual phases are represented by a pair of lines belonging to the
two coexisting phases. Corresponding points on these pairs of lines are connected by
straight lines called tie-lines. In diagrams of the second type (Figs. 2.6(c) and (d)) the
intensive coordinate is constant along the tie-lines, so they are parallel to the axis of the
quotient of extensive variables, whereas in diagrams of the third type (Figs. 2.6(e) and
(f)) the directions of the tie-lines are an important part of the information which can be

 

===========
Basis

 

 

 

 

 

 

 

 

 

  

 

 

 

 

 

 

3000 1400
liquid 1300
2500 liqui 4200 liquid
| 2000 g 11005 r
2 © 1000 4 L
g fee 3
® 1500 ® 9004 foc
a 8 800 C15
5 1000 5
Fe hop © 700
500 bee 800
500 |
0 400
AX © 8 10 15 20 25 30 35 40 45 50 Ay ~100 80-60 -40 -20 0
Pressure (GPa) Chemical potential of Mg (kJ mol”)
(a) (b)
1400 °
1300 liquid
1200 14 r
¢ 1100
= -2 fec+C15
© 1000 +
® 900 = -34 L
g =
E800
® 700 r
600 CuMg, + hep “5 fee
500
400 6
A o 02 04 06 08 10 A oF 19 15 20 25 30
Mole fraction Mg 1000/T
(co) (a)
50
40

30

20

    

Enthalpy (kJ mol‘)

TuNig, + hep:

 

 

 

 

0 02 04 06 O08 1.0 A °? 02 04 06 08 10
Mole fraction Mg Mole fraction Mg

©) 0)

Figure 2.6 Types of phase diagrams: (a) is the T—p diagram of pure Fe, (b) is the T versus Uy
diagram of Cu-Mg, (c) is the normal binary phase diagram of Cu-Mg, (d) is the In(xyj,) versus
1000/T diagram of Cu-Mg, (e) is the H/N versus xy, diagram of Cu-Mg, and (f) is the
isothermal section of Al-Mg-Zn at 608 K. -

===========
2.3 Equilibrium calculations 37

given by the phase diagram. At the points on the tie-lines in the areas between these pairs
of lines the quotients of extensive variables represent overall variables of the system only.

The monovariant equilibria meet in invariant equilibria, where the variables of the phases
are represented by points, a single point in diagrams of the first type and separate points for
each of the (three) phases in the other diagrams. In diagrams of the second type the three
points are ona straight line at the same value of the intensive coordinate, whereas in diagrams
of the third type they form a triangle (a tie-triangle). The coordinates of points on the tie-lines
or within the tie-triangles represent only overall variables of the system.

The difference between a phase diagram and a functional dependence may be explained
by an example. The functional dependence of the molar volume on temperature can
be plotted in the coordinates abscissa = temperature and ordinate = molar volume for
a single phase with given composition and at a given constant pressure (for example
Vin = (Vo/To)T for an ideal gas). A phase diagram of a unary system can be given in the
same coordinates. Here, however, instead of selecting a single phase and taking V,, as a
function of T, both T and V,, are taken as independent variables. Thus the pressure as
the intensive variable conjugate to volume cannot be freely selected, but depends on the
two coordinates temperature and molar volume. The diagram is a typical phase diagram
of the second type, showing how many and which phases are in equilibrium at selected
coordinate values.

The coordinates pressure and molar volume cannot be used simultaneously as coordi-
nates of a phase diagram, since they are conjugate and thus can replace each other, but
they cannot be chosen independently. A functional dependence, however, can be shown
for these coordinates, namely the dependence of molar volume on pressure at constant
temperature.

Two-dimensional phase diagrams not covered by the three types of Schmalzried and
Pelton are sections through higher-dimensional phase diagrams, cut by a condition relating
extensive variables. The most common examples of this type are “vertical sections” of
ternary systems (isopleths). In these diagrams the tie-lines usually are not in the plane
of section, which means that the extensive values of the phases are not all inside the
coordinate space. Owing to that, this type of diagram is often considered not to be a
phase diagram, but merely a section through a higher-dimensional phase diagram. This
distinction may be of minor importance, since any phase diagram shows only part of the
state variables, which are defined by the equilibrium conditions. For example, Fig. 2.6(b)
does not show the composition of the phases and Fig. 2.6(c) does not show j-values.
Also in isoplethal diagrams the quotients of extensive variables represent overall state
variables of the system, which can be interpreted as individual state variables of a single
phase only in single-phase areas including their boundaries simultaneously.

The lines in this type of diagram do not necessarily belong to monovariant equilibria,
but have another common feature: they show “zero-phase-fraction” equilibria. All the
lines show boundaries between an n- and an (n — 1)-phase field. They can be calculated
from the equilibrium conditions for the n-phase equilibrium with the additional condition
that the amount of one phase is zero, although still present in equilibrium. This one phase
is the phase missing from the adjacent (n — 1)-phase field. Points where lines meet in
this diagram can be calculated by setting the amounts of two phas

 

 

 

 

s to zero.

===========
38

2.3.7.2

Basis

Mapping a phase diagram

Several strategies for the calculation of phase diagrams are in use. One of them, which is
called “mapping” in Thermo-Calc, shall be outlined here. Two or three variables of the
conditions are selected as axis variables. For each axis a lower and upper limit as well as a
maximal step are given. All additional conditions are kept constant throughout the whole
diagram. If any of these additional conditions set constraints on mole or mass fractions (or,
generally, on quotients of extensive variables), the diagram will be an “isoplethal” section
of a full phase diagram. The selected axis variables in the plot are not necessarily those
of the calculation of the phase diagram, because, besides the axis variables themselves,
all other variables not fixed by the additional conditions are calculated and stored in the
raw output. The conditions kept constant, however, restrict the output and thus also the
diagrams to be drawn.

If the fixed conditions constrain only intensive variables, the mapping procedure
searches for all equilibria that are monovariant or invariant under these conditions, since
only monovariant equilibria appear as lines in complete phase diagrams. In isoplethal
diagrams it searches for all zero-phase-fraction equilibria.

The mapping procedure starts with a single “initial equilibrium,” whereby arbitrary
values for the axis variables are fixed inside the selected ranges of the axes. Starting
values regarding a selected set of phases and estimated values of the unknowns to be
calculated may be given by the user. Otherwise, Thermo-Calc creates automatic starting
values. Now the Newton-Raphson calculation is started and, if necessary, the set of
phases is changed using the driving forces of all phases considered (those having the
status “entered”) until the most stable set of phases and the equilibrium values of all
variables are found.

Now one of the axis variables is changed in a stepwise manner and the corresponding
equilibria are calculated until, in the case of non-isoplethal phase diagrams, the resulting
set of stable phases corresponds to a monovariant equilibrium. In isoplethal sections the
first change of the set of stable phases defines a point of a zero-phase-fraction line.

In non-isoplethal phase diagrams this monovariant equilibrium is traced, keeping all
except one of the axis variables constant and incrementing the condition of the only
variable axis in steps until an invariant equilibrium is found or one of the selected limits
of the axis is exceeded. The magnitude of the steps of incrementation is controlled by the
curvature of the line. At the invariant equilibrium there are initially c+ 1 monovariant
equilibria, where c is the number of components. One of them is now traced similarly; the
other ones are stored for tracing later. This procedure is continued until all monovariant
equilibria have ended at axis limits or at “known invariant equilibria” (meaning those
stored already).

In isoplethal diagrams the zero-phase-fraction line is traced by setting the appropriate
conditions: the set of stable phases is constituted by all phases appearing in both areas
adjacent to the line plus the phase appearing only in one area; however, this phase is
assigned the fixed amount of zero. This tracing is continued until an axis limit is reached
or the set of stable phases changes again, i.e., a phase appears on acquiring a positive
driving force or a phase disappears on receiving a negative amount. At such a point

===========
2.3 Equilibrium calculations 39

always four lines meet, separating the fields of stability of @, O+a, O+a+f and
©+, where @ stands for a set of phases numbering between one and c+2 in a
c-component system. Now the other lines starting at this point are traced similarly to the
monovariant equilibria in the non-isoplethal mapping procedure.

The mapping procedure sometimes ends with the message “sorry, can not continue.”
This indicates that the Newton—Raphson iteration does not converge. As pointed out in
section 2.3.3, this may happen due to bad starting values. Since here the starting values
of all unknowns are their equilibrium values in the previous step, this seldom occurs, but
there is no way to avoid it absolutely.

If in a phase diagram a set of lines is completely separated from another set, the
mapping procedure must be continued with an additional starting equilibrium leading to
the other set. This is likely to happen if a large homogeneity range of a single solid
solution extends throughout the whole phase diagram. An additional starting equilibrium
may also help to solve a problem with non-converging Newton—Raphson iteration.

In the Thermo-Calc software, equilibrium values of all variables are stored for each
calculated equilibrium during the mapping. This enables one to plot any state variable or
function of state variables after the mapping. For example, Figs. 2.6(b)-(e) could all be
plotted from a single mapping.

BINFKT and TERFKT have no automatic mapping procedure. Monovariant equilibria
of a selected set of phases are calculated in stepwise fashion along a range of an axis
variable, most often the temperature, but also the chemical potential or mole fraction of
one of the participating phases may be used as the axis variable. Starting from a boundary
system with one phase fewer is supported. In this boundary system (a pure component
in BINFKT, a binary system in TERFKT) the corresponding equilibrium is invariant, but
the derivatives of the monovariant lines into the system itself can be calculated (Lukas
et al. 1982). Invariant equilibria involving a selected set of phases can be calculated
easily. Possibly the set of starting values of the unknowns will lead to divergence of the
iteration and a different set must be tested.

These two programs were constructed primarily to calculate diagrams for comparison
of calculated with experimental data after a run of an optimization procedure. Thus,
for the purpose of calculating phase diagrams from a database, they may be somewhat
less user-friendly than Thermo-Calc. Nevertheless, they enable also calculation of com-
plete phase diagrams and isopleths through ternary systems. The distinction between
stable and metastable equilibria is not made in each calculation step, but there are some
final checks allowing one to determine whether the accepted equilibria are the most
stable ones.

A good strategy for BINFKT is to calculate first the two-phase fields starting from the
transformation points of the pure elements. Azeotropic maxima or minima are automat-
ically found. Then some invariant three-phase equilibria are tentatively calculated. The
monovariant two-phase equilibria starting from them can now be calculated. Where two of
the monovariant equilibria intersect, an invariant equilibrium must be present, for which
now the unknowns are approximately known and can be used as a good set of starting
values. Both in Thermo-Cale and also in BINFKT and TERFKT various plots can be
generated from the same calculation. In a binary «—T plot a crossing of lines indicates

===========
40

2.3.7.3

Basis

that a calculated equilibrium becomes metastable there. Thus u—-T plots enable one to
check whether the most stable equilibrium has been selected everywhere.

Implicitly defined functions and their derivatives

Although the lines in a phase diagram are not intended to show a functional dependence,
they can be interpreted as such a dependence for the condition of a monovariant equi-
librium. For example, in Fig. 2.6(b) for equilibrium between liquid and the C15-MgCu,
phase, the corresponding line shows a functional dependence of the temperature T on the
chemical potential of Mg, /44,- Mathematically, this functional dependence is given as an
implicitly defined function by the equilibrium conditions, expressed for the two phases
selected.

Since this two-phase equilibrium is monovariant, one additional equation of the type
(2.37), namely f4y4, = €, completely defines equilibrium. Now all state variables can be
calculated, solving the equilibrium conditions by the Newton—Raphson method. Since the
result depends on the value of €, all the state variables, including 7, are implicitly defined
functions of € and the calculation yields the function values for the chosen value of é.
Also the inverse function, y,(7), can be calculated by selecting a temperature instead
of a Mg chemical potential as the independent variable €. In the present case this inverse
function has no value above 1074K and two values below this temperature. Thus, to
plot the two-phase equilibrium liquid + C15-MgCu, on the phase diagram, it is better to
calculate T as a function of jay rather than fy, as a function of T. For other two-phase
equilibria the contrary may be true.

Also in a diagram of the second type, a possible point of view is to interpret the lines
as representations of implicitly defined functions. In Fig. 2.6(c) the boundary of the two-
phase field C15S-MgCu, + Mg>Cu against C15-MgCu, shows T as an implicitly defined

MgCuy : -C1S-MgCu we
Me as well as the inverse function xy,"°""""(7). Here it is preferable

to select T and calculate the value for the inverse function, ove MeCua | but, for example,
to calculate the liquidus line of the liquid + C15-MgCu, two-phase equilibrium, it is
better to select ayn 4 as the independent variable.

The concept of implicitly defined functions also defines the derivatives of these func-
tions. If the Newton-Raphson method is used for the calculation of function values, it
is easy to get also values of the derivatives. To show that, one can assume a set of two
conditions f, (x, y, t) =0 and f,(x, y, t) = 0 relating the three variables x, y, and t. These
conditions implicitly define the two functions x(t) and y(t). For example, x and y may
represent the mole fractions of the two phases of a selected two-phase equilibrium and
t the temperature. The conditions f, = 0 and f, = 0 must be satisfied throughout the
whole range of variables of the implicitly defined functions. Therefore also their total

derivatives with respect to t must be zero:

df, _ af, oh) oh)
ana \ax)atly)an?

dfs _ ah, (a (28)

function of x,

(2.45)

 

 

de ar Vax J ar" Vay J ar

===========
2.3 Equilibrium calculations 4

or
(2) es (wje-#
dx } dt dy } dt ot
(2) +(#) 2-8
ax } dt dy } dt ot

The derivatives dx/dt and dy/dt have to be taken over the equilibrium states and
thus are the sought derivatives of the implicitly defined functions. The values of these
derivatives corresponding to the selected value of the independent variable t can be found
by solving Eq. (2.46) as a set of two linear equations for the two unknowns dx/dt and
dy/dt.

Comparing Eq. (2.46) with (2.36) shows that the matrix on the left-hand side is the
same as that used to find the corrections to the variables in the last iteration step of the
Newton-Raphson method and thus has already been calculated. The right-hand side of
Eq. (2.46) consists of the partial derivatives of the conditions f, and f, with respect to
the variable t, the independent variable of the implicitly defined functions.

In this way any of the unknowns of the equilibrium conditions can be treated as an
implicitly defined function of another one and values of the function itself as well as of
its derivatives can be calculated by the Newton—Raphson method.

As an example of derivatives, we may derive the famous Gibbs—Konovalov rule

(Goodman et al. 1981) from Eq. (2.46). We formulate the equilibrium conditions for two
phases in a binary isobaric system by modifying Eq. (2.21):

(2.46)

F, =G*-G? =0

Fy =G3-G =0 (2.47)

Using Eq. (2.15) and expressing the derivatives of the partial Gibbs energies with
respect to T as partial entropies, Eq. (2.46) becomes

o( 204) dx" (PGE) ax?
‘ier ar” ae or

PGS) dx* PGE\ dg
(=x ) Sr 0-99 Sa) Fs —sf

 

 

 

=

   

(2.48)

 

 

 

 

(2.49)

ar (=P )P Ge Jax?

The numerator is the change in entropy associated with reversible dissolution of B in
a. It can be replaced by the corresponding change in enthalpy divided by T. Then we
get the Gibbs—Konovalov rule in the form referenced by Goodman et al. (1981) as the
derivative d7/dx* of the inverse function

() (x = 8 )T PGS fax?

—_ = A 2.50
od (Hi — HP) — x8) + (Hg — HE)? Coo)

===========
42

2.4

2.4.1

Basis

where the denominator is the molar enthalpy of reversible dissolution of an infinitesimal
amount of B in a, denoted —AH4, by Goodman et al. (1981) (numerator and denominator
here have opposite signs to those in the formulation of Goodman et al.).

Optimization methods

The principle of the least-squares method

In this section the least-squares method shall be briefly described as it was first introduced
by Gauss, as is done in many textbooks. Mainly the connection with our problem shall
be outlined.

The general problem is as follows: a set of n measurable values W, depends on a set
of m unknown coefficients C; via functions F; with values of independent variables x,;:

 

W, = Fi(Cj, Xi)

 

m (251)

The index k distinguishes the various independent variables (temperature, concentra-
tions, ...) belonging to measurement number i.

If nis greater than m, it is usually not possible to get a set of coefficients C; for which
the W, calculated using Eq. (2.51) are equal to the corresponding measured values L;.
Here the criterion for the “best” set C; is that the sum of squares of the “errors” must be
minimal, where the “errors” vu; are defined as the differences between calculated, F,, and

measured, L;, values times a weighting factor p;:
(F(Cj Xu) — Li) Bi = (2.52)
In many textbooks the square of the quantity p, of Eq. (2.52) rather than p; itself is called

the weighting factor. Equation (2.52) is called the error equation.
The condition for the best values C; is taken as

  

=Min (with respect to the C)) (2.53)

From this condition the m following equations relating the m unknown coefficients C;
can be derived:

j=leem (2.54)

 

To solve these equations, Gauss expanded the v, into a Taylor series and truncated it after
the linear terms:

"oy
V(Cj Xs) © VC; Xe) +O ac 8G (2.55)
ix OC,

===========
2.4.2

2.4 Optimization methods 43

where the AC, are corrections to the coefficients C). If the F;(C;, x,;) and therefore also
the v; are not linear in the coefficients C;, this is an approximation, which might not be
acceptable if the values of the Cc are too far from the final values of the coefficients.

To calculate the corrections AC,, Eq. (2.55) is inserted into Eq. (2.54) and, after
rearranging, that yields

 

 

Lym (2.56)

 

= isl

 

™(% ay a) eg
¥(% a, a= Fi

This is a set of m linear equations for the m unknowns AC,, called “Gaussian normal
equations,” which in matrix notation are written

"av, ay, oy (fxs y. i
(Ex), wor((Sez)) em

These equations are set up, using an initial set C,° of the coefficients, and solved for
the corrections AC,. After adding the corrections to the initial set, the calculation may be
repeated until the corrections are below a given limit.

As a measure of the fit between the resulting coefficients and the measured values,
the mean square error can be used. It is defined by

 

 

mean square error = >
Lam

 

(2.58)

The accuracy of the calculated coefficients is proportional to the square root of the
mean squared error. The factor of proportionality of each coefficient is the square root
of the corresponding diagonal element of the reciprocal of the left mx m matrix of
Eq. (2.57).

The weighting factor

In the BINGSS software, described in section 7.2, special care is taken to deal with the
fact that, when different types of measurements are used, the errors v, cannot be compared
directly. Quantities of different dimensions cannot be added, therefore the squares of
errors in Eq. (2.53) should have the same dimension. The weighting factor p, in Eq. (2.52)
can be used to make the errors v, dimensionless, if p, is taken as the reciprocal of the
estimated accuracy AL, of the measured values (Lukas et al. 1977):

p= (AL) (2.59)

If also the independent variables, x,,; (composition, temperature,... of the sample
investigated), have limited accuracies, Ax,;, that may also be taken into account (Lukas
et al. 1977). In this case the weighting factor p, is defined as

 

P= (a + D(A, /dxy,) « as) (2.60)
k

===========
44

2.4.3

Basis

This choice may be interpreted as the v, being dimensionless relative errors defined
as fractions of the mean errors of the corresponding measurements. Therefore, the errors
of different kinds of measured values can easily be compared.

The AL, may be estimated from different points of view varying from one series of
measurements to another. During the optimization in BINGSS, this can be corrected:
for measurements marked by a common label the weight given by Eq. (2.59) can be
multiplied by a dimensionless constant factor. This includes the factor “0” to discard a
doubtful series of measurements in the following calculations.

In the PARROT software, see section 7.3, the term added to the sum of squares of
errors for each experimental value i is equal to

( eight, (experimental value); — (calculated value); ) 61)
(estimated uncertainty);

This is equivalent to a combination of Eqs. (2.52) and (2.59) without considering
the uncertainties of the independent variables (Eq. (2.60)). The additional dimensionless
factor “weight,” is left to the responsibility of the user to assign weights that reflect the
relative importance of the data. The default settings of all weights are equal to 1.

Marquardt’s algorithm

If all the equations of error are linear in the coefficients, Eq. (2.57) is correct and the
final solution should be found in one step. A second or third step may be useful merely
due to errors produced by rounding. However, if the equations of error are nonlinear in
the coefficients (either due to the analytical description of thermodynamics or due to the
error equation) the step after Eq. (2.57) may fail and the mean square of error increase.

To solve this problem D. W. Marquardt (1963) combined the Newton-Raphson method
with the steepest-descent method. The identity matrix multiplied by a factor called the
Marquardt parameter is added to the normalized matrix of Eq. (2.57). If the Marquardt
parameter is large, this term is dominant and the corrections correspond to a steepest-
descent step, in which the length of the vector is the reciprocal of the Marquardt parameter.
If the Marquardt parameter is small, the iteration step is nearly the pure Newton—Raphson
step. If the mean square error increases, the last correction is discarded and the Marquardt
parameter enlarged by a factor (for example 10) and new corrections are calculated using
the matrix of Eq. (2.57) of the previous step. If two consecutive steps were successful,
the Marquardt parameter is diminished by the same factor for the next calculation.

There are many other methods of improving the Gauss algorithm for nonlinear equa-
tions of error described in the literature. Most of them are mainly intended to diminish the
calculation time compared with that of Marquardt’s algorithm or to avoid the analytical
calculation of derivatives. Since in our special case the calculation time depends mostly
on the calculation of the sum of squares of error, rather than on solving the system of
linear equations (2.57), the calculation time cannot significantly be reduced from that of
Marquardt’s algorithm. Also the analytical calculation of derivatives is no problem in our
case. Therefore no other algorithm is used in BINGSS.

===========
2.5

2.5 Final remarks 45

Final remarks

In this chapter, diverse topics of science such as thermodynamics, crystallography,
numerical methods, and phase diagrams have been mentioned. As stated at the begin-
ning, the aim of CT is to make use of experimental and theoretical information from
all these topics to formulate a thermodynamic description using for each phase in a
multicomponent system a single Gibbs energy function that can describe the equilibrium
state of the system. Such a description must, of course, be very approximate and can
be improved with new data and better models, but it has already proved to be of great
value in understanding, predicting, and simulating chemical processes and properties of
materials.

The thermodynamic description using a single Gibbs energy for each phase means that
all thermodynamic properties such as enthalpy, heat capacity, and chemical potentials
can be consistently calculated from this. The equilibrium state for a system at given
temperature, pressure, and amounts of components, the most common external conditions,
can be calculated by finding the minimum of the Gibbs energy, including all possible
phases. From the calculated equilibrium all thermodynamic quantities can be obtained, as
can, for example, amounts of the stable phases and the partitioning of the components.

The phase diagram describes the equilibrium state of a system as a function of two or
more state variables. For multicomponent systems there are many different types of phase
diagrams that can be useful. Any such diagram can be calculated from the Gibbs energy
functions and they will all be consistent. The thermodynamic functions can be used for
much more than just calculating equilibrium phase diagrams and properties of the stable
states. There are no drastic changes in these functions when they are extrapolated outside
the stability ranges of a phase. A simple kind of extrapolation is to suspend a phase and
calculate a metastable phase diagram from the functions. For example, the metastable
Fe-C phase diagram with cementite can be calculated if graphite is suspended.

By extending this idea further, one can calculate any equilibrium for a phase or an
assemblage of phases, irrespective of whether these phases represent the stable state of
the system. Of course, the calculated metastable equilibrium is only approximate and the
further away from the stable state the less confidence can be attributed to the calculated
values of the state variables. However, often the modeled Gibbs energies are the only
thermodynamic information available for a metastable state. This use of the Gibbs energy
functions requires that the assessment of the stable states be done with great care. The
selection of models and model parameters should be made with the intention that the
Gibbs energy functions and their derivatives will behave reasonably outside as well as
inside the stability ranges of the phases.

The same rules apply to these metastable equilibria as to the stable one. The only
difference is that the total Gibbs energy (for a system at constant T and p) is higher than
that for the stable equilibrium. However, it is still a minimum for the phases included in
the calculation and the chemical potentials for all components are the same in all phases.
