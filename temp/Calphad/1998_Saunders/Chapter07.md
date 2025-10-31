Chapter 7
Ordering Models

7.1, INTRODUCTION

In most phase-diagram calculations there is a tendency for different phases to be
characterised thermodynamically using separate models, irrespective of their
crystal structure. However, in systems where the structures of several phases have
common symmetry elements and similar bonding, it is possible to describe the
system using an ordering model which integrates the descriptions of the various
phases into a single modelling entity. By doing this it is also possible to both reduce
the number the parameters used to characterise the system and give these terms a
sounder physical meaning. Although the mathematical procedures are inherently
simple, the number of computational steps for any rigorous treatment tends to rise
geometrically with the number of possible ordered configurations. This imposes a
high penalty when such ordering calculations are incorporated into phase-diagram
calculations. In addition, the coupling of parameters in various phases can reduce
the degree of freedom with which particular phase boundaries can be described.

A number of different approaches have been adopted for the description of
ordered systems. One route is to start with a fundamental description of bonding
and crystallography, establish the ordering energy of various phases at 0 K and then
add suitable expressions for the structural entropy. The second route is to start with
a description of the high-temperature disordered phase and derive expressions for
the ordering energy, which is then added to derive the properties of the ordered
phase(s). Each route can then be subdivided according to the level of approximation
used and the desired restraints on the computing time involved. Before beginning a
detailed examination of ordering treatments it is useful to make a number of critical
definitions.

7.1.1 Definition of long-range order

A structure can be defined as possessing long-range order if at least two sets of
positions can be distinguished by a different average occupation. These classes are
usually called sub-lattices. The simplest example of an order/disorder transformation
occurring in a b.c.c, lattice may be described in terms of two interpenetrating simple
cubic arrays. If the occupation probability of each species is the same on both sub-
lattices, then this is equivalent to a fully disordered b.c.c. structure, A2 (Fig. 7.1).

181

===========
182 N. Saunders and A. P. Miodownik

 

Figure 7.1. Relative occupation of sub-lattices for the A2, B2 and DO3 variants
of a basic body-centred cubic arrangement from Inden (1982).

By contrast, if the two sub-lattices are totally occupied by different species the struc-
ture exhibits full long-range order, (/ro). In the binary case, and for the equiatomic
composition, this is then represented by a separate symbol, B2 (Fig. 7.1). Between
0 K and the ordering temperature (T°) there is a finite degree of order expressed
in terms of the occupation probabilities (rn) of the two sub-lattices a and 3

m= ay af. (7)

In the case of a binary alloy containing only A and B atoms there is no need to use
a subscript notation; x; becomes the number of A atoms and n; = 4 = 7). Then for
ab.c.c, lattice containing N atoms, the degree of /ro can then be defined by letting
the number of A atoms on a sites be (1 + )N/4. All possible states of /ro are then
represented as 7) ranges from 0 to +1. With 7 = 0 the lattice is disordered, while for
a degree of order 7, the concentrations on the two sub-lattices are c = (1 + 7)/2
and (1 — c) = (1 — 7)/2 respectively. The entropy can then be derived as

samp) me (2) (Gt) (S)] 09

and minimising the Gibbs energy with respect to (7) then provides the following
relationship at high temperatures:

kel (: + a)
= — 7.3)
1° Waa + Van — 2Vap) © \I =n, (73)

where z is the nearest-neighbour co-ordination number.

7.1.2 Definition of short-range order
By definition, iro falls to zero at T°'4, but it is still possible for there to be local

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 183

short-range-ordered (sro) configurations above T°". This can be expressed math-
ematically in terms of the two-point correlation function of adjacent atoms, or in
terms of the pair probability (¢*) of having an A atom at site m relative toa B atom
at site n. It is common practice to use a short-range-order parameter (a) which is
defined in such a way that it can be directly correlated with experimental X-ray
information such as the Warren—Cowley coefficients (Ducastelle 1991)

(S ea

LALB.

 

 

Ordering of unlike atoms corresponds to negative values of a where (* > r42p,
while ¢* < x4zg and positive values of a correspond to the clustering of like
atoms. When ¢* = x4ag, a is zero and the solution is perfectly random.

7.1.3 Magnetic ordering vs structural ordering

If magnetic behaviour is treated entirely in terms of localised spins, it is possible to
use the same formalism as for configurational ordering and also treat mixtures of
the two types of ordering. In the Ising model (Ducastelle 1991) a magnetic moment
is assumed to have only two orientations in a given direction at each site and a
simple nearest-neighbour coupling is then introduced so that parallel pairs have an
energy —J, while anti-parallel pairs have an energy +J.

Even by using such simple assumptions, it is only possible to obtain exact
solutions for a limited number of cases. In fact such assumptions are not necessarily
well suited for real magnetic systems, because moments are vectors and not two-
valued quantities. In many metallic alloys the magnetic moments exhibit non-
integral values and are also extremely sensitive to atomic volume. In general it is
therefore difficult to produce a rigorous treatment of magnetic order and extend it
into a multi-component system. The two major approaches that are used in practice
either assume a simplified spin state for each magnetic species, or alternatively
describe magnetic order by an empirical treatment of the associated changes in
specific heat. The magnitude of the Gibbs energy change associated with magnetic
ordering can be surprisingly large and incorporation of the magnetic Gibbs energy
is therefore very important, especially in ferrous alloys (see Chapter 8). This means
that residual short-range magnetic ordering above the critical temperature can also
provide a significant Gibbs energy contribution. The interplay of chemical and
magnetic ordering is left to a later section.

7.1.4 Continuous vs discontinuous ordering
In alloys, structural ordering transformations can proceed with either a continuous
or discontinuous change in entropy at the transformation temperature, while in

===========
184 N. Saunders and A. P. Miodownik

unary systems, magnetic ordering is always associated with a continuous, second-
order transformation. However, a rigid separation into first- and second-order
transformations is not always practical, as the two types of transformation can
merge in binary and higher-order systems, depending on the precise variation of the
Gibbs energy curves with temperature and composition (Inden 1981a).

7.2. GENERAL PRINCIPLES OF ORDERING MODELS

7.2.1 Interaction parameters

All ordering models, whether simple or complex, require the input of suitable
interaction parameters for each set of nearest neighbours, which create a hierarchy
of terms for each crystal structure. This is frequently truncated to first- and second-
nearest neighbours, but an increasing number of nearest neighbours need to be used
as the symmetry of a given structure decreases. A more important issue is whether
central or point interactions, no matter how far they extend from the point of refer-
ence, need to be expanded to include interactions between atoms in a group or
cluster. This marks the essential difference between the treatment by Bragg and
Williams (1934, 1935a, 1935b), also derived by Gorsky (1928) and generally known
as the BWG treatment, and the more sophisticated cluster variation method (CVM)
proposed by Kikuchi (1951).

Although the formal treatment of CVM includes pairs and triplets, the most
popular cluster is the tetrahedron (Fig. 7.2a). It is possible to consider larger clusters
of atoms (Fig. 7.2b) as well as taking into account as many nearest-neighbour
interactions as desired. In the case of the b.c.c. lattice, the basic tetrahedral cluster
conveniently takes into account second-nearest neighbours. The utilisation of more
complex clusters is only curtailed by the inevitable increase in computing time.
Effective cluster interaction (ECI) parameters can be derived using methods dev-
eloped by Connolly and Williams (1983). This leads to a set of composition-
independent parameters from which the energy of a set of related structures based
on some basic symmetry such as the f.c.c. or b.c.c. lattice can be reproduced. More
recently this has been extended by Lu et al. (1991) to make the ECIs more
independent of the initial choice of basic symmetries. Most models yield the same
enthalpy at 0 K and the same entropy at T' = co, so the crucial point of interest is
the change in properties such as G or Cy in the vicinity of T°“, Differences
between the models then arise from the permitted degrees of freedom when moving
from a condition of full order to one of complete randomness (Fig. 7.3a).

7.2.2 Hierarchy of ordering models
Given a finite time for a given calculation, it is unrealistic to take into account all
possible atomic configurations. It is, however, possible to consider the smaller

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 185

(a)

 

(b)

 

Figure 7.2. Typical clusters used in CVM calculations. (a) Tetrahedral (4-point)

and (b) cube-octahedral (13-point) clusters for an f..c. lattice, (c) the irregular

tetrahedral cluster used in b.c.c. lattices (adapted from Fine! 1994 and Inden and
Pitsch 1991).

number of degrees of freedom associated with a more limited region of space (e.g.,
a suitable cluster of atoms) and then use a mean field approximation for any inter-
action with other (similar) regions. The Monte Carlo method (MC) is assumed to

===========
186 N. Saunders and A. P. Miodownik

— — — — THE BW APPROXIMATION
— ——— THE PAIR APPROXIMATION
THE TETRAHEDRON APPROXIMATION

— ++ — THE POSITION OF THE BEST ESTIMATE
(a) OF THE CRITICAL POINT

        
 

Lalo)
os
N\
=

   

(NS

tak Tle

SHORT-RANGE ORDER PARAMETER

 

 

REDUCED TEMPERATURE, T/T,

Figure 7.3. Variation of short-range order (sro) (a) in an f.c.c. lattice above the

critical temperature, as evidenced by the specific heat predicted by various

ordering models (Kikuchi 1977) and (b) sro characteristics for b.c.c. and f.c.c.
structures at the equiatomic composition (Kikuchi and Saito 1974).

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 187

yield the closest approximation to reality, as it effectively takes into account the
largest number of neighbours (Binder 1986). It is therefore considered the standard
against which the results of other more approximate treatments can be measured.
By contrast, the BWG treatment only deals with the statistically averaged occupation
probabilities on different sub-lattices. As this specifically excludes any correlation
between atoms in local clusters, this makes the BWG treatment incapable of
handling any form of sro, which is particularly important above T*"4.

In between these extremes lie a large number of CVM treatments which use
combinations of different cluster sizes. The early treatment of Bethe (1935) used a
pair approximation (i.e., a two-atom cluster), but this cluster size is insufficient to
deal with frustration effects or when next-nearest neighbours play a significant role
(Inden and Pitsch 1991). A four-atom (tetrahedral) cluster is theoretically the mini-
mum requirement for an f.c.c. lattice, but clusters of 13-14 atoms have been used
by de Fontaine (1979, 1994) (Fig. 7.2b). However, since a comprehensive treatment
for an [n]-member cluster should include the effect of all the component smaller
(n—1, n—2...) units, there is a marked increase in computing time with cluster
size. Several approximations have been made in order to circumvent this problem.

Oates and Wenzl (1996) have proposed a cluster-site approximation (CSA) that
gives a two-term entropy by restricting the way tetrahedra are allowed to mix and
neglecting the effects of the subsidiary pair interactions. Their approach is math-
ematically related to an earlier quasi-chemical model used by Guggenheim (1935).
Various interpretations exist of both the quasi-chemical and CSA approaches, but
they can all be considered part of the spectrum of approximate treatments that come
under the umbrella of a total CVM hierarchy (Kikuchi and Saito 1974). The accuracy
of the various approaches can vary depending on the level of approximation, and it
is interesting to compare predictions for the critical temperature, as defined by the
maximum rate of change of ordering with temperature, using the BWG and various
CVM models. This is shown in Table 7.1 where the critical temperatures were
calculated using a single set of model-independent interaction energies and a
simple spin-up/spin-down f.c.c. Ising model.

All the models converge at very low and very high temperatures but, because
they take into account varying degrees of short-range order, they give a different
Table 7.1. Ratio of the critical temperature calculated for an f.c.c. Ising lattice by different methods,
we only constant nearest-neighbour interactions and using MC as the standard (after Kikuchi

BWG 1.23

Pair 113
CSA 1.10
Tetrahedron 1.024
Octahedron+tetrahedron 1.022
Oct + double tetrahedron 1.017

Monte Carlo (‘Exact’) 1.000

===========
188 N. Saunders and A. P. Miodownik

value of critical temperature. The exact variation in thermodynamic properties as a
function of temperature will depend on the specific crystal structure, but the general
effect is well illustrated in Fig. 7.3(a) and Table 7.1.

This makes it clear why the tetrahedron approximation is so popular, but it should
be noted that the ratios in Table 7.1 were obtained by considering only nearest-
neighbour interactions. Because a higher accuracy is usually associated with longer
computational times, it is important to establish the degree of approximation that
can be safely used in particular circumstances. This requires considerable judge-
ment, as it will also depend on the bonding features of the particular alloy system
and whether longer range forces are important. The main ordering models will now
be considered in greater detail.

7.3. FEATURES OF VARIOUS ORDERING MODELS

7.3.1 The Monte Carlo method

The Monte Carlo (MC) method has been well documented by Binder (1986) and
Inden and Pitsch (1991). Average thermodynamic properties are calculated for a
series of finite three-dimensional arrays of increasing size and the results extrap-
olated to an infinitely large array. The effect of changing the occupancy of a
particular site, on the change in energy of the whole system, is tested systematically
and the occupancy changed or retained according to an algorithm which represents
the effect of temperature.

However, it should be noted that this method is as dependent on the availability
of suitable interaction parameters as any of the other more approximate methods.
Moreover, even relatively small arrays require large amounts of computing time.
For instance, it is possible to handle arrays of 10* to 10° sites but the typical
numbers of MC steps required to reach equilibrium can be as high as 10° to 10*
per site, even for the case of a binary system. This number can be reduced by
restricting calculations to only those configurations with a relatively high prob-
ability of occurrence, but this essentially assumes prior knowledge of the end-point
configuration. A faster approximation to the MC method has been used in Pd-V
which samples only configurations on small clusters around each lattice point
(Ceder et al. 1994).

Other problems associated with the MC method have been raised by Ducastelle
(1991), who has pointed out that boundary conditions need to be specified correctly
in order to properly reflect the crystallography of the system and that it is difficult to
know whether the system has been caught in a metastable configuration. The MC
method also tends to round off critical singularities and is, therefore, not ideal for
second-order transformations. Despite all these factors, it is nonetheless accepted as
the standard against which most other methods can be judged. The lengthy computing
time has mitigated against its use as a sub-routine in more extensive phase-diagram

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 189

calculations. An alternative entropy Monte Carlo functional (EMC) has recently
been proposed, which may achieve an accuracy normally associated with MC but
with the speed of CVM (Ferreira et al. 1997).

7.3.2 The BWG approximation

The advantage of the BWG approximation is that it leads to simple associated
formulae for the heat of solution and other related properties. It can also lead to
reasonable values for the ordering energy at 0 K and its inability to deal with sro at
high temperatures is not important in that case.

7.3.2.1 BWG enthalpies. The enthalpy of formation of a random b.c.c._A2 solid
solution, AH*2, is given by Inden (1991) as



where W‘) are interaction parameters associated with, Ist, 2nd ... k-th nearest
neighbours and defined as W(*) = (Vga + Vag —2Viz) and 2(*) is the co-
ordination number of the k-th shell. For the ordered B2 structure at 0 K, and when
ip < 0.5, the corresponding expression is


General equations, including magnetic terms for various b.c.c. based structures
have been tabulated (Inden 1975a); a typical application to a non-magnetic system
is found in Inden (1975b). Analogous equations for some f.c.c. structures are given
by Inden (1977b) and their implications elaborated further by Buth and Inden
(1982). A selection is given below:

O<ap<1 AHA? = —N{zp(1 — zp) (4W + 3W)] (7.6a)
O<2p<05 AHP, = —N[re(4w +3W®) — 623,W)) (7.6b)
0< 2p < 0.25 AHRS = —Nap(4w + 3W?)) (7.6c)
O<ap S05 AHB? = —Niep(4w + 3W) — 402 Ww} (7.6d)
O<zg<1 AHA! =—N[za(1— 2p) (6W" +3W)) (7.6e)

O<S22<05 AHE, = —Ni[ze(6W + 3W) — 23(4WO + 6W)) (7.6f)
0< 2p < 0.25 AH‘, = —N[ra(6W + 3W®) — 1203,W), (7.6g)

===========
190 N. Saunders and A. P. Miodownik

While the previously mentioned B2 structure, as shown in Fig. 7.1(b), can be inter-
preted as two interpenetrating simple cubic sub-lattices (L =I, II), it is necessary to
consider four sublattices (L = I, Il, III and IV) in order to handle variants of b.c.c.
ordering such as DO; (Fig. 7.1(c)) and B32. These can be distinguished through
different combinations of the occupation probabilities (x, y, z) as defined by Inden
(1974):

t= (pytpa—pa—pa)/4 (7.7)
y= (pa —py)/2 (78)
z= (py — PA) /2. (7.9)

A combination of z = 1 with y = z = 0 corresponds to full B2 ordering, while DO;
ordering requires that y or z > 0 in addition to x > 0. B2 ordering is replaced by
B32 when W() < 1.5W@) (inden 1974) and other lattices such as F43m have
their own unique combination of site occupation probabilities (Richards and Cahn
1971, Allen and Cahn 1972, Inden and Pitsch 1991). With the assumption of
composition-independent values of W, symmetrical ground-state diagrams are
formed which indicate the relative stability of different structures as a function of
the ratio W/W) (Figs 7.4(a) and (b)). However, when the interaction energies
are determined via first principles calculations (Zunger 1993), they are usually
dependent on composition and the resultant ground-state diagrams are markedly
asymmetric (Fig. 7.4(c)). This figure also demonstrates the effect of superimposing
the ground states of different parent structures as distinct from just looking at the
derivatives of one parent structure.

