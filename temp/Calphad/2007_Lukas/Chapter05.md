Models for the Gibbs energy

In this chapter a number of models for the thermodynamic properties of various phases
will be described. The integral Gibbs energy will be used as the modeled thermodynamic
property. The reason to model the Gibbs energy rather than any other thermodynamic
function is that most experiments are done at constant temperature and pressure. From the
Gibbs energy all other important quantities can be obtained according to Eqs. (2.12). Using
the Gibbs energy means that the modeling is limited to a “mean-field” approximation.
Thermodynamic calculations using “Monte Carlo” methods or “molecular dynamics”
are outside the scope of this presentation, but these techniques can provide important
information about the type of mean-field model to be selected.

A phase may sometimes have a particular physical or chemical feature that requires
a special model in order for it to be described accurately. It is not uncommon that the
mathematical expression for such a model may be identical to the expression derived to
describe another physical feature. That simply means that the mathematical expression
is more general than the physical model. Whenever such a generalized expression can
be obtained, it will be called a formalism. A general formalism should be able to handle
cases when various constituents added to a phase behave differently, for example some
may dissolve interstitially or cause chemical ordering. Most of the models used in this
book are special cases of the compound-energy formalism (CEF). The physical meanings
of the CEF parameters in various models differ and this will be discussed in detail.

The models for the phases in a thermodynamic system can be selected independently,
except for the case when two phases are members of a structure family. Phases with
chemical ordering form structure families and they may be modeled with the same Gibbs
energy function, but usually only rather simple structural relations can be described with
a single Gibbs energy function, for example A2/B2 and A1/L1,.

The Gibbs energy for a phase can be attributed to two main factors, the bonding
between the constituents and their configuration. The configurational part always enhances
the mixing of unlike atoms. The bond energy between two unlike atoms may be either
more negative than the bond energy between two equal atoms (creating a tendency for
compound formation or ordering) or more positive (creating a tendency for there to be a
miscibility gap).

The selection of the model for a phase must be based on the physical and chemical
properties of the phase, for example crystallography, type of bonding, order—disorder

79

===========
80

5.1

Models for the Gibbs energy

transitions, and magnetic properties. Most of the models for crystalline phases described
here will take into account the crystal structure of the phases by dividing it into sublattices
characterized by different crystallographic symmetries and numbers of nearest neighbors.
Sometimes a sublattice has just a single constituent, but usually several constituents can
enter a sublattice. By selecting one constituent in each sublattice, one has a stoichiometric
compound with fixed composition. The Gibbs energy of formation of that compound
contains the most important part of the bond energies. In the simplest case the compound
can be a pure element if the phase has a single set of sites and the elements as constituents.
Any solution phase has at least two such compounds and they are then called the “end
members” of the solution phase. The end members define the limit of solubility, but the
model may have end members with a composition inside the composition range of the
phase. Examples of this are a gas phase with molecules such that each molecule is an
end member and an ordered phase in which some end members represent the possible
ordered states. See also section 5.2.3.

In order to describe the measured phase equilibria and the thermodynamic properties
of a system, it is necessary to adjust a number of parameters in the Gibbs-energy model
of the phases. The aim of this book is to teach the reader how to make a good choice of
models and obtain the best possible set of model parameters that describe the experimen-
tal information and are useful for extrapolations to multicomponent systems. The term
parameter will be used for a quantity that is part of a model, like excess parameter.
Some parameters can be a function of temperature, pressure, or even composition, and
thus can be split into several other parameters. Each parameter may consist of several
coefficients and a coefficient is always just a single numerical value. In the PARROT
software, see section 7.3, the term variable is used with the same meaning as coefficient.

The selection of models described here has been based on those currently implemented
in either of the two software packages that are described in more detail in this book. New
models are continuously being developed and added to the software, so a future user can
expect to have an even larger choice of models than that described here.

 

 

The general form of the Gibbs-energy model

The total Gibbs energy of a phase @ is expressed as

Gh agi pomsg? — rims’ 4 EG (5.1)

The superscript @ denoting the phase will normally be omitted in the rest of this chapter
since all expressions are valid for a particular phase. The pre-superscript “srf” stands for
“surface of reference” and represents the Gibbs energy of an unreacted mixture of the
constituents of the phase. Not included in this is the quantity "™*G,, which represents the
contribution to the Gibbs energy due to a physical model such as magnetic transitions, as
described in section 5.4. These models may be composition-dependent through particular
physical quantities like the Curie temperature and the Bohr magneton number.

The pre-superscript “cnf” stands for the configurational entropy of the phase and is
based on the number of possible arrangements of the constituents in the phase given

 

 

===========
5.2

5.2.1

5.2 Phases with fixed composition 81

by Eq. (2.9). This can easily be extended to include random arrangements on several
sublattices. More elaborate methods to predict the entropy of configuration, like the
cluster-variation method (CVM), can be derived for specific crystalline structures and
will be discussed in section 5.7.2.2.

The term with pre-superscript “E” stands for the excess Gibbs energy and describes the
remaining part of the real Gibbs energy of the phase when the first three terms have been
subtracted from the real Gibbs energy. This partitioning means that there is no attempt
to model the physical origins of the Gibbs energy, except those included in ™"SG,,. The
terms “'G,,, and G,, will thus include configurational as well as vibrational, electronic,
and other contributions.

In this chapter a number of models for the various parts will be described. The temper-
ature and pressure dependences of the Gibbs energy for a phase with fixed composition
will be described first. Then the magnetic model will be described as an example of a
physical property that is modeled separately. The reason for a separate description of this
contribution to the Gibbs energy is that the magnetic properties of the phase depend on
the critical temperature for magnetic ordering and the Bohr magneton number, and the
composition dependences of these quantities must be described separately. The descrip-
tion of the models for composition dependence will start with the simplest cases and
gradually introduce more complex features of real phases.

Phases with fixed composition

A phase with fixed composition can be a pure element, a stoichiometric compound, or a
solution phase whose composition is kept constant externally. The Gibbs energy of such
a phase can depend on temperature and pressure only. An important class of such phases
is constituted by the “end members” of solutions, a term introduced at the beginning of
this chapter.

Temperature dependence

Except for the ferromagnetic transition, described in section 5.4.2, the temperature depen-
dence of the molar Gibbs energy, G,,, of a stable end member of a phase 6 is often
described by a power series in temperature like

GE =D dH = ay ta,Tt+a,Tin(T)+a,0? +a,T'+aP+-, T,<T<T, (5.2)

where b; is the stoichiometric factor of element i in @ and >; b;HS®® represents the sum of
the enthalpies of the elements in their reference states, usually the stable state at 298.15 K
and 1 bar, denoted SER. This term is needed because there is no absolute value of the
enthalpy of a system and one must select some reference state. Such a power series can
be valid for a limited temperature region only, here delimited by 7, and 7.

===========
82 Models for the Gibbs energy

The coefficients in Eq. (5.2) expressing the temperature dependence of the end-member
parameter cannot be related directly to any other thermodynamic quantity, but, using the
relations in Eqs. (2.12), one obtains.

@ SER _ 2 1 3
i = a — aT —as a 5 3
Hi -S bx: dy — aT —a3T* +2a,T! —2asT*+-- (5.3)
$8 = —a,—a,(1+In(T)) —2a,7 +a,T? —3asT? ++ (5.4)
Co = —a) —2a;T —2a,T~ —6asT?- ++ 5.5)
? 2 m

From the expression for the heat capacity, C,, it can be seen that the coefficient
for the T In(7) term in Eq. (5.2) originates from the temperature-independent heat-
capacity coefficient. These quantities for pure Cu, from Dinsdale (1991), are plotted in
Fig. 5.1.

The expression above is suitable for expressing the Gibbs energy for a limited temper-
ature range and above the Debye temperature. If the coefficients are fitted to experimental
data and the expression is then used far outside the known temperature range, or down to
OK, severe problems with using this power series will occur. Thus there is an interest in
developing and using temperature-dependent models based on the physical properties of
the phase, namely lattice vibrations, thermal vacancies etc. At present, however, physical
models are rarely used for modeling the heat capacity except for a model for ferromag-
netic transitions described below. The lower temperature limit is usually 298.15 K, which
is sufficiently low to allow calculations of the equilibrium in most heterogeneous sys-
tems that require diffusion in order to reach the equilibrium state. At lower temperatures
diffusion is usually not possible and thus there is little practical interest in extending the
model to lower temperatures.

 

 

 

 

 

 

 

 

32 . 1 . 50 L . i
314 ae
ye o4 L
& 2904 L
E é
3 28
2 z2 -s04 G L
S 274 >
3 2
5 -Ts
g 26 4 5
3 25] -100 4 L
24 4
23 T T 1 — 150 T T T
A 30 600 9001200 1500 YA 300 600 90012001500
Temperature (K) Temperature (k)
(a) (b)

Figure 5.1. The thermodynamic properties of pure Cu: in (a) the heat capacity and in (b) the
Gibbs energy (G), enthalpy (H) and entropy (multiplied by T and with changed sign). Note that
G is continuous at the melting point but H and S have jumps.

===========
5.2.2

§.2.2.1

5.2 Phases with fixed composition 83

Equation (5.2) may require many coefficients if the temperature range is large.
A method by which to decrease the number of coefficients is to use several temper-
ature ranges and different expressions in each. This method is also needed in order
to have backward compatibility with the time when thermodynamic data were usually
described by giving the heat of formation and entropy at 298.15 K and | bar together
with a four-coefficient heat-capacity expression. In such cases there were usually at
least two and often up to four or five temperature regions with different coefficients.
Note that it is mandatory that the first and second derivatives of the Gibbs energy
must be continuous through such a breakpoint, otherwise it would behave like a phase
transition.

Pressure dependence

The pressure-dependent properties such as volume and thermal expansivity are often
ignored in thermodynamic models. For condensed phases they are important for the
equilibrium only at very high pressures, but the molar volume can be important in phase
transformations and knowledge of it is necessary in order to obtain the volume fraction
of a phase. For the gas phase, except close to the critical point or the boiling point,
it is sufficient to describe the pressure dependence by one term, RT In(p/p ). For the
condensed phases a model suggested by Murnaghan (1944) is useful for limited pressure
ranges.

The Murnaghan pressure model

In the Murnaghan model one assumes that the bulk modulus can be expressed by a linear
pressure dependence. The following expression is used for the compressibility, «, which
is the inverse of the bulk modulus:

_— Kol)
OP TE KD

(5.6)
where K,(7) is the compressibility at zero pressure and n is a constant independent of
temperature and pressure. Experimentally n is found to be about 4 for many phases. The
thermal expansivity can usually be described as a power series in temperature and, in order
to have reasonable extrapolations from low temperatures, at which most measurements
are made, to high temperatures, one should use an expression of the form

a@=a)ta,T+a,T? +: (5.7)

and avoid higher powers than one. This model was used in an assessment of pure iron
by Fernandez Guillermet and Gustafson (1984) and Fig. 5.2(a) shows the phase diagram
for iron for varying temperatures and pressures. In Fig. 5.2(b) the pressure axis has been
changed to the molar volumes.

===========
84

5.2.2.2

 

 

 

 

 

 

 

 

Models for the Gibbs energy
2500 2500
liquid liquid
2000 +
2000 4 r l
< hee < foc Bee
@ fec 2 15004 b
® 15004 r
5 5
& 2 1000 4 F
5 5
e e hep
1000 4 500 | bee L
bee hep
500 °
A © 5 10 15 20 25 30 35 40 45 50 A 5 60 6 70 75 80
Pressure (GPa) Molar volume (1077 m3)
(a) (b)

Figure 5.2. Two variants of the phase diagram for pure Fe: (a) the p—T phase diagram and
(b) the volume-temperature phase diagram. In (b) there is a gap in the fec/bec curves at high
volume because the pressure is below zero there.

For solution-phase modeling the Murnaghan model must be integrated into a Gibbs
energy and the expression is


For high pressure, such as at the center of the Earth, the Murnaghan model is not
sufficient and one must use higher-order terms. In most high-pressure models the volume
is then used as independent variable, but in such a case it is no longer a model for the
Gibbs energy.

A new pressure model

A new pressure-dependent model was proposed by Lu er al. (2005) because the compo-
sition dependences of the parameters in the Murnaghan model, Vj, a, Ko, and n, make it
very cumbersome to handle when calculating partial Gibbs energies. This model is based
on the empirical relation proposed by Grover et al. (1973):

Vr. p) = WT) ~«(ryn( 0) 69)
K«(T, p)

where V,(7) and K)(7) are the volume and compressibility at zero pressure and c(T) is

an adjustable function. This can be integrated to give a surprisingly simple Gibbs-energy

expression:

===========
5.2.3

5.2 Phases with fixed composition 85

The expression for the volume as a function of temperature and pressure is more
complicated and involves the exponential integral, Ei, defined as

(5.11)

(5.12)

 

V(T, p) = cere

(T)

where Ei! is the inverse of the exponential integral.

The advantage of this model is that one can include more easily the composition
dependences of the parameters and it is thus better suited for modeling solution phases.
Another advantage is that the model can be extended to higher pressure ranges than can
the Murnaghan model.

Metastable states, lattice stabilities, and end members

When a new component can dissolve in a compound, it forms a solution phase and the
stability range of the phase can be extended also in temperature. A consequence of this is
that the Gibbs energy of the solution phase must have a value at the endpoint representing
the compound also at temperatures outside its range of stability. Thus experimental data
are not always enough to fit coefficients in the temperature models even for compounds.
An example of such extrapolation is shown in Fig. 5.3, where the heat capacity and Gibbs
energy of various forms of pure iron (Fernandez Guillermet and Gustafson 1984) have
been extrapolated from 298.15 to 2000 K.

In other cases the Gibbs energies of compounds that are never stable are needed. These
may be inaccessible to measurement, but it may be possible to predict properties of such a

 

 

 

 

 

 

 

 

 

 

60 L n L L 10 L L L L
554 F 84 hep, b
v 505 bee L L
L liquid g
3
@ 454 L 544 b
2 404 r B24 b
o a
¢ 354 ice r 5 07 a r
8
3 3
3 304 L 6-24 liquid L
25 4 b 44 b
20 T T T 1 T T T T
A oO 500 1000 1500 2000 2500 A 500 1000 1500 2000 2500
Temperature (K) Temperature (Kk)
(a) (b)

Figure 5.3 Thermodynamic data for pure Fe. (a) The heat capacities for the various phases of pure
Fe. The data are extrapolated also outside the stable range of the phases. (b) The Gibbs energies
for some other forms of pure iron relative to bec iron extrapolated over a large temperature range.

===========
86

Models for the Gibbs energy

compound by extrapolations or by ab initio calculations. With some care the results from
total-energy calculations can be used as “experiments” together with real experimental
data with the thermodynamic models described here.

Most elements have only one or two stable crystal structures, but they may have some
solubility in many different phases. When the solubility is large, it is necessary to estimate
a value of the relative stability of the metastable structure as an “end member” of the
phase. These values for pure elements are called “lattice stabilities.” Several estimates of
such unary data have been made. Those currently most used are the comprehensive SGTE
set published by Dinsdale (1991). The Ringberg meetings (Aldinger et al. 1995, 1997)
may lead to a completely new set with improved models. It is important to agree on the
values for these metastable states, even if they are very uncertain, because one cannot
change the value of the Gibbs energy of formation of a stable or metastable end-member
state without reassessing all parts of the thermodynamic database that depend on the
previous value. This problem is not so big for structures stable in some range of T and p
because their thermodynamic properties can be determined by measurements and thus
one can always refer to experimental data, but for metastable states there are estimates
that may differ by a factor of ten or more.

For compounds with no measured heat capacity it is usual to apply the Kopp—Neumann
rule (Grimvall, 1999) that the heat capacity of the compound is equal to the stoichiometric
average of the heat capacities of the pure elements in their SER. The Gibbs energy will
then be

Gh -YbG* =ay+aT (5.13)

In comparison with Eq. (5.2), there are only two coefficients that have to be determined
from experimental data because the heat capacity will be taken from the descriptions of
the pure elements. If there are special reasons, for example the coordination number for
a lattice site, one may refer an element to some phase other than the SER. The same
equation is also applied to the end members used for modeling solution phases that have
a composition within the composition range of the phase.

The main contribution to the heat capacity of a solution is due to the temperature
dependences of the “end members” of solutions. Most other model parameters used to
describe the properties of solutions are only linearly temperature-dependent; at most a
T In(T) term is used to describe a composition-dependent excess heat capacity, but any
higher power of T is discouraged except for the “end members.”

At the Ringberg meetings a new way to perform the extrapolation above and below
the liquidus temperature for the pure elements has been proposed (Agren et al. 1995); in
particular, by including the glass transition. This will not be treated further here, since it
has not yet been implemented in the software generally used for assessments.

Extrapolations of the Gibbs energy of the liquid below the melting temperature and
of the Gibbs energy for the solid phases above the melting temperature are necessary
when one considers solution phases. The SGTE group (Dinsdale 1991) has introduced
breakpoints in the Gibbs energy at the melting temperature of the liquid and the stable
solid phase. This usually works well for phase-equilibria calculations but sometimes gives

===========
5.3

5.3.1

5.3 Variables for composition dependence 87

strange results for calculated thermodynamic functions. Several other suggestions have
been made for extrapolations, but most of them can be treated with the series expression
above.

Variables for composition dependence

The Gibbs energy, G, of a phase depends on the amounts of the constituents in the phase.
For modeling the composition dependence it is more convenient to use the molar Gibbs
energy, G,,, defined in Eq. (2.14) and give the size of the system as the total amount of
components, N, which is the sum of moles of all components N;:

G=N-G, (5.14)

N=DN (5.15)

In this chapter “Gibbs energy” will be used to mean “molar Gibbs energy,” except
when clearly noted otherwise. The composition variables describing the composition

dependence of G,, are in the simplest case the mole fractions of the components, x;,,
defined as

(5.16)

 

The composition is sometimes expressed in mass fractions (often wrongly called weight
fractions) and it is defined as

w= (5.17)
where M, is the mass of component i and M = )°; M;. The mole or mass percent is the
respective fraction multiplied by 100.

For a closed system the amounts of the various components of a system are “external”
variables that can be controlled from outside the system. In each phase in the system the
components may form many different species or ions and enter as constituents various
types of sites in a crystalline phase.

The “composition” of a phase in a system at equilibrium is the amounts or fractions of
all components in the phase. This can be expressed using the mole fractions or the mass
fractions defined above.

Components other than the elements

The number of components for a system is always equal to the number of elements,
but one may prefer to use components other than the elements. For example, in an
oxide system (Ca, Mg, O) one may prefer to use (CaO, MgO, O,) as components if the
composition is entirely inside the binary system (CaO, MgO). This case will be discussed
in more detail in the section on quasibinary systems (section 6.2.4.5).

===========
88

Models for the Gibbs energy

At equilibrium the chemical potential of a component j is related to the chemical
potentials of the elements i by the reaction

By = ditt; (5.18)
j

where bj; is the stoichiometric factor of component i in constituent j and y; is the
chemical potential of constituent j.

An example of the use of this relation is if one wants to know the chemical potential
of H,O in a gas with the components H, and O,. The equation above gives

Mao = Hu, + 0-5Ho, (5.19)

This can be related to the classical “law of mass action” if one assumes that the gas is
ideal, see section 5.5.4, because then one has for each molecule

Ho, = °Go, +RT In(yo,)
My, = °Gu, +RT In(yy,) (5.20)
Huo = °Gu,o + RT In(yy,0)

where y; is the equilibrium constituent fraction of each molecule i in the gas. Inserting
Eq. (5.20) into Eq. (5.19) and rearranging the terms gives.

 

 

0.5°Go, =K= Rr in( “2 ) (5.21)

Yio

 

where K is the reaction constant for the chemical reaction HO = H, + 0.50).

The reference state for the chemical potential of H,O is not well defined unless one
compares it with the chemical potential of a gas consisting of pure H,O, j4j,,o- In that
case it can be related to the partial pressure of H,O, py,o, by -

Hijo — Bio

= — 5.22)
Pro eo( RT ) (5.22)
Another example can be taken from the use of the sublattice model introduced in
section 5.8, where, for example, carbon dissolves interstitially in fee iron, which is
modeled with two sublattices (Fe)(C, Va), where Va represents vacant interstitial sites.
The chemical potential of C cannot be obtained directly from the model, but one has the

following relations for the partial Gibbs energies of the end members for fee iron:

Gv. = Gre
GEO = Ge t+Ge (5.23)

On taking the difference between these partial Gibbs energies, one obtains for the
chemical potential of C

Me = Go = GE — GEV, (5.24)

===========
5.3.2

5.3.3

5.3 Variables for composition dependence 89

Some care should be taken when selecting components other than the elements, since
it might not be possible to define a convenient reference state for the chemical potential
or activity. As reference state one may use only a phase that can exist in pure form for
the selected component. If solely the equilibrium state is interesting, one can ignore such
problems, but one may find that the amount of the phase or the fraction of a component
of a phase may be negative if the phase has a composition outside the composition range
limited by the components defined by the user.

Internal degrees of freedom

In many cases a phase can have “internal” degrees of freedom that cannot be controlled
externally. For example, the speciation of a gas phase at equilibrium is determined by
the Gibbs energies of formation of the various gas species. A typical example is a gas
formed by the elements H and O. In this gas one may at equilibrium expect to find the
constituents H, H,, H,O, O, O,, and O;. For convenience one may also use H, and H,O
as components rather than the elements.

Sometimes a gas is formed by mixing various amounts of particular species, but, when
the equilibrium has been established, new species may have formed and the equilibrium
fractions of the initial species may be very different from the initial values. In a liquid or
crystalline solid there may also be a formation of species and ions on different types of
sites or different types of defects. These must be taken into account when modeling the
phase and the fractions of these constituents can be obtained only from an equilibrium
calculation.

 

