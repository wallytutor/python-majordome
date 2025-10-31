3

First principles and
thermodynamic properties

‘Viewing thermodynamics with an insight into statistical mechanics freed scientists from
the empiricism of the nineteenth century (Callen 1985), and extending this insight to
quantum-mechanical calculations of electronic structures, which has been enormously
enhanced in the last 20 years, has made possible the contemporary integrated view of
materials’ properties.

In chapter 2 the thermodynamic state functions and crystallography were said to be
related. If one considers the electronic structure, a straightforward link is made, since the
crystal structure at T = 0, for a given set of atoms at constant pressure p, is the one for
which the enthalpy H, H = U + PV, has a minimum.

It is appealing to unify knowledge, and one can start with unities, 1~Ry/atom =
1.32kJ mol”!, LeV/atom = 96kJ mol”! and the internal energy U at T = 0 is usually
called the total energy, E,,.1-
quantum-mechanical calculations and their development should help assessors to envisage
how thermodynamic knowledge can be enhanced by using state-of-the-art first-principles
(ab initio) results.

Suppose that one could calculate quantities like the energy U (Table 2.1) per cell of
volume V = (V.,,,) for a given crystal, just using a purely quantum-mechanical approach.
One could use equations like (2.12) for the U calculated from first principles and obtain
two other fundamental quantities:

by the electronic-structure community. Learning about these

 

energy U=UV)
(a
pressure r=-(S G1)
bulk modulus «=—v (24 )
wv?

These would be impressive and useful since the volume and bulk modulus could then
be predicted for any material. But are these calculations possible? These quantities can
nowadays truly be calculated for a crystal frozen at T = 0, specifying only Z, (atomic
numbers) and r; (atomic coordinates like the ones in Table 2.3), without any adjustable
parameters (Hafner er al. 2006).

This is made possible by using the density-functional theory (DFT) (for which the 1998
Nobel Prize was awarded) together with the local spin-density approximation (LSDA)
formulated by Kohn and co-workers in the mid 1960s (Kohn and Sham 1965). (For a

47

===========
48

3.1

3.1.1

First principles and thermodynamic properties

tutorial approach, see the books by Martin (2004), Pettifor (1996), and Pisani (2000), and
also the report from the 5th Ringberg workshop (Turchi et al. 2007).)

But are these calculated values predictive? To test whether they are, one can calculate,
for example, the equilibrium volume, V°, where U is minimum or p = 0 or « at zero
pressure for the crystal structure of interest. Since these quantities are experimentally
observable, one can extrapolate the measured values to T = 0 and compare the results
with the values predicted by the theory. In many cases these predictions obtained using
DFT are surprisingly good; surprisingly, because the theoretical approach used is, in
principle, very simple, as one can see in the next sections.

The density-functional theory (DFT) and its approximations

To treat a set of atoms with quantum mechanics requires one to solve the Schrédinger
equation for many atoms, Eq. (3.2), which means calculating the kinetic and potential
energies (Hamiltonian) for all of them, and they are many (of the order of the Avogadro
number). Simplifications can be made in order to solve the problem, for example, treating
the dynamics of the electrons decoupled from the dynamics of the nuclei, as the adiabatic
approximation does; but the many-body problem still remains. We have

 

 

he he 1 ZZ.
- W+VQa RyRy. Ry) — V+ 5 oS | Wev
( 2m Ne Bi Roe Bu) 29g 789 Xe, a

(3.2)

where W = W(x,23. 0s tye Ry, Raves Ry):

The Hohenberg-Kohn theorems

It was the ideas of the creators of DFT and subsequent approximations that made the
situation treatable because they reformulated the problem.

The first step was to state (and prove) that “for any system of electrons in an external
potential V.,,(r) (from the nuclei), that potential is determined uniquely, except for a
constant, by the ground-state density n(r) (r is a point in the space).”

Another statement was “a universal functional for the energy E(n) of the density
n(r) can be defined for all electron systems. The exact ground-state energy is the global
minimum for a given V,,,(r), and the density n(r) which minimizes this functional is the
exact ground-state density.”