7.3.2.2 Approximate derivation of Téswc). Given values of W") and W®), the
basic BWG treatment also leads to explicit equations for the ordering temperature,
T°4, but the omission of sro inevitably leads to calculated values that are
appreciably higher than shown by experiment. If the simplicity of the BWG method
is to be retained, an empirical correction factor (x) has to be included, where
x= Te /TEE Typical equations for various structural transitions are given
below:

KT5 ao = xt8(1 — zp) (BW — BW) (7.10)
KTBGo-.a2 = Xta(1 — ta) 6W) (7.11)
KTEi3 aa = Xta(1 — 2p) (AW — 6). (7.12)

Working values of x can be obtained by plotting Tgt4,, against values of Tod
obtained by more accurate approximations, e.g., CVM and MC. For b.c.c. alloys
such values have been plotted against W/W) so that an appropriate choice of
(x) can be made (Inden 1975a) (Fig. 7.5). Although inferior to more sophisticated

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 191

 

 

 

 

 

 

 

Formation Energy (meV/atom)

 

 

 

 

 

 

A 0.5 B

Figure 7.4. Ground-state diagrams for structures based‘ on the b.c.c, lattice as a

function of composition corresponding to (a) W) =2Ww?)>0, (b)

W0) = —W) > 0 (Inden and Pitsch 1991) and (c}-(e) examples from first-
principles calculations for selected systems (Zunger 1993).

Pt

treatments, this modified BWG treatment gives surprisingly good answers for many
b.c.c.-ordering systems (see later sections) but can be misleading for close-packed
systems. There is also an inherent inconsistency, in that experimental heats of
solution for the disordered phase actually include a finite degree of sro but it has to
be treated as being completely random.

7.3.2.3 Magnetic interactions in the BWG treatment. The BWG treatment has
been applied extensively to b.c.c. Fe-base alloys, but since these are magnetic it is
necessary to include some extra terms. The configurational Gibbs energy per mole
for a b.c.c. solid solution is then given by the following expression:

===========
192 N. Saunders and A. P. Miodownik
1.0 }— A2/B2. ————»!-«— 2/832 —

'
'
1
—.
+ ——F3 t=— 4. '
+ ' +
'
'

~~
0.6 | Nm

 

 

'
1
04 t
. T,C%(c=0.5) lye T,C%(c=0.5)
oz TP S(e=0.5) | T{B¥%(c=0.5)
'
1
—L_1_| .
0.4 +02 0.0 0.2 0.4 0.6 08 1.0
we) 7 wi)
Figure 7.5. Variation of the (x) factor with the W/W) ratio for b.c.c. alloys
(Inden 1975a).

GPS = G° — Naaze(4W") + 402M) + 307))
7 ; [ewe + 80?M0) — 6W)) 2? + 3WO)(a? + 2)
NET
+P Loh low. pi + pbloes ps) — Tlaza+ Axe] Sng: (7-19)

The first term in Eq. (7.13), G°, allows for any phase stability correction if one or
both of the components do not occur naturally in the b.c.c. form. The second term
represents the enthalpy of mixing, the third term gives the energy contribution due
to ordering, the fourth term gives the atomic configuration entropy, while the last
term is the contribution arising from the magnetic entropy and assumes a linear
variation of the Curie temperature, T,, with composition. Setting the coefficients a
and ( to either 1 or 0 then allows for various combinations of magnetic and non-
magnetic elements to be treated; Inden (1975a) should be consulted for a full
derivation. Obviously the equation is much simplified in the case of non-magnetic
alloys when M) and Smeg are equal to zero. M() is the magnetic interaction
energy between nearest neighbours analogous to W) and o is the magnetic
ordering parameter. Applications have been made to both binary (Inden 1977a) and
ternary systems (Inden 1979).

7.3.2.4 BWG and anti-phase boundary energies. The bond-breaking method first
described by Flinn (1960) allows an estimate to be made for the structural com-
ponent of anti-phase boundary (APB) energies. As good agreement can be obtained

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 193

between calculated and experimental APB energies in the cases of both the non-
magnetic Cu-Zn, B2 phase (Inden 1975b) and magnetic Fe-Co, B2 alloys (Inden
1977a), it would appear that the total fault energy in these cases is dominated by the
structural (chemical plus magnetic) component. For the A2/B2 case, the APB
energy is given by:


where a = the lattice spacing of the sublattice and A, k, | are the Miller indices. For
b.c.c.{110} planes the (h, k, 1) function reduces to /2. The equivalent formula for
f.c.c., L1g structures is given by

 
Inden et al. (1986) and Khachaturyan and Morris (1987) can be consulted for
equations that include longer-range terms. At least third-nearest-neighbour inter-
action energies need to be taken into account for Li, structures and, in general,
there is insufficient experimental data to derive all the necessary parameters. In
order to be able to use a BWG formalism, Miodownik and Saunders (1995)
therefore assumed a constant W)/W() ratio, based on FP calculations by Sluiter
et al. (1992), and were able to derive APB energies for multicomponent nickel-base
Ll, (7’) phases that matched experimental values. Reasonable estimates for meta-
stable ordering temperatures were also obtained by assuming a specific ratio for sro
and Iro at T°! despite the known problems of applying the BWG treatment to
close-packed phases. APB energies have also been calculated using CVM with a
combination of the tetrahedron approximation and nearest-neighbour interaction
energies for B2 (Beauchamp et al. 1992) and L12 ordered compounds (Inden et al.
1986).

7.3.3 The cluster variation method (CVM)

CVM is a more powerful formalism which can include the mutual interaction of all
the atoms in sets of clusters, so as to properly reflect a greater variety of atomic
interactions (de Fontaine 1979, 1994). The smallest cluster that should be used to
describe a three-dimensional lattice is the tetrahedron (Kikuchi 1951), but the com-
plete calculation of entropy using CVM requires a consideration of all subsidiary
clusters (van Baal 1973). This means pairs and planar triangles have to be included
for the tetrahedron approximation, and all these in turn have to be included when
larger clusters such as octahedra are considered. Various mathematical techniques

===========
194 N. Saunders and A. P. Miodownik

are available to maintain self-consistency between contiguous clusters and to avoid
double counting (Inden and Pitsch 1991, de Fontaine 1994).