The constituent fraction

The species that constitute the phase are called the “constituents.” For a gas with several
species the constituent fraction, y;, of each species i in the gas describes the internal
equilibrium in the gas. In a crystalline phase with several sublattices the constituent
fraction is often called the “site fraction.” The sum of the constituent fractions is unity
(on each sublattice) and the mole fractions of the components can be calculated from the
constituent fractions by using

Ll

5.25)
Dj Pid) ‘

 

where b;, are the same stoichiometric factors as in Eq. (5.18). If there are more constituents
than components one cannot obtain the constituent fractions from the mole fractions
without a minimization of the Gibbs energy of the phase.

For the gas phase the partial pressure is often used to describe its composition. For an
ideal gas, Dalton’s law can be applied and the partial pressure for a constituent i, p;, and
the constituent fraction, y,, are related by the total pressure, p, by

Pi= PY; (5.26)

===========
90

5.3.4

Models for the Gibbs energy

For phases with sublattices the constituent fractions, or site fractions, are defined as

5 oN!
Pas (5.27)

 

where N{ is the number of sites occupied by the constituent i on sublattice s and N“
is the total number of sites on sublattice s. If some sites are empty, it is convenient to
define a vacancy fraction

NO No
y= EN iy, (5.28)

NO idVa

The vacancy, denoted Va, can be treated as a real component that always has its
chemical potential equal to zero. This is a structural or constitutional vacancy, not a
thermal vacancy. It is possible to have thermal vacancies in the models, too, and the
fractions of such vacancies can be fitted by model parameters, but these vacancies will
stabilize the phase and the lattice stability parameter for the crystalline phases has to be
refitted to give the correct melting temperatures.

In this context it can be understood that it is convenient to define the molar Gibbs
energy for a crystalline phase relative to the formula unit of the phase. In particular, if the
phase is modeled with sublattices, which can be wholly or partially empty (i.e., containing
vacancies), the molar Gibbs energy is most simply expressed per mole formula unit of
the phase rather than per mole of real components.

The formula unit of a phase with sublattices is equal to the sum of the site ratios,
>, a, where the ratios a usually are the set of smallest integers giving the correct
ratio between the numbers of sites N“ on each sublattice. It is recommended to use
Cu,Mg rather than Cup ¢666667M8o.3333333 also in order to avoid rounding-off errors.

The mole fraction of the component i can be calculated from the site fractions of a
crystalline phase as

 

Ly biy\
© aD, Dj buy)?

 

 

(5.29)

where b;; has the same meaning as above. The vacancies must be excluded from the
summations.

Volume fractions of constituents

If the constituents have very different sizes, some may represent chain molecules with
thousands of atoms whereas others have maybe only a few atoms; this must be taken into
account when considering the entropy of mixing. It is common to use volume fractions in
such systems, but the volume is not a very good independent variable since it depends on
temperature. Instead the volume of a constituent should be used directly in the model and
the composition determined in terms of the constituent fraction of the species as defined
above. An example is given by the Flory—Huggins model described in section 5.9.6.

===========
5.3.5

5.4

5.4.1

5.4.2

5.4 Modeling particular physical phenomena 91

Other fraction variables

For gases partial pressures have already been mentioned above. In aqueous solutions one
frequently uses the molality as the fraction in the modeling. The molality of an aqueous
species i is the number of moles of i per kilogram of solvent and it can be directly
transformed to the constituent fraction of i.

Modeling particular physical phenomena

Several diverse physical phenomena may contribute to the thermodynamic properties of
a phase. In some cases such contributions do not depend smoothly on the composition,
but rather depend on some property that may itself vary with composition, for example
the Curie temperature for ferromagnetic transitions. It is then advantageous to model
these contributions separately even for the pure elements, and to model the composition
dependence of the Curie temperature and similar properties as separate quantities. This
introduces an “implicit” composition dependence into the Gibbs energy, which may make
the equilibrium calculations more complicated but brings the modeling closer to reality.

 

Lattice vibrations

The contribution to the Gibbs energy due to lattice vibrations above 300K is usually
close to that given by the Dulong-Petit rule, 3R7T. As already mentioned, it is not the
intention here to describe models that can be extrapolated to temperatures below 298 K,
but it may in some cases be important to describe the Debye temperature of a phase
because that is related to other properties. A possible method to apply in order to include
this was proposed at the Ringberg workshop (Chase et al. 1995). This method has still
not been implemented in most software and will not be discussed further here.

A ferromagnetic transition model

Some elements and compounds undergo second-order transitions, which can be due
to magnetic ordering or other internal changes without a change in composition. The
sification of a second-order transition is that there is a discontinuity in the second

 

derivative of the Gibbs energy at the transition whereas all first derivatives, such as entropy
and enthalpy, are continuous. A first-order transition means that there is a discontinuity in
the first derivative. At the magnetic-transition temperature the heat capacity approaches
infinity and it would be impossible to represent the heat capacity in the vicinity of the
critical point using Eq. (5.2) without using many coefficients or possibly also temperature
intervals. As an example of this, the heat capacity of pure iron was shown in Fig. 5.3(a).
In such a case it is recommended that the contribution to the Gibbs energy due to the
‘ion in bec be modeled separately. An additional reason is that the
magnetic contribution to G'* in an alloy with iron is not proportional to the fraction of
iron because the ferromagnetic transition is composition-dependent.

second-order trans

 

===========
92

Models for the Gibbs energy

Equation (5.2) can, then, be considered to be valid for a hypothetical element or
compound that does not undergo a second-order transition. For modeling a second-order
transition it is necessary to start with its contribution to the heat capacity of the system. For
the contribution to the heat capacity due to a magnetic transition the following empirical
expressions have been proposed by Inden (1981):

  

 

 

len
cir =x n( 42) rel (5.30)
ce" = KP In =) tl (531)
i aa

where the superscript fm denotes the ferromagnetic state below the Curie temperature Tc.
and pm the paramagnetic state above Tc; Tt is T/T¢ and T is the absolute temperature.
The two coefficients K are general functions for all magnetic transitions and can be
determined by integrating the heat capacities as follows:

1 «
me = f Ci (n)dr + [ CPn(x)dr (5.32)

The total magnetic contribution to the molar entropy is set equal to —R In(1 + B),
where B is the mean magnetic moment measured in Bohr magnetons. This is equivalent
to assuming that the magnetic entropy is due to the disordering of localized spins with
average magnitude equal to 8. The magnetic contribution to the Gibbs energy, ™®*G =
™s8G —T-™8S, vanishes at the Curie temperature, giving ™®H = T,-™*S. The two
contributions to ™*H below and above the Curie temperature may approximately be
attributed to the contributions of long-range order (LRO) and short-range order (SRO),
respectively. The ratio of these two contributions is introduced as an empirical constant,
p, for which Inden found the value 0.28 for cobalt and nickel (fec) and 0.4 for iron (bec).

The heat capacities cannot be integrated to give a closed expression for the Gibbs
energy unless it is expanded into a power series. Thus several simplifications of the
model have been proposed and the simplified version of this model due to Hillert and
Jarl (1978) has been used most widely. This gives

™eG., = nRTf(7)In(B +1) (5.33)

where n is the number of atoms per formula unit that have the average magnetic moment
B. The function f(7) according to the simplified model is

pet amd ee a '
A| 140p * 497\p 6 135 600 7

b/s pgs
(7,2 477 =1
(G++) Ts

 

f=

with

 

aa S18, 169201
~ 1125 " 15975\p

===========
5.4.3

5.4.4

5.4 Modeling particular physical phenomena 93

As already mentioned, p depends on the structure. In a solution phase 7, and B vary
with the composition. For maximum flexibility and simplicity, they are assumed to vary
with composition in accord with the same models as are applied to the Gibbs energy
itself, as described below. The total Gibbs energy for an element or end member with a
magnetic transition is thus

 

Gh=

 

hyp 4 Goamas (5.34)

where G8? is described by Eq. (5.2) and G&™* by Eq. (5.33). The large effect of the
ferromagnetic transition in bec Fe is clearly evident from Fig. 5.3(a). When these values
are integrated to give a Gibbs energy, one can obtain the curves in Fig. 5.3(b), which
show the value of the Gibbs energy relative to bec Fe extrapolated also into the metastable
ranges. These curves are much smoother than the heat capacities, but an effect of the

magnetic transition is the increasing stability of bec Fe at lower temperatures.

Other physical contributions to the Gibbs energy

The contributions to the Gibbs energy from other physical phenomena, such as the
electronic heat capacity, size mismatch, and short-range order, are usually not modeled
separately. The reason for this is that, although some of these contributions can be
accurately modeled from atomistic theories, the contributions to the Gibbs energy are
in most cases much smaller than other contributions that cannot be modeled accurately.
In a theoretical approach one can treat some contributions accurately but may ignore
others that are equally important. In the Calphad technique the total Gibbs energy is
modeled using experimental data on the phase diagram and thermodynamics to fine-tune
the models to reality.

The composition dependence of physical models

The physical models with composition-dependent physical quantities, such as the Curie
temperature and Bohr magneton number in the model for ferromagnetic transitions, add
to the phase a Gibbs-energy contribution that is “indirectly” composition-dependent.
Usually the composition dependence of the physical quantity is described with the same
composition variables as the Gibbs energy itself.

The magnetic model described in section 5.4.2 has two parameters, Tc, the critical
temperature for magnetic ordering, and 8, the Bohr magneton number. These can be
composition-dependent in the same way as the parameters describing the chemical part of
the Gibbs energy. Thus each “end member” of a solution can have a critical temperature for
magnetic ordering and a Bohr magneton number. The composition dependences of these
quantities are described using the same mathematical expression as that for the chemical
excess Gibbs energy. Employment of particular models for other physical properties may
be used more in the future.

An example of modeling the critical temperature for magnetic ordering is shown in
Fig. 5.4. Its value for the bee phase in the Fe-Cr system was assessed by Andersson

===========
94

5.5

Models for the Gibbs energy

 

 

   

   

 

 

 

 

 

 

2500 1 1 1 1 1 1 1
liquid liquid b
2000 b
S <S foc p
@ 1500 Hig boo Fg 1200+ r
5 2 To for bee
= ® 1000 4\\ Jo
: Te for fee
E 1000 : ; £ 800+) r
5 5
e F 6004 L
500 . - 400 4 +
200 + r
° °
A ?° 02 04 06 08 10 AV o 02 04 06 08 10
Mole fraction Cr Mole fraction Ni
(a) (b)

Figure 5.4 The phase diagrams for Fe-Cr and Fe-Ni with the Curie and Néel temperatures of the
bcc and fcc phases plotted as dashed lines, Note that there is a small kink in the solubility curves
where they are crossed by a magnetic-ordering curve.

and Sundman (1987) and is shown as a dashed line in Fig. 5.4(a). Since Cr is anti-
ferromagnetic, this is modeled with a negative value of the critical temperature and
the curve goes through zero at some Cr content and on the Cr-rich end it represents a
Néel temperature. In Fig. 5.4(b) the critical temperatures for magnetic ordering for both
fcc and bee in Fe-Ni from an assessment by A.T. Dinsdale and T. G. Chart (unpublished
work, 1986) are shown, with the ordered L1, phase added by I. Ansara (unpublished
work, 1995). In the absence of any experimental and theoretical information when this
system was assessed, the Curie temperature for bec Ni was assumed to be the same as
that for fee Ni.

Models for the Gibbs energy of solutions

The term “solution” is in some contexts restricted to dilute solutions and “mixtures” used
more generally, but in this book “solution” is used for all kinds of phases that can vary
in composition.

All phases vary in composition to a greater or lesser extent, but for practical purposes
it may be possible to ignore the compositional variations for some compounds. However,
it is also important to state what the practical purpose is. For example, in electronic
engineering the change in electronic properties of a semiconductor like PbS when its
composition is varied over a small range is essential, but a metallurgist interested in
extracting lead from a PbS ore may safely ignore this.

 

For solution-phase modeling it is necessary to describe the properties of the pure ele-
ments or compounds that form endpoints of the solutions. In many cases the solution-phase
models will also require properties for compounds that cannot be measured separately.

===========
5.5.1

5.5 Models for the Gibbs energy of solutions 95

For that one needs estimates and models that can predict, for example, the Gibbs energy
of chromium in the fcc state. These problems were discussed in section 5.2.

In order to describe real solutions, it is necessary to model the terms in Eq. (5.1) and,
together with the model parameters, this can be fitted to the experimental properties of
the solution. One may place the emphasis on any one of “G,,, “S,,, or ®G,,, but the
main goal of the presentation in this book is to model the total Gibbs energy of a phase
in such a way that it can be extrapolated to multicomponent systems.

The compound-energy formalism

There are many ways to derive the compound-energy formalism (CEF), but the original
is based on the two-sublattice model formulated by Hillert and Staffanson (1970). This
model was extended to an arbitrary number of sublattices and constituents on each
sublattice by Sundman and Agren (1981). In order to make the mathematics easier, they
introduced the concept of a “constituent array.” A constituent array specifies one or more
constituents on each sublattice and is denoted J, while the individual constituents are
denoted i, sometimes with a superscript (s) to denote the sublattice s. The constituent
arrays can be of different orders and the zeroth order has just one constituent on each
sublattice. Such a constituent array denotes a compound and this is the origin of the name
compound-energy formalism.
The Gibbs-energy expression for the CEF is

(5.35)

(5.36)

 

 

YP, WL, +P, WL, + (5.37)
Th B

where Jp is a constituent array of zeroth order specifying one constituent in each sublattice
and P;,(Y) is the product of the constituent fractions specified by Jp. °G;, is the compound-
energy parameter representing the Gibbs energy of formation of the compound Jj. In
many applications of the CEF some constituent arrays J) do not represent any stable
compounds, which means that those °G,, must be estimated in some way.

In the configurational entropy the factor a, is the number of sites on each sublattice
and y\” is used to denote the constituent fraction of i on sublattice s. The first sum is
over all sublattices and the second over all constituents on each sublattice.

The excess term, *G,,,, contains sums over the possible interaction parameters defined
by component arrays of the first order, second order etc. A constituent array of first
order has one extra constituent in one sublattice. For the second-order constituent array
it is necessary to include both the case with three interacting constituents on one sub-
lattice and that with two interacting constituents on two different sublattices, i.e. a
reciprocal parameter. The use of constituent arrays of higher than second order is not
advisable.

===========
96

5.5.2

Models for the Gibbs energy

The partial Gibbs energy, Eq. (2.15), takes a special form for a phase with sublattices
since it might not, in the general case, be possible to calculate the partial Gibbs energy for
the components unless all constituents enter in all sublattices. Nonetheless, one can always
calculate the partial Gibbs energy for a constituent array of zeroth order J, as follows:
"AG, 0G.

Gy = Gu tL Hh -LEy (5.38)

o
1d, sal fj

 

ai

where the first sum is taken over the constituents i defined by the constituent array (one
in each sublattice) and the second sum is over all constituents in all sublattices.

The relation between the compound and cluster energies

The CEF was developed for phases in which there are different types of atoms on the
sublattices and different numbers of nearest neighbors in the sublattices, for example
interstitial solutions, carbides, and intermetallic phases like the o phase. More recently it
has also been used to describe order—disorder transformations in phases with the structure
type B2 (CuZn) and L1, (Ni;Al) which are ordered forms of the A2 and AI structure
types, respectively. In such cases there are relations between the parameters in the CEF
that must be respected in order to describe the physical properties of the phase.

The basic concept of the CEF is that each compound or “end member” has
independent Gibbs energy of formation. This Gibbs energy is a function of temperature
and pressure but independent of composition. One may compare this with a CVM treat-
ment in which the “cluster energies” may appear to be similar to the compound energies,
but they depend on the composition, or volume. However, one may expand the com-
position dependence of the cluster energy in the cluster fractions and obtain a separate
end-member energy and an excess energy contribution. It is also possible to replace the
configurational-entropy expression (5.36) by, for example, a quasi-chemical model or a
tetrahedron CVM model, but, as long as the compound energies depend only on T and
p. this should still be considered as a variant of the CEF.

It is not uncommon that there are no experimental data for many of the compounds
or “end members.” In some cases the end members are purely fictitious, in particular
when the end members are charged, like in oxides. In those cases the concept of “bond
energies” may be useful and the energy of such a compound may be estimated as the
sum of the energies of bonds between the atoms in the compound.

Another technique to estimate the Gibbs energy of metastable end members in the
CEF is to assume that an element in a sublattice with a coordination number of 12, or
smaller, will contribute the same Gibbs energy as that element has in the fcc lattice. In a
sublattice with coordination number 14 or higher it will contribute the same Gibbs energy
as in a bec lattice, since the second-nearest neighbors in a bec lattice are not much further
away than the nearest neighbors. This has frequently been used in the modeling of many
phases, for example the o phase. For example, a ternary end-member parameter can be
estimated as

its own

 

°Ghemoni = 1O°G EE +4°GNig + 16°GNT (5.39)

===========
5.5.3

5.5.4

5.5 Models for the Gibbs energy of solutions 97

For models of ordered phases there are usually many possible ordered compounds, but
only a few that are stable and can be measured. It is possible to calculate by ab initio
techniques the energies of ordered compounds, which is very useful, in particular
for obtaining good extrapolations of the ordered phases to higher-order systems; see
section 3.3.3. It is possible using the Connolly—Williams cluster-expansion method
(Connolly and Williams 1983), or by “disordered” ab initio calculations, to obtain esti-
mates of the enthalpies of a disordered phase (Abrikosov et al. 1996). Even with very
good ab initio data, it is still very important to have experimental data to compare them
with since some effects, such as magnetism, may cause deviations between the results of
ab initio calculations and the reality.

The reference state for the Gibbs energy

There is no absolute value for the Gibbs energy, so it is necessary to refer the Gibbs
energy in all phases to the same reference point for each element. Thus in Eq. (5.35) and
in the following the notation °G? means the Gibbs energy of formation of the constituent
array J in @ from the reference states of the elements included in the constituents and is
a function of temperature and pressure,

°G

 

=D by HES = f(T, p) (5.40)
F

where bj; is the stoichiometry factor for the component j in the constituent array J and
H}*® is the enthalpy of the component j in its reference state, which is normally the
stable state for the component at 298.15 K and | bar. This reference state will normally
be omitted from the equations below, but, when calculating chemical potentials, it is
important to know what the reference state for each component is.

The ideal-substitutional-solution model

An ideal substitutional solution means a solution of non-interacting constituents mixing
randomly with each other. A special case of this is when the constituents are the same as
the components. The Gibbs energy is then

Gy = 305/°G, + RTS x, Ina) (5.41)

isl isl

Usually, however, the concept of an ideal model is extended also to the case when
there are constituents other than the components, for example the ideal gas, which usually
has many more constituents than components. The model above should then be called
the simple ideal-substitutional-solution model. The Gibbs energy of this model is

Gy = ys yi°G; 4RTS yiln(y;) (5.42)

i=l i=l

===========
98

5.5.5

Models for the Gibbs energy

In this case the constituent fractions, y;, defined in section 5.3.3, are used rather than
the mole fractions, x;, because there can be more constituents than components and
because the mole fractions defined in section 5.3 are defined only for the components.

In the rest of the book, the term ideal model will mean a model in which the excess
Gibbs energy, °G,,, is zero. This means that its Gibbs energy depends only on the end
members and that the entropy of mixing of the constituents is random. The physical
contributions are included in the ideal model.

The gas phase

The phase most often described as an ideal substitutional model is the gas phase, which
usually has many more constituents than components. For example, a model for gas with
the components O and H should include at least the six constituents H, H,, H,O, O, 05,
and O,:



The sum of the constituent fractions is unity. If there are more constituents than
components, there are internal degrees of freedom in the phase and one can obtain the
values of the constituent fractions only by minimizing the Gibbs energy for the current
set of conditions.

Comparing Eq. (5.42) with the general form of the Gibbs energy, Eq. (5.1), gives


The °G; parameters can, at least in principle, be determined separately for each con-
stituent i, and thus there are no adjustable parameters in the ideal-substitutional-solution
model which describes the properties of the solution. For a gas phase the constituents
are molecules or ions and their °G; values can usually be calculated accurately from the
vibrational and rotational modes of the molecule (Allendorf 2006).

It is interesting to note that it would require a very complicated excess Gibbs energy
to describe the gas mentioned above with H and O using a simple ideal model based on
the mixing of the atoms H and O. It is thus important to select a good “ideal” model
in order to have a simple excess Gibbs energy. The shape of the Gibbs energy versus
composition curve for a binary simple ideal substitutional solution is given in Fig. 5.5(a).

===========
5.5 Models for the Gibbs energy of solutions 99

 

-0.1 4

-0.2 4

-0.3 4

(AT)
@, (AT)

-0.44

-05 4

-06 4

 

 

 

 

A 0 02 04 O06 08 1.0 A 0 02 04 O06 08 1.0
Mole fraction B Mole fraction O

(a) (b)

Figure 5.5 Gibbs-energy curves for ideal solutions. (a) The Gibbs energy for a simple ideal
binary substitutional model divided by RT. Note that the slopes at each endpoint are infinite.

(b) The Gibbs energies divided by RT for an ideal gas with the components H and O at various
temperatures (500, 1000, 1500, 2000, and 3000 K) including all possible molecules (i.e.
constituents) that can form. In (a) there are only A and B as constituents; in (b) there are several
constituents. The strong “V” shape at low temperature is due to the formation of the molecule
H,O. At high temperature the gas becomes more like a monatomic ideal solution with H and O as
major constituents.

The total Gibbs energy of one mole of “formula units” of the gas phase is

G&=Yy, a = bj HS + RT me +RT (2) (5.48)
7 7