With this, one concludes that the functional E(n) alone is sufficient to determine
the ground-state energy and the density. However, this exact functional is unknown!
Furthermore, there was no hint regarding how to obtain it. Later there appeared the
Kohn-Sham Ansatz that showed how to get it.

The Kohn-Sham Ansatz

The Kohn-Sham (K-S) approach simplifies the problem in a very clever way: instead of
having to work with the complicated Hamiltonian, they defined an effective simpler one,

===========
3.1 The DFT and its approximations 49

for non-interacting electrons, which were assumed to have the same density as that in the
real system:

wo,
(- FP Mesto Ri Re . -Ra)) iy, Ry Roy e+ Ry) = PCM, Ris Roy «Ry,

(3.3)

The K-S equations are Schrédinger-like equations, and they are much simpler to
solve, because the effective potential V depends on the coordinates of only one electron.
According to the first Hohenberg—Kohn theorem (Hohenberg and Kohn 1964), it is a
unique function of the electron density because neither the potential nor the density is
known in advance. The K-S equations are solved iteratively, starting with some reasonable
guess for the charge density (which is often taken as a superposition of atomic charge
densities), see Fig. 3.1. The second Hohenberg—Kohn theorem ensures that the converged
solution corresponds to the charge density in the ground state. The total energy of the
system is a unique functional of the density:

n(r)n(r’)

\r-r'|

Eqn) = Tila] for Vegleyn(e) + ff aBra’r’ +Ey +E ln). (G44)

There are various ways to solve these equations numerically and there are several
methods to handle the problem. There are specific computational techniques and they are
implemented in various software codes. Each different way to solve the problem has its
particular advantages and disadvantages, but the important fact is that one needs to know
what each code is calculating and to have complete control of the results and knowledge

 

? Starting wave functions