CVM gained widespread acceptance when it was shown that the tetrahedron
approximation could reproduce the observed f.c.c. Cu-Au phase boundaries,
especially if asymmetric four-body interactions are included (Figs 7.6(a—b)). This
may be contrasted with the results previously obtained by the BWG method which
failed to produce even a qualitative resemblance to the observed phase diagram (Fig.
7.7). The effect of various approximations including the Monte Carlo method is
shown in Fig. 7.8(a). As might be expected, the CSA approximation produces an
intermediate result (Fig. 7.8(b)). The CVM approach also clearly gives much more
information in cases where sro is important. For instance, Kikuchi and Saito (1974)
showed that the decay of sro with temperature was significantly different in f.c.c.
and b.c.c. structures (Fig. 7.3(b)). Nonetheless, residual differences in results
obtained by the CVM and MC technique led to the CVM procedure being extended
to ever larger clusters. This forced the development of alternative cluster expansion
routes; but it is still an open question whether faster convergence can offset the large
increase in the number of equations which arise as the size and complexity of clusters
is increased. However, it is a bonus that the cluster expansion route can also be used
for any other property that is a function of configurational variables (Sanchez 1992).

Although the parameters that enter into the CVM procedure follow some simple
mathematical principles, the procedures are undoubtedly much more complex than
in the BWG approximation. Further complications arise when additional variables
such as the volume change as a result of atomic interchange are considered. Global
volume relaxation can be incorporated by minimising G with respect to changes in
inter-atomic distance (Mohri et al. 1989, 1992), but this assumes that local volumes
are independent of configuration, which is physically implausible when the
constituent atoms have large size differences. However, taking local relaxation into
account leads to even more complex algorithms (Lu et al. 1991, Laks et al. 1992,
Zunger 1994). The Ni-Au system has recently been re-examined as a good testing
ground for various ordering theories (Wolverton and Zunger 1997) as high-
temperature measurements indicate the presence of sro, but the system exhibits
phase separation at low temperatures.

Developments in CVM have been reviewed at regular intervals (Kikuchi 1977,
Khachaturyan 1978, de Fontaine and Kikuchi 1978, de Fontaine 1979, Inden and
Pitsch 1991, de Fontaine 1994, Zunger 1994). The succeeding sections should be
taken as merely defining some of the relevant key concepts.

7.3.3.1 Site-occupation parameters. A complete description of a system requires
detailed knowledge about the occupancy of all available sites by all the participating
species. However, with K constituents and N sites, this leads to K™ different
configurations, which is computationally unrealistic. A useful approximation is to
use average site-occupation parameters, €, for equivalent crystallographic sites.

 

References are listed on pp. 222-226.

===========
CALPHAD— A Comprehensive Guide 195

 

     

 

‘500
CuAu II e
~385°
400
?
£ 300
2 , i
3 Cu,Au te '
& 200
6
é
100
° L \ 4 !
0 20 40 60 80 100
cu Atomic % Au
(b)

(Cu,Au)

TEMPERATURE, °C

 

ATOMIC PER CENT Au

Figure 7.6. Comparison of (a) experimental phase diagram for the Cu-Au system

(Hansen 1958) with (b) predictions for the Cu~Au system calculated using the

tetrahedron approximation but including asymmetric four-body interactions
(de Fontaine and Kikuchi 1978).

Working with clusters defined by r lattice points reduces the number of configura-
tions by a further factor of r. A multi-site correlation parameter (€") can then be
constructed from the sum of all such values and used to define the overall
configuration.

The required thermodynamic functions then depend on the sum of all the cluster
probabilities, This is simplified by expressing the probability of each higher-order

===========
196 N. Saunders and A. P. Miodownik

—— B-W PHASE DIAGRAM
: FOR A,B
- T, FOR A,B, AB

  

 

 

0 0.10 0.20 0.30 0.40 0.50
A cp AB

Figure 7.7. Earlier prediction for Cu-Au using the BWG formalism (Shockley
1938).

cluster in terms of its lower components, e.g., pair probabilities (yi;) as products of
point variables. This approach can be extended to include higher-order systems, for
example in ternary systems one then has combinations of yy1, yo1 and yg. It is
important to note that it does not matter whether the added species are vacancies,
chemically different atoms, or atoms of the same species with different spin con-
figurations, but all the pair variables need to be normalised to unity at some stage.

To complete the picture it is useful to define distribution variables, 1;, which are
atomic fractions normalised to a mole of atoms as related to site-occupation
parameters. The z and y variables are related geometrically through the equation:

= uy. (7.17)
a

The formalism can then be extended to as many co-ordination shells (n-th nearest
neighbours) as required.

7.3.3.2 Effective cluster interactions. The second important parameter in all cluster
models is a series of interaction coefficients that define the bond strengths. An

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 197

kgT/J

4
;
?
;
?

 

“O.1 0.2 03 0.4 0s

CONCENTRATION

T/T (O=fx)

  

1.00

Figure 7.8. (a) enlarged region for 0 < z < 0.5 calculated according to CVM in
the tetrahedron approximation (T), the tetrahedron-octahedron approximation
(T-0) and using a Monte Carlo method (MC) (Sanchez et al. 1982). (b) results
obtained from using the quasi-chemical or CSA approximation (Kikuchi 1977).

important assumption is that all the members of a particular ‘family’ of related
ordered structures can be described by combining a single set of effective cluster inter-
action (ECI) energies E,,(r). The ECI values relate in turn to the total energy, E2,(r),
of a structure, a, through an appropriate set of site correlation functions, &.

===========
198 N. Saunders and A. P. Miodownik

Equations (7.18) and (7.19) give the relationships that hold for a binary system:

Vmax

Eke (7) = Ny Ey (r) GP (7.18)
7

=p Dom On «++ Tm, (7.19)
7 Ins

On = (1 — 2p,) takes the values +1 or -1 depending on the occupancy of the site,
n, N, is the total number of +y-type clusters and the sum runs over all such clusters
that can be formed by combining sites for the entire crystal.

Providing the bonding does not change dramatically across the system, the
derived ECIs should be composition independent. Connolly and Williams (1983)
were interested in calculating the ordering energies of a variety of structures from a
set of constant ECI values, but more importantly their method can be reversed
(Carlsson 1989) to extract ECI values from ordering energies that have been
calculated by electron energy calculations (Pasturel et al. 1992). The number of
structures for which the energy needs to be calculated has, clearly, to be at least
equal to the number of unknown values of E,(r). This is a relatively small number
if only first- and second-neighbour interactions need to be considered, but can rise
substantially with the inclusion of longer-range forces.

The relevant number of interaction coefficients can sometimes be inferred directly
from the electron energy calculations. For example, if structures such as DO, are
found to be more stable than L12, reference to ground-state diagrams shows that at
least second-nearest-neighbours have to be taken into account. Likewise if the ECIs
cannot be extracted without showing a strong composition dependence, this
suggests that longer-range forces need to be taken into account. In the case of Pd-V
it was found that interactions up to the 4th-nearest neighbours had to be included to
obtain good convergence (Ceder et al. 1994) and structures such as L60 and B11 in
Nb-AI indicate that it might be necessary to include the 5th-nearest neighbours in
this system (Colinet et al. 1997).

There are, therefore, some reservations about the use of the inverse Connolly
method if ECIs are determined from an insufficient number of base structures
(Ducastelle 1991). On the other hand, arbitrarily increasing the number of struc-
tures to be calculated is an open-ended recipe for unrealistic increases in computing
time. This problem was solved for a series of semi-conductor compounds by using
lattice theory to map the energies of 10-20 selected A,,B, compounds (Wei et al.
1990), and then extended to AB intermetallic compounds by Lu ef al. (1991). The
procedure has been reviewed by Zunger (1994). It efficiently screens a large
number of symmetries (~65,000 configurations) with a reasonable number of
calculations and then produces a set of cluster interactions that minimises the
predictive error in the energy of all the structures used in the analysis.

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 199

7.3.3.3 Effective pair interaction parameters. In the CVM formalism, effective

pair interaction coefficients, defined by the symbol vine are given in Eq. (7.20)
which clearly resembles the equivalent BWG point interaction coefficients, W, of

Eq. (7.21)

fol
vagn = 9( Vil + vip - 2vi2) (7.20)
Woda = (WE) + wip - 20) (7.21)

where vi) are the pair potentials for atoms J and J at the n-th nearest-neighbour
distance which can be related to the previously derived parameters through a re-
normalisation technique developed by Carlsson (1987). Examples from Pasturel
(1992 ) are given below:

Vy" (F.c.c.) = Eh + 4E3G + 2EU(G)? +++ (7.22)
VO" (b.c.c.) = By + 6E}G + 6EY(G)? +--+ (7.23)
Vg" (b.c.c.) = EF + 4EIG +4EM(G)? ++ (7.24)

Here E} represents the first-neighbour pair energy and E3 the second-neighbour
pair energy. E} represents the energy in a first-neighbour triangle, which for an f.c.c.
lattice contains only first-neighbour pairs, but both first- and second-neighbour
pairs in the case of a b.c.c, lattice.

7.3.3.4 Use of the general perturbation method. All of the above treatments have
essentially started with the assumption that one should first calculate the energy of
an ordered phase and then describe the effect of temperature on the disordering
process. It is, however, equally valid to use the high-temperature random state as a
reference point and extract the ordering energy by difference. This can be
implemented through the general perturbation method (GPM), first suggested by
Ducastelle and Gautier (1976). In this case the ordering energy is written as an
expansion of concentration-dependent n-th order effective clusters (Gonis et al.
1987, Turchi et al. 1988, Ducastelle 1989). Unfortunately, a large number of band-
structure calculations have to be made in order to establish the heat of formation of
the disordered solution over the whole composition range. The calculations also have
to be of high accuracy, so truncating the series expansion is not an option. An
extensive computing effort is, therefore, required even before interaction coefficients
are extracted from the ordering enthalpy and introduced into a CVM procedure.
The interaction parameters derived in this way are usually concentration-
dependent, making for lengthy computations. It is therefore unlikely that this route
will ever be adopted for multi-component calculations unless more efficient
algorithms can be developed. Apart from this aspect, the method is attractive

===========
200 N. Saunders and A. P. Miodownik

because many other associated properties such as APB energies and the variation of
surface energy with orientation can also be derived (Turchi and Sluiter 1992, 1993)
and the method clearly predicts important trends in the properties of both ordered
and disordered transition metal compounds (Sluiter et al. 1987, Turchi et al. 1994).
Some applications of the method to the calculation of binary phase diagrams are
discussed in a later section.

7.3.3.5 General form of the CVM enthalpy. The enthalpy associated with clusters
is given by the sum of expressions that cover all the possible combinations of
points, pairs, triplets, tetrahedra and whatever other clusters are being considered:

ae=-[> Setar e+ SS pt pt ph VAT + (7.25)

nm. 45 nm. ik

where p? represents the site (n) occupancy and equals 1, site (m) is occupied by (i),
otherwise it equals zero. For a given crystal structure there are constraints on the
occupation probabilities of various types of clusters, e.g., tetrahedra, triangles, pairs
and points. Reference should be made to de Fontaine (1994) and Cacciamani et al.
(1997) for explicit values of the enthalpy derived with various different assumptions.

7.3.3.6 Relation of BWG, pair and CVM enthalpies. If the more general expression
of Eq. (7.25) is restricted to pair interactions, the result is:

E(uij) =n ean (7.26)

i=l j=1

which is equivalent to the approximation first suggested by Bethe (1935). As
pointed out by Kikuchi (1977), the BWG treatment involves a further reduction of
the four (2) variables 11, y12, yar and yoo which are implicit in Eq. (7.26), to just
the two variables x, and z2 and then

E(a1,22) => aN ys x €4j i 2. (7.27)

il FL
This equation effectively imposes the condition that pi; = py = TaZp, with the
important result that sro is totally excluded, because, when the pair probability € is
equal to 142, the short-range-order parameter a becomes zero (see Section 7.1.2).

 

7.3.4 CVM entropy
It must be clear that although the CVM approach is much more accurate than the
BWG treatment, the corresponding entropy expressions are now complicated, and

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 201

this escalates markedly as more distant neighbours are also included. In this
section, examples are restricted to the pair and tetrahedron approximations to give a
feeling for the basic features and allow a comparison with the cluster site
approximation discussed in Section 7.3.5.

However, in all cases care has to be taken to avoid double-counting various
permutations. A good correction (Kikuchi 1977) is to divide by a factor which
numerically describes the nearest-neighbour (n) connectivity (c) of the lattice,
which for pairs leads to

I Pig

<u? (7.28)

eT

<i>

 

If the site correlations are extended to triangular clusters, then

I] oe IT
_ <i> <i
I] oi
<i>
The rationale for this is that each first-neighbour pair has been counted twice
because it belongs to two triangles. Each point belongs to six triangles and six pairs,
so the correction factors here cancel out and a further term representing the point
probabilities has to be reintroduced (Finel 1994).