0

Equation (5.48) is an alternative formulation of the law of mass action. The constituent
i to the total pressure p,

 

fractions y, are the ratios of the partial pressure p; of speci:
Pi/P-

The parameters °G* cannot be measured calorimetrically with good accuracy.
A quantum-mechanical calculation, using spectroscopic measurements, is much more
accurate. This type of calculation is outside the scope of this book. The “standard pressure”

 

Po by convention is set to 10° Pa.

It has already been stated above that the gas phase usually has more constituents than
components, i.e., there are stable molecules and thus internal degrees of freedom. It is
interesting for the discussion of the model later to show how the Gibbs energy for a gas
phase with the elements H and O depends on the composition for some temperatures.
This is shown in Fig. 5.5(b). At low temperature the gas is either H, and H,O or O, and
H,O because the Gibbs energy of formation of H,O is very strong.

Non-ideal gases are often described in terms of a Helmholtz energy rather than a Gibbs
energy, i.e., using T and V as variables instead of T and p. The reason for this choice is
that the critical point for the gas—liquid transition is usually important for non-ideal gases,
i.e., the gas and the liquid should have the same Helmholtz energy function. The transition

===========
100

5.5.6

5.5.7

Models for the Gibbs energy

cannot be described with a Gibbs-energy function because it represents a miscibility gap
in the volume of the phase. Non-ideal gases are sometimes modeled using the fugacity;
the fugacity f, of a gas constituent i is simply related to the activity by the reference
pressure pp as

Si = Poti (5.49)

and this can be modeled with the excess parameters introduced below.

Ideal phases with special features

Many features are associated with an ideal phase, i.e., a phase with non-interacting
constituents. The definition above in Eq. (5.42) means that a phase treated with the ideal
substititional model may exhibit a number of “non-ideal” features because there can be
more constituents than components. For example, the activity versus composition curve
for an ideal phase is often assumed to be a straight line, but that is certainly not true for
a gas with H and O, as discussed above.

Even without the formation of stable species with two or more different components
in the gas, one can have “non-ideal” shapes of the activity curves; see Fig. 6.7 later for
an example. The curve depends on what is selected as components, but the components
selected for a system should take into account all phases, not just the gas phase.

In models discussed later one will find that there are miscibility gaps even in “ideal
systems,” i.e., systems with non-interacting constituents.

The origin of non-ideal behavior of solutions

Systems with non-interacting constituents for which the surroundings of a constituent
are irrelevant can be described by ideal models. In an ideal solution the bond between
two unlike constituents, for example atoms in a lattice, is equal to that between two
identical constituents. The simplest way to introduce a non-ideal behavior of solutions is
to introduce the energy difference for these different bonds as

  

 

€,) = Ey —0.5(Ey + Ey) (5.50)

ij

If €,; is negative it means that unlike constituents prefer to be together, i.e., long-
and short-range order or clustering. If €;; is positive, there is a tendency toward phase
separation and formation of a miscibility gap because the constituents prefer to surround
themselves with constituents of the same kind.

In a theoretical approach various physical contributions to E;;, E;;, and E;; can be iden-
tified, like electronic, vibrational, and configurational. In the present treatment, however,
all contributions, except those that are modeled as separate physical contributions to the
Gibbs energy (such as the magnetic contribution above), are included in the thermody-
namic treatment as a value of €;; and are modeled together.

In crystalline solids the number of bonds is fixed, but in a liquid phase the constituents
have no fixed environment and the number of nearest neighbors can vary. In many aspects

===========
5.5.8

5.5 Models for the Gibbs energy of solutions 101

the liquid is more similar to a gas than it is to a crystalline solid, but in all real liquids
there is an interaction energy between the constituents that will create non-ideal behavior.

The substitutional-regular-solution model

In a crystalline phase the atoms have well-defined positions in a unit cell that can be
repeated indefinitely in all directions. In a substitutional solution the constituents have the
same probability of occupying any site in the unit cell and the Gibbs energy is given by

i a°G FREY wns) +°Gy (5.51)

isl isl

 

Since the probability is equal to the mole fraction, on limiting the excess Gibbs energy
to binary interaction, we have

G6, =D VixLiy (5.52)
7 pt
Ly= Sey (5.53)

where z is the number of bonds and €¢ is related to the bond energies by Eq. (5.50). The
substitutional model is frequently used for metallic solutions, both liquids and crystalline
solids, in which all the constituents mix on the same sites.

A phase may have crystallographically different sublattices and these may have dif-
ferent numbers of nearest neighbors and the constituents may prefer different sublattices.
This is a form of long-range order (LRO) and must be included in the modeling, as will
be described in section 5.8.

The models based on the CEF do not include any explicit short-range-order (SRO)
contribution. The reason for this is that a proper treatment of SRO requires the introduction
of clusters, which makes the numerical solution of the equilibrium too complicated for
practical applications in multicomponent materials. Another reason is that, for many
important materials like steels and aluminum alloys, the contribution to the Gibbs energy
due to SRO is very small. Even for alloys in which SRO is significant, for example
Ni-based superalloys, the SRO contribution can be approximated in the excess Gibbs
energy; see section 5.8.4.5.

It is mainly for the liquid phase that models that take SRO into account are more
frequently used also in thermodynamic databases. For the liquid the pair model, like the
quasi-chemical model described in section 5.7.2.1, or the associated model described in
section 5.7.1, is usually sufficient.

For crystalline phases the CVM developed by Kikuchi (1951) has been used with
the techniques described in this book for an assessment of the Au-Cu system (Sundman
et al. 1999). A simple case of approximating SRO in the disordered state is described in
section 5.7.2.2.

===========
102

5.5.9

Models for the Gibbs energy

Dilute solutions, Henry’s and Raoult’s laws

In the very dilute range all phases have the property that the activity of each of the
constituents varies linearly with the fraction of the constituent. This is usually called
“Henry’s law” and all models described here obey this. In some cases, when the solubility
range does not exceed the range within which the activity is linear, it can be convenient to
model the phase with just one parameter describing this slope. Such an activity coefficient
or “Henrian” parameter, y;, for the solute i can be written

 

4; =e0( 4) =x, (5.54)

This model is useful for cases in which several dilute solutes in a single solvent phase
are considered, for example aqueous solutions, because a single parameter is needed and
simple software can be used. For the solvent “Raoult’s law” is assumed, meaning that

a, =%;, (5.55)

For a case with several solvents, or the same solvent in both liquid and solid states,
one must keep in mind that y? does not describe any property of pure i but only of 7
together with the solvent in a specific state. In such cases it is usually simpler to use
a model that relates the properties of the pure solute i in the same state as the solvent,
i.e., to use a model describing the complete composition range from solvent to solute.
This requires an estimation of the Gibbs energy of the solute in a metastable state and
such estimates are usually available from the SGTE (Dinsdale 1991). The assessment
of an interaction parameter to describe the slope in the dilute range is then identical to
assessing a value of y?.

Raoult’s law applies to the solvent in a dilute solution, stating that the activity of
the solvent is equal to the fraction of the solvent when the solute is dilute. All models
described here obey this.

Before the advent of computers, several models useful for thermodynamic calculations
using just pen and paper were developed. One of them that is still popular is the dilute-
solution model of Wagner (1952). In this model an additional coefficient is introduced
into Eq. (5.54) for the chemical potential of the solvent i,

My/(RT) = In(y2x)) +56: (5.56)

This equation is convenient for calculations using pen and paper but should never be
used in computer calculations, since this model is inconsistent because it violates the
Gibbs—Duhem relation, except in the trivial case of a binary solution.

One can compare it with the chemical potential calculated from the substitutional-
regular-solution model, assuming that there are no interactions between the solutes:

HM = 9G; + RT In(x,) + (1 = 2x, +37) Ly; (5.57)

===========
5.6

5.6 Models for the excess Gibbs energy 103

The difference is the squared term of x; in Eq. (5.57), without which chemical potentials
described by Eq. (5.56) cannot be added to form an integral Gibbs energy

Gy = oe; (5.58)

except for the trivial binary case.

For very dilute solutions the fraction of solvent, x7, can be set to zero in Eq. (5.57) and
the sum of the terms °G; + L,; is equivalent to RT In(y?) and L,; is equal to 0.5RTeé;,.

Darken improved this model by introducing his quadratic formula (Darken, 1967).
Since large amounts of data have been obtained using the € model, in particular for the
liquid phase, it can be interesting to note that both Pelton (Pelton and Bale 1986) and
Hillert (1986) have developed methods by which to convert y? and €;; to a regular-solution
model. If the solvent is denoted as “1,” the partial Gibbs energies of the solutes “j” are,
using Hillert’s method,

Gp =°G)+Mj +L, + RT In(x)) + (Ly — bij — Lad x

k=2

 

$0.5 PL + Lu — Luar (5.59)

min
where the L parameters are the interaction parameters in a substitutional regular solution,
Eq. (5.52). The °G; is the reference state for pure j in this phase and M; is a modification of
this reference state when “1” is a solvent. The relations connecting M,, the L parameters,
and the € parameters are
Ly/(RT) = —0.5¢))
Lyj/(RT) = €4; — (Ej + ux) (5.60)
M,/(RT) = ¥3 +€;;
With the last formula one may use the € parameters in a regular-solution model. Note

that, even converted to a regular solution, the model is limited to the dilute range of all
the solutes j in Eq. (5.59) due to Mj.

Models for the excess Gibbs energy

The excess Gibbs energy is the Gibbs energy that is “in excess” of what can be described
by “G,,, ™S,, and "SG... The binary, ternary, and higher-order interactions in the
excess Gibbs energy will be described separately. All interactions will be written for
a multicomponent system in order to avoid using special features that are valid in a
lower-order system only:

Gy = Gy $C TS Gy (61)
*Gy = Gy — Gy G+ TS,

RNMEG pUMEG y hienEG (5.62)

===========
104

5.6.1

5.6.2

Models for the Gibbs energy

Note that the excess Gibbs energy includes all contributions not included in the ideal
part, i.e., excess vibrational, excess configurational, etc.

The Gibbs energy of mixing

One should not confuse the excess Gibbs energy and the Gibbs energy of mixing. The
Gibbs energy of mixing is defined as

 

6G, = Gy —La°G

(5.63)

where the summation i is for all components of the system. The total Gibbs energy of
mixing, ™*G,,, is the difference between the Gibbs energy of the phase and that of a
mechanical mixture of the components. The excess Gibbs energy, ®G,,, in Eq. (5.1), is a
modeling quantity and equal to the difference between the Gibbs energy of the real phase
and that of whatever ideal model that has been selected.

The binary excess contribution to multicomponent systems

The basic form of the binary excess-Gibbs-energy contributions to a multicomponent
substitutional solution is

acl on

YD xxl (5.64)

i=l jar

 

This equation is a sum over binary interactions in all i-j systems. Note that the mole
fraction of each constituent is used, i.e., there is no assumption that x; +x; = 1,
that is true only for the binary subsystem. The same equation can be used to describe the
binary excess contribution for each sublattice of a phase. The constituent fractions of the
multicomponent system should then be used in Eq. (5.64).

There are several ways to justify type of binary interaction parameter from a physical
point of view, for example by invoking the difference in bond energy between like and
unlike atoms in Eq. (5.50). If the number of nearest neighbors is z, then L;; = (z/2)€;j.
If the regular-solution parameter L,; is a temperature-independent constant, the model is
called strictly regular.

There are many extensions of this model including temperature and compo-
sition dependences and considering interactions between constituents on different
sublattices.