{

p Starting density

{

y”, & Solve Kohn—Sham equations

|

Calculate new charge density

t

Yes |e Converged? — No

 

 

 

 

 

 

 

 

 

 

 

 

 

 

Calculate total energy, etc.

 

 

 

Figure 3.1 The DFT method, showing the Kohn-Sham routine for solving the Schrédinger
equation for one effective electron.

===========
50 First principles and thermodynamic properties

in mind, one should be careful

 

of how to interpret them (Turchi er al. 2007). Bearing this
when analyzing DFT results.

3.2 The DFT results at OK

There are cases for which the theory gives wrong predictions. For example, within the
DFT-L(S)DA (local (spin-) density approximation) bec Fe is unstable, and even with the
best LDA, germanium is a metal. For the Fe case, use of the so-called generalized gradient
approximation (GGA) (Martin 2004) cures the problem. But it seems that there is no help
to be obtained from the LDA/GGA for solving the band-gap problem in semiconductors
and in this case an approach that goes beyond the DFT is being developed, see Fig. 3.2.

 

 

 

 

 

 

 

 

 

 

 

ZR,
Theory: DFT
Approximations: LDA/GGA
Limitations:
Methods for ionic cores: (a) 100 to 1000 atoms
(b) large computational
(a) all electrons: demand
FLAPW (wien2k, etc.), (c) T=0
PL-LMTO (Methfessel, etc.)
(b) pseudopotential approximation:
plane-wave (abinit, CASTEP,
DACAPO, VASP, etc.),
numerical/iocal (SIESTA, etc.)

 

 

 

Calculates:

Lattice parameters, total energies, density of states, forces, bulk modulus,
surface energies, etc.

 

 

Assessment of predictions:

Calculated values should be checked with experimental results extrapolated
to T=0. They scatter like experimental values, depending on approximations
and method used. It does not work for strongly correlated systems.

 

 

 

Figure 3.2 A schematical view of the first-principles (or ab initio) approach without fitting
parameters: theory, approximation methods, results, and limitations. The items in parentheses are
some of the codes related to the methods.

===========
3.2 The DFT results at OK 51

 

 

 

 

@ B32
-20 @u, Lio
e 4 @ C2im
< Mee
2
240 Qe Sto é
& ~ &
£ e
e
-60 a2 a
o «
cry
80 T T T T T T T T T
se Ti v cro Mn Fe = oN

Figure 3.3 Total energies for a number of ordered aluminides calculated from first principles by
various authors using various methods. Courtesy of Catherine Colinet.

The good results obtained with the GGA for Fe cannot be used as an argument that
the GGA is better than the LDA in all cases. For example, the GGA is known to provide
better calculated lattice parameters for solids than does the LDA, and as a consequence it
gives better descriptions of the bulk properties. However, the predictions of the GGA for
the estimation of the surface properties are still under discussion. With much experience
having been accumulated by scientists after many calculations using DFT in different
approximations in recent years, some insight has been obtained into the question of for
which quantities each approximation works best.

In Fig. 3.3, total energies for a number of ordered aluminides calculated by various
authors using different methods are plotted in order to give a feeling for the magnitude of
the scatter of the calculated values. One can easily conclude that first-principles results
scatter in a very similar way to experimental data. It is, then, of fundamental importance
to evaluate those results. The best way to do this is to have an expert in these techniques
to help in the evaluation.

Excellent combinations of results from experiments and DFT calculations are given in
papers by Ghosh and Asta (2005) and Ghosh et al. (2006). In the former they investigate
the phase stability, phase transformations, and elastic properties of a phase, Cu,Sn;,
relevant for lead-free solders and in the latter they study ordering in Ti—Zn alloys. The
way they present the theoretical results can be used as standard for publications of the
same type. All values are listed in tables, LDA and GGA results for formation energies
and lattice constants are compared with each other and with experimental results in a very
detailed way; for instance, reported atomic positions are compared with the experimental
ones obtained from X-ray diffractometry. Their paper demonstrates that the DFT results
can be quickly validated by a few experiments using the techniques described in the next
chapter.

===========
52

3.2.1

 

 

 

 

 

 

 

First principles and thermodynamic properties
2200 2200
liquid

2000 2000
_ liquid a
< 1800 ¥ 1800 4pdo
® 2 fee
2 1600 bec |Z 1600
g 8
E 1400 fcc & 1400
e Fe

1200 1200 {| A1S

Liz
1000 1000
0 02 04 06 08 10 ZY 0 02 04 06 08 1.0
Mole fraction Cr Mole fraction Pt
(a) (b)

Figure 3.4 Extrapolations of the liquid-fce solubility curves for Cr-Ni and Cr-Pt (dashed lines)
must end at the same melting temperature of metastable Cr. This point is marked with 0 on the
temperature axis.

Calphad enthalpy estimates at 0K

The stabilities of elements in the various types of lattices are needed in the Calphad
technique. In the book by Kaufman and Bernstein (1970) a combination of first-principles
data and extrapolation techniques is used to estimate these “lattice stabilities.” In most
cases these were obtained from estimates of the entropy of melting and of the melting
point for the metastable phase. The latter could sometimes be estimated from phase
diagrams, for example, for fec Cr, from phase diagrams with high solubility of fee Cr. In
Fig. 3.4 this extrapolation is shown by dashed lines in the phase diagrams calculated for
Cr-Ni by Lee (1992) and for Cr-Pt by P.J. Spencer (unpublished work, 1988).

This gives the following Gibbs energy for the fee and bee phases for pure Cr relative
to the liquid:

Get — ghee = aston — 7) (3.5)

 

Ghd Glee = ashitp _ py (3.6)
where AS, is the entropy of melting and 7, is the melting temperature. Subtracting
Eq. (3.6) from Eg. (3.5) gives the Gibbs-energy difference between fcc and bec and,
assuming that the heat capacity is the same for both phases, an estimate of the enthalpy
difference between the two phases at 0K, AH, can be obtained:

GES — RS = (ash TS — ash TS) + (ash! — ashy en
AHG? = Ast! TP — ast! TR (3.8)
A calculation of lattice stabilities for transition-metal elements done by Skriver

(1985) gave very different values of the enthalpies at OK for some of the elements
and this led to severe criticism of the Calphad lattice stabilities. Later it was shown

===========
3.3

3.3.1

3.3.2

3.3 Going to higher temperatures 53

that the enthalpy of fec Cr is in fact impossible to calculate by ab initio meth-
ods because the lattice is dynamically unstable and transforms to a bec lattice by
the well-known Bain transformation (Bain 1924). The Calphad lattice stabilities have
recently been reviewed by Pettifor (2003) and Sluiter (2006) and the Calphad values
for fec Cr are now generally accepted, as long as the fec phase is dynamically stable
(Turchi er al. 2007).

Similar problems with dynamically unstable lattices still occur in ab initio calculations
of more complicated lattices in binary and higher-order systems. The relaxed lattice must
be identified carefully.

Going to higher temperatures, adding the statistics

Quantum molecular dynamics and Monte Carlo simulations

The theory and results discussed thus far are for T = 0. In order to have predictions using
DFT for the effects of the temperature, the elegant quantum molecular dynamics (QMD)
approach of Car and Parrinello (1985) is being developed. This technique allows one to
calculate melting temperatures. It has been applied for some elements, for example C,
for which the pressure versus temperature phase diagram was obtained (Grumbach and
Martin 1996).

Monte Carlo simulations can also be coupled to first-principles methods, but they are
more applicable to gases or isolated atoms. However, some progress has been achieved
also for solids.

The cluster-expansion method, plus a CVM or plus Monte Carlo:
the so-called first-principles phase diagrams

Another way to get the statistics for obtaining properties at higher temperatures is to use
the technique called cluster expansion (Connolly and Williams 1983, Sanchez et al. 1984,
Zunger et al. 1990). In this method, starting from the total energies, the configuration
and interactions are decoupled and configuration-dependent quantities are expanded in
clusters. Normally the cluster energies decrease rapidly with size and only a few are
needed, but sometimes very large clusters are needed (Zarkevich and Johnsson 2004).
After this step, two routes can be used to obtain the statistics: a cluster-variation method
(CVM), whereby the configuration entropy is obtained as a function of composition and
temperature; or a Monte Carlo simulation whereby it can also be calculated. From these
quantities the phase diagram can be calculated. Figure 3.5 shows schematically the three
steps for obtaining a first-principles phase diagram.

An example of this method applied to a ternary system is given by Lechermann et al.
(2005). The mapping of bondings for the pure elements Al, Fe, and Ni calculated by the
same authors is shown in Fig. 3.6.

Cluster expansion coupled to a CVM has been reviewed by Colinet (2002). An example
of its use with Monte Carlo simulation is given in Tepesch et al. (1998).

===========
54

3.3.3

First principles and thermodynamic properties

1. T=0 Electronic structure

Density-functional theory
Effective single-particle (K-S)
Structural relaxation
Phonon spectrum, if possible
Fe Ni

2. T=0 Lattice Hamiltonian

Cluster expansion
Decoupling configuration and interaction
Expanding configuration-dependent quantities
in clusters

Arbitrary configuration

Given lattice parent

3. T#0 Statistical Mechanics

Cluster-variation method (CVM)
Generalized mean-field approach
Configuration entropy

Metastable states

Fe Ni

Figure 3.5 A schematic view of a method by which to obtain a first-principles phase diagram.
Courtesy of Frank Lechermann.

First-principles-enhanced Calphad extrapolations of fcc and bcc
with ordering for the Al-Fe-Ni ternary system

Calphad extrapolations from binary subsystems to ternary systems require descriptions of
metastable phases, which, in the case of the binary subsystems of the Al-Fe—Ni system
(for Al-Fe by Seiersten and Tibballs (1993), Fig. 6.5, for AI-Ni by Ansara et al. (1997b),
Fig. 9.16(a), and for Fe-Ni by A. T. Dinsdale and T. G. Chart (unpublished work, 1986)
and I. Ansara (unpublished work, 1995), in Fig. 5.4(b) later) were not particularly well
described in the initial Calphad assessments.

Later the metastable extension of the fec phase in AI-Ni was assessed, see Fig. 9.16(b),
as well as the metastable extension of the fec ordering in Al-Fe and the metastable
bee ordering in Fe—Ni. In the assessment of the metastable phases ab initio calculations
of energies of the ordered phases were used and the reciprocal parameter according to
Eq. (5.151) was included to describe the short-range order.

===========
3.3 Going to higher temperatures 55

 

fee-Ni bec-Fe fec-Al

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

  

Figure 3.6 The bondings for Al, Fe, and Ni calculated in the plane indicated in the cells.
Courtesy of Frank Lechermann.

From the metastable extensions of the binary phases one can extrapolate more reliably
into the ternary system, using the four-sublattice CEF model as explained in section 5.8.4.4
for the ordered fcc phase and a two-sublattice model for the ordered bee as described in
section 5.8.2.4. The Gibbs energies of the ternary tetrahedra in the fec model representing
the ordered compounds Al,FeNi, AlFe,Ni, and AlFeNi, can initially be estimated from
the binary bond energies Uajp.. Uaiyj- ANd Mp.y; and the numbers of bonds of each type as

°Gatcatzeni = 2H ani + 20 autre + Meni
°Garrereni = Mani t are + 2ttpeni (3.9)
°C pureaniens = 22 ani + Matte + 20 pei

The notation for the parameters is explained in chapter 5. Altogether this gives a
dataset, from which the isothermal ternary phase diagram at 1023 K shown in Fig. 3.7(a)
was calculated by B. Sundman (unpublished work, 2003). It can be compared with the
phase diagram in Fig. 3.7(b), which was constructed from experimental data by Bradley
(1951).

The Al-Fe-Ni phase diagram calculated at 1250 K by Lechermann et al. (2005) using
only ab initio results as described in section 3.3.2 is shown in Fig. 3.7(c).

These calculations illustrate that skilled use of first-principles results for modeling
metastable regions can make Calphad extrapolations more realistic and that these extrapo-
lations can, inversely, give feedback to the first-principles diagrams when cluster expan-
sion is used because a Calphad assessment can provide extrapolations into metastable
regions whereas experimental data are usually scattered and limited to the stable range
of the phases as in Fig. 3.7(b).

===========
56

First principles and thermodynamic properties

 

04 06
Mole fraction Al

08

 

Calculated extrapolation from the
assessed binary Al-Fe, Al-Ni, and
Fe-Ni systems into the ternary sys-
tem at 1023K. The miscibility gap
between the A2 and B2 phases and
the direction of the Ll) phase are
correctly predicted in comparison
with the phase diagram in (b) con-
structed from experimental data,
even though the stability of Ll, is
overestimated. The high-Al corner

   

has not been calculated.

The Al-Fe-Ni phase diagram at
1023K constructed from experi-
mental data by Bradley (1951).
Reprinted with permission from the
Institute of Materials, Minerals and
Mining.

An ab initio prediction of the Al
Fe-Ni phase diagram at 1250K.
Reprinted from Lecherman et al.
(2005). Copyright 2005, with per-
mission from Elsevier.

Figure 3.7 Isothermal sections of Al-Fe-Ni obtained with different techniques.

===========
3.3.4

3.4

3.4 Final remarks 57

Electronic-structure calculations for ordered and disordered
systems based on the CPA approach

In contrast to the methods quoted above, the method based on perturbation theory performs
configurational averaging analytically. One of the most well-known approximations in
alloy theory is the coherent-potential approximation (CPA), which was recently reviewed
in the context of Calphad by Turchi et al. (2007).

Final remarks

In the next chapters the connections between Calphad and the DFT results will be
emphasized as much as possible. It is clear that further development will bring the
theoretical results closer and closer to reality. Combining the calculated results with
experimental data using empirical methods like Calphad will give important feedback
and point out the good and bad trends of the theoretical predictions, at the same time as
providing better predictions for thermodynamic applications.

Thermodynamic functions and phase diagrams calculated from first-principles data
usually show correct trends and topology when compared with experimental data,
but the calculated values are often far from the accuracy needed by scientific or
industrial applications. The Calphad method provides the means to combine the
first-principles calculations with experiments using models with adjustable parame-
ters to reach the required accuracy for applications. At the same time the thermody-
namic models and their extrapolations to metastable states are improved, as shown in
section 3.3.3.

When publishing a paper including first-principles calculations, one should always
compare the results with results from calculations done by other scientists and with
experimental data.

Some years ago first-principles results were described as a kind of caricature of reality.
Nowadays, even though the methods being used are much better, one has the impression
that the picture the theoreticians are trying to paint has no contact with reality. If all
the known experimental data for a system are compiled and checked for consistency
according to Calphad methods, this is a clear image of reality. What one can then expect
the theoreticians to achieve is that, when painting that image, the picture will be able
to talk.