. (7.29)

7.3.4.1 Criteria for judging CVM approximations. Finel (1994) has addressed
several important issues such as the criteria that should be used to judge the quality
ofa CVM approximation and what sequence of clusters lead to a rapid convergence
to an exact solution. This includes the interesting point that use of a given cluster
size yields less precise answers for the disordered phase in comparison to its
ordered counterpart. Fortunately, the higher symmetry of a disordered lattice also
reduces the number of variational parameters for a given cluster size. It is therefore
sensible to use a pair approximation for T’ < T°! combined with the tetrahedron
approximation for T > T°, or the tetrahedron approximation for the ordered
phase and the tetrahedron/octahedron approximation for the disordered phase.
Other combinations have also been used, such as the MC method to obtain
enthalpies and cluster probabilities and then using CVM in the tetrahedron
approximation to calculate the entropy (Bichara and Inden 1991). Likewise a
mixture of MC plus a 13-point cluster has also been used (Ceder et al. 1994). A
comparison between BWG, CVM and MC in the more complex case of the Al5
structure can be found in Turchi and Finel (1992) (Fig. 7.9).

7.3.4.2 Entropy on the pair interaction model. The entropy of the system in a pair

===========
202 N. Saunders and A. P. Miodownik

F/I,

5B -1s
2.0 1
06
au 04
a
0.2
° rei
o 1 2 3

KT/I,

Figure 7.9. Variation of (a) the Gibbs energy, (b) the enthalpy and (c) the entropy
with temperature (scaled to the nearest-neighbour interaction energy Ji) for the
complex structure A15. Comparison between BWG (---), CVM in the tetrahedron
approximation (---) and the Monte Carlo method (—) (Turchi and Finel 1992).

interaction model can be obtained using Stirling’s approximation, if it is assumed
that only nearest neighbours are included, as

sy=an[e-9 Dann F LD wh uyl- (7.30)
7 7G
7.3.4.3 Entropy on the tetrahedron approximation. If the treatment is extended to
the case of a tetrahedral cluster, this immediately raises the number of required
equations to (2*) variables. As already indicated, the pair approach is not sufficient
to adequately describe the f.c.c. lattice, where an additional variable z;;4: is needed
where i, j, k, | can take values 1, 2, 3... corresponding to various atoms or
vacancies. The energy expression corresponding to the tetrahedra is then given by

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 203

En = 2N > eign zijn (7.31)

ikl

where 2N is the total number of tetrahedra formed from N lattice points and €;;4:
contains the four-body interactions. Even this may not produce a fully accurate
answer, since an analysis of several f.c.c. systems shows that their behaviour neces-
sitates taking into account next-nearest neighbours (Inden 1977a). In that case, an
octahedral plus tetrahedral cluster is really required (de Fontaine and Kikuchi
1978). Fortunately the CVM treatment of the b.c.c. structure is much simpler than
for f.c.c, as it can be handled with an irregular tetrahedron that already includes first
and second neighbours (van Baal 1973). The many CVM reviews already cited
should be consulted for the entropy expressions relating to more elaborate clusters.

7.3.4.4 Implementation of CVM. The implementation of any improved ordering
algorithms must take into account both a minimisation of computing time and
teliable convergence to the equilibrium result. The Newton-Raphson method of
steepest descent is not convenient when there is a large number of variables, as it
can oscillate and produce negative values for probability variables. By contrast the
natural iteration method (Kikuchi 1974, de Fontaine and Kikuchi 1978) was
specifically designed to handle the complexities of CVM, and gives only positive
probability variables which converge smoothly to the state of lowest Gibbs energy.
Although ‘safer’, the natural iteration method is, unfortunately, much slower than
the method of steepest descent.

7.3.5 The cluster site approximation (CSA)

The emphasis in the previous sections has been on the accuracy with which the
Gibbs energy, particularly the entropy component above T°, can be calculated.
However, as the number of components, C, and the number of atoms in the chosen
cluster, n, increases, the number of simultaneous equations that have to be solved is
of the order of C”. This number is not materially reduced by redefining the
equations in terms of multi-site correlation functions (Kikuchi and Sato 1974). The
position may be eased as extra computing power becomes available, but a choice
will inevitably have to be made between supporting a more complex model or
extending a simpler model to a greater number of components.

The cluster site approximation, CSA, has the great advantage that the required
number of equations to handle the necessary variables is given by the product Cn
(Oates and Went! 1996) as compared to the exponential value C” aassociated with
a full CVM treatment (Inden and Pitsch 1991). The CSA is a variant of the quasi-
chemical model proposed by Li as early as 1949, where the number of clusters that
are considered to contribute to the entropy are reduced by excluding all clusters that
share edges or bonds. Kikuchi (1977) has deduced the consequential changes in
entropy for an f.c.c. structure (Eqs 7.32 and 7.33), which places CSA intermediate

===========
204 N. Saunders and A. P. Miodownik

between BWG and CVM in the overall hierarchy of CVM techniques (see Table
7,1, p. 187).

[Eton]

 

(cvM) S{ui541} = Rin] ——- —__ 4. (7.32)
Ul cman [Me
ight 7
3
[Tew |
(CSA) S{wigaa} = Rin 2 (7.33)
An alternative way of expressing these differences is:
S*€1CVM] = 25; — 65p1 + 5S,
S>°©(CVM] = 6S; — 12S, + 35p2 + 451 — Sy
Sf" (QSA] = S>**(CSA] = S; — 35, (7.34)

where the subscripts t, tr, p and s refer to tetrahedral, triangular, pair and single-site
contributions respectively. As an example, the expanded form of the entropy
contribution for S; is given by:

St = —Nk > wigs in win (7.35)
‘ig
The single-site entropy term in the CSA version arises from the normalisation of
the partition function (Oates and Went! 1996), while the relative complexity of the
b.c.c., CVM case occurs because the tetrahedron is asymmetric in this case. There
is then a need to take into account both nearest- and next-nearest-neighbour
interactions (Inden and Pitsch 1991).

One result of the simplification inherent in the CSA treatment is that the same
expression is obtained for the entropy of both f.c.c. and b.c.c. lattices which clearly
distinguishes it from the differences noted in Fig. 7.3(b). However, Fig. 7.10 shows
that the overall variation of Gibbs energy derived from the CSA method agrees well
with CVM, falling between the pair approximation, which overestimates the
number of AB bonds, and the point approximation, where these are underestimated.
As might be expected, if larger clusters are admitted to the CSA approximation the
results become closer to the CVM result. However, this is counterproductive if the
object is to increase the speed of calculation for multi-component systems.

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 205

0

-2

3

Free Energy/kT

. cvM
4 = CSA

-5
0 08) 02 03 04 05
Mole Fraction
Figure 7.10. Variation of free energy with composition for an f.c.c. lattice as