In Fig. 5.6 the effect of the regular-solution parameter (in units of Jmol~') on the
phase diagram for a binary system is shown. The system has only two phases, liquid
and solid. In each row the liquid has the same regular-solution parameter, +20000 in
the first row, +10000 in the second, 0 in the third, and —10000 in the last row. The
solid has a regular-solution parameter equal to +20000, +10000, and 0 in the first
and second rows, and +10000, 0, and —10000 in the third and fourth rows. With a
negative regular-solution parameter one can expect ordering, so a tentative second-order

 

===========
5.6 Models for the excess Gibbs energy 105

 

     

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

‘200 ‘000 ‘400
‘200 200 ‘300
‘100 1100 —<—r 1200
t000 ‘000 ‘100
= 200 = 1 = 00
£0 £0 2 0
© eo © wo 100
$00 500 co
0 co sco
200 200 460
A> 02 os 08 08 10 fo o2 as 08 a8 10 Q& o 02 od 08 OB
Mol racion 8 Mol tacion8 Mol facion 8
(a)+20000, +20000 (b)+20000, +10000 (c)+20000, 0
‘200 ‘000 ‘300
‘200 200 ‘200
‘100 ‘100 ‘100
00 <0 = 100
© wo = 10 | = 200
3 800 3B 00 B00
B 700 B 700 B 700
E oo = om © 0
$00 500 sco
0 co 0
200 200 200
Ao o2 os 08 08 10 Qf o o2 os 08 a8 10 Qo 02 oA 08 OB
Mol racion 8 Mol tacion8 Mol facion 8
(@+10000,+20000 (@)+10000, +10000 (9 #10000, 0
‘200 ‘000 ‘300
‘200 200 ‘200
‘100 ‘100 ‘100
¢ i000 ¢ 1 1000
= 900 = 900 |_| = 900
2 eco 2 200 2 00
E 0 L 0 Lo
© 600 © 600 © 600
$00 500 sco
‘00 0 ‘00
200 200 200
A 0° 02 04 06 08 10 AY o 02 04 06 08 10 ZY 0 02 04 06 08
Mol racion 8 Mol tacion8 Mol facion 8
(g)0,+10000 (h)0,0 (i) 0, 10000
‘200 ‘000 ‘300
‘200 200 ‘200
‘100 ‘100 ‘100
¢ i000 ¢ = 100
= 200 = 90 a) ———_|
2 20 2 00 2 to
E 0 L 0 L 0
© 600 © 600 © 600
$00 500 sco
0 co 0
200 ooo 400
A © 02 04 06 of 10 ZY o 02 o4 06 08 10 AY 0 02 04 O86 08 10
Mol racion 8 Mol tacion8 Mol facion 8
() 10000, +10000 (&) 10000, 0 (10000, -10000

Figure 5.6 Phase diagrams for binary systems with differing values (in units of Jmol~') of the
regular-solution parameter. In the first row the interaction is +20000 for the liquid and +20000,
+10000, and 0, respectively, for the solid. In the second row the interaction is +10000 for the
liquid and +20000, +10000, and 0, respectively, for the solid. In the third row the interaction is
0 for the liquid and +10000, 0, and —10000, respectively, for the solid. In the fourth row the
interaction is —10000 for the liquid and +10000, 0, and —10000, respectively, for the solid. The
dotted curves in diagrams (i) and (1) represent a possible second-order ordering transition.

===========
106

Models for the Gibbs energy

transition line is indicated by a dotted line. The ordering has been assumed to be of
A2/B2 type.

In Fig. 5.7 the Gibbs-energy curves for the liquid and solid phi are plotted for three
different temperatures for the case when the interaction parameter is —10000J mol~! for
the liquid and +10000Jmol!"! for the solid. At 800K the liquid is stable except at the
limits and the Gibbs-energy curve for the solid phase is very flat but has no inflexion
points. At 500K the Gibbs-energy curve for the solid phase has a maximum and two
minima, but the miscibility gap is metastable since the liquid phase is stable in the middle
of the diagram. At 400K the miscibility gap in the solid phase dominates the phase
diagram and the liquid is no longer stable.

In the assessment of real systems one should expect to obtain interaction energies
approximately of the same order of magnitude in all phases modeled with a regular-
solution model. The reason for this is that the regular-solution parameter depends on the
difference in bond energies as given by Eq. (5.50), which remains approximately the
same independently of the structure of the phase.

 

 

 

 

 

 

 

 

 

 

6 6 6
L 4 L 4 _ 4
3 3 3
Eo E> EB 2 liquid
25 2 4 solid 2 4
B B 3 solid
5 solid 5 B
@ -2 @ -2 liquid @ -2
oH o H4 o H4
3 3 3
8-6 3-6 g-68
-8 -8 8
Ao 02 04 06 08 10 A 0 02 04 06 08 10 A 0 02 04 06 08 1.0
Mole fraction B Mole fraction B Mole fraction B

(a) (b) (©)

Figure 5.7 Gibbs-energy curves for the phase diagram in Fig, 5.6(j) at three different
temperatures, (a) 800, (b) 500, and (c) 400K.

 

 

  

 

 

 

 

 

 

8 T=20000
L a4
3 t =
2 5 L=10000
2 E2
3 Zo
° &
5 B-2
z ig
° 8 T==10000 6 £=-10000
A 0 02 04 06 08 1.0 A 0 02 04 06 08 1.0
Mole fraction B Mole fraction B
(a) (b)

Figure 5.8 The Gibbs energy (a) and the enthalpy (b) of mixing at 400K for the values of the
regular-solution parameter used to calculate the phase diagrams in Fig. 5.6. The dotted curves
represent a metastable extrapolation without ordering for the case with negative interaction.

===========
5.6.2.1

5.6 Models for the excess Gibbs energy 107

 

  

 

 

 

 

 

 

 

 

 

1300 +300
1200 +200

1100 +100
< 1000 < 1000
& 200 | 900
3 800 } 2 800 = 800
2 700 700 2 700
= 600 600 600

500 500 500

400 400 400

300 300 L 300

A 0 02 04 06 08 10 A 0 02 04 06 08 10 A 0 02 04 06 08 10

Mole fraction B Mole fraction B Mole fraction B

Figure 5.9 Phase diagrams with a compound A,B for varying interaction parameters in the liquid
and solid phases; the compound has the same Gibbs energy in all three diagrams. The interaction
parameter in the liquid is +10000J mol in the left and middle diagrams and —10000J mol“ in
the diagram on the right. The solid-phase interaction parameter is +20000J mol”! in the diagram
on the left and +10000J mol"! in the other two. In the phase diagram the compound melts
congruently in the diagram on the left, has a solid decomposition in the diagram in the middle,
and undergoes peritectic melting in the diagram on the right.

In Fig. 5.8(a) the Gibbs energy of mixing and in Fig. 5.8(b) the enthalpy of mixing
for the solid phase at 400 K are shown for some values of the regular-solution parameter.
The dotted line indicates the metastable disordered phase for the case with negative
regular-solution parameter.

In most binary systems there are also intermetallic phases, but, if these are ignored,
the general shape of the phase diagram should be close to one of those plotted. In Fig. 5.9
three phase diagrams with a compound are shown. It shows that the type of transformation
for the compound in the phase diagram depends on the parameters of all phases; it is not
a property of the compound.

The Redlich-Kister binary excess model

Equation (5.64) gives just a single interaction parameter for the phase in the binary i-j
system and that is often not enough to describe the available experimental data. One may
extend the binary regular-solution term in the composition by using differences between
the fractions of i and j:

k
Ly = Dx)" Ly (5.65)
=

This form of the composition dependence for a binary interaction was first suggested by
Guggenheim (1937). It was recommended for use in modeling multicomponent systems
by Redlich and Kister (1948) and is generally known as a Redlich-Kister (RK) power
series. It is evident that, for a binary system, this equation can be written in many different
forms using the relation x, = 1 —x,. Other well-known expressions for the composition
dependence are Legendre polynomials, and those of Margules, Borelius, etc. However, the
form given above is recommended for use in multicomponent systems since it preserves

===========
108

Models for the Gibbs energy

the shape of the excess Gibbs energy of the binary system in the multicomponent system
and only the magnitude decreases with decreasing x; + x;.

The curves in Fig. 5.10 may help the reader to understand the contributions of
the various terms in an RK series to the excess Gibbs energy. Note that the regular-
solution term is the only one that has a non-zero value in the middle of the system.
The contributions from the odd coefficients change sign in the middle whereas the
contributions from the even coefficients have the same sign throughout the whole sys-
tem. All curves are calculated for the same value of the parameter, 20000Jmol™'. The
magnitude of the curves decreases because the difference in fractions is raised to a
higher power.

For reasons discussed later, one should avoid using many coefficients in an RK
series. There should be a special reason for using more than the first three. The special
name “subregular-solution model” is sometimes used when just two RK coefficients are
employed, and “subsubregular” indicates using three.

The order of i and j is important in the RK series, since the sign of the coefficients
depends on it. Various types of software may use different ways to denote the order.

A single positive regular-solution parameter will always give a symmetrical miscibility
gap, thus at least two RK coefficients are needed in order to have an asymmetrical
miscibility gap.

 

Enthalpy (kJ mol")

 

 

 

 

T T
0 0.2 04 0.6 08 1.0
A Mole fraction B

Figure 5.10 The contributions to the enthalpy of mixing for the first five terms in the RK power
series. The *Z curve is dashed and that for *Z is dotted to make them easier to identify.

===========
5.6 Models for the excess Gibbs energy 109

It is quite common that a phase is stable only within a narrow composition range. This
is usually modeled with sublattices with various types of defects based on crystallographic
and other experimental information. However, the model usually covers a much larger
composition range than the stability range of the phase. It may be tempting to limit the
composition range by using many RK coefficients, but one must be aware of the effect
of these coefficients also outside the stability range of the phase. In particular, one may
have serious problems when extrapolating a binary system with many RK coefficients
to a ternary or higher-order system because the phase may then appear at quite different
composition ranges, where the higher-order binary RK coefficients do not give a reason-
able description. This is further described in chapter 6 on assessment methodology and
in case studies in chapter 9.

The parameters ’L;; in the RK series can, of course, be temperature-dependent. Nor-
mally a linear temperature dependence is enough and only when heat-capacity data are
available may one use more:

"Ly =" ayy +b, T (5.66)

The composition dependence of the excess enthalpy is described by ”a,; and the excess
entropy by "b,;. If measured excess-heat-capacity data are available, then and only then
may one introduce a higher-order temperature dependence into the RK coefficients. The
next higher term after the linearly temperature-dependent one should be a TIn(7) term
to represent a constant excess heat capacity.

The Redlich—-Kister power series is useful only when the excess enthalpy is a smooth
function of the constitution like for the Cu-Ni system in Fig. 5.11 from Jansson (1987).
When the enthalpy varies rapidly, like in the Mg-Sn system shown in Fig. 5.16(b) later,

 

some other modeling feature must be used.

 

 

 

 

 

 

 

 

1800 3.0
liquid
1500 a | _ 28
g ‘
= S 20
2 1200 E
2 foo 245
z 900 s
s
& = 10
r a
600 05
foc + foc#2
300 0
0 02 04 06 08 10 ZY 0 02 04 06 08 1.0
Mole fraction Ni Mole fraction Ni
(a) (b)

 

Figure 5.11 In (a) the phase diagram for Cu-Ni is shown. The temperature for the ferromagnetic
transition for Ni (dashed line) makes the miscibility gap skewed. In (b) the enthalpy of mixing in
the fcc phase is shown. The enthalpy curve is rather smooth and two RK coefficients were
sufficient.

===========
110

5.6.2.2

5.6.3

Models for the Gibbs energy

Other binary excess parameter models

The Redlich—Kister series is the recommended excess model because it is symmetrical and
thus extrapolates well to ternary and higher-order systems. There are many other excess
models for binary systems, such as the simple polynomial, Lagrange series, etc., some of
which may also be modified to be symmetrical series. In a binary system one may always
convert from any series to another, but the ternary extrapolations will depend on the
series used, as well as on the extrapolation method; see section 5.6.6. Combining several
different binary excess series and different extrapolation methods makes it very difficult
to understand the behavior of a multicomponent system; therefore, it is not advisable.

Two versions of a phase diagram assessed without
thermochemical data

One may find published assessments using little or no thermodynamic data. Such assess-
ments should be considered with great skepticism, since it is quite easy to describe the
same phase diagram with quite different values of the thermodynamic data. See for exam-
ple the two phase diagrams in Fig. 5.12. The diagrams are very similar but the phase
boundaries represent only differences between the Gibbs energies of the phases and thus
the enthalpy curves from the two assessments are very different, as shown in Fig. 5.13.

The difference in the assessment is that in (a) an ordered model with sublattices has
been used for the intermetallic phase, whereas in (b) the intermetallic compound has been
assumed to be a substitutional model. In (a) the ordering has been assumed to be strong
at the equiatomic composition, but a large deviation from stoichiometry has been allowed
using anti-site atoms. In (b) the phases have been modeled with excess parameters as
small as possible.

 

 

 

 

 

1100 1100

     
 

     
 

liquid 4000 liquid

intermetallic intermetallic

lee

   

 

 

 

 

 

 

 

 

 

 

400 400
300 200
0 02 04 06 o8 10 fA 0 02 04 08 o8 10
Mole fraction B Mole fraction B
(a) (b)

Figure 5.12 Two calculated phase diagrams fitted to the same experimental data on the phase
diagram but without any thermochemical data. Different models were used for the intermediate
phase. The difference between the two phase diagrams is very small.

===========
5.6.4

5.6 Models for the excess Gibbs energy 111

 

        

 

 

 

 

 

 

 

2 2 ~ 0
fee ¢
5
30 ota OE,
2. 2 intermetallic. 2
s a
2 -10
B-4 4 2
3 3-15
56 6 a
s 8
Es 4 5-20
ki 2
10 -10 © 9s
0 02 04 06 08 1.0 0 02 04 06 08 10 A 0 02 04 06 08 10
Mole fraction B Mole fraction B Mole fraction B

(a) (b) (co)

  

Figure 5.13 In (a) and (b) the enthalpy of mixing for all phases has been calculated for the two
phase diagrams in Fig. 5.12 using ordered and disordered models, respectively. As can be seen the
enthalpy curve for the intermetallic compound in (a) is much more negative and has a pronounced
“v"-shape. The activity curves calculated at 600 K for the two assessments are shown in (c) (the
full line is for the ordered model (a); the dotted line is for the disordered model (b)) and there are
significant differences.

There are hardly any differences between the phase diagrams in Fig. 5.12 and, if there
are no thermochemical measurements or crystallographic information about the type and
degree of ordering, there is no way of knowing which assessment is correct.

The sharp increase in activity at x(B) = 0.5 from the ordered model is shown in
Fig. 5.13(c) (full line). It is due to the ordering and cannot be reproduced in the dashed
curve from the assessment in which the intermetallic compound was treated as a sub-
stitutional solution. The diagrams show the simple relation between a sharp “V”-shaped
enthalpy curve and a strong increase of the chemical potential at the same composition.

The extrapolations into a ternary system from these two different assessments will
behave very differently. Thus ternary data are often a useful complement to binary
assessments with no or little data.

 

   

The ternary excess contributions

The excess ternary interaction contribution requires one more summation:

"EGE YY xaxLip (5.67)

joie k=jtl

 

In some cases one would require that the ternary interaction parameter is also
composition-dependent and, as in the binary case, several methods have been suggested
as ways to handle this. However, in order to provide a symmetrical extension into higher-
order systems, Hillert (1980) suggested the following type of composition dependence in
the ternary excess parameter:

+0, Lig ty Lig (5.68)

 

===========
112

5.6.5

5.6.6

Models for the Gibbs energy

where

(5.69)

 

The advantage of introducing the v; fractions is that their sum will always be unity,
even in a multicomponent system. The ternary parameter will thus behave symmetrically
when extrapolated to higher-order systems. If all 'L;,, are the same then that is identical
to having a composition-independent ternary parameter. A composition-independent term
in Eq. (5.68) is thus redundant.

A composition-independent ternary term would have its largest contribution where the
three fractions are as large as possible, i.e., in the middle of the constitutional triangle.
From Eq. (5.68) it is evident that the ‘L;,, will have its largest contribution toward the
corner for pure i.

Before introducing ternary or higher-order interactions, one should consider modi-
fication of the binary systems if the extrapolation to a higher-order system exhibits a
significant difference from the experimental information. Since the experimental infor-
mation is usually scarce and uncertain, it is possible to obtain equivalent descriptions of a
binary system. The binary descriptions will have different extrapolations to higher-order
systems and often ternary information is crucial for obtaining a valid binary description.

Higher-order excess contributions

As for binary and ternary interactions, more summations can be added:

p32 mtn
"EGS = LY axatbia to (5.70)
GST jae kp IH

Few quaternary or higher-order parameters have been evaluated, but they would fit
into Eq. (5.70). It has not been necessary to consider composition dependences of these
parameters because there are not enough experimental data and, if there are discrepancies
in higher-order systems, one can normally correct this by reassessment of the lower-order
systems.

Extrapolation methods for binary excess models

In the derivation of the excess contributions to the Gibbs energy in Eq. (5.62) a multi-
component system considering the contribution from each of the binary, ternary, and
higher-order terms was used. In the equations one should use the fraction of each con-
stituent from the multicomponent system. One must not replace the fraction of one
constituent with one minus the sum of the rest, since that would affect the contribution
to higher-order systems. This is the simplest method of adding contributions from many
lower-order systems together and is not related to a particular solution model. However,

===========
5.6 Models for the excess Gibbs energy 113

several methods for how to add together contributions from binary systems have been
proposed on the basis of geometrical reasoning.

It may be important to point out that the choice of extrapolation model is important
only for higher-order parameters in a Redlich—-Kister series. The composition-independent
regular parameter will extrapolate in the same way independently of the extrapolation
model.

The method used in Eq. (5.62) above has been derived in a geometrical way also and
is called the Muggianu method (Muggianu et al. 1975). Alternative methods have been
suggested by Kohler (1960), Colinet (1967), and Toop (1965). The Kohler and Colinet
methods are symmetrical like the Muggianu method and treat the contributions from the
three binary systems in the same way, but refer the contributions from the binaries to
different compositions along the binary side as shown in Fig. 5.14.

The Toop method treats one of the three elements differently, but, if the other two
elements become identical, they reproduce the binary A-B = A-C systems in each ver-
tical section through the A corner. These two features, (a) symmetrical treatment of
all elements and (b) reproducing the binary systems if two elements “become” identi-
cal, cannot be combined, except in the case of composition-independent regular solu-
tions in all three binaries. The differences among the methods are usually small. The
Muggianu method has the easiest formulation, starting from the RK formalism, and thus
is preferable.

The Toop method is used when one of the constituents behaves very differently from
the others. For example, when mixing carbon or oxygen with two metals, it may be
tempting to use the Toop method since it treats the contribution from one of the binaries
differently from those from the other two. This method thus requires that constituents be
classified into different groups, which can be done with small databases, but there is no
obvious way to do this for a general database.

Pelton (2001) has devised an ingenious method to classify Toop elements for each
ternary and to combine this with other ternary extrapolation models in a multicomponent
system. This can become very complicated, so it is not recommended unless all other
methods to handle the asymmetry of a ternary system have been exhausted. First one
should try different sets of constituents, taking into account size effects, short-range order,
electronegativity, or charge transfer. There are several other modeling tools that can
handle such effects. One possibility is to add a ternary parameter that can be evaluated

        

got Sot
Sos Sos

 

0 0 0
Ao 02 04 06 08 10 A 0 02 04 06 08 10 A 0 02 04 06 08 1.0 A 0 02 04 06 08 1.0
Mole fraction B Mole fraction 8 Mole fraction B Mole fraction B
(a) Muggianu () Kohler (6) Cotinet (6) Toop

Figure 5.14 Various ternary extrapolation methods presented graphically.

===========
114

5.7

Models for the Gibbs energy

from the binary excess parameters. Hillert (1980) showed that a Toop model for a ternary
A-B-C system, where C is the “Toop” element and the binary A-C and B-C systems are
modeled as subregular solutions, can be treated with the Muggianu model with a ternary
parameter evaluated from the binary systems

Lage ='Lact'Lpc G7)

where 'Lac and 'Lyc are the subregular-solution parameters for the A-C and B-C systems.

Ternary extrapolation models that can vary from “Kohler type” to “Toop type” depend-
ing on the relative values of binary excess Gibbs energies are not physical and would
give strange extrapolations to higher-order systems.

Modeling using additional constituents

Any solution with a strong tendency toward ordering, i.e., those in which it is energetically
favorable for unlike atoms to be close, will have a characteristic “V”-shape in its enthalpy
of mixing when the composition varies. This might not be evident from the phase diagram
shown in Fig. 5.15 for the Mg-Sn system from (Fries and Lukas 1993). The published
assessment was later modified using a new description of the hcp phase.

The activity curves will also be affected by the ordering and the activity may change by
several orders of magnitude over a small composition range. At the ordering composition
the configurational entropy will have a minimum. All these effects are shown in Fig. 5.16
for the liquid phase in the Mg-Sn system. The low entropy of mixing and the sharp
increase of the activity occur at the same composition. At higher temperatures the curves
reveal a more regular behavior of the liquid. It should be evident that this type of behavior

 

liquid
900

8

600 nop + Mg,Sn|

Temperature (Kk)
x
8

8

 

8

Mg,Sn + bet

 

 

 

8

 

0 02 04 06 08 1.0
Mole fraction Sn

Figure 5.15 The phase diagram for Mg-Sn does not indicate that the liquid has any unusual
properties. Only when one has access to thermochemical data does one find, see Fig. 5.16, that
there is a strong short-range ordering in the liquid phase. The existence of the very stable
compound Mg,Sn can be taken as an indication that there may be a tendency for the liquid also to
have strong ordering around the same composition, but there are cases with stable compounds but
no short-range order in the liquid.

===========
 

 

 

 

 

 

 

 

 

 

 

 

5.7 Modeling using additional constituents 115
04 1. 1 L L A 0 1. 1 L L
-24 b 24 L
5 44 r a 44 L
-6 L 3
2 6 — 64 br
a r 2 -34 b
@ -104 L 2
2 2 104 1300 L
2-24 r £
3 5-124 L
g-14] 1300 r s
@ 16-4 700 L 3 —14 + ‘700 b
3
8 18] L a te 4 L
-20 | L -18 | b
22 T T T T ~20 T T T T
0 02 04 06 08 A 0 02 04 06 08 0
Mole fraction Sn Mole fraction Sn
(a) (b)
6 . 1 1 L 1 . 1 1 L 1
1300
54 r 1
= 107 4 b
eal L
2 4] L 10° + 4300 r
2 &
B24 L 210° 4 F
i 5
14 L
3 hon 10 700 L
uw 105 4 b
a4 L
-2 7 1 ¥ 10% T 7 T T
04 06 08 1.0 0 02 04 08 08 1.0

 

>

Mole fraction Sn

()

Mole fraction Sn
(@)

Figure 5.16 The effect of ordering on various thermodynamic properties for the Mg-Sn system:
(a) the Gibbs energy, (b) the enthalpy, (c) the entropy, and (d) the activity. The curves have been
calculated for the temperatures 700, 900, 1100, and 1300 K.

cannot be treated by the excess-Gibbs-energy formalism described in Eq. (5.62), which
describes a smooth change in curvature over the whole composition range.

If the excess Gibbs energy for a substitutional-solution model requires too many
coefficients to describe this behavior, it is preferable to modify the ““G,, and “™S,,
terms of Eq. (5.1). For solid phases, one may use crystallographic information to intro-
duce sublattices, as described in the next section. For liquids and for cases in which
sublattices are not possible, one may introduce fictitious constituents, usually called
associates.

Normally, fictitious constituents are used to describe short-range order (SRO), i.e., the
local arrangement of atoms, and the sublattice model to describe long-range order (LRO),
i.e., the atoms form a periodic arrangement over long distances, but there are intermediate
cases for which neither method fully describes the reality.

===========
116

5.7.1

5.7.2

Models for the Gibbs energy

The associate-solution model

In systems with SRO, unlike atoms tend to stay together for a shorter or longer length
of time. The term “associate” was introduced to denote an association between unlike
atoms when the attractive forces between the atoms are not strong enough to form a
stable chemical molecule. If a molecule is formed, this should be included unproblem-
atically as a constituent in the solution. Consider, for example, the H-O system plotted
in Fig. 5.5(b), which shows the variation of the Gibbs energy with composition. The
pronounced minimum in the Gibbs energy is due to formation of H,O molecules in the
gas and there is no excess Gibbs energy.

For a system with a similar Gibbs energy or enthalpy versus composition curve to that
of a system with formation of stable molecules, the introduction of a fictitious constituent
may be reasonable. Thus the associate-solution model formally introduces an “associate”
as a constituent in the solution as a modeling tool. The associate may be considered as a
molecule not stable enough to allow its isolation, but having a lifetime still significantly

 

larger than the mean time between two thermal collisions.

Fictitious constituents, sometimes called “associates” and sometimes “clusters,” can be
used in the same form of the equation for the surface of reference of the Gibbs energy and
the configurational entropy as in Eq. (5.42). In this way one introduces a new constituent
and thus creates an internal degree of freedom. The Gibbs energy of formation of the
new constituent can be used to fit experimental data. An experimentally determined sharp
minimum in the enthalpy curve is mainly described in terms of the enthalpy of formation
of the associate. The stoichiometry of the associate must correspond to the composition
of the minimum. At that composition the constituent fraction of the associate is high and
thus the configurational entropy is low.

The contributions of the surface of reference and the configurational entropy to the
Gibbs-energy expression, Eq. (5.1), for a substitutional associated solution are

x

“1G,

(5.72)

   

og, = Ryn) (5.73)

 

where the summation over / is for all constituents. The site fraction y, is used here to denote
that the constituent fractions are not the same as the mole fractions of the components.
The excess Gibbs energy can be modeled in the same way as a substitutional solution, as
described in section 5.6, treating the interaction between each pair of constituents as an
independent parameter. Physical properties such as magnetism can be added as usual.

Non-random configurational entropy

If the interactions between the constituents are large, the random entropy of mixing used
for modeling Eq. (5.42) is not appropriate. If the interactions create a long-range ordering
of the constituents, that can be modeled with sublattices as described in section 5.8. If
the interactions create short-range ordering, its contribution to the Gibbs energy must

===========
5.7.2.1

5.7 Modeling using additional constituents 117

be modeled differently. There is interest in predicting phase diagrams using more or
less complicated, non-ideal, entropy expressions based on the “quasi-chemical” approach
or on the CVM. In these models pairwise bonds between atoms or clusters with three
or more atoms are introduced as fictitious constituents in calculating the entropy by
use of Eq. (2.11). The models include a correction term to give the correct random
configurational entropy when there is no tendency toward SRO.

The quasi-chemical model

Guggenheim proposed a model for chemical SRO called the quasi-chemical model
(Guggenheim 1952). To derive this model, one may start by assuming that the bonds
between A and B atoms, giving molecules AA, BB, and AB, are distributed randomly.
The formation of the bonds is described by a simple chemical-reaction formula that can
be written as a Gibbs energy of reaction for the molecules AA, BB, and AB:

AA+BB =AB+BA (5.74)

As with the associate model, this can be treated by introducing additional “fictitious”
constituents into a substitutional-solution model, in this case both AB and BA. The reason
for having two constituents with the same stoichiometry is due to the fact that they do not
represent free molecules as in the gas or liquid, but bonds in a crystalline solid, where the
orientation of the bond is important. The exchange of an A and a B atom between two
neighboring sites affects the entropy because other bonds are changed by this exchange.

For a phase with the number of bonds per atom equal to z and ignoring the fact that
the bonds should agree on the atom placed at each site, the Gibbs-energy expression for
the “bonds” AA, BB, AB, and BA is

“Guy = Yan’Gan + Yon°Gpp + Yan°Gas + Yoa°Goa (5.75)

"Sy = RS [an In(yaa) + Ypp (pe) + Yas Man) + Yea Mea) (5.76)
The mass-balance constraints give the mole fractions of A and B as

X,=Yaa $0505 +Ypa) (5.77)

y= Yep +0.5(Yan + Ya) (5.78)

In the expression for the surface of reference, "Gag = °Gg, due to symmetry. If
Yas = Yea there is no LRO and this “degeneracy” in the disordered state, due to its
distinguishing the fractions of y,g and ygq, gives an additional term RTy,, In2 compared
with the case on ignoring this degeneracy. In the expression for “'S,, the configurational
entropy is overestimated considerably because the number of bonds is z/2 times larger
than the number of atoms per mole and, for the case "Gz = 0, the entropy should become
identical to that of an ideal solution of the components A and B.

The origin of this overestimate can be understood if z = 2 in Eq. (5.76) because it is
then identical to the entropy of a gas phase with AA, BB, BA, and AB. In a gas phase

 

===========
118

5.7.2.2

Models for the Gibbs energy

the molecules are independent and can rotate freely, but in a crystalline phase the nearest
neighbors to a site must agree what atom is placed in that site. In order to correct for the
overestimation of the entropy in Eq. (5.76), the following modified entropy expression
was suggested by Guggenheim (1952):

Sy = -R5 [ons wo(25*) + pp n(4") +Yap n( 22) +Yba n( tha )
2 a a Xatp XAtp

— R[xq In(x,) +p In(xg)] (5.79)

 

 

  

For the case of no SRO this expression gives the same configurational entropy as a
random mixing of the atoms A and B. This is the final entropy expression according to the
quasi-chemical model and also to the simplest Ising model, but, even with this correction,
Eq. (5.79) is valid only when the degree of SRO is small. If the ordering is strong and
z > 2, one may even have negative values of “'S,, from Eq. (5.79); see Fig. 5.17(b) later.

When the SRO is very strong, it can be treated as LRO, which can be described with
the sublattices introduced in section 5.8. A connection between the quasi-chemical model
and the sublattice model is described in section 5.8.4.3.

One can easily verify that Eq. (5.79) is identical to a random-entropy model when
there is no SRO. For this case the constituent fractions can be calculated from the mole
fractions:

Yaa =

(5.80)

Yas = Yaa =

 

YBB

On inserting Eq. (5.80) into Eq. (5.79), this becomes identical to an ideal solution in
Eq. (5.41). This is in contrast to the associate model, in which an ideal configurational
entropy of all constituents is assumed and the configurational entropy will never be
identical to that of an ideal solution without the associate.

The cluster-variation method

In the CVM formalism developed by Kikuchi (1951), one introduces clusters with three,
four, and more atoms and, depending on the crystal structure, one can derive corrections
to the entropy expression taking into account the fact that the clusters are not independent.
However, the principle is the same as for the quasi-chemical formalism, namely that
these clusters can be treated as independent constituents with a unique fraction, but, for
the configurational entropy, one must take into account the fact that the clusters share
corners, edges, surfaces, etc. The configurational entropy is different for each different
crystal structure and the CVM configurational entropy for an fcc lattice in the tetrahedron
approximation is given below. For the case in which there is no LRO, there are five
constituents or “clusters,” A, Ag75Bo25, AgsBo5, Ao.25Bo7s, and B. One may use the
stoichiometry as fraction indices as long as there is no LRO. These five clusters all
represent tetrahedra in the fee structure and are the end members of the phase. The

 

===========
5.7 Modeling using additional constituents 119

configurational enthalpy is included in their Gibbs energies of formation. Without LRO
the surface of reference is

  

(5.81)

stg °G °G G G
Gin = Ya "Ga t+ Yaq33Bo.25 GaqrsBo2s + ¥AosBos GFaosBos + YaqasBors FAoasBors + Ye
The ideal configurational entropy for a system with these constituents is

BeOS = —R[ yg IM(VA) + Yay gsBo.95 !MO'ny 5895)

FYaqsBo5sM(vag 5895) + YaoasBo.15 IM(YAgasBo5) + YB In(ye)] (5.82)

In a crystal the clusters are not independent, but share edges and corners. They must
thus agree on the type of atom placed in each site and that reduces the configurational
entropy compared with that of an ideal gas. This correction can only be approximate and,
with the CVM tetrahedron approximation, the following expression is used:

CVMenty _ pidentg 4 oie g
+6R[Paa In(Paa) + Pas (Pap) + Poa n(Ppa) + Poe nPop)

—SR[xq In(xq) + Xp In(xp)] (5.83)

The term “8S,, is due to the fact that the 5 clusters above are degenerate cases of
the 16 clusters needed to describe LRO (4 different Ap.7sBo25, 6 different ApsBos, and
4 different Ap »5Bo.75). This means adding

°8S yy = —RL(agzs80.25 + Yaoasbn.75)1M(4) + Yang 80.5 11(6)] (5.84)

The variable p,, is a pair probability that is equal to the bond fraction in the quasi-
chemical-entropy expression. The values of pa, etc. can be calculated from the cluster
fractions as

1
Par = Yat O-5YagzsBo2s + EY AnsBos
1
Pas = Por = 0-25Y a5 ssB.25 + Z¥AnsBos + 9-259 980.25 6.85)
1
Pas = Yet 0.5YagasBo75 + EYAo Bos

and the mole fractions from the pair probabilities as

Xa = Paat Pas (5.86)
*p = Pas + Pea
The equations for p,, etc. are easily understood if one realizes that, in a tetrahedron

cluster, there are six bonds and that in an Ap 7;Bo 5 cluster half of these bonds are between
A atoms, whereas in an Aj ;B,,; cluster only one is between A atoms.

===========
120

Models for the Gibbs energy

 

        

 

 

 

° er
500 CEF without LRO
= -1000 b
2
= -1500 CVM without LRO r
& -2000 b
2
& -2500 L
3
© -3000 VM |
with
-3500 ‘SRO |
-4000 + 1 r 1 1 bo =4.4 111 —+
A ° 02 04 06 08 10 JAY 0 02 04 06 08 10 12 14
Mole fraction B WT,
(a) (b)

Figure 5.17 Comparisons of the Gibbs energy for tetrahedron CVM and other models using the
same bond energy. T¢ is the critical temperature for long-range ordering at equiatomic
composition. (a) The Gibbs energy for a regular-solution model, associate model, and tetrahedron
CVM model, all using the same nearest-neighbor bond energy at T/T. = 1.06. (b) Gibbs energy
versus T for a tetrahedron CVM model (full lines) and a four-sublattice CEF model (dashed lines)
at equiatomic composition.

In Fig. 5.17(a) the Gibbs-energy curves for three related models have been calculated
for an A-B system using the same nearest-neighbor bond energy just above the tem-
perature for LRO. One curve is for a substitutional regular-solution model, Eq. (5.64),
with ideal configurational entropy Eq. (5.41); one for an associated-solution model with
five constituents, A, Ap 75Bo25, AosBos, Ao2sBo7s, and B, Eqs. (5.72) and (5.73); and
one for a CVM tetrahedron model, Eqs. (5.81) and (5.83) with the same clusters as the
associates. In the second and third of these models no excess Gibbs energy is used, but
the same constant Gibbs energies are used for the associates or clusters. It is clear that
the associate model overestimates the contribution of SRO to the Gibbs energy.

In Fig. 5.17(b) the Gibbs energies at equiatomic composition for the CVM tetrahedron
model (full lines) and a four-sublattice CEF model (dashed lines) with approximate SRO
contribution according to Eq. (5.151) are plotted versus temperature from 0 to 1.4 times.
the ordering temperature, 7,. The Gibbs energy has been normalized by dividing it by
RT.. The Gibbs energies for these two models are almost identical when there is LRO.
Above 7, the LRO state is metastable within a short temperature interval both for the
CVM and for the CEF. The metastable state without LRO has been extrapolated all the
way down to 0K for both models. The CVM extrapolation has an unphysical negative
entropy at low temperatures. This means that one must be careful using models like the
modified quasi-chemical model for liquids that cannot undergo a transition to LRO; see
section 5.9.3.1.

In general the cluster energies in the CVM depend on the composition, whereas the
end-member energies used in the CEF have fixed energies representing a phase with
exactly the composition and structure of the end member. In the CEF the dependence on

===========
5.7.3

5.7 Modeling using additional constituents 121

composition is modeled with the excess Gibbs energies and this method requires fewer
composition variables than does the CVM. As a comparison, a CVM tetrahedron model
for fcc with eight elements must have at least 8' = 4096 clusters or constituents whereas
a four-sublattice CEF model, which can describe the LRO just as well as CVM can
and with a reasonable SRO approximation, requires only 8 x 4 = 32 constituents. This
means that a CEF model will be several orders of magnitude faster than a CVM model
to implement in three-dimensional software for simulations of phase transformations, for
example.

The excess Gibbs energy with additional constituents

Even with fictitious constituents, Eq. (5.1) can be applied with an excess term given
by Eq. (5.62) and the summations are made including the fictitious constituents. Intro-
ducing a fictitious constituent into a binary substitutional solution allows one to treat
this formally as a ternary system and evaluate binary interactions of all three con-
stituents. From the mathematical point of view, this is not a problem, but of course
the software for calculation of the equilibrium must handle the m:
properly.

A simple case of introducing associates is the model for the Mg—Sn system. The liquid
exhibits a high degree of SRO at the Mg,Sn composition and, in order to describe this,

 

balance conditions

 

 

A 0 0.2 0.4 0.6 0.8 1.0

Constituent fraction Sn

Figure 5.18 The variation of the constituent fractions in liquid Mg,Sn with composition at
temperatures of 700, 900, 1100, and 1300 K. The dotted lines represent two constant amounts of
Sn as indicated.

===========
122

5.8

Models for the Gibbs energy

one may introduce Mg,Sn as a constituent of the liquid. The terms in the Gibbs-energy
expression will be

 

GIS = Yop Gag +n Gu + Ygysn °Gmteysn (5.87)
cgi = —R[ymtg INOag) +.'su IN('sn) + Ygysn 11g, sn)] (5.88)
"Gay = Yug¥snLag.sn + YaeySnYsnLstesS0,$n + YMg)MaySn/Mg,MepSn (5.89)

 

The parameter °Gyj,,s, determines the fraction of Mg,Sn in the liquid. There are
three excess interaction parameters that describe each “binary” side of the constitu-
tional triangle shown in Fig. 5.18. In this diagram, which looks like a ternary system,
for the Mg-Sn system, taken from an assessment by Fries and Lukas (1993), the full
lines show how the constitution of the liquid phase varies with composition at several
temperatures. In these cases the parameter Ly,,.s, is usually zero because the fractions
of Mg and Sn are never high simultaneously. One may include a “ternary” interaction

  

Lvig.sn.Mg3Sn*
Note that the selection of the associate is very important, the model will behave
differently if one selects as a model (Mg, Sn, Mg/;Snj)3).

 

Modeling using sublattices

In crystalline solids it is important to take into account that the atoms may occupy
different types of sublattices with different coordination numbers, bond lengths, etc.
Sublattices represent LRO, which will modify both the entropy expression and the excess
Gibbs energy. The simplest case of a sublattice model would be two sublattices with two
constituents in each. A shorthand notation of this would be

(A,B) (C.D), (5.90)

where the subscripts m and n give the ratio of sites on the two sublattices. In a crys-
talline solid m and n are fixed numbers, but one may chose to extract a common factor
determining the size of the formula unit of the phase. It is advisable to use the smallest
possible integer numbers for the site ratios. The constituents A, B, C, and D can represent
atoms, ions, anti-site atoms, vacancies, etc. The most general formalism for describing
thermodynamic properties of phases with two or more sublattices is the CEF, which is
given by Eqs. (5.35)-(5.37).

The very simplest case of using two or more sublattices is when there is a single
component on either sublattice. That represents a stoichiometric phase and is not different
from having a single species as constituent. The case of mixing on one sublattice and a
single constituent on the other is identical to mixing species in the substitutional model,
although some care has to be taken about the stoichiometry of the species in order to
obtain a reasonable configurational entropy.

===========
5.8.1

5.8 Modeling using sublattices 123

Reciprocal solutions

A simple case, which cannot be modeled as a substitutional model, is that of a phase with
two sublattices and two constituents on each sublattice. This is known as a reciprocal
system because of the reaction

An Cu + BmDy = AnDy + BnCy 6.91)
The reciprocal energy represented by this reaction is

AG = Gace +°Gpn — Gav — Gare (5.92)

An example of this type of reaction occurs on mixing the salts NaCl and KBr:
NaCl+KBr = NaBr + KCI (5.93)
In the reciprocal model, just like in the CEF, one assumes ideal configurational entropy
on each sublattice separately and the total entropy is weighted with respect to the number
of sites on each sublattice. The sublattice model thus gives a different behavior of the
configurational entropy from that given by a substitutional model. The first two terms of

Eg. (5.1) will be

Gm = IEG uc FIN Grv +d

 

“GrectYaye’Gun (5.94)

ot Soy

—R{mlyy In(yg) +p In(yp)] + aLye NOW + yp NOD} (5.95)

where y; and yj are the constituent fractions on sublattices 1 and 2, respectively. The
reference energy expression has four terms representing the possible four compounds
obtainable by combining the constituents on the two sublattices. The Gibbs energy of
formation of these compounds °G;.; is multiplied by the fractions of one constituent from
each sublattice. Note that a colon is used to separate constituents on different sublattices
in the parameter expression. For clarity, two constituents on the same sublattice will
sometimes be separated by a comma.

The configurational entropy is calculated from Eq. (2.11) assuming random mixing
on each sublattice and multiplying this by the site ratios. The excess term, *G,,, will be
discussed in the next section. Already without any excess terms, i.e., an ideal reciprocal
model, there are some specific features.

In Fig. 5.19(a) the constitutional square is shown and the four corner compounds are
indicated. If the reciprocal model is used for a binary system, the constituents on the
two sublattices can be the components, species or ions formed by the components or
vacancies. The Wagner—Schottky model described in section 5.8.2.3 is one of the most
important examples of the use of this model. Many examples of the application of the
two-sublattice model will be described in other sections.

For the reciprocal model one may be able to calculate partial Gibbs energies not for
the components but only for end members as defined in section 5.5.1. For a model with

===========
124

5.8.1.1

Models for the Gibbs energy

 

 

 

 

 

 

 

 

(AD) (BD)
1.0 . . . . 0.50 . . . .
09 4 b 0.45 42 b
08 | b 0.40 b
a O74 b 9 0.35 b
5 06 4 F §& 0.30 F
8 os | b 2 0.25 b
2 044 b 2 020 b
? 03 4 L 2 0.15 L
02 4 b 0.10 . b
O14 b 0.05 b
0 (8:C) 0
AX 9 02 04 06 08 10 A o 01 02 08 04 085
Site fraction B Mole fraction B
(a) (b)

Figure 5.19 Diagrams for reciprocal systems. (a) The constitutional square for a reciprocal
system (A,B)(C,D). The lower left corner represents the compound AC, the upper right the
compound BD. (b) The reciprocal miscibility gap in a system (A,B)(C,D). The dotted curve
represents the miscibility gap without any excess parameters; the full line, which actually has five
miscibility gaps, represents the stable phase diagram with the reciprocal parameter according to
Eq. (5.102) added.

 

the Gibbs energy given by Eqs. (5.94) and (5.95), the partial Gibbs energy for the end
member AD can be calculated using Eq. (5.38),

Gyp = "Gay t (ly) ypAG + mRT In(y,) + ART In(yp) (5.96)

where AG is the reciprocal energy according to Eq. (5.92).

Excess Gibbs energy for the reciprocal solution

In the reference energy term there are already two fractions, one from each sublattice,
multiplied by the parameter for formation of the compound. In the excess parameter one
will thus start with three fractions multiplied by each other, two from one sublattice and
one from the other. Additionally there is a reciprocal excess parameter that is multiplied
by all four fractions:

 

®Gm = Ya¥eNeLawc + Ye YvLABD +YACMLac + YgverLwco + Y YpLawco (5-97)

There are two “binary” interaction parameters for each sublattice depending on the
constituent on the other sublattice and these are related to the four sides of the constitu-
tional square in Fig. 5.19(a). The reciprocal parameter will have its largest influence in
the center of the square. In Fig. 5.26 in the section 5.9.4 the surface of reference for a
reciprocal system is shown.

===========
5.8.1.2

5.8 Modeling using sublattices 125

The binary interaction parameters can be expanded in an RK formula, Eq. (5.65), in
terms of the two fractions from the same sublattice, for example

  

Lasic = (v4 3p)" +" Lame (5.98)

v=0

It may also be necessary in some cases to use a composition dependence for the
reciprocal parameter. The following expression has been adopted:

   

Lapicv ="Lasicp + (a = 3) *Lanco +96 — 9) *Laz.co 5.99)

So far no more than two composition-dependent terms have been used and it is
recommended that one try to do without any composition dependence.

For the models with more sublattices, the excess Gibbs energy is expanded in the same
way as for the reciprocal system. With three or more sublattices, however, the excess
Gibbs energy is less important since the major part of the Gibbs energy is described by
the parameters in the surface of reference, °G;.

 

The reciprocal miscibility gap

The reciprocal sublattice model has an inherent tendency to form a miscibility gap in the
middle of the system. When the reciprocal Gibbs energy, AG in Eq. (5.92), is sufficiently
large this will create a phase separation with the tie-lines parallel to the diagonal and
with the largest energy difference between the corner compounds. This miscibility gap
can appear without any excess parameters and it cannot be suppressed completely even
by adding excess parameters. Even the reciprocal parameter might not suppress the
miscibility gap, but may just separate it into two smaller ones.

When there are experimental data on the Gibbs energies of the corner compounds, the
appearance of the miscibility gap is usually predicted reasonably well by the reciprocal
model with no or small excess energy. However, if one or two of the corners represent
metastable or purely fictitious compounds that must be estimated, it is often difficult to
control the appearance of this miscibility gap.

When there are no data for an end member of a reciprocal solution, it is often useful
to estimate using the assumption that the AG in Eq. (5.92) is zero, i.e., the end member
(A:C) representing a fictitious compound can be estimated by

p+ °Gge- (5.100)

   

In this way one can avoid problems with reciprocal miscibility gaps. If several end
members are fictitious and cannot be estimated in any other way, one should start by
estimating the one which is most significant. One should also take care about compound
energies that might not be specific to a particular system. In particular, the parameters
for compounds with some sublattices filled with vacancies may be part of other systems
and it is then important to estimate the values of such parameters by incorporating all
available information, just as when determining the lattice stabilities for the elements.

===========
126

5.8.2

5.8.2.1

Models for the Gibbs energy

To avoid the presence of a reciprocal miscibility gap, Hillert suggested the use of a
special reciprocal parameter,

©G = JapopLapcy (5.101)

This can completely suppress the miscibility gap and can be added to the normal
excess Gibbs energy, for the expression Eq. (5.97). Since there is no physical reason for
this composition dependence, it must be considered as a curve-fitting parameter.

The reciprocal miscibility gap is often decreased by short-range ordering in the system.
It is possible to derive an approximation to this contribution, as was first done by Pelton
and Blander (1986) for molten salts. It was later extended to solid phases by Sundman
et al. (1998). The reciprocal parameter is expressed as a function of the reciprocal energy,
AG in Eq. (5.92), as

  

(5.102)

Lascn =

 

The factor z is the number of nearest neighbors. This parameter has also been used
successfully by Frisk er al. (2001) for modeling carbides and nitrides, for which many
end members are not stable and their Gibbs energies thus must be estimated.

In Fig. 5.19(b) the reciprocal miscibility gap in a phase modeled as (A, B)(C, D) is
shown as a dotted line. This miscibility gap is calculated with a AG parameter according
to Eq. (5.92) only and no excess parameters. Adding a reciprocal parameter according to
Eq. (5.102) changes the miscibility gap into five different ones, which are shown by the
full lines.

Models using two sublattices

In this section we consider a number of models that can be described with the two-
sublattice CEF. When there are several constituents in each sublattice, one can write the
model

(A,B, 6), (UVs os), (5.103)

In some cases the same constituent can be on both sublattices; in others the constituents
are different. The Gibbs energy for this model is

Gn =D LV yiyy°G.j +" Gy +r(m Lyin) +a YD yy 079) +* Gy (5.104)

Interstitial solutions

A common application of the two-sublattice model is to interstitial solutions of carbon
or nitrogen in metals. Owing to the difference in size, these elements prefer to occupy
the interstitial sites in the metallic sublattices. In the austenite phase with fcc lattice the

===========
5.8.2.2

5.8.2.3

5.8 Modeling using sublattices 127

interstitial sites form an interwoven fcc lattice and the structure type for Fe with C is
thus B1.

The main characteristic of an interstitial solution is that one of the constituents in
Eq. (5.103) is the vacancy. This was already introduced in Eq. (5.28) and the vacancy can
be treated just like any other “real” constitent if its chemical potential is always equal to
zero, and it is excluded from the summation to calculate the mole fractions, Eq. (5.29).

Some carbides, nitrides, and borides have the B1 structure (TiC, VN, etc.) and they
can be treated with the same model as austenite, i.e., the fec phase. A model for B1 as
both metal and carbon-nitride—boride phases in a multicomponent steel is

(Fe, Cr, Ni, Ti, ...):(Va, C, N, B); (5.105)

In Thermo-Cale two “composition sets” of the fec phase can be used if both the
metallic phase (with mainly vacancies in the interstitial sublattice) and the carbide are
stable in the same system. Usually the carbide is the second composition set, but, after a
calculation, one may have to list the compositions of the phases in order to know which
composition set is metallic or carbide.

Models for phases involving metals and non-metals

Many phases involving a metallic element and a non-metal like carbon, nitrogen, or
oxygen are modeled with one sublattice for the metallic elements and another for the
non-metal. Some examples are the cubic carbo-nitride mentioned above, and the M,C;
carbide. In some cases there is more than one crystallographically different sublattice for
the metallic element, but there are normally not enough experimental data to describe
this. One case for which two metallic sublattices have been used is for the M,3C, carbide,

(Cr, Fe, ... )so(Cr, Fe, Mo, W, ... )3(C)e (5.106)

 

In the model above one has used the experimental information that some of the
elements do not enter all sublattices, in this example Mo and W. Even if there is a third
sublattice with just carbon, this is in principle a two-sublattice model because there is
mixing on only two sublattices.

An interesting case is the spinel phase. In this case the constituents must be treated as
ions:

(Fe** , Fe**), (Fe?*, Fe**, Va),(O?-)4 (5.107)

There are additional constraints when a phase has charged constituents. This model
will be discussed further in section 6.2.5.8.

The Wagner-Schottky defect model

The Wagner-Schottky model (Wagner and Schottky 1930) describes the variation of the
Gibbs energy of formation of a compound within a small composition range as a function

===========
128

Models for the Gibbs energy

of various types of defects. The model contains only three parameters, the Gibbs energy
of formation of the ideal compound and the Gibbs energies of formation of two defects,
allowing a deviation from stoichiometry on both sides of the ideal composition. This
model can be described in the CEF as a reciprocal model with four end members. If the
ideal constituents are called A and B and the defects X and Y, the model will be

(A, X),(B, Y), (5.108)

where a and b are the stoichiometry ratios. The defects can be

(1) _anti-site atoms, i.e., B atoms on the sublattice for A and A atoms on the sublattice
for B;

(2) vacancies;

(3) _ interstitials; or

(4) a mixture of the above defects.

If interstitial defects are important, one must in CEF add a sublattice for these and
specify how many sites there are in this interstitial sublattice and that the normal con-
stituent on the interstitial sublattice is the vacancy. For example, if the main type of defect
is that both A and B prefer to appear as interstitials on the same interstitial sublattice,
one has the model

(A), (B),(Va, A, B). (5.109)

The crystal structure for the phase provides additional information. For example,
in some compounds with the B2 structure type, i-e., ordered bee with two identical
sublattices, one often has anti-site atoms on one side of the ideal composition and
vacancies on the other. This means that it is tempting to use a model of the form

(A,B), (B, Va); (5.110)

but the two sublattices are crystallographically identical, which means that, if the atoms in
the two sublattices are interchanged, the crystal is still the same and the ideal compound
can equally well be written BA as AB. For this reason one must include all defects on
both sublattices; allowing both anti-site atoms and vacancies the model should be

(A,B, Va); (B, A, Va); (5.111)

One should take into account that B2 is an ordered form of the bec lattice. The recom-
mended model for B2 is discussed further in section 5.8.2.4.

The Wagner-Schottky defect model considers only one defect for each sublattice and
three parameters are needed, the energy of formation of the compound and the energy
needed to create a defect on either sublattice. On comparing this with a reciprocal CEF
model like Eq. (5.104), the energy of formation is equal to the °G,., parameter, the energy

===========
5.8 Modeling using sublattices 129

needed to create defects on the first sublattice is related to the °Gx., parameter, and the
energy needed to create defects on the second sublattice is related to °Gy.y-
The mathematical identification of the Wagner—Schottky model with the CEF leads to

°Gan = °Ga,s, (5.112)

Gay = Gay, + A Gaw (5.113)
y on a °

°Gxa = °Gr,0, + NOx (5.114)

7 °C b °, b °,
°Cxy = "Cay, + pM Gav + GWG

= Gay t+°Gyy —°Gap (5.115)

where °Gap,, A°Ga.y, and A°Gx., are the parameters of the WS model

G. yn + W°Gx5+ (5.116)

 

 

where nx is the number of X on A sites, ny is the number of Y on B sites, and n is the
total number of sites considered.