calculated by the point, pair and tetrahedron approximations for both CSA and
(CVM just above the critical temperature (Oates and Wenz! 1996).

It remains to be seen whether the CSA approximation will prove viable when
applied to multi-component systems, but it does appear to be a useful compromise.
So far the method has also been restricted to only first- and second-neighbour inter-
actions; clearly any extension to longer-range forces will start to offset its current
advantages in terms of computing time.

7.3.6 Simulation of CVM in the framework of a sub-lattice model

Sundman and Mohri (1990) have made a number of simplifying assumptions in
order to implement the cluster variation method within the framework of a sub-
lattice model and produced a method that can handle varying degrees of short-range
order within a random solid solution. Using the specific example of Cu—Au, clusters
of specific compositions (e.g., Cu, Cu7zsAus, CusAus, CuzsAu7s and Au) are
treated as separate composition variables. Although this has superficial analogies
with the treatment of molecular species in a gas phase, there are constraints on the
positioning of such clusters in the solid-state analogue (as indeed there are in the
full CVM treatment). Suitable correction terms have therefore to be introduced with
the further constraint that the final expression reduces to the normal regular solution
model when the sro becomes zero.

This treatment was used to determine the high-temperature equilibrium in the
system and combined with a standard four sub-lattice treatment of the ordered
phase, equivalent to the BWG treatment for a binary f.c.c. lattice. The Cu-Au
diagram generated by this means (Fig. 7.11) is quite close to that obtained by an
early MC calculation (Binder 1980), but the latter result is not now universally
accepted (Ducastelle 1991). Sundman and Mohri (1990) suggested that their hybrid

===========
206 N. Saunders and A. P. Miodownik

1
pe
'

1
a

Normalized temperature

 

0
ot 0.2 03 0.4 05

Mole fraction B

Figure 7.11. Comparison of an ordering treatment in an f.c.c. lattice using a sub-

lattice approximation for tetrahedral clusters for disordered alloys, combined with

a BWG treatment for the ordered phases (—) with a conventional tetrahedron

CVM calculation (---) (Sundman and Mohri 190). The tie lines are from a Monte
Carlo calculation that has since been superseded.

approach would produce some self-cancellation of the errors inherent in both
treatments, but the accuracy of this approach remains an open question, particularly
as it has only been tested in the context of nearest-neighbour interactions.

It will be interesting to see how such treatments based on a sub-lattice model can
be made more general. So far it has only been used for quite simple systems with
ordered structures such as L12 and Llp, It may be necessary to include more than
four sub-lattices for complex ordered phases which are superstructures of these
types, and to consider more than Ist or 2nd neighbour energies. Furthermore, the
choice of clusters for the sro part must relate back to the sub-lattice model itself and
it is difficult to see how the more complex clusters routinely handled by CVM
models can be reconciled with the sub-lattice models used so far.

7.4. EMPIRICAL ROUTES

7.4.1 Specific heat (Cy) approximation

Integration of experimental C, data with temperature can be used to bypass the
plethora of models described in the previous sections, as it provides both the critical
ordering temperature and the ratio of sro to Iro. This route has been extensively used
to describe magnetic transformations (Inden 1977a, Hillert and Jarl 1978, Nishizawa
et al. 1979) and generalised through the development of a series of approximate

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 207

treatments. In the magnetic case these all require a priori knowledge of the critical
ordering temperature and the number of Bohr magnetons which are uniquely related
to the magnetic ordering energy and entropy of the fully (magnetically) disordered
state (Chapter 8). Analogous functions can be constructed for the equivalent chemical
or structural ordering transformation and have been used to describe the configura-
tional ordering of the @-phase in the Cu-Zn system (Inden 1981), in Fe-Al (Inden
1983) and for both configurational and magnetic ordering in Fe-Si (Lee et al. 1987).

The relative reluctance to apply this method more extensively to structural order-
ing can be ascribed to several factors. Firstly, the main objective in the magnetic case
has been to calculate a AGmnag contribution from the critical ordering temperature;
the latter is therefore an input and not an output from the calculations. By contrast,
the prediction of T° is a major objective in the case of structural ordering. A
second factor is that there is a general lack of experimental C, data for configura-
tional ordering transformations, which has made it difficult to establish general
trends for the degree of sro associated with different crystal structures. This is an
important input parameter and has led to the use of values that have only been really
validated for the magnetic case. Thirdly, Inden (1991) has shown that unacceptable
singularities can arise in the Gibbs energy functions if input data are derived from
the terminal entropy of the disordered state. However, the same article shows that
satisfactory results can be obtained with negligible loss of accuracy by alternative
routes (Fig. 7.12). This is a good example of the fact that small changes in the way
parameters are derived can make significant differences to the final phase diagram.

The main advantage of the C, route is that the Gibbs energy contribution of a
structural ordering transformation can be incorporated using algorithms that are
already available in a number of software packages to describe the magnetic Gibbs
energy. The ordering Gibbs energy is automatically partitioned into long-range and

1.00

gA2—B2
kN

 

2
3

Entropy of ordering, -

 

mole fraction, xp

Figure 7.12. Ordering entropy as a function of composition: (a) exact values

derived from the terminal entropy for a completely random solution and (b) using

an empirical route via the enthalpy The difference between these two curves is
sufficient to generate spurious miscibility gaps (Inden 1991).

 

===========
208 N. Saunders and A. P. Miodownik

short-range components and asymptotes smoothly to the function representing the
disordered state. An associated, and not insignificant advantage, is that these
algorithms are designed to handle asymmetrical values of the ordering temperature.
The main disadvantage is clearly the need to have a value of T° as an input. One
possibility is to derive T°" from a simple BWG approximation together with an
appropriate x factor (see Section 7.3.2.2), but this only a reasonable option in the
case of b.c.c. systems. Nevertheless, there are systems, such as Nb-Al, where
electron energy calculations have shown a rapid variation of ordering energy with
composition (Colinet et al. 1997). The C, method may therefore find a niche for
handling ordering in certain multi-component b.c.c. alloys.

7.4.2 General polynomial approximation

The possibility of simulating the actual BWG ordering energy, rather than Cp,
using a polynomial approximation was also examined by Inden (1976) using the
disordered solid solution as a reference state. The following expression was
suggested for a continuous second-order transformation such as A2/B2:

Gasol = ¢ + (OT) — (Be + 26Ta)7? + (26+ OTo)1® (7.38)
where

THT/T,e = Hes and 0 = Sit — Soe. (7.37)

Assuming these three parameters are available, it is then possible to obtain explicit
values for
Sdgrord = —0 + (6€/To + 40)7 — (6e/Ty + 36)7? (7.38)
and
Hig = G85" + TS (7.39)

A good match was obtained with the results obtained from the standard BWG treat-
ment, both for the A2/B2 and the B2/DO3 transformation, and the expression was
extended for use in the Cu-Zn—-Mn system (Chandrasekaran 1980). However, as these
equations are based on the BWG approximation, which does not take into account sro,
this approach was abandoned when the CVM formalism became more established.

7.5. ROLE OF LATTICE VIBRATIONS
7.5.1 Interaction of ordering and vibrational entropy

All the approaches described so far concern themselves only with the calculation of
Gibbs Energy changes that are caused by changing atomic configurations per se and

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 209

do not necessarily take into account effects associated with the elastic modulus,
vibrational entropy or atomic volume. Changes of these properties with com-
position will also affect the Gibbs energy, and therefore, the matching of experimental
and calculated phase diagrams. The proper inclusion of vibrational with electronic
and magnetic excitations may indeed reduce the number and magnitude of arbitrary
parameters introduced into various ordering models (Cacciamani et al. 1997). This
is a general problem which affects all manner of phase transformations, not just
ordering, and is the reason why there is now increasing emphasis on entering
specific functions for parameters such as Debye temperatures into the next
generation of Gibbs energy algorithms (Sundman and Aldinger 1995).

However, it is also possible for changes in the vibrational spectrum to occur with
changes in degree of order itself, producing a further change in the entropy.
Experiments indicate that, in the case of Ni3Al, the vibrational component, 0.2-0.3
Rmol-!, can be of comparable magnitude to the configurational entropy, 0.56
Rmol™! (Anthony et al. 1993, Fultz et al. 1995). Other examples are a change of
0.10 Rmol~! for Fe3Al and 0.12-0.23 R mol~! for CusAu (Anthony et al. 1994).
To appreciate what effect this may have on the ordering temperature the mean free
approximation can be extended (Anthony et al. 1993) to include different frequency
factors, w, for the various bonds:

_ 2keT l+n\; 9 3/2
© {Van + Von — 2Vap) ' G - *) (ho /tan come)" (7-40)

This is essentially the same expression already given for the BWG approximation
(Eq. (7.3)) with an additional function that combines the various vibrational
frequencies of different bonds. In an ordered alloy the A-B bonds are expected to
be stiffer than those of the A~A and A-B bonds, so the vibrational entropy of the
ordered state will be lower than that of the disordered state, thus lowering the critical
ordering temperature.

In the absence of experimental information on vibrational frequencies, a first
estimate can be made via Debye temperatures derived from First Principle
calculations. However, the Debye model does not necessarily give an accurate
enough answer because it does not include the high-frequency part of the
vibrational spectrum. Garbulsky and Ceder (1996) have provided an estimate of the
possible fractional change in critical ordering temperature that could be caused by
changes in lattice vibrations (Fig. 7.13). This can clearly be quite significant, and
the change can be of either sign, depending on the combination of size-mismatch
and chemical affinity. A redistribution of masses per se as a result of ordering does
not seem to produce any major effect (Grimwall 1996).

7.5.2 Kinetic development of ordered states
The structures that are actually observed in practice depend on the kinetics of

===========
210 N. Saunders and A. P. Miodownik

2

 

—S Tee-ordering

go fee-segregating

. bec-ordering

=o — bee-segregating

&

Z 0.1

= -02 iS

a -0.; set#4 \“s. Fe-Cr
5 ww

% -03 S.,
s set#3 S.
mw 0.4 x

 

0.20 0.15 04 -0.05 0 0.05 0.1
Nearest neighbor vibrational EC]

Figure 7.13. Estimated fractional change in the ordering temperature resulting
from incorporating the effect of ordering on the vibrational spectrum by an
additional effective cluster interaction (ECI,») (Garbulsky and Ceder 1996).

transformation, and a time-dependent version of CVM called the path probability
method was already proposed in the early stages of CVM (Kikuchi 1966, 1977).
More recently, Mohri et al. (1992) have outlined some of the implications in
relation to an f.c.c. lattice including a switch from nucleation and growth to
spinodal decomposition, a concept first proposed by de Fontaine (1975).
Implementation of MC versions of such techniques have shown that there can be
transient metastable ordered states before the equilibrium ground state is finally
achieved (Fultz 1992, 1994). Thus Hong ef al. (1995) showed that small regions
having the B32 structure can form on the way to attaining the stable B2 structure,
even though the selected ratio of first- and second-neighbour bond strengths make
B32 technically unstable. Calculations by Turchi ef al. (1994a) for Fe-Cr alloys
indicate that, if the sigma phase was excluded, a B2 phase would have a Gibbs
energy intermediate between that of the random A2 high-temperature solution and
separation into two Fe- and Cr-rich solutions at low temperatures. The conclusion
that a virtual ordered phase can exist even when the heat of mixing is positive has
considerable consequences for the prediction of metastable states during rapid
cooling.

7.6. INTEGRATION OF ORDERING INTO PHASE DIAGRAM CALCULATIONS

The previous sections have largely concentrated on the relative accuracy with which
a given order—disorder reaction can be described and the associated computing time.
However, one of the ultimate tests is to see whether these procedures can be
integrated into calculations for real, rather than model, systems.

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 211

7.6.1 Predictions restricted to phases of related symmetry

Table 7.2 gives selected examples of applications of various models to various
systems, covering the range through model calculations in binary systems to ternary
applications. Bearing in mind the scale of the subject, the list cannot be considered
exhaustive and other reviews should also be consulted (Ducastelle 1991, Inden
1991, de Fontaine 1994, Turchi 1994). The earliest applications either concentrated
on simple systems such as the f.c.c.-based transformations in Cu—Au, or only tried
to reproduce a restricted region of a real alloy system; for example the b.c.c. family
of structures in the Fe-rich region of the Fe-Si system.

Ordering in the b.c.c. phase of Fe-Co alloys (Figs 7.14(a) and (b)) is a good
example of the relatively small difference between using the BWG and CVM
methods in the case of b.c.c. systems, even where magnetic effects have to be in-
cluded. Similar comments apply to the ternary Fe~Co—Al system (Figs 7.15(a}(c)).
This may be contrasted with the large variations obtained in close-packed systems,
as already evidenced by the various phase diagrams produced for Cu-Au (Figs 7.6—
7.8). It is therefore not surprising that many applications to b.c.c. ternary systems
tend to concentrate on a description of a limited region in phase space where a
particular family of ordering reactions based on b.c.c. derivatives are known to take
place, and have not tried to integrate these into a characterisation of the whole

diagram.

7.6.2 Predictions using only first-principles plus CVM

It is possible that a complete solid-state phase diagram can be predicted from a
combination of first-principles (FP) and CVM without the introduction of any
arbitrary adjustable parameters. However, the present state of the art cannot, as yet,
fully deal with the liquid phase. Examples of this kind include Fe-Cr (Turchi et al.
1994a), Ti-Rh (Sluiter et al. 1988), Ru-Nb (Becker et al. (1991) and AI-Li (Sigli
and Sanchez, 1985). For a useful review see Turchi (1994). Given the severe
restrictions placed on this route, the reproduction of many qualitative features in
complex diagrams must be considered a tour de force. However, the resulting phase
boundaries have not been generally accurate enough to allow their incorporation
into any subsequent calculation for industrial alloys.

7.6.3 Methods which maximise the FP input

To be useful from a CALPHAD point of view, it is mandatory to have a charac-
terisation of the liquid phase, and the insistence on working totally from FP has to
be relaxed. The simplest solution is to add data for the melting points and
enthalpies of fusion for the elements from conventional CALPHAD sources. As for
heat of mixing for the liquid phase, one approximation is to assume it will follow a
suitably weighted behaviour of the f.c.c. and b.c.c. phases. This kind of treatment

===========
212

N. Saunders and A. P. Miodownik

Table 7.2. List of Methods applied to Selected Ordering Systems

 

 

 

System Lattice Model Nearest neighbours Sub-lattice/ References
clusters
AB fice. BWG W®) and WO) 4 sublattices Inden (1977b)
AB fc. BWG W") and W?) 8 sublattices Buth and Inden (1982)
A-B fie.c. (L1p/L1,) CVM variable W/W) T, T/O and MC Mohri et al. (1985)
A-B (A2/B2/B32)  CVM_ variable W/W) T and MC Ackermann et al. (1989)
AB fcc. CsA W°) only Pt, Tr, T Oates and Went! (1996)
A-B fe.c/b.c.c. CvM W" only Pt, Tr, O, T Kikuchi and Sato (1974)
AB fees. CVM  W onl PL, Tr,0,T Kikuchi (1977)
AB (Mp/L}2) Mc W—W>0 TiO andMC _ Inden and Pitsch (1991)
AB ep.h. MC anistr, WO /WO?) Crusius and Inden (1988)
AB cp.h/DOs = MC function WO) Kikuchi and Cahn (1987)
AB foc MC mixed" CVM __Finel (1994)
Au-Cu fe. cvM T Kikuchi (1974)
Au-Cu fies. VM assym. T Van Baal (1973)
Ni-Ga —_ B2+ vacancies Neumann and Chang
(1979)
Co-Ga — B2+vacancies Neumann and Chang
(1979)
AB AlS alloys =CVM wi) wo +BWG+MC —Turchi and Finel (1992)
FeCo bec. CVM W") and We) T Inden and Pitsch (1991)
FeCo bec, BWG W and We) Inden (1977a)
Fe-Co bec. cv WW) = 0) T Colinet et al. (1993)
Al-Co . MC Ackermann (1988)
Cu-Zn GPM Turchi et al. (1991)
Cuzn BWG Wand W® — 4 sublattices —_Inden (1975b)
Fe-Al MC upto W®) Bichara and Inden (1991)
Fe-AL-Co BWG Fe, Co, mag spin 1 Kozakai and Miyazaki
(1994 a,b)
Fe-Al-Co BWG Fe, Co, mag spin 1 Miyazaki et al. (1987)
Fe-Al-Co cVvM Colinet et al, (1993)
Fe-Al-Co MC ‘Ackerman (1988)
Ni-ALTi cvM THO Sanchez. (1992)
Fe-Si-Co BWG Fe, Co, mag spin 1 Inden (1979)
Fe-Si-Co BWG Fe, Co, mag spin 1 Fukaya et al, (1991)
Fe-Si-Al BWG Fe, Co, mag spin 1 Fukaya et al. (1991)
Fe-Al-Ge BWG Kozakai and Miyasaki
(1993)
Ti-AL-Mo cvM T Rubin and Finel (1993)
Ti-ALNb cVM T Rubin and Finel (1993)
TLALW cVM T Rubin and Finel (1993)
Gatn-P  III-V cVvM Silverman et al. (1994)
Ga-As-Sb Zn-blende CVM upto Wi) Zunger (1994)
Cu-In-Se Chalcopyrite © CVM Osorio et al. (1993)
In-P-Sb Zn-Blende = CVM T+T/O Nakamura et al. (1991)

 