The parameter °Gx.y from the CEF represents a phase consisting only of defects,
which should be very unstable. Equation (5.115) relating this parameter and the other end
members is equivalent to setting the reciprocal energy, Eq. (5.92), to zero.

On combining assessments of the same phase from different systems in a database, one
may find that the parameter °Gx., occurs in several systems, not just in the A-B system.
It is thus necessary to agree on a recommendation for the value of °Gx.g, similarly to
what was done for the metastable states of the pure elements; see section 5.2.3.

When the values of °Gx.g are fixed, one has to use the excess parameters to describe
the properties of the individual binaries. It i:
parameters in the CEF are most important. This is done below for the case in which the
defects are anti-site atoms on both sublattices, i.e.,

 

Illustrative to show how to determine which

  

(A, B),(B, A), (5.117)

The differential of the Gibbs energy with respect to any variation of the site fractions can
be calculated from the partial Gibbs energies, Eq. (5.38):

wG=E= dy, (5.118)

This differential should be zero at equilibrium and, for a fixed composition, the relations
between the dy; are

 

dy, = -dyy (5.119)

 

===========
130 Models for the Gibbs energy

This gives the following equation for the equilibrium fraction of defects in the single-phase
region:

IG, AG, @ AG,

a 0G

— = 5.120
b ayy ¢ )

 

 

 

 

ay, AyK
The Gibbs-energy expression from Eq. (5.104) with five parameters in the excess
Gibbs energy is

Gy = Yn Gat VHC an + YONA Gan HNN’ (6.121)

cts.

= RT {alyg In(yy) + yp ln) + Ly INA) +5 Ing) ]} (5.122)

"Gm = YaYeOMLawa t¥pLann) IO Laaw tele) +a ABA — (5.123)
As usual a colon “:” is used to separate constituents in different sublattices and for clarity
a comma “,” has been used between interacting constituents in the same sublattices, but
that will normally be suppressed.

The parameter °G,., is the Gibbs energy of formation of the ideal compound A,B,;
°G,., is the Gibbs energy of formation of pure A with the same structure as A,B,, i.e.,
all B sites filled with anti-site atoms. The parameter °Gg., is the equivalent for pure B
and the parameter °Gg., is the Gibbs energy of formation of the compound consisting
entirely of defects; its value will be discussed further below. As mentioned above, °G4..
and °Gz., should not be used to fit this phase in the binary A-B system because they
may occur for the same phase in other binary or ternary systems.

Inserting the Gibbs-energy expressions into Eq. (5.120) gives, after simplification,

erin( 228) = (3 -*8)en.-(8-
vay ab a

 

 

 

 

YoY, YayB _ YAN
— SEL
+( Pt ab at) ABB

vars Yar , Yayk vars _ yao, Yak
- Laap- - L,
+( @ ab ab ) ‘MAB ( @ abt a) BAB

 

  

 

 

 

 

 

 

1
zene (5.124)

 

bk

The Wagner-Schottky model is applicable when the fraction of defects is very small
and the defects are non-interacting. At the ideal composition with no defects, one has

 

(5.125)

===========
5.8.2.4

5.8 Modeling using sublattices 131

and inserting this into the right-hand side of Eq. (5.124) (and the first equation also in
the logarithm) gives

    

 

» 11 . 1. 1, 1 1
RT In(yyg) = ( + i) Gan — 5 Gxa— [Gan — Flaws — baa (5.126)
For very small defect fractions, their product can thus be expressed by the following

equation:

 

(5.127)

ny (a+b)'Gaw —
YaYa = EXP!

rns tanta)
abRT

In the case in which °G,., and °Gp.g formally are unary parameters, which are already
defined in the database, the parameters Ly g., and Ly., , can be used for adjustment to the
defect fractions. These two parameters are equally important at the ideal composition, but
Lx _p. Will be most important for deviations toward B and L,., 3 will be most important
for deviations toward A. Note that the parameter °Gp., does not appear in Eq. (5.127)
because the fractions by which it is multiplied were set to zero. Even when interaction
parameters are used, it is commonly restricted by Eq. (5.115).

The other two interaction parameters, Ly g., and Lg.z ,, are for one sublattice filled
with defects and are not significant close to the ideal stoichiometry. It is recommended
that they are set equal to the former two:

Lana = Laon = Lane (5.128)
Lana = Laan = Leas

which is equivalent to assuming that the interaction on each sublattice is independent
of the occupation of the other sublattice. Equation (5.128) is just an estimate to prevent
selection of arbitrary numbers and to keep insignificant parameters within suitable ranges.

If the defect fractions are larger, one may use other parameters in the Gibbs-energy
expression, as a first step by expanding the interaction parameters using RK coefficients,
Eq. (5.98). In fact, the CEF is not restricted to the dilute range; as has already been
described, it can be extended to a sublattice full of defects.

A model for B2 ordering of bec

The B2 ordering of the A2 structure type means that the atom in the center of the unit
cell is different from those at the corners, see Fig. 5.20. A typical phase diagram with B2
ordering is that for Fe-Si or Cu-Zn from Seiersten and Tibballs (1993) and Kowalski and
Spencer (1993), respectively. In these systems there is a second-order transition between
B2 and A2 and this enforces the treatment of the ordered and disordered phases by use
of the same Gibbs-energy expression.

In many other systems a phase with B2 structure appears as an intermetallic phase
with more or less restricted solubility, for example Fe-Ti. In such cases it is frequently
treated as a separate phase from the disordered A2 phase, using, for example, a Wagner—
Schottky model; see section 5.8.2.3. However, this is not recommended because, on

===========
132

Models for the Gibbs energy

(a) (b)

Figure 5.20 The disordered A2 (a) and ordered B2 (b) variants of the bec lattice. From the
Crystal Lattice Structures web page (http://cst-www.nrl.navy.mil/lattice).

extending into a ternary, the B2 phase may form a continuous solution to another binary
system for which there is a second-order A2/B2 transition, for example in Al-Fe-Ni, see
section 3.3.3.

The B2 ordering requires a two-sublattice model in which the sublattices have equal
numbers of sites and must be treated as identical for crystallographic reasons. It is thus
irrelevant for the Gibbs energies of formation whether element A is in the first sublattice
and element B in the second or vice versa; one has

=" (5.129)
All interaction parameters on the two sublattices must also be symmetrical, thus

Ligne = Leis (5.130)

Li jst = Leia (5.131)

Note that these parameters will give a contribution also in the disordered state, i.e., when
Y; = y/ =x;. In section 5.8.4.1 this feature is discussed in detail.

As discussed in section 5.8.2.3, there are both anti-site atoms and vacancy defects in

B2. Thus, since the two sublattices are crystallographically equivalent, a binary model
would be

(A,B, Va), (A,B, Va), (5.132)

This means that one has nine end members for a B2 phase with two different defects
on each sublattice. However, many of these can be eliminated using the requirement
that the model must be symmetrical with respect to exchanging the constituents on the
sublattices, thus

Can = Con (5.133)
“Gave = Gran (5.134)

Cave = "Cven (5.135)

===========
5.8.2.5

5.8 Modeling using sublattices 133

Using the fact that B2 is an ordered bec phase, one also has that

“Gyn = GS (5.136)

Gan = (5.137)

 

Finally there is a parameter °Gy,.y, and there is no well-defined value to assign for
this. The parameter °G?* is related to the energy needed to create thermal vacancies, but,
since this is dependent on the element, it is better to use the parameter L'*“,, to determine
this. There has been some argument that this parameter represents empty space and its
value should thus be zero, but this reasoning is doubtful and it creates numerical problems
since the parameter is for zero amount of real atoms. When the number of real atoms
approaches zero the Gibbs energy per mole of atoms becomes zero divided by zero,
which can give very large negative values and thus make a bec phase consisting mainly
of vacancies very stable. Other arguments are that one should consider it as a phase full
of defects and use a very large positive number to suppress the thermal vacancies. The
present recommendation is to use a reasonably large positive value like 307 in order to
avoid numerical problems and fit an interaction parameter to describe the real vacancy
fraction.

It is important to model the B2 phase in a compatible way in each binary since one
often has solubilities of ternary elements across the whole composition range, for example
in Al-Fe-Ni; see section 3.3.3. In this ternary system the model for the B2 phase must
include the disordered bec phase as a special case. More about modeling ordered phases
can be found in section 5.8.4.

 

A model for L1,/A1 ordering

The Al structure type is shown in Fig. 5.21(a) together with some ordered structures. The
L1, ordering means that the eight corner atoms are of a different kind from the atoms on
the sides. This gives an ideal stoichiometry A,B and initially this was modeled with two
sublattices, (A, B);(A, B),. In this model the constituents in the sublattice with three sites
have eight nearest neighbors in the same sublattice. This means that there is a relation
between the Gibbs energy of formation °G,., and the interaction parameters Lag. since
both are related to the bonding energy of the nearest neighbors. The recommended way to
model ordering on the fcc lattice is to use four sublattices, as described in section 5.8.4.4.
A problem with using the two-sublattice model in an assessment of an L1, ordering is that
it may predict an ordered L1, ordering if the parameters are converted to a four-sublattice
model.

The L1, phase is the most important ordered fec phase and it may be practical
to use the two-sublattice model for multicomponent systems. There are rather compli-
cated restrictions on the parameters that are needed in the two-sublattice model sub-
lattice. The method employed to convert from a four-sublattice model is described in
section 5.8.4.6.

===========
134 Models for the Gibbs energy

 

(b) (c)

Figure 5.21 The disordered Al (a) and ordered L1 (b) and Ly (c) variants of the fee lattice.
From the Crystal Lattice Structures web page (http://cst-www.nrl.navy.mil/lattice).

5.8.3 Models with three or more sublattices

Many crystalline phases have more than two sublattices, but it may be necessary to
simplify the models to fewer sublattices since there might not be enough experimental
data. Nonetheless, it is fairly common to use three or four sublattices to describe real
phases. The model for a phase with three sublattices is

(A,B, 2. Ja, (Ke Ly es Jag(Us Ve 2 ag (5.138)

When the same constituent enters more than one sublattice, it may be useful to remind the
reader about Eq. (5.29) concerning how to obtain the mole fractions from the constituent
fractions.

The Gibbs-energy expression for a phase with three sublattices is

Gy = DLT ING Gy

 

ware Lyin) +a Ye yj InGy) + a3 Yo yy” 00) +°Gy, (5.139)
j

i
where

= LULL yi vibe

iy k bi

FLU UV yyy yi Ligon

ijk Isj

t+ LVL Y yiviye yy Liga

v7 kts
FLUELUV yop yin ime to
7 °F tsk msi
FLU UY LV ype vvnLinima bo (5.140)
7 “7 “E tskma)

The number of possible excess parameters is very large, but normally very few are used.
The most important parameters to optimize are those in the surface of reference, °G;,

===========
5.8.3.1

5.8 Modeling using sublattices 135

Phases are not very commonly modeled with four or more sublattices and several
constituents in each because it is difficult to acquire enough experimental data to evaluate
the necessary number of parameters. An exception is when there are crystallographic
relations between the parameters, as in the case of chemical ordering. In the next section
a four-sublattice model for ordering on the fcc lattice will be described.

Models for intermetallic phases

Some intermetallic phases have been modeled with three sublattices, the most well known
perhaps being the o and the w phases (Fig. 5.22). In both cases the crystallographic
information has been simplified in the thermodynamic modeling. The o phase has five
different crystallographic sublattices, but only three are used in the modeling. The main
reason for this is that there is not enough experimental information to evaluate all neces-
sary parameters for a five-sublattice model. Such information would be the distributions
of the various components on the sublattices, which are rarely known. In the o phase the
first sublattice is mainly occupied by fcc-type elements, the second by mainly bec-type
elements, and the third is a mixture of all.

The composition range of the intermetallic phase is important to consider when decid-
ing on the sublattices. If the intermetallic phase appears in several systems, all of these
should be considered before selecting a model. The constituents of a sublattice would
normally be those which can be the only constituent on that sublattice, but, in order
to describe the composition range, it may be necessary to include some components as
“defects” in sublattices that they normally would not enter. However, this may increase
the number of parameters significantly in multicomponent systems and should be done
with care. Sometimes one may accept an error of a few percent in the composition range
in a lower-order system in order to simplify the multicomponent description.

It is important for the development of a general thermodynamic database that all
agree to use the same set of sublattices when modeling a phase. In the second Ringberg
report Ansara et al. (1997a) presented a survey and recommendations regarding the mod-
eling of many intermetallic compounds. For example, they recommended that the o phase
be modeled with three sublattices and the site ratios 10:4: 16, not 8:4: 18 as had been

 

Figure 5.22 The crystal structures of o (left) and L2, (right) phases. From the Crystal Lattice
Structures web page (http://cst-www.nrl.navy.mil/lattice).

===========
136

5.8.3.2

5.8.4

Models for the Gibbs energy

used previously. The reason for the earlier model was to simplify the description of the
composition range of the o phase in the Ni-V system and to describe the composition
range of the o phase in the Cr—Fe—Mo system.

The possibility of using ab initio calculations to obtain values for metastable end
members in intermetallic phases is rapidly becoming an important source of information,
for example on the Re-W (Fries and Sundman 2002) and Cr—Fe (Korzhavyi et al. 2005)
system. Since the CEF can use the energies calculated for the ordered end members
directly without any cluster-expansion approximation and because SRO is insignificant in
these phases, the combination of the CEF and ab initio methods amounts to an important
step forward for the development of new materials.

The availability of improved experimental techniques such as Rietveld refinement
(Joubert 2002) also means that additional information on site occupancies and defect
fractions has become available to use in the modeling of phases. The experimental
determination of the site occupancy of the j. phase in the Nb-Ni system showed that
none of the previous models, which had been selected arbitrarily or on the basis of
coordination-number arguments, coincides with the one revealed by the experimental
results (Joubert and Feutelais 2002).

Models for metal-non-metal phases

The M,;C, phase is an example of a phase that has been modeled with two sublattices
for the metallic elements and one for the carbon, in order to treat the limited solubility
of the heavy elements W and Mo in a proper way. The crystallographic information
would give (Cr, Fe, . . . )»,(Cr, Fe, W, Mo, . . . )»Cg, but it was not followed entirely since
that would not have described the full composition range. Instead a model of the form
(Cr, Fe, .. . )xo(Cr, Fe, W, Mo, . . . );Cs was adopted.

Many oxide phases have different types of metallic sublattices, for example the spinel
phase. In this phase the oxygen ions form an fcc lattice and the metallic ions enter some of
the tetrahedral and octahedral interstitial sites. A four-sublattice model has been adopted
for this phase, which can also describe the wide stability range of the spinel phase in the
MgO-AI,O, system.

An interesting application of the three-sublattice model is to the Fe—Al-C system. In
the ferrite phase, carbon dissolves interstitially and Fe—Al can form a B2 ordered structure.
This means a combination of two sublattices for ordering of the metallic elements with
one extra sublattice for interstitials. Some care must be taken with the model parameters
to ensure that the disordered phase remains stable, but, using the partitioning as described
in section 5.8.4.1, that is no problem.

Models for phases with order-disorder transitions

The sublattice model can describe phases that exhibit ordering of the metallic constituents
on different sublattices that may disappear above a certain temperature or beyond a partic-
ular composition, for example the B2/A2 transition already mentioned in section 5.8.2.4,
the L1,/A1 transition in section 5.8.2.5, and the four-sublattice models in sections 5.8.4.4

===========
 

5.8 Modeling using sublattices 137

and 5.8.4.7. If one restricts the model parameters to just the ideal model without excess
parameters, the sublattice model is identical to the Bragg—Williams—Gorsky treatment of
ordering, but with the excess parameters in the CEF one may reproduce the real properties
of the ordering transformation better.

In the disordered state the constituents are distributed equally but randomly on the
sublattices. In the ordered state the constituents have different fractions. This degeneration
of the two or more ordered sublattices into a single one enforces several restrictions
on the possible parameters in the CEF, otherwise the disordered state would never be
stable. These restrictions are based on the requirement that the Gibbs energy of the phase
must have an extremum against variations in the ordering variables at the disordered
composition. In the disordered state such a requirement is self-evident and the extremum
must be a minimum, otherwise the phase would undergo ordering. Such requirements
were first derived by Ansara et al. (1988).

In some cases the ordered phase is described with a different Gibbs-energy expression
from that used for the disordered phase. The ordered phase will then normally never
be completely disordered. Such a treatment of ordered phases is not recommended in
general, although some ordered structure types, such as D0,, and L2), see Fig. 5.22 and
section 5.8.4.7, may require too many sublattices for it to be practically reasonable to
treat them with a single mathematical expression.

The configurational entropy for a phase with an order—disorder transition may deviate
considerably from the ideal entropy used in the sublattice model. However, from a
practical point of view these differences can be modeled in terms of the excess Gibbs
energy without losing any agreement with experimental data, although one may suspect
that the extrapolations based on these simplifications may be less accurate than a proper
treatment of the configurational entropy. For future work it is recommended that models
making use of the CVM, see section 5.7.2.2, or similar techniques should be considered
for phases with order—disorder transitions.

The disordered state of an ordered phase

For phases modeled with an order—disorder transition like the B2/A2 case in section 5.8.2.4
both the ordered and the disordered state can be described with a single Gibbs-energy
function.
Applying y; = y/’ =x; to the G,, expression (5.104) for an ordered binary A—B phase
and a regular-solution interaction parameter gives
Gay = YsVRCG aa HY

Gan +940 "Gua + v4y6°Gas

   

+O.SRT [y% lm(y') + ¥% lm(yg) + 9% In) +94 lm(y$)] FyaLane + 9G Leam

XA Gay F2Xy%R Gay $45 Gog + RT [xq In(xy) +x In(xg)] + 2X, X—Lage

  

= KGa Fate Gan +35 Con + %a%p Cow
+.xXp(2°G ap — Gaia — °Gp.p) + RT [xq In(xq) + Xp In(vg)] + 2x XpLawe

Gy +p °Gy RT [xq In(xq) +g In(xg)] +X, %p Lan (5.141)

 

===========
138

5.8.4.2

Models for the Gibbs energy

The star, *, used instead of a constituent index in the parameters above indicates that
the parameter is independent of the constitution of that sublattice. In the derivations of
the relations above, °Gy.3 = °Gg., and Lag.» = L..s3 have been used and in the last line
also the substitutions

 

Gy = Gan
Gs = Cun (5.142)

Lap = 2’Gan—°Ga.n — "Gan +2L ane

The fact that the parameters used to describe the ordered state also influence the
disordered state is a disadvantage when the ordering is added to an already-assessed
disordered phase. Also when extrapolating binary systems with and without ordering to
a ternary system this model requires that the parameters derived for the substitutional
model for the disordered phase be converted to the two-sublattice model. This can always
be done by replacing the mole fractions by the appropriate site fractions,

xX, = 0.50, +yK)

y= 0.5(y% +98) (5.143)

but it is rather cumbersome for multicomponent systems.

These were the reasons for introducing a “partitioning” of the Gibbs energy for an
ordered phase into one part that is independent of the ordering and one that describes the
contribution to the Gibbs energy due to ordering.

Partitioning of the Gibbs energy for ordered phases

For phases with order—disorder transitions the partitioning of the Gibbs-energy expression
is into two parts, a general part, which depends only on the composition of the phase,
expressed as mole fractions x, and another part giving the contribution due to long-range
ordering, depending on the site fractions y:

 

(x) +AG&(y) (5.144)
The first term, G¢'(x), is independent of the ordering state of the phase. The second
term, AG", gives the contribution due to long-range ordering and must be zero when
the phase is disordered. The simplest way to ensure that AG¢™ is zero in the disordered
state is to calculate this contribution as
AG*(y) = G"(y) — G"(y replaced by x) (5.145)
In Eq. (5.145) the parameter describing the ordering, Ge", is first calculated with the
original site fractions, y, which describe the ordering. The site fractions are then set equal
to the mole fractions, x, which means that each constituent has the same site fraction in

===========
5.8.4.3

5.8 Modeling using sublattices 139

all sublattices, and the value of the expression is calculated again. The difference is the
contribution to the Gibbs energy due to ordering. If the phase was originally disordered,
the two terms will be equal and the difference will be zero.

Ordered phases become less ordered with increasing temperature. Above a certain
temperature LRO may disappear completely, but some SRO will remain even in the
disordered state. If the ordered phase has no order-disorder transition within the experi-
mental range, for example the ordered phase may melt before it disorders, there is a
certain arbitrariness in the distribution of the Gibbs energy between Gés(x) and Ge"(x).
It may be possible to resolve this using ab initio calculations.

An important advantage of this partitioning is that it is much easier to combine
assessments, including assessments of both ordered and disordered descriptions of a
phase. If a system has a disordered contribution only, that is added to the Gs part and
no parameters are needed for the G2" part.

It is important to understand that the partitioning of the Gibbs energy into an ordered
and a disordered part is not a new model; the Gibbs-energy expression can always be
written using the site fractions only. It is a simplification that is useful for calculations
of ordered phases in multicomponent systems.

  

The quasi-chemical model and long-range order

An interesting connection with the quasi-chemical model for SRO is that one can calculate
site fractions for a two-sublattice model from the “bond fractions” yay, Yap. Yea, and
Ypp as
Ya = Yaa t+ Yap
Je = Yeat Yep
Ya = Yaa tba (5.146)
Je = Yas +Ybp
Note that it is essential to treat yg and yga as different, otherwise one cannot describe
the long-range ordering. This means that a quasi-chemical model can be formally treated
as a two-sublattice model, but in addition it includes a contribution from SRO. It is not

possible to calculate the bond fractions from the site fractions without introducing an
additional variable €:

= Yaya +€

s
5
I

Ya = YaYe—€
Yea = YbYa—€ (5.147)

Yen = Yaya t€
It is this € variable that describes the SRO. The quasi-chemical model is not
used for assessment since it is limited to crystalline structures that can be described

  

===========
140

5.8.4.4

Models for the Gibbs energy

with a two-sublattice model with all nearest neighbors on the opposite sublattice,
but it has been applied to liquids, see section 5.9.3. Note the problem with nega-
tive entropies for large SRO shown in Fig. 5.17(b) if one uses a quasi-chemical
model without allowing for LRO. Models for crystalline phases with explicit SRO are
based on the CVM, see section 5.7.2.2; models with implicit SRO are described in
section 5.8.4.5.

Simultaneous L1, and L1, ordering

With four sublattices one may model both LI, and L1, ordering on the fee lattice.
Actually, there are many more ordered structures based on the fcc lattice, but most of
them can be treated as separate phases with different Gibbs-energy expressions. The
restriction that these phases will never undergo disordering is usually a minor problem.

In the four-sublattice model the restrictions on the parameters can be derived fairly
easily from the symmetry of the lattice. For example,

 

 

“Gavan = Gaawa ="Gasaca = "Gaaiaca

“Gasan = “Gapan = "Goan = "Gana = "Goan = "Goma:

“Geawa = “Gooan = "Gone ="Ganse (5.148)
SLaBvcA = “Lavaca = Lyarap:a = "Laacnas

The L1, and L1, ordering and also the disordered Al phase can be described with the
same model. Normally the Gibbs energy is partitioned into a disordered and an ordered
part as described in section 5.8.4.2. The L parameters above are then normally not used
since they can be described in the disordered part. If one assumes that the bond energy
between AB pairs, u,g, depends only slightly on the composition, one can write the G
parameters as follows:

°Grrne = Gays = 3ttan + Ary

°Ga.a5:8 = Gayp, = Allan (5.149)

“Gxs65 = Gas, = 3uay + Aur

The factors of 3 and 4 above come from the number of AB bonds in each end member.
The bond energy may be different when the overall composition is different and thus the
terms Au, and Au, can be used as corrections to fit the experimental data.

It is a critical test that one has used a correct set of parameters that the disordered
phase can really be disordered, i-e., that all site fractions on all sublattices are equal at
some high temperature. If there is a deviation, even a small one, then probably one or
more parameters are missing or have wrong values.

===========
5.8.4.5

5.8 Modeling using sublattices 141

Approximation of the short-range-order contribution to the Gibbs energy

The SRO contribution to the Gibbs energy of the fcc phase can be approximated with a
reciprocal parameter as shown in Eq. (5.102). For a four-sublattice phase one can have
three different such parameters:

L, L,

ABABAA = Fa BAABA ==

 

(5.150)

Lasasas = La.paabn

Laeazen = Laeiaee = 77° = Lop

Unless there is a lot of experimental information on the system, one may set all of these
equal and just use

  

Lywa.es =Laweane = = uyy + Au; (5.151)

A reasonable initial value is obtained, according to Abe and Sundman (2003), by setting
this parameter equal to the bond energy, ug, and, if necessary, using a small correction
term, Au,. The SRO should vanish at high temperatures, which can be achieved by mul-
tiplying wap by a factor like exp[(T¢—T)/(2T,)]. where Te is the ordering temperature
for the equiatomic composition.

The “prototype” fec phase diagram shown in Fig. 5.23(a) was calculated with a single
constant bond energy ug = —10000Jmol™! used in Eqs. (5.149) and (5.151) with all
Au, = 0. This diagram is almost identical to the prototype phase diagram for fcc ordering
calculated using a CVM-based tetrahedron model, as shown by Sundman and Mohri
(1990). The thermodynamic functions at 700 K for the system are plotted in Fig. 5.23(b).
The entropy curve is like teeth on a saw and, for ordered compositions, the entropy is
almost zero. The heat-capacity curve is even more irregular, as discussed by Kusoffsky
and Sundman (1998).

To describe a real binary phase diagram with fcc ordering, one has to investigate the
parameters of the Gibbs-energy function that can be adjusted. The Gibbs energy has been
partitioned between the disordered fcc and the ordered phases according to Eq. (5.145):

GN = G3) + AGS") (5.152)
4
GA = YO x,°G, +RT YO xIn(xj) +x ,x— Dey —¥)"” LA (5.153)
ioXB icXB 0
AGH = GO) -— GS) (5.154)
4
GE = LY YL DY yyPyP oS + RTD Dy! Inv!) +FGgt
iEXBj=ABA-ABISAB S1e0B
(5.155)

14
Gm! = OY yyy yyy Le (5.156)

sslisstl

===========
142

Models for the Gibbs energy

 

 

 

 

 

 

 

 

1300 * * a * * ; (Atty LI LI AT
1200 4 r | 40°S/ f
1100 | [ 24 [
S 14 L
¢ 1000 4 Le Lt2 r 2
© 9004 L1o | 2 04 y
2 14 L
soo | [
S E24 [
700 | | 2
E B _, | [
© 6004 | <7] H/(RT) [
500 4 big | [
400 5 r 64 GIRT) bk
300 1 1 1 1 7 1 1 1 1
A o 02 04 06 08 10 fY 0 02 04 06 08 10
Mole fraction B Mole fraction B
(a) (b)

Figure 5.23 A prototype phase diagram for fcc ordering with two L1, ordered phases and one
Ll, ordered phase is shown in (a). The diagram is calculated using a single Gibbs-energy
function, Eq. (5.152), with a single bond energy value wy = —10000J mol”. In (b) the
dimensionless thermodynamic functions at 700 K are plotted (the entropy is scaled by a factor of
10, to make it more easily visible). The vertical dotted lines indicate the two-phase regions.

In the disordered part, Eq. (5.153), the contribution due to SRO must be included and
the following parameters must be set using the notation from Eqs. (5.149) and (5.150):

 

°LA's = Gap + 1-5Ga,p, + Gap, +0.75L qq +0.75Lpp + lo
‘LAs = 2G a, —2Gap, +0.75L q, —0.75Lg3 +h

PLAS = Gaye — 1.5Ga,p, + Gap, — Slap th (5.157)
SEAL, = —0.75L yy +0.75Lpy

4p Al

Al = —0.75Laq + 1.5Lqy —0.75L55

These parameters can be derived from the four-sublattice model by setting all site
fractions equal to the mole fractions and identifying the interaction parameters in the
substitutional model. The coefficients Jy to /, are zero in Fig. 5.23 but can be optimized to
fit experimental data. It is necessary to include the ordered parameters in the disordered
part because otherwise one would not have a separation of the three maxima for the
order—disorder transitions.

One may think that including the SRO contribution in the disordered part, G¢s, would
give twice the SRO contribution when the phase is ordered. However, according to
Eq. (5.154), the SRO contribution from the ordered part will be subtracted using mole
fractions and thus cancel out the contribution from the disordered part when the phase is
ordered.

The phase diagrams in Fig. 5.24 show the influence of varying the Aw and /;
parameters. In both diagrams ua, = —10000Jmol~', Au, = —1000Jmol"', and

===========
5.8.4.6

 

 

 

 

 

 

 

 

5.8 Modeling using sublattices 143
1800 1 1 . 1 1800 1 . .
1600 | L 1600 | b
A At
1400 4 r 1400 4 r
= 1200 = 1200
g g Lt,
® 10004 Lt, F & 10004 t
2 2
800 + r 800 + r
e Uy e Lt }
600 + r 600 + r
Li,
400 + r 400 + r
200 1 1 1 1 200 1 r 1 1
A ° 02 04 06 08 10 AY 0 02 04 06 08 10

Mole fraction B

(a)

Mole fraction B

(b)

Figure 5.24 Ordered phase diagrams, with (a) /y =0 and (b) /) = 40000J mol", for fee with two
L1, ordered phases and one Ly ordered phase calculated using a single Gibbs-energy function,
Eq. (5.152), with different parameter values, according to Eqs. (5.149) and (5.153); the values are
given in the text.

Auy = +1000J mol”', and in (a) the disordered /, parameter is zero whereas in (b) it is
40000J mol".

The same four-sublattice model can also be applied to ordering in hep phases. It is
also possible to add a fifth interstitial sublattice to the ordered model, but all parameters
for the interstitial component should be in the disordered part.

It is of historical interest to mention that the first order-disorder phase diagram for
fcc was calculated by Shockley (1938) using a Bragg—Williams—Gorsky model without
the reciprocal parameters, Eq. (5.151), and he could then not separate the three ordering
maxima. It was a success of the CVM when Sanchez et al. (1982) showed that a CVM
tetrahedron model could describe the topology of the ordered fcc phase diagram with
three separate maxima.

Transforming a four-sublattice ordered fec model to the two-sublattice model

The relation between the parameters for the two-sublattice L1, model can be derived
from a four-sublattice model in which the site fractions on three sublattices are set equal
and related to the normal parameters in the two-sublattice model, or by using the criterion
that dG/dy,; = 0 for the disordered state for all independent y,. The reason for using a
two-sublattice model is that calculations with it are significantly faster, but it means that
one cannot calculate a possible L1, transformation.

Higher-order systems with an L1, phase modeled with two sublattices require a lot
of ternary and some quaternary interaction parameters dependent on the binary ones in
order to make the disordered state stable. For a phase (A, B, C, D);(A, B,C, D) the list

===========
144 Models for the Gibbs energy

below shows some of these parameters as derived by Dupin (1995), which can also be
found in Kusoffsky et al. (2001):

0 yond
Ly BA

1 pond
Ly BA

ond
LNs. CA

od
LX B.D:

oyord
LN CA

1 pond
Ly CA

ond
LX .C,D:A

oped
Lixo A

1 ord
Ld. A

 

ord
GB! A

= —1.5G gg, +1-5Ga,p, + 1-5Ga,8,

0.5G ay, — 1.5Ga,p, +15G a,

6G p50 — 1-5Ggp,0~ 1 5Gage, —1.5G,5 — 15

 

+ Gap, —1SGa,0—15Ga,0, + Gacy,
6G x50 ~1-5Gqup — 1 5G app, — 1 5G 55 —1.5Ga,5,

+ Gap, —15Ga,y — 1.5Gq,0, + Gav, (5.158)
-15G ye, $15Gq,¢, + 15Gqy6

0.5Gae, — 1.5Ga,0, + 15Gac

6G ,,ep — 1.5Gye,p — 1 SGgep, — 1.5Ga,0— 1-SG,c,

+ Gyo, —15Ga,p — 1.5Ga,p, + Gav,

-1.5Gqp, + 1.5Ga,p, +1. 5Ga,p

0.5G ap, — 1-5Gg,p, +1.5G,p

Gap,

It is not necessary to give a complete list since software can generate all these
parameters. The parameters from the four-sublattice model are denoted as in Eqs. (5.149)
and (5.159). The symbols Gag, etc. have the same meanings as for the respective binary
systems according to Eq. (5.149). The new symbols introduced are defined as

G.

ancy = Uap +2ttye+2ttye + Any

Gapje = 2ttay + Hye + 2uye + Aus (5.159)

Gaye = 2utay + 2tae+ uye + Atty

Gascp = “ap t+lact+ Uap + Upc + Upp + Men + Anz

where ip etc. are from the binary systems but the terms Au, to Au; can be optimized
to fit data in the ternary system.

5.8.4.7 B32, DO,, and L2, ordering

The B32, DO, and L2, phases are ordered forms of the A2 structure type and require
four sublattices for their modeling. The ideal composition of a B32 ordered phase is AB,
as for B2, but not all nearest neighbors are different. The ideal composition of a DO;
ordered phase is A,B, as for L1,, but, in contrast to L1, ordering, the DO, ordering does
not have identical surroundings in the three sublattices with the majority constituent.

===========
5.8.5

5.8 Modeling using sublattices 145

One difference between the four-sublattice models for ordering in bec and fee phases is
that the bec ordering requires two bond energies, both nearest and next-nearest neighbors
are important. In B2 ordering it is sufficient to have two sublattices, one with the central
atom, the other with the eight corner atoms. In DO; ordering one must consider eight bec
unit cells and each of the previous sublattices is split into two new ones in such a way
that the atoms on the same sublattice are arranged diagonally. The four sublattices must
be grouped two and two since all nearest neighbors are on two of the sublattices and all
next-nearest neighbors on the third. If sublattices 1 and 2 have no nearest neighbors and
neither do sublattices 3 and 4, the compound energies are

Gavan = Bad = Gpaaa 2€an + Tap

Gyxne = Gowaa4éas (2) (5.160)

 

 

°Gawaw = Gapaa = "Gpacan = "Goacna 2€an +216

where 7,, is the next-nearest-neighbor bond energy.

The L2, phase is also known as the Heusler phase with the ideal composition A,BC
and can appear only in ternary systems; the lattice is shown in Fig. 5.22. It has the same
arrangement of sites as D0,, but two sublattices have the same element (A) while the
other two have different elements (B and C).

  

Partitioning of the Gibbs energy for phases that never undergo
disordering

Phases with many sublattices may become very complicated in multicomponent systems
since the number of “end members” is the product of the number of con:
each sublattice. Many of these “end members” may represent compositions inside the
single-phase region or far outside the phase’s stability region, thus it can be impossible to
assess or evaluate any parameter value for these. The technique of setting the parameters
equal to the mean value of the Gibbs energies of formation of each constituent, like in
Eq. (5.39), is one possible way to handle this.

Another recent model involves partitioning the Gibbs energy into a substitutional and
a sublattice description also for phases with sublattices that never disorder. For such a
case there is no need to make the ordered contribution equal to zero and for those phases

 

tuents in

  

one simply has

Gy = G(x) —T™ Sh + AGE (5.161)

AGO) = GO) (6.162)

G4 is described with a substitutional model and Ge" includes the sublattices according
to the crystalline structure. In Eq. (5.161) the ideal configurational entropy “'S¢s is
subtracted from the disordered part and the configurational entropy is calculated for the
ordered part only.

The physical reason for adding a disordered contribution to a phase like o is that the
interaction energies need not depend strongly on the sublattices where the constituents

===========
146

5.8.6

5.9

5.9.1

Models for the Gibbs energy

are located. In particular, for a phase with a narrow composition range the disordered
contribution makes it possible to have a smoother enthalpy curve far away from the
composition range of stability and avoid unphysical curvatures. It also seems possible
to model phases with small composition ranges with fewer parameters, using disordered
interaction parameters.

This partitioning for phases that are always ordered is a very new model and little
practical experience has been obtained. For the Laves phase the usual model has all
constituents on all sublattices, but the o phase is normally modeled with a restricted set
of constituents on the sublattices. With a disordered part it may be advantageous if all
constituents were allowed to enter all sublattices. In the first case one would use for Fe—Cr

(Fe) 1o(Cr)a(Cr, Fe) ie (5.163)

and in the second case
(Cr, Fe) 1o(Cr, Fe)4(Cr, Fe) ig (5.164)

An advantage of the second method would be that one could assign a value just to
the °Gf, representing pure o Fe and would not have to bother about multicomponent
parameters like °Gf...4,.4; that cannot be determined from experimental data. The value
of °Gf, have to be estimated or determined from ab initio calculations. This partitioning
is used in the case study of the Re—W system in section 9.3.

Partitioning of parameters in physical models

Physical properties that are modeled separately, such as magnetism, may also have
their parameters partitioned between the ordered and the disordered part. The individual
parameters such as the Curie temperature from both parts will be added together before
they are used to calculate contributions to the Gibbs energy of the phase. In Fig. 5.4
the assi 1 temperatures for magnetic ordering in the bec phases in the Fe-Cr
system and for fee and bee phases in the Fe—Ni system are plotted.

 

sed criti

 

Models for liquids

The substitutional-solution model is the most commonly used model for liquids. The
associate model, described earlier, is often applied to liquids that exhibit a tendency
toward SRO. The description of these models will not be repeated here.

Metallic liquids

Most metallic liquids can be well described in terms of a substitutional solution of the

elements with a Redlich-Kister excess Gibbs energy, Eq. (5.51), which is repeated here:

Gy = x°G, +RTY x n(x) + Gy, (5.165)
iat iat

===========
5.9.2

5.9.3

5.9.3.1

5.9 Models for liquids 147

where x; is equal to the mole fraction. The binary excess Gibbs energy, using the Redlich—
Kister series explained in section 5.6.2.1, is

®Gy = VV waxy (5.166)

7 ipl

k
Ly = Dy, — x)" "L, (5.167)

v=0

Ternary and higher-order terms can be added as for solid solutions, as described in
section 5. For the liquid phase it is also sometimes useful to introduce other ternary
extrapolation models, as described in section 5.6.6.

 

Liquids with strong short-range order

Some liquids have a tendency to exhibit SRO around certain compositions. This is usually
apparent also in the solid state with a stable compound of that composition. The heat of
mixing of the liquid should have a pronounced “V”-shape and it can be modeled with
associates, see section 5.7.1, or, for cases in which the SRO is due to electronic charge
transfer, the particular models for liquids described below.

Quasi-chemical entropy for liquids

Short-range order is particularly important in liquids and several models have been pro-
posed for various types of liquids. The already-mentioned associated model is particularly
useful for the liquid phase when different atoms like to be close to each other but still do
not form stable molecules. Since the associated solution still uses the ideal configurational
entropy, several attempts have been made to improve the agreement with experimental
data by taking into account a quasi-chemical entropy expression. Two such models will
be described here because they can be used in the PARROT program.

The modified quasi-chemical model

Various modifications of the quasi-chemical model have been used with considerable
success by the FACT (Bale er al. 2002) group in Montreal to describe oxide and sulfide
liquids. In their assessments they have not used the same model for the metallic liquid,
which makes it impossible to describe some systems like Fe—-S and Zr—O for which there
is no miscibility gap between the metallic and ionic liquids.

This model has been modified several times and it has not been used for any assess-
ments with the software described in this book, so it will not be discussed further. The
interested reader is referred to the publications by Pelton er al. (Pelton et al. 2000, 2001,
Pelton and Chartrand 2001, Pelton 2001).

Just to investigate the importance of the quasi-chemical configurational entropy, a
quasi-chemical modification of the liquid two-sublattice model, described by Hillert
et al. (2001), has been tested. The liquid two-sublattice model is described below in

===========
148

Models for the Gibbs energy

section 5.9.4. For a simple system with ions all with unit charge, all cations mix on one
sublattice and all anions on the other, and the numbers of sites on the two sublattices
are the same. For this simple case this model is identical to the modified quasi-chemical
model of Pelton et al.,

(A,B) (Ch, Dh), (5.168)

The configurational entropy in the ionic-liquid model is given by Eq. (5.183) and, for
the simple system above,

aston

 

‘ac Gac t Yap’ Gap + Yac® Gace + Yap’ Gap

RTz ’ ’ : :
+ FE [cto 2) #rtn( 22) rcto( 9) rte)
2 Yan You Yau pe Yaron Yeu dpe

+ RT [yaie In(y gre) + Yar Ings) Her IN(Ver-) +p INQ) (5.169)

 

The equation above is simplified by the fact that all charges are the same. This means
that it is similar to a crystalline quasi-chemical model, Eq. (5.79).

The reciprocal miscibility gap for this system has been calculated using the same
values for the end members in both models and is shown in Fig. 5.25 for the normal
ionic-liquid model (dashed lines) and for the ionic quasi-chemical model, Eq. (5.169)
(full lines). For the quasi-chemical model the number of bonds, z, was assumed to be 12.
The only difference between the models is in the configurational entropy, the effect of
which is quite small.

0.50 L L 1 L

 

0.45 4

0.40 4

0.35 4

0.30 4

0.25 4

0.20 4

Mole fraction D

0.15 4
0.10 4

0.05 4

T i
A 0 04 0.2 0.3 0.4 05

Mole fraction B

 

 

 

 

Figure 5.25 The reciprocal miscibility gap for an ionic liquid (dashed lines) and that for the ionic
quasi-chemical model (full lines) calculated using the same Gibbs energies for the end members.

===========
5.9 Models for liquids 149

5.9.3.2. The cell model

A binary cell model was proposed by Kapoor et al. (1974) and later extended to multi-
component systems by Guye and Welfringer (1984). It was first used for liquid oxide
slags, but has recently been extended to sulfides and fluorides also.

The cell model has a special form of the quasi-chemical entropy. One considers
cells with one anion and two cations. Originally only oxygen was considered, so the
presentation here will be limited to oxides. The cells can have two identical or two
different cations. The cells can be treated like constituents, but one has to be careful about
the numbers of atoms in the constituents. The general rule is that the same number of
anions must be provided from both cations in the constituent with two different cations.
The mole fractions of the “component oxides,” i-e., the cells with only one type of cation,
are, for n cations,

 

it Digi My (5.170)
Q
0=5(»+Evai) (5.171)
ial iv

where v; is the oxygen stoichiometry in the component oxide of the cation M, M,,0,
As an example one may use the CaO-SiO, system, for which the constituents would be
(CaO, SiO,, (CaO),SiO,) and the quantities above would be

Youo + 2Vca,Siog

 

Xexo = o
Ysio, +
sion = 9
2 = Yeao + Ysio: + 3Yearsiog (5.172)

The Gibbs energies of formation of the “component oxides” as well as the cell with
two different cations are simply introduced into the “'G,, part of Eq. (5.1) multiplied
by their constituent fractions as in the ideal-solution model, Eq. (5.42). One has to be
careful that the parameters are given the right values considering the number of atoms in
the constituent; the parameters for formation of a cell are for one oxygen atom whereas
the constituents defined here will be for v; +v; oxygen atoms.

The model then introduces a sum over the component oxides, D, defined as

D, => v)x; (5.173)
i=