Abbreviations: BWG = Bragg-Williams-Gorsky, CVM = Cluster Variation method, T = Tetrahedron
approximation, 1/0 = Tetrahedron/Octahedron approximation, MC = Monte Carlo, SC = Simple cubic
approximation, SP = simple prism approximation, Pt = point approximation, Tr = triangle approximation

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 213

1500

1000

Temperature (K]

Temperature [K]

500

  

(a) (b)

Figure 7.14. Comparison of ordering in binary b.c.c. Fe-Co alloys (a) according
to the BWG approximation (Inden 1977) and (b) using CVM (Colinet et al. 1993).

has been applied to Ni-Ti (Pasturel et al. 1992) and Nb-Al (Colinet et al. 1997),
but it is of course possible to also import such data from CALPHAD assessments if
these are available.

While this can produce diagrams that are closer to reality, certain critical features
can still be in error by a considerable margin (several hundred degrees in some
instances). One way of improving the agreement is to use a simple scaling factor
for the initial set of calculated interaction coefficients so as to obtain a better fit
with observed critical temperatures. Such discrepancies might of course simply
reflect the fact that vibrational terms were often ignored. It is possible to partially
include the effect of the phonon spectrum, without adding further empirical
parameters, by deriving vibrational frequencies from FP calculations of the bulk
modulus (Sanchez 1992).

It is difficult to assess the relative merits of the different approaches as they have
not necessarily been applied to the same systems. They are further characterised by
other differences such as the CVM cluster size, different characteristics of the
liquid phase and, notably, by the adoption of different values for the lattice
stabilities. The Ni~Al system is useful in this respect as it contains both ordered
b.c.c, and ordered fic.c. phases as well as having been tackled by many

===========
214 N. Saunders and A. P. Miodownik

  
 

T = 800K

Fe 20

40
Al (at. %)

 

Figure 7.15. Predicted equilibrium between b.c.c. derivative-ordered phases in

ternary Fe-Al-Co alloys (a) using the BWG formalism at 800 K (Kozakai and

Miyazaki 1994), (6) using CVM at 700 K (Colinet et al. 1993) and (c) using the
Monte Carlo method at 700 K (Ackermann 1988).

investigators. Le et al. (1991) and Sanchez et al. (1984b) have used the Connolly
inversion method, Sluiter et al. (1992) the general perturbation method and Tso
(1992) the mixed CVM-CALPHAD method. More recently, this system has also
been used as a test vehicle (Cacciamani et al. 1997) to compare other combinations
of CVM and CALPHAD methods (see next section).

7.6.4 The mixed CVM-CALPHAD approach

Even with the incorporation of CALPHAD data for the liquid phase, the insistence
on using the electron energy lattice stabilities for the end-members can make it
virtually impossible to integrate any resulting FP phase diagram with other systems
based on standard CALPHAD assessments. A totally different approach is necessary

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 215

to achieve such a possibility. A mixed CVM-CALPHAD technique (Sigli 1986,
Tso 1992) essentially accepts the CALPHAD view of placing a premium on
accurately fitting the experimental phase boundaries rather than on fixing all the
parameters from FP. Once the connection with FP calculations becomes less rigid,
it also becomes possible to use standard thermochemical lattice stabilities, thus
allowing a more seamless integration with other CALPHAD assessments. How-
ever, the crucial element of this approach is the incorporation of a suitable excess
term to remove any discrepancies between a CVM calculation of the ordering
component and the observed phase equilibria.

GP = SO GE + Gy + Cbrces: (7.41)

istn

Here the first term represents the lattice stability components of the phase ¢, the
second term the Gibbs energy contribution arising from cluster calculations and the
third term is the excess Gibbs energy expressed in the form of a standard Redlich-
Kister polynomial (see Chapter 5).

Once the aim has been shifted away from maximising the FP input, it seems
sensible to extend the range of input parameters that are used to define the cluster
interactions and include all the available experimental data such as enthalpies of
formation. It is then possible to derive ECI parameters entirely from experimental
data (Oates et al. 1996), although in that case they may well turn out to be
concentration- and temperature-dependent. The Ni-Al phase diagram resulting
from the CVM-CALPHAD treatment of Tso (1997) is shown in Fig. 7.16(a). The
results show that the CVM-CALPHAD route leads to phase boundaries of
reasonable accuracy but with potentially fewer parameters than a CALPHAD
approach, such as the specific form of sub-lattice model used by (Ansara et al.
1995) Fig. 7.16(b) (see also Chapter 5), The work reported by Cacciamani et al.
(1997) should be consulted for the effect of making other assumptions, and work
involving a combination of FP, cluster expansion and vibrational energies for this
system is in progress.

7.6.5 Applications of FP~CVM calculations to higher-order metallic alloys

There have been relatively few attempts to determine ordering in a ternary system
solely using a combination of FP calculations and CVM. Computing time
obviously rises substantially with the number of components, so some simplifica-
tions may have to be made. One suggested technique (Sanchez 1992) is to perform
the main calculation by using the tetrahedron approach but use re-normalised
parameters which reproduce a T° previously deduced from the more accurate
tetrahedron—octahedron approximation. This allows both first- and second-
neighbour interactions in the binary systems to be taken into account, but how

===========
216 N. Saunders and A. P. Miodownik

(a)

1900

1700

3

Temperature (K)
oS
3

1100

 

° 0.2 0.4 0.6 08 1.0

Atomic Concentration of Ni

Temperature (K)

 

0 0.2 0.4 0.6 0.8 1.0

Figure 7.16. Comparison of Ni-Al Phase diagrams obtained by (a) using a hybrid
CVM-CALPHAD approach (Tso 1992, Cacciamani 1997) and (b) CALPHAD
approach incorporating a sub-lattice ordering model (Ansara ef al. 1995).

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 217

far it will be possible to extend this to a multi-component situation is still an open
question. Some results for restricted regions of the Ni-Al-Ti are given in Sanchez
(1992), while Asta et al. (1995) have performed an FP-CVM study of intermetallic
phase stability in Ti-Al-Nb alloys. Because of interest in exotic intermetallic
compounds, Becker and Sanchez (1993) have also explored the Ru-Nb-Zr system.
Some further general aspects of modelling can be found in the work of Tso et al.
(1989) and Tso (1992).