The important property of this sum is that the “component oxides” must be ordered
in decreasing valency according to the cations. By introducing D, the model attempts
to account for the charged behavior of the cells. The expression for the configurational
entropy below, Eq. (5.174), is in principle derived by first distributing the highest-charged
constituents on all possible sites, then the second-highest-charged ones on the remaining
sites and so on.

===========
150

5.9.4

Models for the Gibbs energy

If two cations have the same valency, they are arranged in decreasing order of
“acidity.” The order is slightly arbitrary, but the proposed arrangement of cations is
(P+, si**, (PO)**, Crt, AP*, Fe*+, Cr°*, Fe*t, Mn?*, Mg?*, Ca®*, Na'*). Note
that several cations have two valencies and P also appears as a complex (PO)**, in order
to obtain a better description of the experimental information. The entropy expression of
the cell model is then

nl
ete _ pli D\_ Disa
su= Ri [rm( se) Pom oe)

n vx, a yy )
=2R > y,x;In( =!) —R dy, Inf 5.174
ue (=) x» (3 6174)
The first two sums are over all component oxides, but the last sum over j is for all m
constituents.

The excess parameters of the cell model are slightly special and will not be discussed
here.

The partially ionic-liquid two-sublattice model

This model has a very long name and it is usually abbreviated as the liquid two-sublattice
model, although that can be ambiguous. It is interesting to note that the sublattice model
developed by Hillert and Staffanson (1970) for solid phases was based on a model
suggested by Temkin (1945) to take into account the configurational entropy in molten
salts. In a liquid there is no LRO and one cannot distinguish sites for anions or cations,
but the mathematical formalism using mixing on two different sites gives good agreement
with experimental information. This means that exchanges of a cation with an anion
must not be counted in calculating the configurational entropy by use of Eq. (2.11). In
particular, on mixing four salts, A.C,, A,D,, B.C,, and B,D,, one obtains a reciprocal
system as shown in Fig. 5.26, with A and B in the first sublattice and C and D in the

 

second:

(A, BP) (Co, Do (5.175)

 

If all ions have the same valence then P = Q = a and the Gibbs-energy expres
for this liquid is identical to that for a crystalline two-sublattice model. However, if the
valencies of the cations or anions are not equal, one must find some method by which
to maintain electro-neutrality in this liquid. One method is to use equivalent fractions
defined by

(5.176)

(5.177)

 

===========
5.9.4.1

5.9 Models for liquids 151

0.5

Gibbs energy
é
a

1

   

06
04
02 00

Figure 5.26 The surface of reference for a reciprocal system. Note that the surface is curved even
without any configurational entropy or excess parameters. Courtesy of Qing Chen.

where a+, b+, c—, and d— are the valences of A, B, C, and D, respectively, and
P=Q=1. However, the use of equivalent fractions has the drawback that it is impossible
to extend the model to systems with neutral constituents.

Hypothetical vacancies and neutral species

Therefore another model has been developed, which can be extended both to systems
with only cations (i.e., metallic systems) and also to non-metallic liquids, for example
liquid sulfur. This model is called the “partially ionic two-sublattice liquid model” (Hillert
et al. 1985) and it uses constituent fractions as composition variables. In order to handle
a liquid with only cations, i.e., a metallic liquid, hypothetical vacancies are introduced on
the anion sublattice, whereas in order to extend the model to non-metallic systems one
introduces neutral species on the anion sublattice. The model can be written as

(CE) pAL Va, Boo (5.178)

where each pair of parentheses surrounds a sublattice, while C represents cations, A
and B neutral species. The charge of an ion is denoted

  

anions, Va hypothetical vacanci

===========
152

Models for the Gibbs energy

v; and the indices i, j, and k are used to denote a specific constituent. The superscripts v;
on cations and anions as well as 0 for the neutral species will be omitted unless needed
for clarity. The numbers of sites on the sublattices, P and Q, vary with the composition
in order to maintain electro-neutrality. The values of P and Q are calculated from the
following equations:

P=Dviyq, + Ova (5.179)
7
O=L Ne,

where y, denotes the constituent fraction of constituent i. Equation (5.179) simply means
that P and Q are equal to the average charge on the opposite sublattice. The hypothetical
vacancies have an induced charge equal to Q.

The ordinary mole fractions can be calculated from the constituent fractions in the
following way for the components which behave like cations:

Pye, (5.180)
Xe, = ———+ .
“P+ OU —yva)
For the components which behave like anions or neutral species:
Qyp,
we i 5.181
*» = prod ¢ )

 

where D is used to denote any constituent on the anion sublattice. Equation (5.181) cannot
be applied to the hypothetical vacancies, because the mole fraction of vacancies is zero,
of course.

The integral Gibbs-energy expression for this model is

“Gn = LL Yaa;
7

    

Feya, + Ova DL Ye,° Ge, FAD Yay’ Gay (5.182)
7 r

 

= «oy Ye, Inve.) + o(s Ya, In(va,) + yvalnQva) +O Yo, INO, ] (5.183)
i 7 E

 

LL Vy Laas + LL Md

a] ok

FLU Lynn Ling +L Lvodveliva
i

tak i

ab

 

iy i'Na

 

FLV Vov ili +L Lyi valivae tO DY Ys Ley ke (5.184)
Toy 7k i ke

where °Go, Ay is the Gibbs energy of formation for v; +; moles of atoms of liquid C;Aj.
°Go, and °Gg, are the Gibbs energies of formation per mole of atoms of liquids C; and B;,
respectively. The factor Q in front of the second and third sums comes from the variation
of the number of sites with the composition. Note that G,, in Eqs. (5.182)-(5.184) is
defined for a formula unit that contains P + Q(1 —yy,) moles of atoms. “'S,, is a random
configurational entropy on each sublattice and -G,,, is the excess Gibbs energy.

===========
5.9 Models for liquids 153

5.9.4.2. The excess parameters

5.9.4.3

There are many possible excess parameters in this model and in the expression above
only the binary ones are included. The following list may be useful in order to relate
them to real systems.
L;,i,; tepresents interaction between two cations with a common anion, for example, in
the CaO-MgO system, Loy2+ Mg2+.02-+
iiy:Vva Tepresents interaction between two metallic elements, for example, in the Ca-Mg
system, Le, yg. The charge is irrelevant in this case. Note that this parameter is equiv-
alent to that in a substitutional solution of i and j if the parameter is multiplied by the
fraction of vacancies squared. The corresponding ternary parameter with three cations
must be multiplied by the third power of the fraction of vacancies in order for the
parameter to be compatible with the ternary interaction parameter in a substitutional
solution with three metallic atoms. This is discussed in more detail by Sundman
(1991b).
L;,:,x is forbidden because the number of cation sites is zero.
L;.j,;, tepresents interaction between two anions in systems with a common cation, for
example, in the Ca(OH),—CaCO, system, Le,2+:04'-,coz-+
L;.;y, tepresents interaction between a metallic atom and an anion, for example describing
the Fe-rich side of the Fe-S system, Ly.2+.52- ya-
L;., represents interaction between an anion and a neutral atom, for example describing
the sulfur-rich side of the Fe-S system, Ly,2+.s2- 5
Ljvax Tepresents interaction between a metal and a neutral species, for example, in the
Fe-C system, Lp.2+.va,c+
Ly, x, Tepresents interaction between two neutral species, for example, in the Si,N,-SiO,
system, Ls;.x, sio,- Note that the cation is irrelevant in this case because the number
of cation sites is zero.

L,

It is straightforward to include ternary interaction parameters in the model, but this
will not be described here.

Equation (5.182) may look formidable in its complexity and one may wonder whether
simpler models might not be equally useful. This criticism misses the point, because
Eq. (5.182) is the general multicomponent expression and this model is indeed identical
to simpler models in many special cases. The great advantage with Eq. (5.182) is that
it allows a continuous description of a liquid that changes in character with varying
composition. Equation (5.182) has successfully been used to describe oxide liquids,
silicates, and sulfides as well as SRO in liquids and also molten salts and ordinary metallic
liquids.

  

 

Compatibility between different liquid models

It is instructive to show how to convert from some different models to the liquid two-
sublattice model. A liquid with two metallic elements like Fe and Cr would normally
be treated as a substitutional-solution model, (Fe, Cr). In the liquid two-sublattice model

===========
154

5.9.5

5.9.6

Models for the Gibbs energy

the description would be (Fe**, Cr+) 9(Va)g (taking the dominant valency only). For
solutions with only vacancies in the anion sublattice, P and Q are always equal. All
parameters for interactions between cations evaluated for a substitutional model can thus
be used directly in the liquid two-sublattice model.

A liquid solution of C in Fe may also be treated as a substitutional solution, at least at
high concentrations of carbon. However, it would not be realistic to assume that carbon
has a positive valency and in the liquid two-sublattice formalism one would like to model
it like (Fe**)p(Va, C)g. It is quite remarkable that this is also mathematically identical
to a substitutional solution (Fe, C).

Another remarkable feature of Eq. (5.182) is that it becomes identical to the associate
model for some simple binary systems, for example the Cu-S system modeled with
an associate Cu,S. The associate model uses a substitutional solution of (Cu, S, Cu,S)
whereas the liquid two-sublattice model uses (Cu'*),(S?-, Va, S)g, but it is possible to
identify the parameters in these two models with each other and they give identical results
in both models. The assumptions behind the associate model and the liquid two-sublattice
model are very different and it is interesting that these different assumptions can lead to
the same mathematical expression. This shows clearly that one cannot make any statement
about the true nature of a system just because a mathematical formalism based on some
physical model of the system gives a good result. It may be possible that another physical
model of the system will yield exactly the same mathematical formalism.

The aqueous solution

Model parameters for aqueous solutions are usually not stored in general databases but
are often re-evaluated from various models for each particular application. However,
parameters for a simplified Pitzer model and some other models used for aqueous solutions
can be evaluated using the techniques described in this book. Interested users are referred
to the particular software for instructions on how to handle the parameters of the models
implemented.

A model for polymers — the Flory-Huggins model

This model has been proposed for polymer systems in which the constituents can be very
different in size or volume. For each constituent a “size” parameter must be given. It is
used in the following binary expression for the Gibbs energy of mixing:

-nfoa(®)

where x, and x, are mole fractions, v, and v, are measures of the sizes of the constituents,

4 Sadar + mesadXin
yy

 

(5.185)

 

Xp is an interaction parameter, and

ee

*= Te bom 5.186)
VyXp ©.

o:

 

Myx, FX

===========
5.10

5.10.1

5.10 Chemical reactions 155

It is not clear how to introduce composition-dependent binary excess parameters or how
to extend this model to ternary or higher-order systems. In order to conform with the
current models, the following general expression has been implemented in Thermo-Calc:

XX)

Guy = 11°C +x4° Gy + RTLxy In(G,) +9 In(9)] + La (5.187)

MX, +X

where the parameter L,, = 7X5.

Chemical reactions and thermodynamic models

In chemistry it is common to use reactions to describe equilibria between different phases
or constituents in a phase. This is very simple and useful when there is only one solution
phase involved and this can be modeled as a substitutional phase. When there are many
constituents or the phases involved have complex structures, there are more problems than
simplifications in using reaction formulae. It is thus recommended that one use chemical
reactions only as an introduction to equilibrium calculations and then switch to using a
general minimization of the total Gibbs energy for equilibrium calculations as described
in section 2.3.

The solubility product

An example of a homogeneous chemical reaction was given in section 5.3.1. Here an
example of a heterogeneous chemical reaction will be given in order to show the relation
between chemical reactions and the thermodynamic modeling. The chemical reaction for
formation of the AIN phase from Al and N dissolved in liquid steel can be written

(Al) +(N) =AIN (5.188)

The parentheses around Al and N are used to denote that they are dissolved in an
unspecified solvent and the reaction formula does not specify that AIN is a different
phase, but all of this is usually evident from the context. If the liquid steel is an ideal
solution, the reaction can be written

°Ghy + RT In(xk)) +°GR + RT In(xy) = GAN (5.189)

where the superscripts now denote the phases liquid (L) and solid AIN. Rearranging this
gives the solubility product

+ ot — exp OI O=
= 4 : 5.190
sha cxo( aT ) (5.190)

 

The right-hand side is the equilibrium constant giving the solubility product. There is
thus a simple relation between the thermodynamic technique described in this book and
chemical-reaction formulae. The chemical reactions should never be used when two or

===========
156

5.10.2

Models for the Gibbs energy

more solution phases are involved or the model for any phase is more complicated than
the substitutional-solution model. Note also that Eq. (5.190) is formally very similar to
Eq. (5.127), but, for the latter equation, the defect fractions and the energy parameters
belong to the same phase, a so-called homogeneous equilibrium, whereas in Eq. (5.190)
the reaction concerns two different phases, a so-called heterogeneous reaction. This
difference is obvious when using thermodynamic models but rather obscured by the
reaction formalism.

Comparison with the Kréger and Vink notation

A method by which to describe equilibria with defects in ionic systems is to use the
Kréger and Vink notation, or something similar, in chemical reactions. This technique has
the same limitation as that of using chemical reactions for other equilibria as mentioned
above.

For example, the reaction of a gas containing oxygen with bunsenite (NiO) to form
a vacant site for Ni and two holes (denoted h*) in the conduction band to compensate
for the electrons taken up forming the oxygen ion can be written as a chemical reaction
using the Kréger and Vink notation:

0.508" = Vi, +2h* +05, (5.191)

In standard textbooks such as Birks et al. (2006) it is shown that the fraction of
vacancies in the Ni sublattice formed in this reaction depends on the partial pressure
of oxygen as Pos This relation is obtained by using the “law of mass action” on the
reaction above and replacing the fraction of holes by the fraction of vacancies on the
Ni** sublattice from the electro-neutrality condition.

In Chen et al. (1998) the modeling of semiconductors is discussed and, to formulate
a physically realistic model for the reaction above, it is reasonable to assume, as shown
by Grundy (2006), that each hole is associated with an Ni?* ion to form an Ni** ion and
the model should be

(Ni?*, Ni**, Va), (07), (5.192)

This model is identical to that used for wustite described in section 6.2.5.8 later. The
Gibbs energy for this model would be

Gy = wee" Guenor +

 

+ RT(yya+ Innes) +yye+ In(yys+) + ve InGya)) (5.193)

The partial Gibbs energy for oxygen in the model can be calculated as the difference
between the partial Gibbs energies for the end members using Eq. (5.38),

===========
5.11

5.11 Final remarks 157

Go =2Gyjs+.92- + Gyg.or- — 2G yj2+,02-

 

=2(°Gys+.or- + RT In(yy+)) +°Gyaor- + RT In(yy,)
—2(°Gyi2+or- + RT In(yye+))
=AGy, + RT(2In(yy+) +1n(yq) — 2 Inn) (5.194)
In the last line AGy,, = 2°Gyj3+.92- + °Gya.cr- — 2°Gyj2+.¢2- has been introduced for the

energy needed to create an Ni** ion plus a vacancy. Electro-neutrality requires yyj3+ = 2yy,
and, because the sum of site fractions is unity, yy+ = 1 —3yy,, which gives

Go = AGy, + RT2 In(2yyq) + In(yy,) —2 In(1 — 3yy,)) © AGy, + 2RT In(2) + 3RT In(vy,)
(5.195)

where one has used In(1 — 3yy,) * 0 since the fraction of vacancies is small. Combining
this with the expression for the chemical potential for oxygen in the gas at the standard
pressure py gives

0.5 [ross +RTIn (%)] =AGy, +2RT In(2) +3RT In(yy,) (5.196)
- Po
Rearranging the terms gives
3RT In(yy,) —O.5RT In (22) = 0.5°GS — AGy, —2RT In(2) (5.197)
Po -
AGy,+2RT In(2) —0.5°G3*
eee Se (5.198)
RT
Ape (5.199)

 

The Kroger and Vink notation does not specify the model for the phase and it is quite
arbitrary how one includes electrons and holes in a model based on the CEF. It can
nonetheless be illuminating to transfer a reaction notation to a CEF-type model in order
to understand how realistic it is.

Final remarks

In most models the excess Gibbs energy includes contributions from all kinds of phys-
ical phenomena, for example vibrational, electronic, and configurational, which are not
described separately in a magnetic model, for example. It is not practical to use very
detailed models for a particular contribution, for example configurational entropy, if other
phenomena with equal or larger contributions to the Gibbs energy are described with a
simpler excess model.

A note about model names may also be appropriate. For example, the special case
of the CEF applied to chemical ordering is called the Bragg—Williams—Gorsky (BWG)
model above when no excess terms are included, but some authors may call all models

===========
158

5.11.1

Models for the Gibbs energy

 

Table 5.1 A tentative classification of the different models. Note that the Gibbs energies of
“clusters” and “pairs” can be composition-dependent whereas the Gibbs energies of

“end members” in the CEF are not. All models with the point approximation are special cases
of the CEF.

 

 

 

Configurational
entropy Sublattices used Constituents Excess Model
Point No Elements No Ideal substitutional
Yes Regular substitutional
Species No Ideal (gas)
Yes Real gas or associate
Yes Elements No BWG
Yes Sublattice model
Species No Ideal CEF
Yes CEF
Pair No Pairs No Quasi-chemical
Yes Modified quasi-chemical
Complex Yes Clusters No cVM
Yes Calphad CVM

 

 

limited to the point approximation of the configurational entropy BWG models. A possible
classification of the different models, following Sundman (1990), is shown in Table 5.1.
Of course, all models are special cases of the Ising model (Ising 1925).

Adjustable parameters in the models

The models and formalisms described in this chapter usually contain many more adjustable
parameters than can be fitted with the available experimental values. This problem will
be discussed several times in chapter 6. It is important to understand that the most critical
parameters to be optimized are not those in the excess model, but those in the surface of
reference part, “'G,,. When a phase is modeled with associates or with sublattices there
are parameters, such as °G¥texsn or °GRixe, in the surface of reference energy that must be
fitted to experimental information. Since these parameters are multiplied by the lowest
power of the fractions, they will have a larger influence on the behavior of the Gibbs
energy than will any excess parameter. All parameters in ‘"G,, must be referred to the
reference state of the elements, but, if they describe compounds inside the composition
range of the phase, the Kopp—Neumann rule, see section 5.2.3, is often used in addition to
an adjustable enthalpy and entropy term. One must never set an end-member parameter
equal to zero.

In fitting a thermodynamic model to experimental values, the final value of each
adjustable coefficient depends on many of the different measurements and each measured
value contributes to many of the coefficients. The advantage of the least-squares method
is that these influences do not need to be known quantitatively, since the strategy of the
method itself is to select the best possible agreement among all the coefficients and all the
experimental values. Many of the parameters and coefficients of the models, however, are
not able to improve the fit between descriptions and measurements significantly. Using

===========
5.11.2

5.11.3

5.11 Final remarks 159

them in an excessive manner may lead the calculation to follow just the scatter of the
experimental values, creating maxima and minima where a smooth line is physically more
probable.

To judge whether a certain coefficient is well defined by the available set of measured
values, the effect of each coefficient on the shape of calculated curves should be known
at least qualitatively. It must be determined for each coefficient whether its influence
on the shape of calculated functions really is necessary to improve the fit between
calculation results and the experimental dataset. In the case studies in chapter 9 this check
is described. If it is difficult to find enough arguments in a given case, the least-squares
method should be applied twice, with and without the coefficient. Comparing the two
results makes a decision possible in most cases. It is better to start a calculation with
fewer coefficients than with some unnecessary ones. A systematic misfit between some
series of experimental points and the corresponding calculated curve usually giv
hints regarding what parameter or coefficient should be added.

es some

 

Models, formalisms, and curve-fitting formulae

In real phases a lot of features of the models described in this chapter may be more or less
redundant. Then the “general model” becomes a “formalism,” which is used to describe
the Gibbs energy of the phase by application of a “particular model.”

Using a formalism like the CEF, one may have many more parameters than necessary
to fit the available data. One may then be forced to use some parameters purely for “curve
fitting” of the experimental data, since it is not possible to relate their values to measured
quantities.

Curve fitting normally means that a set of data is fitted to a mathematical function,
ignoring any underlying physical or chemical relations. This can be the case also for
thermodynamic modeling when just a single property is fitted. For example, if a phase
diagram is fitted without using any thermochemical information, it is most unlikely that
the enthalpies and entropies obtained from such an assessment will be realistic. It is
mandatory to use all possible thermochemical information, even estimated values, to
obtain realistic values also of the separate thermodynamic properties of a system, i.e., for
the enthalpy, entropy, and heat capacity. In addition, one must take care that the model
parameters for a phase do not predict unrealistic values outside the range of stability of
the phase. However, the question of what is unrealistic is sometimes debatable.

The lack of data is usually the main reason for using “curve fitting,” since it might
not be possible to relate the model parameters to more than a single measured quantity.

Limitations in the models

Almost all models in commercial thermodynamic databases available today use the ideal
(point) configurational entropy. This is sometimes a severe limitation since the SRO must
then be modeled as an excess contribution. This excess contribution may give a bad
extrapolation to higher-order systems, but the effort needed to change to the use of quasi-
chemical or CVM-based models is considerable because the number of clusters increases

===========
160

Models for the Gibbs energy

exponentially with the number of components. Another problem with these models is
that one cannot just put a number of assessed systems together and extrapolate to a
higher-order system. One must add the necessary pairs or clusters for all combinations
of elements and calculate or estimate energies for these. Methods intended to simplify
the CVM by using fewer clusters, like the CSA (Oates and Wenzl 1996), may resolve
some of these problems, but any general change of model requires that all systems in the
databases today be reassessed. Thus one should be careful in selecting any new model to
be of general use.

 

Many simplifications in the modeling of the crystal structure may be necessary in
order to limit the model parameters, in particular when there is little or no experimental
information about the occupancies of the constituents in the sublattices. Even with very
good information about this, one must have a lot of thermodynamic information, either
experimental or from ab initio calculations.