Earlier work on systems such as Ni—AI-Cr reported in Sanchez et al. (1984b)
used FP methods to obtain information on phases for which there was no experi-
mental information. In the case of Ni-base alloys, the results correctly reproduced
the main qualitative features of the y—y’ equilibrium but cannot be considered
accurate enough to be used for quantitative alloy development. A closely related
example is the work of (Enomoto and Harada 1991) who made CVM predictions
for order/disorder (y—y') transformation in Ni-based superalloys utilising
Lennard-Jones pair potentials.

7.6.6 Applications to more complex structures
Many semiconductors and ceramics contain phases with more complex variations
based on larger unit cells and with marked deviations from cubic symmetry. This
involves an enormous increase in the number of potential structures that have to be
screened in order to find the ground-state configuration. In addition, a higher
accuracy is required because the relevant Gibbs energy differences become smaller,
which makes the BWG approximation inappropriate. Applying the CVM technique
is also difficult because conventional cluster expansions only converge quickly in
the absence of appreciable atomic relaxation and the computational effort also
becomes much higher as the number of atoms in the unit cell increases. These
problems have been overcome through the methods developed by Zunger and his
co-workers and can be applied not only to conventional order—disorder transfor-
mations but also to APB boundaries and interfacial energies. Systems that have
been studied include the quasi-binary system AlAs/GaAs (Magri et al. 1991), many
other III-V quasi-binary systems (Wei et al. 1990), pseudo-ternary phase diagrams
of chalcopyrite-zinc blende alloys (Osorio et al. 1993) (Fig. 7.18) and surface-
stabilised ternary semi-conductors (Zunger 1993). The GaSb-InSb and GaP~InP
systems have been studied by Mohri et al. (1989) and InP-InSb by Nakamura et al.
(1991). The importance of lattice relaxation has been emphasised by Zunger
(1994). Technically all these examples are restricted to solid-state applications
since, as has already been mentioned, FP calculations cannot as yet handle the
liquid phase. There is therefore significant scope for combining these treatments
with a standard CALPHAD treatment of the liquidus and solidus (Ishida et al. 1988,
Ohtani et al. 1992).

In the field of ceramics the CVM technique has been applied to the system

===========
218 N. Saunders and A. P. Miodownik

(Culnse,),_,(ZnSe),,

1200

800

 

> 0

& 0 02 04 06 08 1.0
2 Culnse, ZnSe
3 x

5

2

E (b)

e

A

  

Figure 7.17. Predicted phase diagram for the system (CulnSe),..(ZnSe)s: (a)

stable and metastable equilibrium between chalcopyrite (CH) and zinc-blende

(ZB) phases using volume-dependent interaction parameters; (b) using a hierarchy
of less accurate approximations (Osorio et al. 1993).

CaCO3;-MgCOs, using the tetrahedron approximation, and compared with the
result by using BWG (Burton and Kikuchi 1984a). As might be expected, CVM
gives better results than BWG because of the inclusion of sro (Fig. 7.18). Good
agreement was obtained for the sub-system CaCO;-{(CaCOs)os(MgCOs)o.5}
(calcite-dolomite), but interestingly the features of the dolomite-magnesite
({(CaCO3)o.s{MgCOs)os}-MgCO3) segment do not match even qualitatively.
The authors therefore suggested that an additional transition based on the rotation
of CO; groups might have to be included to give an extra degree of freedom. In the
case of hematite Fe203, the corundum structure necessitates the use of a prismatic

 

References are listed on pp. 222-226.

===========
CALPHAD—A Comprehensive Guide 219

we Teonsotute

     
  

..

   

pExperimental points from
S! Goldsmith & Heard (1961)
Calculated points

 
    
 

Tr,
2
&

R3c + R3

  

0 O01 02 03 04 05 06 07 08 09 10
CaCo, x Mgco,
MgCO3

Figure 7.18. Comparison of experimental and predicted phase equilibria i int the

system CaCO;-MgCO; using CVM in the tetrahedron approximation for a

trigonally distorted f.c.c. Ising lattice. Semi-quantitative agreement is achieved for

the calcite-dolomite segment but the Mg-rich side of the diagram indicates the
need to include a more complex model (Burton and Kikuchi 1984b).

cluster (Burton and Kikuchi 1984b). Better agreement for the calculated Neel
temperature was obtained than with simpler pair-models, but the calculation was
still considerably in excess of experimental results. The order—disorder transition in
FeTiO; shows that structural information is important in systems which have aniso-
tropic coupling (Burton 1985a). This becomes even more necessary in carbonates
and silicates where intra-layer interactions favour phase separation, while inter-
layer interactions favour ordering (Burton 1985b). Only for highly ionic materials,
such as CaO-MgO, does the charge state remain invariant on mixing; but even in
this case discrepancies may arise due to the neglect of vibrational entropy (Tepesch
et al. 1996).

A distinctive feature of many oxides is the presence of lattice defects, requiring
the evaluation of defect interaction energies (Tetot et al. 1994). These can be of
vital significance in relation to the superconductivity of materials such as
YBa,Cu;0, whose basic ordering behaviour has been studied by Kikuchi and
Choi (1989) and de Fontaine et al. (1987). Vacant sites can also have a significant
effect in intermetallic compounds, effectively adding an extra component, since the
sites have to be treated as a separate species and given suitable interaction energies.
An early example is the paper by Neumann and Chang (1979) on defect structures
in B2 transition metal intermetallic compounds.

===========
220 N. Saunders and A. P. Miodownik

1.7, COMMENTS ON THE USE OF ORDERING TREATMENTS IN CALPHAD
CALCULATIONS,

7.7.1 General comments

Difficulties often arise when attempting to incorporate theoretical ordering treat-
ments within the so-called ‘traditional’ CALPHAD approach which obeys the
paradigm of accurate coupling of measured thermodynamics and phase diagrams.
This is because the majority of theoretical treatments tend to be associated with an
exclusive sub-set of particular physical phenomena and may not include other,
equally important effects within their theoretical basis. For example, the BWG treat-
ment does not include sro while the excess Gibbs energy arising from vibrational
entropy is rarely considered in standard CVM procedures. Within a ‘traditional’
CALPHAD optimisation, such additional effects are empirically included through
the various excess terms. Added to this, the greater number of parameters which can
be optimised means that accurate calculations for binary and ternary phase diagrams
are possible. Without this required degree of accuracy it is impossible to make
accurate predictions for phase equilibria in multi-component alloys.

This accounts for the moves to combine a theoretical CVM treatment with a
CALPHAD optimisation technique which include an excess term (see Section
7.6.4). However, CVM then becomes just another optimisable model and it is not
yet clear whether there is any gain in predictability in the higher-order systems
when adopting this procedure for multi-component alloys, even if vibrational
entropy can be properly included.

At the present time the strength of the more theoretically based ordering models
is that they offer the potential for predicting ordering diagrams of many different
types, which is not possible within the more empirical CALPHAD framework and,
very importantly, they provide the possibility of predicting material properties
which are more physically based. If these approaches are adapted too much merely
to achieve high levels of accuracy in the coupling of phase diagrams and thermo-
dynamic properties, the essence of predictability becomes lost and it also may be
that their theoretical basis is submerged. For example, recent attempts with sub-
lattice models for ordering (Ansara et al. 1988, 1995), while being faster than either
CVM or MC, are limited to basic ordering diagrams. They are also empirically
based in that parameters are fitted as part of an optimisation process and, therefore,
any predictive capability is compromised.

There are other factors to be considered. In a number of systems temary phases
exist whose stability indicates that there are additional, and as yet unknown, factors
at work. For example, in the Ni-Al-Ta system 7, which has the Ni3Ti structure,
only exists as a stable phase in ternary alloys, although it can only be fully ordered
in the binary system where it is metastable. However, the phase competes success-
fully with equilibrium binary phases that have a substantial extension into the
ternary system. The existence of the 7-phase, therefore, is almost certainly due to

 

References are listed on pp. 222~226.

===========
CALPHAD—A Comprehensive Guide 221

ternary interactions within the ordered phase itself which would require knowledge
of the interaction energies for higher-order clusters containing all three elements.
The chances of providing a CVM optimisation which is more accurate than
achieved through more empirical approaches may then be small.

The increased computing power necessary to include just binary CVM models
(without even considering any extension to multi-component alloys) then raises
serious question-marks concerning the philosophy of combining CVM-CALPHAD
as a general tool for predicting equilibria in higher-order systems. There may be a
real danger that attempts to combine the current, physically based theoretical
models with more empirically based CALPHAD calculations will not allow the full
strengths of either approach to be properly realised. This prognosis is, of course,
tempered by the fact that there will, inevitably, be advances in theoretical models,
and it may be that in future years CALPHAD will be predominantly based on
models whose basis lies in electronic energy calculations tied to very exact and
fundamental ordering models. However, such a pleasant prospect will probably
only come to fruition in the next decades rather than the next few years.

In the meantime, an excellent example of how ordering models can be used in
practice is given by Enomoto et al. (1991) (Section 7.6.5). These authors showed
that it was possible, using the tetrahedron approximation within CVM, to make
predictions for ordering in multi-component, Ni-based superalloys which could
subsequently be used in the design of /-y'-based single-crystal alloys. Although
within this framework it is not possible to predict more general phase equilibria,
one can envisage a fully integrated FP-CVM approach which would further allow
the possibility of predicting APB and stacking fault energies in the y’-phase and
therefore provide vital input parameters for predicting yield strength or creep resis-
tance in such alloys. Further to this, it may also be possible to predict the formation
of other, important ordered phases found in Ni-based superalloys such as y”.

7.7.2 The prediction of ordering temperatures
As a final comment it is clearly necessary to make a distinction between progress in
evaluating ordering energies and progress in predicting ordering temperatures.
Despite the fact that ordering energies can now, for the most part, be evaluated
accurately from FP, the accurate prediction of ordering temperatures is still
proving elusive in many cases. Although the problem is not as difficult as
predicting melting points, there are still a large number of contributing factors that
have been found to enter into the evaluation of the entropy of the relevant
competing structures. Just as the BWG method has been largely superseded by
VM and MC methods because BWG per se cannot handle sro, so it now appears
that a merely configurational MC approach, which does not take into account
changes in the vibrational spectrum due to ordering, may also prove insufficient.
This means that the predictability of ordering temperatures is going to vary from

===========
222 N. Saunders and A. P. Miodownik

system to system and the accuracy will depend markedly on the relevant structure
and bonding characteristics. If the structure is b.c.c., and bonding forces are sym-
metrical across the system, it may well be that ordering temperatures can be
predicted quite accurately by using the BWG method with a scaling factor. For f.c.c.
systems of reasonable symmetry an equivalent accuracy can only be attained by
using a suitable cluster size within a CVM treatment. However, there will be both
b.c.c. and f.c.c. systems which show asymmetrical bonding behaviour with respect
to composition and/or a temperature dependence of the interaction parameters. In
these cases going to larger cluster sizes, or using the MC method with assumed
constant interaction parameters, will lead to a potential error in predicted ordering
temperatures comparable to the effect of omitting sro in the BWG approximation.

When a suitable algorithm can be found that takes all the relevant factors into
consideration, it will obviously become possible to make more accurate predictions
of the ordering temperature for unknown systems. However, this is likely to be at
the expense of even more computing time than the conventional MC method and
therefore may not lend itself for incorporation into a CALPHAD methodology for
handling multi-component alloys. The possibility of extending T° values from
binary systems into a ternary or higher-order systems will therefore depend on how
far it is possible to make meaningful calculations without knowing the exact site
occupancies for each component, and this is an area which needs further
examination and validation.

REFERENCES

Ackermann, H. (1988) Ph.D. Thesis, RWTH Aachen.

Ackermann, H., Inden, G. and Kikuchi, R. (1989) Acta Met., 37, 1.

Allen, S. M. and Cahn, J. W. (1972) Acta Met., 20, 423.

Ansara, I, Sundman, B. and Willemin, P. (1988) Acta Met., 36, 977.

Ansara, I., Dupin, N., Lukas, H. L. and Sundman, B. (1995) in Applications of Thermo-
dynamics in the Synthesis and Processing of Materials, eds Nash, P. and Sundman, B.
(TMS, Warrendale), p. 273.

Anthony, L., Okamoto, J. K. and Fultz, B. (1993) Phys. Rev. Lett, 70, 1128.

Anthony, L., Nagel, L. J., Okamoto, J. K. and Fultz, B. (1994) Phys. Rev. Lett., 73, 3034.

Asta, M., Ormecci, A., Wills, J. M. and Albers, R. C. (1995) Mat. Res. Soc. Symp. Proc., 364,
157,

Beauchamp, P., Dirras, G. and Veyssiere, P. (1992) Phil. Mag. A., 65, 477.

Becker, J. D, Sanchez, J. M. and Tien, J. K. in High-Temperature Ordered Intermetallic
Alloys IV, eds Johnson, L. A. et al. (1991) Mat. Res. Soc. Symp. Proc., 213, 113.

Becker, J. D and Sanchez, J. M. (1993) Mat. Sci. Eng., A170, 161.

Bethe, H. A. (1935) Proc. Roy. Soc., 150A, 552.

Bichara, C. and Inden, G. (1991) Scripta Met., 25, 2607.

Binder, A. R. (1986) Monte-Carlo Methods in Statistical Physics, ed. Binder, A. R.
(Springer, Berlin).

===========
CALPHAD—A Comprehensive Guide 223

Bragg, W. L. and Williams, E. J. (1934) Proc. Roy. Soc., 145A, 699.

Bragg, W. L. and Williams, E. J. (1935a) Proc. Roy. Soc., 151A, 540,

Bragg, W. L. and Williams, E. J. (1935b) Proc. Roy. Soc., 152A, 231.

Burton, B. and Kikuchi, R. (1984a) Phy. Chem. Minerals, 11, 125.

Burton, B. and Kikuchi, R. (1984b) Amer. Mineralogist, 69, 165.

Burton, B. (1985a) in Computer Modelling of Phase Diagrams, ed. Bennett, L. H. (AIME,
Warrendale, PA), p. 81.

Burton, B. (1985b) in Computer Modelling of Phase Diagrams, ed. Bennett, L. H. (AIME,
Warrendale, PA), p. 129.

Buth, J. and Inden, G. (1982) Acta Met., 30, 213.

Cacciamani, G., Chang, Y. A., Franks, P., Grimwall, G., Kaufman, L., Miodownik, A. P.,
Sanchez, J. M., Schalin, M. and Sigli, C. (1997) CALPHAD, 21, 219.

Carlsson, A. E. (1987) Phys. Rev. B, 35, 4858.

Carlsson, A. E. (1989) Phys. Rev. B, 40, 912.

Ceder, G., Tepesch, P. D., Wolverton, C. and de. Fontaine, D. (1994) in Statics and
Dynamics of Alloy Phase Transformations, eds Turchi, P. E. A. and Gonis, A. (Plenum.
Press, New York), p. 571.

Chandrasekaran, L. (1980) ‘‘Ordering and martensitic transformations in Cu-Zn—Mn shape
memory alloys’, Ph.D. Thesis, University of Surrey, Guildford, UK.

Colinet, C., Pasturel, A., Nguyen Manh, D, Pettifor, D. G. and Miodownik, A. P. (1997)
Phys. Rev. B, 56,(2).

Colinet, C., Inden G. and Kikuchi, R. (1993) Acta Met., 41, 1109.

Connolly, J. W. and Williams, A. R. (1983) Phys. Rev. B., 27, 5169.

Crusius, S. and Inden, G. (1988) in Proc. Int. Symp. Dynamics of Ordering Processes in
Condensed Matter, Kyoto 1987, eds Komura, S. and Furukawa, H. (Plenum Press, New
York), p. 139.

de Fontaine, D. (1975) Acta. Met., 23, 553.

de Fontaine, D. (1979) Solid State Physics, 34, 73.

de Fontaine, D. (1994) Solid State Physics, 47, 33.

de Fontaine, D. and Kikuchi, R. (1978) in Applications of Phase Diagram in Metallurgy and
Ceramics, ed. Carter, G. (NBS Special Publication SP 496, Gaithesburg), p. 999.

de Fontaine, D., Willie, L. T. and Moss, S. C. (1987) Phys. Rev. B, 36, 5709.

Ducastelle, F. (1989) in Alloy Phase Satability, eds Stocks, G. M. and Gonis, A. (NATO ASI
series E Appl. Sci. 163, Kluwer Acad. Publ.), p. 2329.

Ducastelle, F. (1991) Order and Phase Stability in Alloys, Cohesion and Structure, Vol. 3,
eds de Boer, F. R. and Pettifor, D. G. (Elsevier, Amsterdam).

Ducastelle, F. and Gautier, F. (1976) J. Phys. F, 6, 2039.

Dunweg, B. and Binder, K. (1987) Phys. Rev., B36, 6935.

Enomoto, M. and Harada, H. (1991) Met. Trans. A, 20A, 649.

Enomoto, M., Harada, H. and Yamazaki, M. (1991) CALPHAD, 15, 143.

Ferreira, L. G., Wolverton, C. and Zunger, A. (1997) submitted to J. Chem. Phys..

Finel, A. (1994) in Statics and Dynamics of Alloy Phase Transformations, ed. Turchi, P. B.
A. and Gonis, A. (Plenum Press, New York), p. 495.

Flinn, P. A. (1960) Trans. AIME, 218, 145.

Fowler, R. H. and Guggenheim, E. A. (1939) in Statistical Mechanics (Cambridge University
Press, Cambridge), p. 162.

  

 

===========
224 N. Saunders and A. P. Miodownik

Fukaya, M., Miyazaki, T. and Kozakai, T. (1991) J. Mat. Sci., 26, 5420.

Fultz, B. (1992) Phil. Mag. B, 193, 253.

Fultz, B. (1994) in Statics and Dynamics of Alloy Phase Transformations, eds Turchi, P. E.
A. and Gonis, A. (Plenum Press, New York), p. 669.

Fultz, B., Anthony, L., Nagel, L. J., Nicklow, R. M. and Spooner, S. (1995) Phys. Rev. B, 52, 3315.

Garbulsky, G. D. and Ceder, G. (1996) Phys. Rev. B, 53, 8993.

Gonis, A., Zhang, X. G., Freeman, A. J., Turchi, P., Stocks, G. M. and Nicholson, D. M.
(1987) Phys. Rev. B, 36, 4630.

Golosov, N. S., Pudan, L. Ya., Golosova, G. S. and Popov, L. E. (1972) Sov. Phys. Sol. State,
14, 1280.

Gorsky, V. S. (1928) Z. Phys., 50, 64.

Grimwall, G. (1996) J. Alloys and Compounds, 233, 183.

Guggenheim, E. A. (1935) Proc. Roy. Soc., A148, 304,

Hansen, M. and Anderko, K. (1958) Constitution of Binary Alloys: 2nd ed. (McGraw-Hill,
New York).

Hillert, M. and Jarl, M. (1978) CALPHAD, 2, 227.

Hong, L. B., Anthony, L. and Fultz, B. (1995) J. Mat. Res., 10, 126.

Inden, G. (1974) Z. Metallkde., 65, 94.

Inden, G. (1975a) Z. Metallkde., 66, 577.

Inden, G. (1975b) Z. Metallkde., 66, 648.

Inden, G. (1976) Proc. CALPHAD V, paper Ill.1.

Inden, G. (1977a) Z. Metallkde., 68, 529.

Inden, G. (1977b) J. de Physique, Coll. C.7, Suppl., 38, 373.

Inden, G. (1979) Phys. Stat. Sol., 56, 177.

Inden, G. (1981) Physica, 103B, 82.

Inden, G. (1982) Bulletin of Alloy Phase Diagrams, 2, 406.

Inden, G. (1983) Mat. Res. Soc. Symp., 19, (Elsevier, New York), p. 175

Inden, G. (1991) Scand. J. Metallurgy, 20, 112.

Inden, G. and Pitsch, W. (1991) in Materials Science and Technology, Vol. 5, ed. Haasen, P.
(VCH Verlagsgesellschaft, Weinheim), p. 497.

Inden, G., Bruns, S. and Ackermann, H. (1986) Phil. Mag. A, 53, 87.

Ishida, K., Shumiya, T., Nomura, T., Ohtani, H. and Nishizawa, T. (1988) J. Less. Comm.
Metals, 142, 135.

Khachaturyan, A. G. (1978) Prog. Mater. Sci., 22, 1.

A. G. and Mortis, J. W. (1987) Phil. Mag. A., 56, 517.

Kikuchi, R. (1951) Phys. Rev., 81, 988.

Kikuchi, R. (1966) Suppl. Prog. Theor. Physics, 35, 1.

Kikuchi, R. (1974) J. Chem. Phys., 60, 1071.

Kikuchi, R. (1977) J. de Physique, Coll. C7, Suppl., 38, 307.

Kikuchi, R. and Sato, H. (1974) Acta. Met., 22, 1099,

Kikuchi, R. and von Baal, C. M. (1974) Scripta Met., 8, 425.

Kikuchi, R. and Cahn, J. W. (1987) in User Applications of Phase Diagrams, ed. Kaufman,
L. (ASM, Metals Park, OH), p. 19.

Kikuchi, R, and Choi, J. S. (1989) Physica C, 160, 347.

Kozakai, T. and Miyasaki, T. (1993) in Computer Aided Innovation of New Materials II, eds
Doyama, M, et al. (Elsevier, Amsterdam), p. 767.

===========
CALPHAD—A Comprehensive Guide 225

Kozakai, T. and Miyazaki, T. (1994a) ISIJ International, 34, 373.

Kozakai, T. and Miyazaki, T. (1994b) J. Mat. Sci., 29, 652.

Laks, D. B. et al. (1992) Phys. Rev. B, 46, 12,587.

Le, D. H., Colinet, C., Hicter, P. and Pasturel, A. (1991) J. Phys. Cond. Matter, 3, 7895; ibid
9965.

Lee, B.-J., Lee, S. K. and Lee, D. N. (1987) CALPHAD, 11, 253.

Li, Y, (1949) Phys, Rev., 76, 972.

Lu, Z. W., Wei, S. H., Zunger, A., Frota-Pessao, S. and Ferreira, L. G. (1991) Phys. Rev. B,
44, 512.

Magri, R., Bernard, J. E. and Zunger, A. (1991) Phys. Rev. B., 43, 1593.

Miyazaki, T., Isobe, K., Kosakai, T. and Doi, M. (1987) Acta Met., 35, 317.

Miodownik, A. P. and Saunders, N. J. (1995) in Application of Thermodynamics in the
Synthesis and Processing of Materials, eds Nash, P. and Sundman, B. (TMS, Warrendale,
PA), p. 91.

Mohri. T, Sanchez, J. M., and de Fontaine, D. (1985) Acta Met., 33, 1171.

Mohri, T. Kobayashi, C. and Watanabe, K. (1988) Mem. Fac. Eng. Hokkaido Univ.,
XVII(3), 76. -

Mohri, T., Koyanagi, K., Ito, T. and Watanabe, K. (1989) Jap. J. Appl. Phys., 28, 1312.

Mohri, T., Sugawara, Y., Watanabe, K. and Sanchez, J. M. (1992) Mat. Trans. Jap. Inst.
Met., 33, 558.

Nakamura, K., Mohri, T. and Ito, T (1991) Bull. Fac. Eng. Hokkaido Univ., 155, 19.

Neumann, J. P. and Chang, Y. A. (1979) Z. Metallkde., 70, 118.

Nishizawa, T., Hasebe, M. and Ko, M. (1979) Acta Met., 27, 817.

Oates, W. A., and Wentl, H. (1996) Scripta Mater., 35, 623.

Oates, W. A., Spencer, P. J. and Fries, S. G. (1996) CALPHAD, 20, 481.

Ohtani, H., Kojima, K., Ishida, K. and Nishizawa, T. (1992) J. Alloys and Compounds, 182,
103.

Osorio, R., Lu, Z. W., Wei, S.-H., and Zunger, A. (1993) Phys. Rev. B, 47, 9985.

Pasturel, A., Colinet, C., Paxton, A. T. and van Schilfgaarde, M. (1992) J. Phys. Cond.
Matter, 4, 945.

Richards, M. J, and Cahn, J. W. (1971) Acta Met., 19, 1263.

Rubin, G, and Finel, A. (1993) J. Phys. Condensed Matter, 5, 9105.

Sanchez, J. M., Ducastelle, F. and Gratias, D. (1984a) Physica, 128A, 334.

Sanchez, J. M., Jarrett, R. N., Sigli, C. and Tien, J. K. (1984b) in HighTemperature Alloys:
Theory and Design, ed. Stiegler, O. R. (TMS, Warrendale, PA), p. 83.

Sanchez, J. M. (1992) in Structure and Phase Stability of Alloys, eds Moran-Lopez et al.
(Plenum Press, New York), p. 151.

Sanchez, J. M. and de Fontaine, D. 1980 Phys. Rev., B21, 216.

Sanchez, J. M., de Fontaine, D. and Teitler, W. (1982) Phys. Rev. B, 26, 1465.

Sigli, C. (1986) ‘‘On the electronic structure and thermodynamics of alloys’’, Ph.D, Thesis,
Columbia University.

Sigli, C. and Sanchez, J. M. (1985) Acta Met., 34, 1021.

Silverman, A., Zunger, A., Kalish, R. and Adler, J, (1995) J. Phys. 7(6), 1167.

Sluiter, M. and Turchi, P. E. A. (1989) Phys. Rev. B, 40, 11,215.

Sluiter, M., Turchi, P. E. A. and de Fontaine, D. (1987) J. Phys. F, 17, 2163.

Shuiter, M., Turchi, P. E. A., Pinski, F. J. and Stocks, G. M. (1992) J. Phase Equilibria, 13, 605.

===========
226 N. Saunders and A. P. Miodownik

Sluiter, M., Turchi, P. E. A., Zezhong, F. and de Fontaine, D. (1988) Phys. Rev. Lett., 60,
716.

Sundman, B. and Mohri, T. (1990) Z. Metallkde., 81, 251.

Sundman, B. and Aldinger, F. (1995) Ringberg (1) Workshop, CALPHAD, 19, 433.

Tepesch, P. D., Kohan, A. F., Garbulsky, G. D., Ceder, G., Coley, C., Stokes, H. T., Boyer,
L.L., Mehl, M. J., Burton, B. P., Cho, K. and Joannopoulos, J. (1996) J. Am. Cer. Soc., 79,
2033-2040.

Tetot, R., Giaconia, C., Nacer, B. and Boureau. G (1994) in Statics and Dynamics of Phase
Transformations, eds Turchi, P. E. A. and Gonis, A. (Plenum Press, New York), p. 577.

Tso, N. C, Sanchez, J. M. and Tien, J. K (1989) in Superalloys, Supercomposites and
Superceramics, eds Tien, J. K. and Caulfield, T. (Academic Press, New York). p. 525.

Tso, N. C. (1992) ‘Thermodynamic modelling of ternary alloy phase solubility’, Ph.D.
Thesis, Columbia University.

Turchi, P. E. A. (1994) in Intermetallic Compounds, Vol 1, eds Westbrook, J. H. and
Fleischer, R. L. (John Wiley, New York), p. 21.

Turchi, P. E. A. and Finel, A. (1992) Phys. Rev. B, 46, 702.

Turchi, P. E. A. and Sluiter, M. (1992) Mat. Res. Soc. Symp., 253, 227.

Turchi, P. E. A. and Sluiter, M. (1993) in Computer Aided Innovation of New Materials II,
eds Doyama, M. et al. (Elsevier, Amsterdam), p. 1449.

Turchi, P. E. A, Reinhard, L. and Stocks, G. M. (1994a) Phys. Rev. B., 50, 15,542.

Turchi, P. E. A., Singh, P. P., Sluiter, M. and Stocks, G. M. (1994b) in Metallic Alloys:
Experimental and Theoretical perspectives, eds Faulkner, J. S. and Jordan, R. G. (Kluwer
Acad.), p. 177.

Turchi, P. E. A., Sluiter, M., Pinski, F. J., Johnson, D., Nicholson, D. M., Stocks, G. M. and
Staunton, J. B. (1991) Phys. Rev. Lett, 67, 1779.

Turchi, P. E. A., Stocks, G. M., Butler, W. H., Nicholson, D. M. and Gonis, A. (1988) Phys.
Rev. B, 37, 5982.

van Baal, C. M. (1973) Physica, 64, 571.

Wei, S.-H., Ferreira, L. G. and Zunger, A. (1990) Phys. Rev. B, 41,(12), 8240.

Wolverton, C. and Zunger, A. (1997) J. Comp. Mat. Sci 8(1-2), 107.

Yang, C. N. and Li, Y. (1947) Chinese J. Phys., 7, 59.

Zunger, A. (1993) Japanese J. Appl. Phys., 32(Supplement 3), 14.

Zunger, A. (1994) in Statics and Dynamics of Phase Transformations, eds Turchi, P. E. A.
and Gonis, A. (Plenum Press, New York), p. 361.
