Chapter 10
The Application of CALPHAD Methods

10.1, INTRODUCTION

The purpose of this chapter is to describe the current state of the art for what can be
achieved in terms of CALPHAD calculations. It will start with a brief history on
how CALPHAD calculations have been used in the past and then concentrate on
the complex multi-component materials that can be treated by the software
packages described in the previous chapter on computational methods. It will also
concentrate on calculations for ‘real’ materials, which are mainly multi-component
and, where possible, comparisons will be made with experimental observations.
Little time will, therefore, be spent on binary and ternary calculations, although
these can be quite complex and have their own points of interest. There are now so
many such calculations that it would be impossible to cover the full range here.
Also they must now be considered rather as building blocks for use in calculations
which are multi-component in nature. For more extended information the reader is
therefore pointed to the 20-year index of the CALPHAD journal (CALPHAD 1997)
where calculations of binary and ternary systems are regularly published. Some
examples of calculated binary and temary diagrams are shown in Figs 10.1 and
10.2. They show the formation of non-stoichiometric binary and ternary
compounds, order—disorder transformations (G/B2 in Ti-AI-Nb), ionic liquids
with miscibility gaps, multiple sub-lattice phases, spinel phases, etc., and help
demonstrate the state of the art which can now be achieved.

It is possible to separate calculations made under the CALPHAD umbrella into a
number of strands. One major area is concerned with substance databases where,
with the general exception of the gas phase, phases are modelled as stoichiometric.
The problems associated with Gibbs energy minimisation are simpler for such
calculations, but they can often involve much larger numbers of phases than would
be considered in a multi-component alloy. Alloys probably still account for the
majority of CALPHAD publications, as a review of the CALPHAD journal shows a
preponderance of papers in this area. This relates back to the development of
solution databases, which are more complex in nature than substance databases,
and also to the intrinsic early problems of CALPHAD associated with factors such
as lattice stabilities and development of new models for metallic systems. The
development of models for ionic systems is also another significant, and growing
area, sharing much in common with the principles driving the development of alloy

299

===========
300 N. Saunders and A. P. Miodownik

 

TEMPERATURE_CELSIUS

 

 

60 80
MOLE_PERCENT C MOLE_PERCENT TI

(c) $i02-CaO

3200

2400
2200

  

2000

Temperature / K

   

1816.88
1000 nue A 481 |
. maar
1400 <
00 402 04 06 08 1.0
sio2 Xero ca

Figare 10.1 Calculated binary phase diagrams for (a) Mo-C (Andersson 1988),
(b) Co-Ti (Saunders 1996c) and (c) CaO-SiO, (Taylor and Dinsdale 1990).

calculations. In ionic systems the aim is to develop models which represent both the
mixing properties of ionic substances as well as allowing these to be combined with
substance and alloy databases. At present most CALPHAD software packages
include models which deal with aqueous solutions, but their general usage has not
been great, which is also true for organic systems.

10.2, EARLY CALPHAD APPLICATIONS

Broadly speaking, the first application of CALPHAD methods was intrinsically
coupled to experimental thermodynamic or phase-diagram measurements. For

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 301

    
        

0.0 #4
0 2 = 40 & 60 8000 C29.0 02. HB
MOLE_PERCENT MO Mole fraction MgO.

(c)

 
  
  

2)" a.

0 720 © 40 60ALTi 89 100
MOLE_PERCENT AL

Figure 10.2 Calculated ternary isothermal sections for (a) Ni-Mo-Re at 1000°C
(Saunders 1997c), (b) CaQ-MgO-AI203 at 2000 K (Hallstedt 1992) and (c)
isothermal section of Ti-Al-Nb at 100°C (Saunders 1996a).

example, early work by Kaufman and Clougherty (1964) on Ti-O both explored
aspects of modelling as well as coupling of their calculations to experimentally
determined O activities. In Europe a number of groups, particularly some of the
founder-members of the Scientific Group Thermodata Europe (SGTE), were
strongly interested in systems of interest to Fe-based alloys, and work by Counsell
et al. (1972) on Fe-Ni-(Cu, Cr), by Harvig et al. (1972) on Fe-X-C systems and
Ansara and Rand (1980) on Fe-Cr-Ni-C clearly demonstrates the concept of
coupling of a CALPHAD calculation with experimental determination of phase
boundaries and thermodynamics.

An example of an early paper on a binary system is the work of Spencer and
Putland (1973) on Fe-V. This combined a review of the thermodynamics and phase
diagram of the Fe-V system with new, selective experimental thermodynamic

===========
302 N. Saunders and A. P. Miodownik

1500

~~~» Experiment

—— Calculated
1300

1100

900 |

TEMPERATURE, °C

700

500

300

 

 

Fe 0.2 04 0.6 08 v
xy

Figure 103 Calculated a+ phase boundary for Fe-V with experimental
boundaries superimposed.

measurements in order to provide a thermodynamic assessment of the a/o-phase
boundary in this system. Figure 10.3 shows a diagram calculated with their
parameters and compares this with the experimentally determined phase diagram.
Since then, new assessments have been made for this system, but apart from
changes in models and the inclusion of the liquid and y phases (which are in
themselves important developments) the form of the calculated diagram in the
region of interest to Spencer and Putland (1973), as well as the calculated
thermodynamic properties, have not essentially changed.

In ternary alloys, coupling thermodynamic calculation with experimental work
is often essential and a good example of such work is found in the assessment of
Cr-Fe-W by Gustafsson (1988). Figure 10.4 shows a calculated isothermal section

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 303

1273 K

           

{ey St
Dp [pS
0 0.2 0.4 0.6 08 1.0

MOLE_FRACTION W

Figure 10.4 Calculated isothermal section of the Cr-Fe-W system with
experimental tie-lines superimposed (Gustafson 1988).

  
 

 

    

at 1273 K which is compared with wide-ranging tie-line experiments carried out by
the same author. Ideally, it is helpful to have new experimental backing for
assessment work but enough information may exist so that a good assessment can
be made with data already available in the literature. Increasingly, the latter
situation is becoming the more usual route to providing ternary assessments but, in
the authors’ opinion, if high-quality results are needed, and there are discrepancies
between various literature references, highly accurate experimentation on a small
scale is a worthwhile undertaking. An example of such an approach is that
undertaken by Yang et al. (1992a, b) for the Ni-AI-Ti system, where a few alloys
in the B/6'/7’ ternary phase field were all that was necessary to accurately fix this
particular phase equilibrium, which was crucial to the development of a new type
of intermetallic alloy. The concept of a detailed optimisation of thermodynamic
parameters, although initially slower in generating large quantities of data, has
eventually led to the ability to make highly accurate calculations in higher-order
systems.

The development of models and concepts was also of major importance in the

===========
304 N. Saunders and A. P. Miodownik

development of CALPHAD techniques, particularly when dealing with the so-
called ‘lattice stability’ concept and intermetallic phases. Kaufman (1967) and
Kaufman and Bernstein (1970) constructed many different phase diagrams using
ideal or regular solution theory and assessed values for the energy differences
between the f.c.c., b.c.c. and c.p.h. phases for many elements. The work clearly
demonstrated that the correct forms of phase diagrams could be matched with
simple concepts and models. Although these diagrams cannot now be considered
accurate enough for detailed application, there is little doubt that correct trends
were predicted, and this more than anything confirmed the validity of a number of
the fundamental concepts of the CALPHAD route.

Probably the most fundamental change in modelling, particularly in the solid
state, has occurred through the development and application of the sub-lattice
model (see Chapter 5). In early years the mathematical formalisms for describing
substitutional solid solutions had been well established and it was these types of
models which were first employed for phases such as the B2, NiAl phase in Ni-Al
(Kaufman and Nesor 1978b) (Fig. 10.5) and the o phase in Cr-Fe (Chart et al.
1980) (Fig. 10.6). Otherwise intermetallic compounds were usually treated as line
compounds (Figs 10.5 and 10.7). The disadvantages of both models are substantial.
Firstly, in multi-component space it is difficult to model properties of compounds
which have preferred stoichiometries and sub-lattice occupation, using a model
which essentially describes random mixing on a single sub-lattice. Secondly, in

@) (b)

   

2500

Calculated Observed

Figure 10.5 (s) Calculated and (b) observed Ni-Al phase diagram (from
Kaufman and Nesor 1978b).

 

References are listed on pp. 402-408.

===========
CALPHAD— A Comprehensive Guide 305

1000

1

8

TEMPERATURE_CELSIUS

400

300
0 20 40 60 80 100

MOLE_PERCENT CR

Figure 10.6 Calculated low-temperature region of the Cr-Fe system (Chart et all.
1980).

(a) (b)

i= ey

 

  
 

 
   
  

3500 iqui Liquid
+

 

Liquid

   
  
 
 
   
 

+
Graphite Graphite
| | Pe 3000
2500
we we
wc +
+ Graphite 2000 Graphite
we
1500
bee + WC wewe
1000
w W5C2 c
Calculated Observed (12)

Figure 10.7 (2) Calculated and (b) observed W-C phase diagram (from Kaufman
and Nesor 1978a).

===========
306 N. Saunders and A. P. Miodownik

systems where solubility ranges are very important, for example the 7’ phase in Ni-
based superalloys, the stoichiometric compound approach can never achieve high
levels of accuracy.

The sub-lattice model is now the predominant model used in most CALPHAD
calculations, whether it be to model an interstitial solid solution, an intermetallic
compound such as 7-TiAl or an ionic solution. Numerous early papers, often
centred around Fe-X-C systems, showed how the Hillert-Staffansson sub-lattice
formalism (Hillert and Staffansson 1970) could be applied (see for example
Lundberg et al. (1977) on Fe-Cr-C (Fig. 10.8) and Chatfield and Hillert (1977) on
Fe-Mo-C (Fig. 10.9)). Later work on systems such as Cr-Fe (Andersson and
Sundman 1987) (Fig. 10.10) showed how a more generalised sub-lattice treatment
developed by Sundman and Agren (1981) could be applied to multi-sub-lattice
phases such as o.

Alongside calculations for alloy systems, complex chemical equilibria were also

 

FE-CR-C
973 K

4 +My 3C, + MAC

(CHROMIUM CONTENT UCR

a+ M,C + M,C

 

0.02 0.06 0.10 0.14 0.18 0.22 0.26 0.30 0.34 0.38 0.42

CARBON CONTENT UC

Figure 10.8 Calculated isothermal section for Fe~Cr~C at 973 K (Lundberg et al.
1977). Axes are in U-fractions where UCR=xcy/(I-xc) and UC=x¢/(I-x¢).

 

References are listed on pp. 402-408.

===========
CALPHAD— A Comprehensive Guide 307

FE-MO-C

 

0.45

      

038 ye cred

Molybdenum content UMO

0.25

0.15

Y#8+CEM
0.05

 

0.03 0.09 0.15 0.21 0.27 0.33 0.39 0.45 0.51 0.57

Carbon content UC

Figure 10.9 Calculated isothermal section for Fe-Mo-C at 1223 K (Chatfield and
Hillert 1977). Axes are in U-fractions where UMO=xyo/(1I~xc) and UC =x¢/(I-x¢).

2000
1800 Lig

1600

1400

1200

1000

TEMPERATURE_CELSIUS

800

a, +a,

 

 

0 20 40 60 80 100
MOLE_PERCENT CR
Figure 10.10 Calculated Cr-Fe phase diagram (Andersson and Sundman 1987).

===========
308 N. Saunders and A. P. Miodownik

being dealt with on a routine basis. These calculations centred around so-called
‘substance’ databases, which include data for condensed, stoichiometric substances
and an ideal gas phase containing many different species. In essence, the compu-
tational aspects of such calculations are less severe than for alloy or ionic systems
which are dominated by more complex models. However, they have a complexity
of their own as the input of only a few elements gives rise to substantial numbers
of substances and gaseous species. For example, in a gas-phase reaction involving
C-H-N-O there could be some 60 various gaseous species. Furthermore, in fields
such as environmental studies, it is important to consider low levels of activity, so it
is not always possible to simplify the potential reactions by ‘suspending’ species if
they exist below a certain critical limit.

The simplicity of modelling in ‘substance’-type calculations meant that com-
plex systems could be studied at an early stage of CALPHAD development. The
SolGasMix programme of Eriksson (1975) was one of the first to provide such a
capability, and within a decade very complex systems were being routinely
handled; two good examples are given in the CALPHAD volume dedicated to
Eriksson in 1983. Lindemer (1983) was able to look at gas-phase reactions in a
fission reaction involving U-Cs-I-Ba-Zr—Mo considering 18 gaseous species and
20 condensed substances. Another interesting example of a calculation based
mainly on a substance database is given in the work of Lorenz et al. (1983) who
were interested in the stability of SiC-based ceramics containing ZrO, and other
oxides. This involved the quaternary system SiC-ZrO2-Al.03-SiO, reacting in
inert argon gas, and gave rise to 36 gaseous species and 22 stoichiometric, solid
substances. Calculations of the reaction for various composite mixtures of SiC and
oxides were then made as functions of temperature and pressure. Calculations
involving so many phases were not being routinely handled at this time for
systems such as steels, where non-ideal mixing in most of the solid phases is the
norm.

There now exists a thriving community of researchers who regularly publish
thermodynamic assessments for binary and temary systems. Many are extremely
accurate and, due to a formalisation of unary data proposed by SGTE (Dinsdale
1991), these can be combined with existing or future work in the establishment of
multi-component solution databases, where the promise of CALPHAD methods is
greatest. In many ways an accurate thermodynamic assessment of a binary or
temary system only proves again the validity of the fundamental concepts laid
down in earlier years. The models have improved and, therefore, levels of accuracy
level have improved, but most commonly used materials are multi-component in
nature and the degree to which binary and ternary assessments can be applied per se
is fundamentally limited. The key issue is how to extend the CALPHAD route to
‘real’ rather than ‘ideal’ materials, and the next section will concentrate on this
issue.

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 309

10.3. GENERAL BACKGROUND TO MULTI-COMPONENT CALCULATIONS

10.3.1 Introduction

From their earliest days CALPHAD methods have always promised to be
extendable to complex materials. Certainly, the necessary mathematical formula-
tions to handle multi-component systems have existed for some time and have been
programmed into the various software packages for calculation of phase equilibria.
However, it is interesting to note that, until quite recently (with the exception of
steels), there has been little actual application to complex systems which exist in
technological or industrial practice, other than through calculations using simple
stoichiometric substances, ideal gas reactions and dilute solution models. The latter
have been used for some time, as it is not intensive in computational terms, and
some industrially important materials, although containing many elements, are
actually low in total alloy or impurity content, e.g., HSLA steels. Examples in this
area can be found in Kirkaldy et al. (1978), Bhadeshia and Edmond (1980), Hack
and Spencer (1985) and Kroupa and Kirkaldy (1993). The limitations of dilute
solution models have been discussed earlier in Chapter 5 and, although useful for
certain limited applications, they are not applicable in a generalised way and could
not begin to handle, with any accuracy, complex alloy types such as stainless steels
or Ni-based superalloys. Substance calculations, while containing large numbers of
species and condensed phases, are, in many ways, even more limited in their
application to alloys as they do not consider interactions in phases involving
substantial mixing of the components.

The main areas of application for more generalised models have, until recently,
been restricted to binary and ternary systems or limited to ‘ideal industrial materials’
where only major elements were included. The key to general application of
CALPHAD methods in multi-component systems is the development of sound,
validated thermodynamic databases which can be accessed by the computing
software and, until recently, there has been a dearth of such databases.

The notable exception to this trend was steels and, in particular, stainless and
high-speed steels where alloy contents can rise to well above 20wt%. For such
alloys a concentrated solution database (Fe-base) has existed since 1978, based on
work done at the Royal Institute of Technology (KTH), Stockholm, Sweden.
However, although it is far more generalised than dilute solution databases, its
range of applicability is limited in temperature to between 700° and 1200°C. Work
since 1978, mainly by the Royal Institute of Technology, has seen the development
of a new steel database, TCFe, for use in Thermo-Calc. This work now forms the
basis for steel calculations in the SGTE solution database. More recently, TCFe has
been extended and improved by Saunders and Sundman (1996). These newer
databases have a number of distinct advantages over the old Fe-base, not least in
that liquid-phase equilibria is now taken into account.

The lack of similar databases for other material types presented severe problems

===========
310 N. Saunders and A. P. Miodownik

for CALPHAD calculations with any of the other commonly used materials and led
to a concentration of application to steels. However, in the past four years further
multi-component databases have been developed for use with Al-, Ni-, Ti- and
TiAl-based alloys (Saunders 1996a-c, 1997a,b). These databases have been created
mainly for use with industrial, complex alloys and the accuracy of computed results
has been validated to an extent not previously attempted. Simple, statistical analysis
of average deviation of calculated result from experimental measurement in ‘real’,
highly alloyed, multi-component alloys has demonstrated that CALPHAD methods
can provide predictions for phase equilibria whose accuracy lies close to that of
experimental measurements.

The importance of validation of computed results cannot be stressed too highly.
We are now in a position where computational speed has allowed the development
of modelling in many related areas. These models often rely on input data which
can be time-consuming to measure but can be readily predicted via CALPHAD and
related methods. Therefore, CALPHAD results may be used as input for other
models, for example, in the manufacture of a steel starting from the initial stages in
a blast furnace, through the refinement stages to a casting shop, followed by heat
treatment and thermomechanical processing to the final product form. All of these
stages can be modelled and all use input data which can be provided either directly
or indirectly from CALPHAD calculations. Such a future total modelling capability
will never materialise properly until confidence can be placed in the predictions of
each of the building blocks. In the case of CALPHAD methods, the key to this is
the availability of high-quality databases and the rest of this section will
concentrate on databases and discuss some of the strategies in their construction.

10.3.2 Databases

10.3.2.1 ‘Substance’ databases. Basically substance databases have little
complexity as they are assemblages of assessed data for stoichiometric condensed
phases and gaseous species. They have none of the difficulties associated with non-
ideal mixing of substances, which is the case for a ‘solution’ database. However, an
internal self-consistency must still be maintained. For example, thermodynamic
data for Cis), Or<g> and CO2<g> are held as individual entries, which provide their
requisite properties as a function of temperature and pressure. However, when put
together in a calculation, they must combine to give the correct Gibbs energy
change for the reaction Ci+O2<g-CO2<g>. This is a simple example, but
substance databases can contain more than 10,000 different substances and,
therefore, it is a major task to ensure internal self-consistency so that all
experimentally known Gibbs energies of reaction are well represented. Examples of
substance databases of this type can be found in the review of Bale and Eriksson
(1990).

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 311

10.3.2.2 ‘Solution’ databases. Solution databases, unlike substance databases,
consider thermodynamic descriptions for phases which have potentially wide
ranges of existence both in terms of temperature and composition. For example, the
liquid-phase can usually extend across the whole of the compositional space
encompassed by complete mixing of all of the elements. Unlike an ideal solution,
the shape of the Gibbs energy space which arises from non-ideal interactions can
become extremely complex, especially if non-regular terms are used. Although it
may seem an obvious statement, it is nevertheless important to remember that
thermodynamic calculations for complex systems are multi-dimensional in nature.
This means that it becomes impossible to visualise the types of Gibbs energy curves
illustrated in earlier chapters which lead to the easy conceptualisation of miscibility
gaps, invariant reactions, etc. In multi-component space such things are often
difficult to understand, let alone conceptualise. Miscibility gaps can appear in
ternary and higher-order systems even though no miscibility gap exists in the
lower-order systems. The Gibbs phase rule becomes vitally important in under-
standing reaction sequences, but often one has to accept the computer predictions
which can be surprising at times. This emphasises the need to validate the database
for multi-component systems and leads inexorably to the concept of two types of
database.

10.3.3 The database as a collection of lower order assessments

Essentially this is the basic concept of any database, but an unthinking application
of this concept is dangerous. It can be easily demonstrated that in multi-component
calculations the properties of some substances, or lower-order interactions in
solution phases, are ineffective in modifying phase equilibria, while in other cases
some are extremely critical. This may be because the total energy of the system is
very exothermic and a particular Gibbs energy term is close to ideal. In this case a
change of a few hundred percent in a binary value actually alters things very little.
Other reasons may exist for the precise value of an interaction being non-critical.
For example, the equilibrium solubility of elements in a particular phase may be
small and the )7; 5); xi; solubility product subsequently produces small changes
in total energy, even if interaction coefficients are heavily modified. This leads to a
number of important questions and concepts. The first and most important question
is how many of the constituent substances or lower-order interactions must be
accurately represented before a successful calculation can be guaranteed.

Let us take the example of a simple commercial alloy such as Ti-6AI-4V. This is
the most popular structural Ti alloy used worldwide. Essentially one would need to
consider Ti-Al, Ti-V and AI-V binary interactions and Ti-Al-V ternary inter-
actions. Unfortunately, although called Ti-6AI-4V, this alloy also contains small
amounts of O, C, N and Fe and it therefore exists in the multi-component space
within the Ti-Al-V-O-C-N-Fe system. There are then 21 potential binary

===========
312 N. Saunders and A. P. Miodownik

interactions and 35 possible ternary interactions to consider. The number of
thermodynamic assessments necessary to obtain all of these parameters is
obviously massive, and the inclusion of an additional element to the alloy means
a further 7 binary and 21 ternary assessments would potentially need to be made.
This would make a total of 28 binary and 56 ternary assessments. The effort to do
all of this is so large that it is much easier (and cheaper) to consider an almost
exclusively experimental route to determining phase equilibria in the commercial
Ti-6Al-4V alloy. This can be enhanced with regression analysis techniques to
specify the effect of various elements on critical features such as the temperature
when the alloy becomes fully 3.

Fortunately, it is not necessary to perform all of these thermodynamic
assessments. In essence one should ensure that all of the binary systems are
completed, but the levels of C and N are so low that it is possible to effectively
ignore interaction parameters between these two elements, even if they were
possible to determine. The percentage of ternary assessments which is necessary to
provide an accurate calculation is, in reality, small, mainly because the ternary
Di Dj Le 217 ;te solubility product can be small for the minor elements. For
example, the effect of including ternary parameters for Fe-C-N, which are basic-
ally impurity elements, is negligible and little effect is found from the Fe-V-N
system even though it contains one of the major elements.

It can therefore be seen that if we wish to consider making calculations for the
Ti-6AI-4V alloy, the actual amount of work is much reduced from the theoretical
number of permutations. However, this is a particularly simple Ti-alloy and another
type such as IMI 834 typically contains Ti, Al, Sn, Zr, Nb, Si, C, O, N and Fe,
where seven elements have a significant effect on phase equilibria. The general
problem, therefore, remains as to how to judge the number of the potential inter-
actions which must be included, so that a successful multi-component calculation
can be made. This cannot be answered in a simple fashion and the position is
considerably exacerbated if one wishes to make a generalised database applicable
for many material types. If reliable and accurate multi-component calculations are
to be made, new paradigms are required and it is no longer possible to consider
using databases which are basically constructed as collections of assessed binary
and ternary systems which might be available at the time. The database itself must
be assessed.

10.3.4 Assessed databases

By definition ‘assessed databases’ are focused, usually on material types. The
recent Al-, Ni- and Ti-databases (Saunders 1996a-c) and, to a large degree, the Fe-
databases produced by KTH in Stockholm are good examples. They contain up to
15 elements and have been designed for use within the composition space
associated with the different material types. All, or most, of the critical binary and

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 313

ternary systems have been assessed and calculated results have been validated as
being successful. The words italicised in the previous sentence hold the key
paradigms which need to be employed when designing an assessed database.

Composition space. It is firstly of critical importance that a well-understood and
properly circumscribed composition space is defined. This is best done by consider-
ing databases for use with particular material types, for example steels, conven-
tional Ti alloys, etc. This firstly limits the number of elements which need to be
considered and also helps to define concentration limits for these elements.

Critical systems. It is impossible just by looking at a list of elements to decide
which are the critical binary and ternary systems that must be critically assessed.
However, some clear pointers can be gained by looking at the composition space in
which the database is to be used. For example, B levels in Ni-based superalloys as a
rule do not exceed 0.1 wt% and, therefore, assessment of B-rich ternary and higher-
order alloys is unnecessary. There are, however, critical B-containing ternary
systems which must be assessed to understand the thermodynamics of the M;Bz
phase which can appear. Likewise, the thermodynamics of the MC carbide must be
well defined and this includes a large number of carbon-containing ternary systems.
On the other hand, although Ti, Ta and Nb may appear in the alloy in much larger
amounts than B and C, a ternary assessment of Ti-Ta—Nb is not critical as the
magnitude of the thermodynamic interactions are small which, combined with the
XX; Le 2257s Solubility product term, makes for small Gibbs energy changes.
The understanding of the critical systems in an assessed database is in the hands of
the developer of the database and can often only be understood after a series of
multi-component calculations are made.

Validation of the database. This is the final part in producing an assessed database
and must be undertaken systematically. There are certain critical features such as
melting points which are well documented for complex industrial alloys. In steels,
volume fractions of austenite and ferrite in duplex stainless steels are also well
documented, as are +’ solvus temperatures (7') in Ni-based superalloys. These
must be well matched and preferably some form of statistics for the accuracy of
calculated results should be given.

Only after at least these three steps are taken can a database then be considered
as an assessed database and used with confidence in an application involving a
complex multi-component alloy.

10.4. STEP-BY-STEP EXAMPLES OF MULTI-COMPONENT CALCULATIONS

This section will take three commercial alloys and analyse how the final calculated
result took form, starting with some of the important constituent binary and ternary
diagrams, and seeing how the various features of the final alloy are controlled by
these underlying systems.

===========
314 N. Saunders and A. P. Miodownik

10.4.1 A high-strength versatile Ti-alloy (Ti-6Al-4V)

Ti-6AIl-4V is probably the most widely used Ti alloy in the world. It is an alloy
with a duplex structure containing solid solutions based on the a, c.p.h._A3 and f,
b.c.c._A2 allotropes of Ti. In its final heat-treated form it consists predominantly of
@ and its high strength is partly derived from its final microstructure which is
manipulated by a series of thermomechanical treatments that include hot isothermal
forging just below its  transus temperature (T°). The interest is, in the first place,
to predict T® and how the amounts of a and ( vary with temperature.

There are empirical relationships which relate alloy content to 7%, but these are
not usually applicable to all types of Ti alloy and can suffer from a lack of accur-
acy. Significantly, there are no such relationships which can be generally used for
predicting the amount of a and @ in commercial alloys as a function of temperature
and composition and little work has been undertaken to quantitatively understand
the partitioning of elements between the a and 6 phases.

The alloy combines the features of two different binary systems, Ti-Al and Ti-V
(Figs 10.11 and 10.12). Al is an ‘a-stabiliser’ while V is a strong ‘(-stabiliser’. It is
the combination of these two types of diagram which produces a wide two-phase
a + @ region, and Fig. 10.13 shows the behaviour of the basic ternary alloy as a
function of temperature. Although more heavily alloyed in Al, the alloy never

1800
1600

1400

1200

TEMPERATURE_CELSIUS

800

(at

 

0 20 40 60 Al, Ti 80 100
MOLE_PERCENT AL

Figure 10.11 Calculated Ti-Al phase diagram.
References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 315

2000

1800
1600

1400

1200

1000

TEMPERATURE_CELSIUS

800
a

600 |

400
20 40 60 80 100

MOLE_PERCENT V
Figure 10.12. Calculated Ti-V phase diagram.

80
70
60

50

MOLE %a

40
30

20

600 700 800 900 1000 1100

TEMPERATURE_CELSIUS

Figure 10.13 Calculated mole % or vs temperature plot for a Ti-GAI-4V temary
alloy.

===========
316 N. Saunders and A. P. Miodownik

becomes fully a, as just enough V is added to retain some (. The basic behaviour of
the alloy is thus defined by the Ti-Al-V ternary but Ti alloys always contain
significant levels of O and N, and in the case of Ti-6AI-4V usually some Fe. At
high levels (>5000 ppm) O generally acts as an embrittling agent, but at lower
levels (2000 ppm) it can be used to enhance strength (Jaffee 1958) and is therefore
a deliberate addition to ‘conventional’ alloys such as Ti-6Al-4V. Apart from the
physical effects of O, this also produces significant phase-boundary shifts even at
low levels of uptake, and it is therefore necessary to include the effects of at least
this element in the calculations.

Figure 10.14 shows the calculated Ti-O diagram from Lee and Saunders (1997).
In the composition range of interest it is of a simple type but O has a powerful
effect on T. This effect is carried over to the critical ternary system Ti-Al-O and
Figs 10.15 and 10.16 show how the Ti-Al system changes as O is added (Lee and
Saunders 1997). No such information is available for Ti-V—O but it is interesting
to note the predicted effect of O on Ti-V. Figure 10.17 shows a section through

 

liquid

1800

1600

1400

Temperature, °C

1200

1000

800

 

Figure 10.14 Calculated Ti-O phase diagram (from Lee and Saunders 1997).
References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 317

 

 

1400
0.05 wt%O
1300 +
g
2
4
1200
a
Q, ,
a
a
5 1100
=
<
ae
& 1000 +
=
ai
&
900 «
800
0 3 10 15

MOLE_PERCENT AL

Figure 10.15 Calculated vertical section through Ti-Al-O at 0.05wt%O.

1400

1300

1200

1000

TEMPERATURE_CELSIUS

900
1.0 wt%O

800
0 5 10 15 20

MOLE_PERCENT AL

Figure 10.16 Calculated vertical section through Ti-Al-O at 1.0wt%O.

===========
318 N. Saunders and A. P. Miodownik

1000

0.25 wt%O

900

800

f

700

600

TEMPERATURE_CELSIUS

 

500

 

MOLE_PERCENT V

Figure 10.17 Calculated vertical section through Ti-V-O at 0.25wt%0.

Ti-V-O at a constant 2500 ppm of O and the effect of O on T° is significant, while
the effect on the position of the a-phase boundary is minimal.

Taking the necessary binary assessments for the inclusion of C, N and Fe and the
assessments for Ti-Al-O and Ti-V-O, the effect of O on the T° of Ti-6AI4V
with typical C, N and Fe impurity levels, was calculated and compared with
experiment. The agreement between the calculations and experimental results of
Kahveci and Welsch (1986) is good (Fig. 10.18). Figure 10.19 further shows some
calculated phase % vs temperature plots for three Ti-6Al4V commercial alloys
and compares these with experiment. The advantage of the CALPHAD route
becomes increasingly apparent because, as well predicting 7, the calculations
have also given good results for the amounts of a and (.

Furthermore, it is now possible to look at the partitioning of the various elements
to the a and phases and Fig. 10.20 shows comparisons with experiment for the
various metallic elements. One of the V results for the @ phase has an arrow
indicating that the true experimental result was considered to be higher than that
shown in Fig. 10.20 (Lasalmonie and Loubradou 1979). This is because the 9
grains were so small that some overlap with the a matrix occurred during
measurement by EPMA, resulting in a V reading that is almost certainly too low.

As previously stated, the levels of the light elements such as O are important in
determining physical properties of Ti and it is also possible to look at the parti-
tioning of O between the a and f phases (Fig. 10.21). It can be seen that the level of
O in a just below T¥ is extremely high. This has significant consequences for
thermomechanical processing for Ti-6Al-4V at these temperatures as yield

 

References are listed on pp. 402-408.

===========
MOLE % ALPHA

50

40

30

20

1200

1150

1100

1050

1000

TEMPERATURE_CELSIUS

950

 

CALPHAD — A Comprehensive Guide 319

© Kahvechi & Welch (1986)

 

0.2 04 0.6 08 10
WEIGHT_PERCENT O

Figure 10.18 Comparison between calculated and observed (-transus for
Ti-6AL4V alloys as a function of O concentration.

 

500 600

[Blenkinsop (1993)
© Kahveci and Welsch (1986)
Lee et al. (1991)
° x
©
Zz Xz
On
z
°

 

700 800 900» 10001100

TEMPERATURE_CELSIUS

Figure 10.19 Calculated mole % phase vs temperature plots for three Ti-6AI-4V

alloys with experimental data superimposed.

===========
320 N. Saunders and A. P. Miodownik

1 (#*%Al) Lasolmonie and Loubradou (1979)
A (eV) Lasolmonie and Loubradou (1979)
© («1%4Fe) Lasolmonie and Loubradou (1979)
‘he (WAN) Ishikawa et al. (1992)
(HV) Ishikawa et al. (1992)
oF (wt%Fe) Ishikawa et al, (1992)

CALCULATED WT%

 

 

° 5 10 15
OBSERVED WT%

Figure 10.20 Comparison between calculated and experimental values for the
concentration of Al, V and Fe in the a and f phase in Ti-6AI-4V alloys.

0.6

0.5

0.4

0.3

0.2

WEIGHT_PERCENT O

200 400 600 800 1000 1200
TEMPERATURE_CELSIUS

Figure 10.21 Calculated concentration of O in the a and f phase for a Ti6AL-4V
alloy.

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 321

strengths in & will be higher and ductility levels lower than would be expected by
just taking total levels of impurity as a guide.

10.4.2 A high-tonnage Al casting alloy (AA3004)

Aluminium alloys form one of the most widely used groups of materials in
existence. They make products which are often cheap and can be applied to many
different areas. Extensive work has been done on the experimental determination of
binary and ternary phase diagrams, mainly during the mid-part of this century, and
researchers such as Phillips (1961) and Mondolfo (1976) have produced detailed
reviews of the literature which provide industry standard publications. However,
although some important Al-alloys are based on ternary systems, such as the LM25/
356 casting alloy based on Al-Mg-Si, in practice they inevitably include small
amounts of Cu, Mn, Fe, Ti etc., all of which can significantly modify the castability
and properties of the final product. The situation is further exacerbated by the use of
scrap material. It is therefore useful to be able to predict phase equilibria in multi-
component alloys.

The modelling issues for Al alloys turn out to be reasonably straightforward.
Unlike superalloys or steels there are few intermetallic phases with wide regions of
stoichiometry. A large number of the compounds tend to be stoichiometric in
nature, for example, Mg2Si and Al,CuMg. Where there is substantial solubility,
such as in the AlsMn and a-AlFeMnSi phases, the transition metals basically mix
on one sub-lattice while Si mixes on the Al sub-lattice. The phases can be then
treated as conventional line compounds and complexities of modelling associated
with phases such as o and y’, where many elements may mix on more than one sub-
lattice, do not arise. There is also limited solubility in the Al solid solution for most
elements which are usually added to Al alloys which means that, for this phase, the
effect of most ternary interactions is completely negligible. Nevertheless, Al alloys
more than make up for this simplicity in modelling by exhibiting reaction schemes
which can be far more complex than usually found in systems involving more com-
plex models. Because of their inherent simplicity in modelling terms, Al systems
offer a good example of how a database can be constructed and the AA3004 alloy,
which is based on the Al-Fe-Mn-Si system, will now be discussed in more detail.

The AI-Si diagram and Al-rich regions of the Al-Mn and Al-Fe diagrams are
shown in Figs 10.22-10.24. The Al-Mn and Al-Fe systems are modifications based
on the work of Jansson (1992) and Saunders and Rivlin (1987). Unless stated, all
other diagrams are from Saunders (1996b). The Al-Mn and Al-Fe diagrams are
complex but in terms of Al alloys only the AlsMn, Al,Mn and Al;Fe phases are of
importance. This leads to a large degree of simplification in considering the ternary
modelling.

Figure 10.25 shows the liquidus projection for the Al-Fe~Mn system which is
characterised by a substantial extension of the AlgMn phase into the ternary and

===========
322 N. Saunders and A. P. Miodownik

1500
2
2
a
4
mw 1000
v,
a
a
2
s (ay \
a 500
=
w
B

0
o 20 40 60 80 100
WEIGHT_PERCENT SI
Figure 10.22 Calculated Al-Si phase diagram.

a
2
a
a
QQ
o
wa
s
P
&
<
oe
w
=
=
w
Be

 

WEIGHT_PERCENT MN

Figure 10.23 Calculated Al-rich region of the Al-Mn phase diagram.

 

References are listed on pp. 402-408.

===========
CALPHAD— A Comprehensive Guide 323

900
850
800
750

700

650 P
600

550 Al;Fe

TEMPERATURE_CELSIUS

500
450

400
0 5S 0 15 20 25 30 35 40 45

WEIGHT_PERCENT FE

Figure 10.24 Calculated Al-rich region of the Al-Fe phase diagram.

WEIGHT_PERCENT FE
e

°

2 4 6 8 10
WEIGHT_PERCENT MN

Figure 10.25 Calculated liquidus projection for Al-Fe-Man.

===========
324 N. Saunders and A. P. Miodownik

some slight uptake of Mn in Al;Fe. These extensions basically comprise Mn and Fe
substitution in an otherwise stoichiometric compound. The diagram has been
reviewed by Phillips (1961) and Mondolfo (1976) where there is good agreement
on features such as the eutectic temperature and compositions of phases. The main
problem with the assessment of Al systems is in interpretation of experimental
information concerning the liquidus of the compounds, where results can be scat-
tered. This is a general problem and relates partly to the steepness of the liquidus
slope and the low solubility of some transition elements in liquid Al. Such liquidus
lines are difficult to determine accurately by methods such as DTA, as there is often
very little heat associated with the transformation, and significant undercooling can
also occur. The most reliable measurement techniques tend to be isothermal in their
nature, for example, sampling of the liquid.

The addition of Si to Al-Mn and Al-Fe leads to the formation of a number of
ternary compounds (Figs 10.26 and 10.27). There is significant mixing between Al
and Si in the cubic a-AIMnSi phase but the other phases are treated accurately as
compounds with fixed stoichiometry. The agreement between the calculated
diagrams and those of Phillips (1961) and Mondolfo (1976) is again good, with
compositions of invariant reactions typically being to within 1 wt% of each element
and 5°C in temperature.

The joining of the ternary systems into Al-Fe-Mn-Si basically involves con-
sidering the a-AlMnSi compound which extends almost completely to Al-Fe-Si.
In fact, in early work on Al-Fe-Si alloys, which contained minor levels of Mn, the

40

poe
Ros &

WEIGHT_PERCENT FE
a8

>

2
im

0 2 4 6 8 w 12014
WEIGHT_PERCENT SI

Figure 10.26 Calculated liquidus projection for Al-Fe-Si.
References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 325

 

 

0 2 4 6 8 10
WEIGHT_PERCENT SI

Figure 10.27 Calculated liquidus projection for Al-Mn-Si.

a-AlFeSi phase was considered to be isomorphous with a-AlMnSi. Later work
showed this not to be the case and its stable structure is hexagonal (Munson 1967,
Mondolfo 1976, Rivlin and Raynor 1988). The addition of Fe to the a-AIMnSi
phase is simply achieved by making the Gibbs energy of the cubic AlFeSi com-
pound only just metastable. Other elements such as Cr and V also partition to the
cubic a@ phase and this can also be taken into account.

Combining this quaternary with Mg, and in particular Al-Mg-Si, it is now
possible to consider a reasonably pure AA3004 alloy which is used extensively for
thin-walled containers such as drink cans. Figures 10.28(a,b) show phase % vs
temperature plots for an alloy Al-1Mn—1.2Mg-0.5Fe~0.2Si (in wt%). On solidi-
fication the primary phase is Al, with AlgMn appearing soon afterwards. There is a
subsequent peritectic reaction involving a-AlFeMnSi (which will now just be
called a) which partly consumes the AlgMn phase. The amount of a increases as
the alloy is cooled below its solidus and it becomes the dominant solid-state
intermetallic just below 600°C. However, it disappears around 400°C, as Si is taken
up by the formation of Mg,Si which acts as a precipitation hardening phase. The
interplay between the a and AlgMn is critical, as the surface finish during fabrica-
tion of cans is much improved if @ particles, rather than AlgMn, predominate in
3XXxX alloys of this type (Anyalebechi 1992, Marshall 1996). It is therefore now
possible for CALPHAD methods to be used as a tool in helping to model and
control this reaction.

Cama et al. (1997) studied an alloy with the same composition as used in the last

===========
326 N. Saunders and A. P. Miodownik

(a)

MOLE % PHASE

 

Mg,Si TEMPERATURE_CELSIUS
(b)

 

 

MOLE % PHASE

 

 

100 200 300 400 500 600 700
TEMPERATURE_CELSIUS

Figure 10.28 (a) Calculated mole % phase vs temperature plot for a AA3004
alloy. (b) Expanded region of Fig. 10.26(a).

calculation, but with 0.2wt%Cu added, and performed long-term anneals between

550° and 630°C. They measured the relative levels of AlgMn and a and reported

results as a percentage of a observed. Calculations were therefore made for their

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 327

alloy so that computed results could be compared with experiment. Experimental
results varied between 61 and 39% while the calculations predict values of 53-
33%. The calculations suggest some small amount of liquid would be present at
630°C and the lower value is quoted at 620°C. The results, while underestimating
the measured values, are still in very reasonable agreement and the temperature
dependency of the conversion of AlgMn to a is almost exactly predicted.
Furthermore, Marshall (1996) reported results for the closely related AA3104 alloy
where the transition from Mg Si to @ is observed somewhere between 350 and
400°C. Although Marshall (1996) did not provide a composition for the alloys
which were used, calculations for an ideal 3104 composition, following Sigli et al.
(1996), suggest this transition occurs between 360° and 440°C, in good agreement
with observation.

In alloys such as AA3004 some of the major issues concern solidification and
therefore it is interesting to look at this in detail. However, as solidification in Al
alloys rarely occurs under equilibrium conditions, a more detailed examination of
this issue will be found in the next chapter.

10.4.3 A versatile corrosion-resistant duplex stainless steel (SAF 2205)

Duplex stainless steels are a highly formable, strong, yet highly corrosion-resistant
series of alloys. The ‘ideal’ duplex structure is aimed to be a 50/50 mixture of
austenite (7) and ferrite (a). The microstructure can be manipulated by thermo-
mechanical processing to produce an alloy with high strength. They also have a
high Pitting Resistance Equivalent (PRE), where PRE can be related to the levels of
Cr, Mo, W and N by the empirical formula (Hertzman 1995)

PRE = wt%Cr + 3.3(wt%Mo + wt%W) + 16wt%N.

A popular alloy of this type is SAF 2205. The alloy is predominantly an Fe-Cr-Ni
alloy with significant additions of Mo, Mn, Si, C and N. The composition may
typically be Fe-22Cr-5.5Ni-3Mo-1.7Mn-0.4Si-0.14N-0.024C (in wt%). Figure
10.29 shows an isothermal section for Fe-Cr-Ni at 1000°C and Fig. 10.30 shows a
phase% vs temperature plot for a Fe-22Cr~5.5Ni alloy. It has a narrow liquid+solid
region and it is already duplex below 1216°C, reaching a 50/50 + @ mixture at
1015°C, close to the final annealing temperature of the full composition alloy. The
@ phase forms below 730°C at the expense of «, but this is low compared to the
temperature where it is observed in real SAF2205 (Thorvaldsson et al. 1985). The
PRE number for this ternary alloy is only 22 and values around 30-40 are necessary
for adequate corrosion resistance.

The addition of 3%Mo improves its pitting resistance equivalent (PRE) but
causes substantial changes (Fig. 10.31). The level of austenite is substantially
decreased, only forming below 1134°C and never reaching more than 40% in the

===========
328 N. Saunders and A. P. Miodownik

 

0 20 40 60 80 100
WEIGHT PERCENT NI

Figure 10.29 Calculated isothermal section for Fe-Cr-Ni at 100°C.

8

MOLE % PHASE
& s

600 800 1000 1200 1400 1600
TEMPERATURE_CELSIUS

Figure 10.30 Calculated mole % phase vs temperature plots for a Fe-22Cr-5.5Ni
alloy.

 

References are listed on pp. 402-408.

===========
CALPHAD— A Comprehensive Guide 329

100

MOLE % PHASE

600 800 1000-1200 1400 1600
TEMPERATURE_CELSIUS

Figure 10.31 Calculated mole % phase vs temperature plots for a Fe-22Cr-5.5Ni-3Mo
alloy.

duplex region. The stability of o is markedly increased: it now forms below 875°C
and some x forms below 800°C. Both o and x are actually seen in SAF2205. Figure
10.32 shows an isothermal section for Fe~Cr-Mo which shows the expansive
region of o and the formation of a ternary x phase.

 

0 20 40 60 80 100
WEIGHT_PERCENT MO

Figure 10.32 Calculated isothermal section for Fe-Cr-Mo at 1000°C.

===========
330 N. Saunders and A. P. Miodownik

MOLE % PHASE

 

600 800 1000 1200 1400 1600
TEMPERATURE_CELSIUS

Figure 10.33 Calculated mole % phase vs temperature plots for a
Fe-22Cr-5.5Ni-3Mo-1.7Mn alloy.

The addition of 1.7%Mn does not make such a large difference as the Mo addition
(Fig. 10.33). It is, however, noticeable that all of the a has disappeared between
670-850°C by the reaction to form (7 + ). This is because Mn is both a ¥ stabiliser
and it enhances the formation of ¢ which competes with a for a-stabilising
elements such as Cr and Mo.

The addition of 0.4wt%Si does not alter the general behaviour of the alloy
significantly (Fig. 10.34). It is known that a temary o phase forms in Fe-Cr-Si but
Si is also a powerful a stabiliser. It is noticeable that there has been sufficient a
stabilisation to delay the onset of the a — (7 + a) transformation and a is stable to
lower temperatures than previously but, in the end, the level of addition of Si is
insufficient to make significant changes.

The next major changes occur with addition of N which substantially stabilises
(Fig. 10.35). The alloy is now close to its final composition and it can be seen that
the N has stabilised +y sufficiently such that it becomes the predominant phase
below 1050°C while the formation of o and x is relatively unchanged. A new phase
is now observed, M2N, based on Cr,N. This is an important phase as it can cause
sensitisation to corrosion resistance. In SAF2205 its temperature of formation is
close to that of a. The addition of C additionally causes the formation of Mz3Cs
below 900°C (Fig. 10.36) and slightly lowers the solidus.

The final predicted behaviour for SAF2205 is close to that found in practice. The
amount of 7 in the alloy as a function of temperature is in excellent agreement with
experimental results (Hayes 1985) and the behaviour of the minor phases is also

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide

400

80

40 Y

ol
oL TN

0 800 1000 1200 1400 1600

MOLE % PHASE

TEMPERATURE_CELSIUS

Figure 10.34 Calculated mole % phase vs temperature plots for a
Fe-22Cr-5.5Ni-3Mo-1.7Mn-0.4Si alloy.

MOLE % PHASE

 

600 800 1000 1200 1400 1600
TEMPERATURE_CELSIUS

Figure 10.35 Calculated mole % phase vs temperature plots for a
Fe-22Cr-5,5Ni-3Mo-1.7Mn-0.4Si-0.14N alloy.

331

===========
332 N. Saunders and A. P. Miodownik

MOLE % PHASE

 

600 800 1000-1200 14001600
MoCo
~ " TEMPERATURE_CELSIUS

Figure 10.36 Calculated mole % phase vs temperature plots for a SAF2205 alloy
with composition Fe-22Cr—5.5Ni-3Mo~1.7Mn-0,4Si-0.14N-0.24C.

well predicted. The temperature of o and M2N formation is close to that
observed in practice and the M23Cs and x phases are predicted to form as
observed (Thorvaldsson et al. 1985). The behaviour of the x phase is interesting
as it is commonly seen as one of the first minor phases to form in practice.
Thorvaldsson et al. (1985) showed that in SAF2205 the sequence of phase
formation at 850°C would be x followed by o, with o finally being the stable
phase and yx disappearing after long anneals. The predicted solvus temperature
for x is close to that of o but at 850°C it is not yet stable when o forms. This
would be quite consistent with the observed behaviour of SAF2205.

10.5. QUANTITATIVE VERIFICATION OF CALCULATED EQUILIBRIA IN
MULTI-COMPONENT ALLOYS

This section will give examples of how CALPHAD calculations have been used for
materials which are in practical use and is concerned with calculations of critical
temperatures and the amount and composition of phases in duplex and multi-phase
types of alloy. These cases provide an excellent opportunity to compare predicted
calculations of phase equilibria against an extensive literature of experimental
measurements. This can be used to show that the CALPHAD route provides results
whose accuracy lies close to what would be expected from experimental measure-
ments. The ability to statistically validate databases is a key factor in seeing the
CALPHAD methodology become increasingly used in practical applications.

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 333

10.5.1 Calculations of critical temperatures

In terms of practical use, one of the most important features of phase equilibria can
often be the effect of composition on some critical temperature. This can be a
liquidus or solidus or a solid-state transformation temperature, such as the G-transus
temperature, (T*), in a Ti alloy. The solidus value can be critical, as solution heat-
treatment windows may be limited by incipient melting. In some materials a solid-
state transformation temperature may be of prime importance. For example, in Ti
alloys it may be specified that thermomechanical processing is performed at
some well-defined temperature below the (-transus temperature. The CALPHAD
route provides a method where such temperatures can be quickly and reliably
calculated.

10.5.1.1 Steels. One of the most striking successes of the CALPHAD technique has
been in the highly accurate calculation of liquidus and solidus temperatures.
Because of their inherent importance in material processing, there are numerous
reported measurements of these values, which can be used to judge how well
CALPHAD calculations perform in practice. For example, detailed measurements
of liquidus and solidus values for steels of all types have been made by Jernkontoret
(1977). The values were obtained on cooling at three different cooling rates, 0.5, 1
and 5°C sec~!. The effect of cooling rate is seen to be marginal on the liquidus but
could be profound on the solidus due to the effects of non-equilibrium segregation
during the liquid—solid transformation. Calculations for the liquidus and solidus
were made for these alloys using the Fe-DATA database (Saunders and Sundman
1996) and compared with the results obtained at the lowest cooling rate. Figure
10.37 shows the results of this comparison and the accuracy of the predictions is
impressive, particularly for the liquidus values which exhibit an average deviation
from experiment (d) of only 6°C. It is also pleasing to note how well the solidus
values are predicted with an average deviation of just under 10°C. Three solidus
values are not matched so well and are highlighted. In these alloys low-melting
eutectics were observed, but not predicted, and it is uncertain if the difference is
due to an inherent inaccuracy in the prediction or to the persistence of non-
equilibrium segregation during solidification.

10.5.1.2 Ti alloys. In Ti alloys there are numerous measurements of the T” as this is
a very critical temperature for these alloys. Figure 10.38 shows the comparison
between predicted and measured values for Ti alloys of all types, ranging from B-
type alloys such as Ti-10V-2A1-3Fe through to the a types such as IMI834. The
results exhibit an average deviation from experiment of less than 15°C which is
very good for the measurements of a solid-state transformation such as T?.

===========
334 N. Saunders and A. P. Miodownik

1600

O Liquidus
O Solidus

1550
1500
1450
1400
1350

1300

CALCULATED (°C)

1250

1200

4150

 

1100
1100 1200 1300 1400 1500 1600

EXPERIMENTAL (°C)

Figure 10.37 Comparison between calculated and experimental (Jemkonteret
1977) solidus and liquidus values of a range of steels.

1100
© Chen and Sparks (1980)

g Ito et al. (1985)

@ Lin et al. (1984)

ba Onodera ef al. (1985)

& Peters and Williams (1985)
© Sugimoto et al. (1985)

A Yoder et al. (1984)

e Ishikawa et al. (1992)

4 Matsumoto (1993)

© Blenkinsop (1993)

+ Lampman (1990)

1050

850

800

CALCULATED BETA-TRANSUS
2
8

750

 

700
700 800 900 1000 1100

OBSERVED BETA-TRANSUS.

Figure 10.38 Comparison between calculated and experimental #-transus
temperatures in Ti-alloys (from Saunders 19962).

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 335

10.5.1.3 Ni-based superalloys. In Ni-based superalloys, containing high volumes of
y’, the temperature window where an alloy can be heat treated in the fully + state is
a critical feature both in alloy design and practical usage. This heat treatment
window is controlled both by +, and the solidus and there have therefore been
numerous experimental measurements of these properties. A further key experi-
mental feature for cast alloys is the liquidus and, similarly, numerous measure-
ments have also been made for this temperature. Figure 10.39 shows a comparison
plot for 7’, liquidus and solidus for wide variety of Ni-base superalloys and average
deviations from experiment are typically the same as for steels and Ti alloys, with d
for liquidus and solidus being 6°C and 10°C respectively while d for the 77, is less
than 15°C.

10.5.2 Calculations for duplex and multi-phase materials

10.5.2.1 Duplex stainless steels. Duplex stainless steels have provided a fruitful
area for CALPHAD calculations and have been an example of where high levels of
success have been achieved for practical materials. An early study (Hayes 1985)
was able to demonstrate that reasonable predictions for amounts of austenite could
be obtained for a variety of different duplex stainless steels, demonstrating the

1500 ‘Small (1993)

‘Small (1993)

‘Small (1993)

Honnarat et al. (1971)

Van der Molen et al. (1971)
Betteridge and Heslop (1974)
Brinegar et al. (1984)
Dharwadkar et al. (1992)
Dharwadkar et al. (1992)
Shaw (1992)

Shaw (1992)

Wlodek et al. (1992)

Zou et al. (1992)

Zhang et al. (1993)

/T; Zhang et al. (1993)

an

1400

2222

1300

SS
a

1200

RAAB
se
aa

1100

COR OCOODA HKG
2

ARS

1000

OBS. CRITICAL TEMPERATURE (C)

 

00
‘800 1000 1200 1400
CALC. CRITICAL TEMPERATURES (C)

Figure 10.39 Comparison between calculated and experimental critical tempera-
tures for Ni-based superalloys (from Saunders 1996c).

===========
336 N. Saunders and A. P. Miodownik

general applicability of CALPHAD calculations to these materials. The later work
of Longbottom and Hayes (1994) shows how a combination of CALPHAD cal-
culation and experiment can provide accurate formulae for the variation in austenite
and ferrite as a function of composition and heat-treatment temperature in Zeron
100 stainless steels. These formulae can then be used during production of the
material to help define temperatures for thermomechanical processing. The steel
database (TCFe) developed at KTH has been used in a number of publications,
notably by Nilsson (1992) and Hertzman (1995).

More recently, Fe-DATA (Saunders and Sundman 1996) was used in calcula-
tions for a wide variety of duplex stainless steels, and detailed comparisons were
made for amounts of austenite, as a function of temperature, and the partition
coefficients of various elements in austenite and ferrite. The results of these
comparisons are shown in Figs 10.40 and 10.41. In Fig. 10.40, experimental results
which have been given as volume fractions have been compared with mole%
predictions, which is reasonable as molar volumes of the two phases are very
similar. d for the amount of austenite is less than 4%, of the same order as would be
expected for experimental accuracy, and the comparison of elemental partition
coefficients is good. C and N levels, which are difficult to measure in practice, are
automatically calculated. Where such measurements have been made the
comparison is good and the advantage of using a calculation route is further
emphasised.

onogxmoce
i
= 8h
F
ft
g

CALCULATED % AUSTENITE

 

o 2 4 60 80 100
EXPERIMENTAL % AUSTENITE
Figure 10.40 Comparison between calculated and experimentally observed % of
austenite in duplex stainless steels. (Data from Longbottom and Hayes (1991)
represent dual phase steels.).

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 337

CALC. PARTITION COEFFICIENT

0.0 0.5

 

1S 2.0

EXP. PARTITION COEFFICIENT

+ Cr, Li (1995)

X Ni, Li (1995)

‘Y Mo, Li (1995)

'V Mn, Li (1995)

A Cu, Li (1995)

Si, Li (1995)

D4 Cr, Cortie and Potgeiter (1991)
QUNi, Cortie and Potgeiter (1991)
(Mo, Cortic and Potgeiter (1991)
t Cr, Hayes et al. (1990)

BANi, Hayes et al. (1990)

A Mo, Hayes ef al. (1990)

‘Y Mn, Hayes et al. (1990)

Su, Hayes et al. (1990)

OSi, Hayes et al. (1990)

Y W, Hayes et al. (1990)

ON, Jomard and Perdereau (1991)
2 Ni, Jomard and Perdereau (1991)
© Mo, Jomard and Perdereau (1991)

  

OF Cr, Hayes (1985)

Y Ni, Hayes (1985)

A Mo, Hayes (1985)

Mn, Hayes (1985)

AC, Merino et al. (1991)

@ Si, Merino et al. (1991)

5 Mn, Merino et al. (1991)
‘We Cr, Merino et al. (1991)

X Ni, Merino et al. (1991)

+f Mo, Merino et al. (1991)
GIN, Merino et al, (1991)

A Cr, Charles et af. (1991)

B Ni, Charles et al. (1991)

© Mo, Charles et al. (1991)

® Si, Charles et al. (1991)

© Cu, Charles et al. (1991)

+ Mn, Charles et al. (1991)

% Cr, Hamalainen et al. (1994)
@ Mo, Hamalainen et al. (1994)
© Ni, Hamalainen et al. (1994)
© Cu, Hamalainen et al. (1994)
4 N, Hamalainen et al. (1994)

Figure 10.41 Comparison between calculated and experimentally observed
Partition coefficients between austenite and ferrite in duplex stainless steels.

===========
338 N. Saunders and A. P. Miodownik

10.5.2.2 Ti alloys. Duplex microstructures are usually formed in Ti alloys which
are classed using the level of a-Ti or 8-Ti in the alloy. There are a few fully a and
B alloys but most are duplex in nature. Much work has been done in measuring T?
but fewer results are available in the open literature for the variation of volume
fraction and composition of a and 3. Fewer experiments are therefore available for
comparison purposes. Figures 10.42(a-c) show calculated phase% vs temperature
plots for three types of commercial alloys, an a-type, IMI834, an (a/()-type, SP
700 and a f-type Ti-10V-2A1-3Fe. The agreement is very satisfactory.

10.5.2.3 High-speed steels. High-speed steels are alloys with high C levels and con-
taining refractory metals such as Cr, Mo, V and W. They subsequently contain high
levels of various carbides, typically between 5 and 15 vol%, with some alloys
having more than 20 vol% (RiedI et al. 1987, Hoyle 1988, Wisell 1991, Rong et al.
1992). They are useful practical alloys for cutting tools where their wear resistance,
toughness and resistance to tempering during machining is controlled by the types,
amounts and shapes of the various primary carbides MgC, M2C and MC. The
composition of the steel controls the amounts and types of the various carbides and,
therefore, knowledge of phase equilibria in these alloys is important. Detailed work
has been done by Wisell (1991) characterising the various carbides in tool steels.
Fifty-six alloys were prepared and compositions of the carbides measured by
microprobe analysis. Calculations have been made for all alloys and comparisons
with the composition of the various MgC, M2C and MC carbides are shown in Figs.
10.43(a-c).

10.5.2.4 Ni-based superalloys. In Ni-based superalloys considerable work has been
done on the determination of 7/7’ equilibria and a substantial literature exists by
which to compare CALPHAD calculations with experimental results. Figure 10.44
shows a comparison plot for -y’ amounts in a wide variety of superalloys, ranging
from low 7’ types such as Waspaloy through highly alloyed types such as IN939 to
single crystal alloys such as SRR99. The accuracy is similar to that for the duplex
steels, with d of the order of 4%. As lattice mismatches are so small, mole% values
give almost identical values to vol% and figures 10.45(a-e) show some of the
comparisons for the composition of -y and y' where the high standard of results is
maintained, Where experimental results have been quoted in wt% they have been
converted to at% to allow for consistency of comparison. The average difference
for elements such as Al, Co and Cr is close to lat% while for Mo, Ta, Ti and W this
value is close to 0.5at%. Too few experimental values for Hf and Nb were found to
be statistically meaningful but where possible these were compared and results for
average differences were found to be slightly better than obtained for Mo, Ta, Ti
and W.

 

References are listed on pp. 402-408.

===========
CALPHAD— A Comprehensive Guide 339

° © Blenkinsop (1993)
40
35
30
25
20

15

MOLE % ALPHA

 

960 980 1000 1020 1040 1060

(b)
co Ishikawa et al. (1992)

MOLE % ALPHA

 

600 700 800 900 1000

© Duerig et al. (1980)

MOLE % ALPHA
8

 

650-700 «750 800 850900
TEMPERATURE CELSIUS
Figure 10.42 Calculated mole % phase vs temperature plots for three types of

commercial alloys: (a) an a-type, IMI 834, (b) an (a/8)-type, SP 700 and (c) a
B-type Ti-10V-2Al-3Fe (from Saunders 1996a).

===========
340 N. Saunders and A, P. Miodownik

i) Wiselt (1991)

     
 
   

CALC U-FRACTION IN MC (x100)

°o 2000 «4060 8s
EXP U-FRACTION IN MC (x100)

(b) Wisetl (1991)

CALC U-FRACTION IN M6C (x100)

°9 10 2030 40 ~<50 ~~ 60
EXP U-FRACTION IN M6C (x100)

60 Wisell (1991)

CALC U-FRACTION IN M2C (x100)

 

0 10 20 30 40 50 60
EXP U-FRACTION IN M2C (x100)

Figure 10.43 Comparison between calculated and experimental values (Wisell
1991) for the concen-tration of Cr, Mo, W, V and Fe in (a) the MC, (b) the MgC
and (c) MC phases of high-speed steels.

 

References are listed on pp. 402-408.

===========
OBSERVED % GAMMA PRIME

OBSERVED % AL

CALPHAD— A Comprehensive Guide 341

20 40 60

80

CALCULATED % GAMMA PRIME

Figure 10.44 Comparison between observed and calculated amounts of 7’ in Ni-
based superalloys (from Saunders 1996c).

(a)

5 10 15
CALCULATED % AL

20

 

100

 

2s

e+ *¥O<Od SP EHGO

Kriege and Baris (1969)
Loomis et al. (1972)
Dreshfield and Wallace (1974)
Caron and Khan (1983)
Magrini et af. (1983)
Brinegar ef al. (1984)

Khan et al. (1984)

Meng et al. (1984)

Nathal and Ebert (1984)
Blavette et af. (1988)

Harada et al. (1988)

Schmidt and Feller-Kniepmeier (1992)
Duval et al. (1994)

© > Kriege and Baris (1969)
+ Kriege and Baris (1969)
© 7' Loomis et al. (1972)

©) 7’ Dreshfield and Wallace (1974)
‘¥e7 Dreshfield and Wallace (1974)
A-y! Shimanuki et al. (1976)
(> Shimanuki et al. (1976)
4-7’ Caron and Khan (1983)

oh 7 Delargy and Smith (1983)
‘&1 Delargy and Smith (1983)
ba! Khan et al. (1984)

@7' Meng et al. (1984)

BY Meng et al. (1984)

bd7' Blavette ef al. (1988)

77 Blavette et al. (1988)

3 7/ Harada et al, (1988)

+7 Harada et al. (1988)

7" Trinckhauf and

7 — Nembach (1991)

307" Schmidt and

07 _ Feller-Kniepmeier (1992)
0.7’ Duval et al. (1994)

7 Deval et al. (1994)

Figure 10.45 Comparison between calculated and observed compositions of -y
and -y’ in Ni-based superalloys: (a) Al, (b) Co, (c) Cr, (d) Mo and (e) W. (at %)

(from Saunders 1996c)

===========
342 N. Saunders and A. P. Miodownik

‘© 17’ Kriege and Baris (1969)
© + Kriege and Baris (1969)
A 7’ Shimanuki et al. (1976)
7 Shimanuki ef al. (1976)
4 7’ Caron and Khan (1983)
+ 7! Delargy and Smith (1983)
& 7 Delargy and Smith (1983)

ba 7’ Blavette ef al. (1988)

7 7. Blavette ef al. (1988)

o& 7! Harada ef al. (1988)

+7 Harada et al. (1988)

Y 9 Trinckhauf and

Ay _Nemback, (1991)

x 7’ Schmidt and

© 7 Feller-Kniepmeier (1992)
0 7 Duval et al. (1994)

© 7 Duval et al. (1994)

OBSERVED % CO

 

 

0 5 10 1S 20 25 30 35 40
CALCULATED % CO

© 7 Kriege and Baris (1969)
@ 7 Kriege and Baris (1969)
© 7 Loomis et al. (1972)

© 7’ Dreshfield and Wallace (1974)
he 7 Dreshfield and Wallace (1974)
A! Shimanuki et al. (1976)
1B 7 Shimanuki et al. (1976)
bd 4! Caron and Khan (1983)

+ 7 Delargy and Smith (1983)
7 Delargy and Smith (1983)
04-9! Khan ef af. (1984)

@ 7 Meng et al. (1984)

7 Meng et al, (1984)

047 Blavette et al. (1988)

97. Blavette et al. (1988)

4 7 Harada et al. (1988)

+7, Harads et al, (1988)

Y 7 Trinckhauf and

Ar _Nembech, (1991)

X07 Schmidt and

©7 _Feller-Kniepmeier (1992)
0-7 Duval et al, (1994)

© 7 Duval et al. (1994)

OBSERVED % CR

 

0 5 10 15 2 25 30 35 40
CALCULATED % CR

Figure 10.45 (b) and (c).

 

References are listed on pp. 402-408.

===========
OBSERVED % MO

OBSERVED % W

 

CALPHAD—A Comprehensive Guide 343

4 6
CALCULATED % MO

4 6
CALCULATED % W

Figure 10.45 (4) and (¢).

 

 

© y' Kriege and Baris (1969)

© 7 Kriege and Baris (1969)

© 7 Loomis et al. (1972)

© 7’ Dreshfield and Wallace (1974)
‘e7 Dreshfield and Wallace (1974)
4’ Caron and Khan (1983)

ba! Khan et af. (1984)

© 7! Meng ef al. (1984)

@ 7 Meng et al. (1984)

 7/ Harada et al. (1988)

+7 Harada et al. (1988)

Y 1 Trinckhauf and

Ay _ Nembach, (1991)

0-7 Duval et al. (1994)

97 Duval et al. (1994)

 

+o! Dreshfield and Wallace (1974)
7, Dreshfield and Wallace (1974)
+7! Caron and Khan (1983)

+7! Delargy and Smith (1983)

7, Delargy and Smith (1983)

yf Khan et al, (1984)

+f Blavette et al. (1988)

7, Blavette et al. (1988)

7! Harada et al. (1988)

+7, Harada et al. (1988)

7 Schmidt and

7, Fellet-Kniepmeier (1992)

171 Duval et al. (1994)

7 Duval ef al. (1994)

OOOx+ HOR EME ENG

===========
344 N. Saunders and A. P. Miodownik

10.5.3 Summary

It is clear from the results shown in this section that the CALPHAD route is
providing predictions whose accuracy lies close to that expected from experimental
measurement. This has significant consequences when considering CALPHAD
methods in both alloy design and general everyday usage as the combination of a
high quality, assessed database and suitable software package can, for a wide
range of practical purposes, be considered as an information source which can
legitimately replace experimental measurement. The next sections discuss more
complex types of calculations which are geared to specific, practical problems.

10.6. SELECTED EXAMPLES

10.6.1 Formation of deleterious phases

Formation of secondary phases is a feature of many materials and, in the context
used here, is defined as the formation of phases other than the primary hardening
phases or the predominant phases in duplex alloys. Embrittling phases can be
carbides, borides, topologically close-packed (TCP) phases such as o or p, or
‘insoluble’ compounds such as Al7Cu2Fe in Al alloys. They can also be beneficial,
providing secondary hardening reactions as for example in the low-temperature
precipitation of 7 phase in the 7'-hardened alloy IN939 (Delargy and Smith 1983).
But, more often, they produce a degradation in mechanical properties as is found
with o formation in stainless steels. The understanding of the formation of these
phases is therefore critical in material design and processing. For Ni-based super-
alloys, the formation of o and related phases has concerned alloy designers for
many years. They are major materials in aerospace gas turbine engines where
failure of critical components can have catastrophic consequences. The next two
sub-sections will therefore show examples of how CALPHAD methods can be used
to understand and help control TCP phases.

10.6.1.1 o-Phase Formation in Ni-based Superalloys. The concept of ‘o-safety’
has been one of the most important design criteria in the design of superalloys
(Sims 1987), and in the past the most usual method of predicting this was by
techniques such as PHACOMP which rely on the concept of an average electron
hole number, N,, made up of a weighted average of NN, values for the various
elements. In itself the concept behind PHACOMP is simple and it is easy to use, but
there are a number of questions concerning its use and theoretical justification. For
example, the values of N, used to calculate N, are usually empirically adjusted to
fit experience and the model fails to explain why o appears in the Ni-Cr-Mo
temary but is not observed in binary Ni-Cr or Ni-Mo. Furthermore, although it
supposedly correlates with the phase boundary of + and a, it gives no infor-
mation on the temperature range where o may be stable, nor does it provide any

 

References are listed on pp. 402~408.

===========
CALPHAD—A Comprehensive Guide 345

information on the interaction of this boundary with the 7/p or 7/Laves boundaries.
Using the CALPHAD route an actual o-solvus temperature can now be
calculated which defines the temperature below which o will form and can be
unambiguously used to help define ‘o-safety’. A good example of this concept is in
Udimet® 720 (U720) whose composition is given below (Keefe et al. 1992).

Cc Cr Co Mo WwW Ti Al B Zr

U720. «(0.035 18.0 «147 30 125 50 2.5 0.033 0.03
U720LI 0.01 16.0 14.7 30 125 5.0 25 0.015 0.03

 

This alloy was first used in land-based gas turbine engines and for long-term use at
up to 900°C (Keefe et al. 1992), but its excellent all-round properties suggested that
it could also be used as an aerospace disc alloy. Unfortunately, while long-term
exposure at high temperatures produced only minor susceptibility to 0, its use at
750°C quickly led to large amounts of o being formed (Keefe et al. 1992). Clearly
the alloy was either close to, or just below, its o-solvus at the higher temperature
and it was found necessary to reduce Cr levels to destabilise o at lower
temperatures. This led to the development of U720LI with 2wt% less Cr than for
U720. C and B levels were also lowered to reduce formation of borides and
carbides which acted as nucleation sites for ¢ formation.

Figure 10.46 shows a calculated phase % vs temperature plot for U720 and it can
be seen that its o-solvus is indeed close to 900°C and at 750°C the alloy would

MOLE % PHASE

   

Carbides TEMPERATURE_CELSIUS

Figure 10.46 Calculated mole % phase vs temperature plot for U720 (from
Saunders 1996c).

===========
346 N. Saunders and A. P. Miodownik

contain substantial levels of o, in excellent accord with experimental observation.
Keefe et al. (1992) further determined TTT diagrams for both U720 and U720LI,
which are shown in Figure 10.47. Decreasing the Cr levels must decrease the o-solvus
and, as the high-temperature part of the TTT diagram asymptotes to the o-solvus
temperature, the two TIT diagrams should have distinct and separate curves.
Taking the o-solvus calculated for U720 and U720LI, it was proposed (Saunders
1995, 1996c) that the TTT diagrams should have the form as shown in Fig. 10.48.

1000

= U720/0720L1 (0)
950 © U720/U720L1 (o free)
4 U720 (0), U720L1 (0 free)

900

u720
850

(T°)

 

Hold time (hours)

Figure 10.47 TTT diagrams for o formation for U720 and U720LI after Keefe
et al. (1992).

 

© U720/U720L1 (a)
© U720/0720L1 (0 free)

4 U720(0), U720LI (0 free)
} U7200,

u720L1 UT20L1 0,

(T°c)

 

 

 

Hold time (hours)

Figure 10.48 TTT diagrams for U720 and U720LI based on calculated o-solvus
temperatures.

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 347

10.6.1.2 The effect of Re on TCP formation in Ni-based superalloys. As gas
turbine engines are designed and manufactured to work at higher and higher thrust-
to-weight ratios, the temperature capability of most components has had to be
increased. This has applied particularly to the high-pressure (HP) turbine blades
where the development of new alloys has followed lines associated both with the
development of microstructure and new chemistries. HP turbine blades are now
commonly single-crystal materials where the grain boundaries have been removed
by novel casting techniques. HP blades have also seen the development of alloy
variants which typically contain Re at levels of between 2 and 6wt%. Because Re is
such a heavy element, this relates to a small addition in atomic terms, but the effect
on properties such as creep and strength is pronounced. Re also has a profound
effect on the temperature at which TCPs are observed, raising this substantially
(Darolia et al. 1988, Erickson ef al. 1985). The reason for this is not readily under-
stood in terms of a PHACOMP approach (Darolia et al. 1988), and it therefore is
interesting to look at how CALPHAD methods can deal with an element like Re.

CMSX-4 is a second generation single crystal superalloy and typically has the
composition Ni-6.3Cr-9Co-0.6Mo-6W-6.5Ta-3Re-5.6Al-ITi-0.1Hf (in wt%).
Figure 10.49 shows a calculated phase % vs temperature plot for this alloy and most
aspects of its phase behaviour appear well matched. The high-temperature TCP
phase is the R phase, in excellent agreement with the work of Proctor (1992) and its
predicted composition is also in good agreement with Proctor (1992), with W and
Re in almost equal proportions (~35wt% each). It is clear that the partitioning of Re

 

MOLE % PHASE

 

600 900 1200 1500
TEMPERATURE_CELSIUS

Figure 10.49 Calculated mole % phase vs temperature plot for a CMSX-4
Ni-based superalloy.

===========
348 N. Saunders and A. P. Miodownik

to the R phase is particularly strong and even stronger in 0, where levels can reach
45wt%. Although the formation of TCP phases is clearly enhanced because they are
so rich in Re, their amounts in the alloy are restricted by the total level of Re, in this
case only 3wt%. Therefore, the amounts of o and R never rise to catastrophic levels
as was evident in the previous example of U720. This has the corollary that Re-
containing single-crystal alloys, such as CMSX-4, may be relatively tolerant to
TCP formation even though their temperatures of formation can be high.

The sensitivity of TCP formation to Re can be further emphasised by examining
what happens to CMSX-4 when the Re level is reduced by % to 1.5wt% accompanied
by a corresponding increase in W level. For this case the solvus temperature falls
by some 50°C. A similar exercise of replacing Re with W was performed by
Darolia et al. (1988) and their observed variations in the start temperature of TCP
formation are in reasonable accord with this.

It is also evident that there is a complex interplay between the three main TCP
phases, o, R and P, with y: occasionally being observed (Darolia et al. 1988, Proctor
1992, Walston et al. 1996). To examine this more closely, calculations were made
for CMSX-4 by alternatively suspending two of the three main TCP phases and
calculating the behaviour of the alloy with just one of the phases allowed to form at
any one time (Fig. 10.50). The solvus temperatures for R, P and o respectively were
calculated as being close to each other at 1045°, 1034° and 1026° respectively, and
the R and P phases are particularly close in stability over the whole temperature
range. It is clear, therefore, that the interplay between the various TCP phases will
be sensitive to the alloy composition and indeed changes in Re, W and Cr levels
will cause either o, R or P to become the dominant TCP phase.

40
ask
3.0
25

2.0

MOLE % PHASE

 

 

600700 800 900 1000 1100
TEMPERATURE_CELSIUS

Figure 10.50 Calculated mole % phase vs temperature plot for a CMSX-4 Ni-based
superalloy with only one TCP phase allowed to form at any one time.

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 349
10.6.2 Complex precipitation sequences

10.6.2.1 7000 series Al-alloys. Probably the most complex type of Al alloys are the
7000 or 7XXX series. These are based on the Al~Cu-Mg-Zn quaternary system
and hardening reactions are based on one or more of three phases: (1) 7, which is
based on the binary Mg-Zn Laves compound but also exists in Al~Cu-Mg; (2)
T_AlCuMgZn, which exists in both the Al-Cu-Mg and Al-Mg-Zn systems; and
(3) S_AlpCuMg (as in an AA2024 alloy). In these alloys it is the Zn/Mg ratio which
is considered most critical in deciding the type of precipitation reaction which takes
place. It should be noted that in practice an alloy such as AA7075 achieves
maximum hardness due to the precipitation of the metastable 7/ phase which is
structurally related to 7. Also, both the T_AlCuMgZn and S_Al,CuMg phases can
form similar metastable hardening phases. At present, thermodynamic descriptions
for these phases do not exist but, because of the inherent relationship between the
metastable and stable forms of the compounds, it is reasonable to expect that the
metastable precipitate which forms will be closely related to the respective stable
precipitate which predominates in the alloy. Also, a number of important questions
connected with processing are directly related to the stable forms; for example,
solution temperatures and intermediate heat-treatment temperatures and their
formation during non-equilibrium solidification. It is therefore instructive to look at
a series of calculations for 7XXX alloys to observe how the calculated diagrams
vary as the composition of the alloys is changed.

Figures 10.51a—d show the precipitation of the three major hardening phases, 7,
T and S, as well as e-AlCrMnMg and Mg)Si, for a series of high-strength 7000
series alloys with Zn:Mg ratios as given in Table 10.1. For simplicity, other phases
which may appear, such as AlgMn, a, etc., have not been included. AA7049
represents the highest Zn:Mg ratio and also gives one of the highest values for the
total percentage (Zn+Mg) total. In this case the hardening phase is almost
completely 7 and its level rises to a maximum of 6% in molar units. As the Zn:Mg
ratio is reduced from 3.1 to 2.7 in the AA7050 alloy the competition between 7 and
nis still won easily by 7 but, due to the high levels of Cu in this alloy, it will also be
significantly prone to the formation of S_Al,CuMg. The 7075 alloy has a lower
Zn:Mg ratio of 2.2 and although still predominantly hardened by 7, some T phase

Table 10.1 Composition and Zn/Mg ratio of various 7XXX alloys (after Polmear 1989). Values for Si,
Fe and Mn relate to maximum values

Alloy Si Fe Cu Mn Mg. Zn Cr ZnMg

 

AA7049 0.25 0.35 Ms 0.2 25 17 0.15 31
AA7050 0.12 0.15 23 0.1 23 6.2 0.04 27
AA7075 04 05 16 03 25 5.6 0.23 22

AA7079 03 04 06 0.2 33 43 0.18 13

 

===========
350 N. Saunders and A. P. Miodownik

(a)

MOLE % PHASE

 

0
100 «200-300 400 $00, 600 700

MOLE % PHASE

 

=——

100-200 300 | 400 S00, 600700

TEMPERATURE_CELSIUS

Figure 10.51 Calculated mole % phase vs temperature plots for 7XXX series
Al-alloys. (a) AA7049, (b) AA7050, (c) AA7075 and (d) AA7079.

 

References are listed on pp. 402-408.

===========
MOLE % PHASE

MOLE % PHASE

 

CALPHAD—A Comprehensive Guide

(c)

TEMPERATURE_CELSIUS

(aly

 

100 §=.200S 300-400 500 600700
TEMPERATURE_CELSIUS

Figure 10.51 (c) and (d).

351

===========
352 N. Saunders and A. P. Miodownik

begins to appear below 200°C. It is also noteworthy that the level of S phase is
reduced. Both of these effects are due to the reduction of Cu levels in AA7075. This
means that less S phase is formed, which releases Mg, and effectively means that
more Mg is available in the alloy. We are therefore forced to consider the
concept of an effective Zn:Mg ratio which is potentially affected by the level of
Cu in the alloy. The final alloy, AA7079, has the lowest Zn:Mg ratio of 1.3, well
below a value of 2 which is considered the critical point at which the 7 phase is
favoured. As would be expected, the main precipitation now occurs by the T phase
with no predicted formation of 7 and no S phase because of the effective absence of
Cu.

As stated previously, the predominant hardening in these alloys may be
controlled by the metastable forms of the various phases, but it is clear that the
calculations have allowed a quick scan to be made of the major types of
equilibrium precipitates and this must have a significant bearing on the formation of
the metastable forms. Furthermore, the role of Cu can be better understood as can
also the effect of the various minor elements on the ‘insoluble’ compounds. It is
also interesting to note the predicted formation of the e-AlCrMnMg phase with the
addition of Cr. In AA7075 it helps retard recrystallisation during the high-
temperature heat treatment for this alloy and is, therefore, beneficial.

10.6.2.2 (Ni, Fe)-based superalloys. Ni,Fe-based superalloys, such as 718, can behave
in a complex fashion, which is associated with the formation of various carbides
and the interplay between three major precipitated phases; § based on Ni3Nb, 7’
based on Ni;Al and a metastable phase -y” which is related to the 5 phase. Inconel®
625 (IN625) was the prototype for the Nb-hardened NiFe-type superalloys and it is
instructive to look at the complex precipitation phenomena which occur in this
alloy which has the composition Ni-21.5Cr-9Mo-3.6Nb-5Fe-0.2AI-0.2Ti-0.05C
(in wt%).

Figures 10.52(a,b) show phase % vs temperature plots for a standard IN625
alloy. It is predominantly strengthened at low temperatures by the formation of 6
and is characterised by the formation of three types of carbide, MC, MgC and
Ma3Cg. It is further unstable with respect to both o and yz at low temperatures. This
behaviour shows that the alloy lies close to a ‘boundary’ which is controlled by the
Mo/Cr ratio where, at lower Mo/Cr ratios, the alloy would contain MC and the
more Cr rich phases M23Cg and a, while at higher Mo/Cr ratios the alloy would
contain MC and the more Mo-rich phases M,C and yp.

The temperature range of formation of the various carbides and the solvus
temperatures of 6 are well established (Ferrer et al. 1991, Vernot-Loier and Cortial
1991) and the calculated diagram is in excellent agreement with this experimental
information. However, during processing it is usually the 7” phase which is formed
instead of 6. This is due to much faster transformation kinetics of this phase and
hardening Ni,Fe-based superalloys is usually due to a combination of + and ”.

 

References are listed on pp. 402-408.

===========
CALPHAD— A Comprehensive Guide

 

 

(a)
Pa
a
<
x
=
8
m
2
3
=
600 900 1200 1500
Mg3Cy
TEMPERATURE_CELSIUS
o
a
<
=
=
8
a
2
3S
=

 

600 900 1200 1500
Ma3Cy

TEMPERATURE_CELSIUS

Figure 10.52 (a) Calculated mole % phase vs temperature plots for an IN625
Ni-based superalloy. (b) Expanded region of Fig. 10.50(a).

353

===========
354 N. Saunders and A. P. Miodownik

MOLE % PHASE

 

 

TEMPERATURE_CELSIUS

Figure 10.83 Calculated mole % phase vs temperature plots for an IN625
Ni-based superalloy with the 6 phase suppressed.

This can be modelled by suspending the 5 phase from the calculations and Figure
10.53 shows the subsequently calculated phase % plot. Again, the solvus tempera-
ture for y” is well matched with a consequent increase in the +’ solvus temperature
of some 50°C.

10.6.2.3 Micro-alloyed steels. In the past 20 years the strength and toughness of
high-strength low-alloy (HSLA) steels has improved considerably through micro-
alloying additions. These additions, typically Ti, Nb and V, form stable carbo-
nitrides which help both by reducing grain growth during the high-temperature
annealing process and by precipitation hardening at lower temperatures. Similar
effects occur with so-called interstitial-free (IF) steels. Modelling work on such
alloys has been reasonably extensive (Zou and Kirkaldy 1992, Houghton 1993,
Akamatsu et al. 1994) and, although at first sight the formation of such carboni-
trides may appear relatively straightforward, there is an internal complexity which
should not be underestimated.

In essence two types of carbonitride are formed in a Ti,Nb-hardened micro-
alloyed steel. At high temperatures a predominantly TiN-rich carbonitride is formed.
However, on cooling to lower temperatures a predominantly NbC-rich carbonitride
also precipitates. Both carbonitrides are based on the NaCl structure and form part
of a continuum usually described by a formula such as (Ti,Nb;..)(C,N;.). This can
be expanded to include elements such as V and Ta, so the formula becomes
(Ta, TiyNb,V}1.x-y.2)(C:Ni.z). The formation of two types of carbonitride can be
considered due to ‘phase separation’ and Fig. 10.54 shows a projected miscibility

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 355

gap for the simple case of (Ti,Nb;.,)(C,N).,) from Akamatsu et al. (1994). If the
composition of the carbonitride lies outside the miscibility gap, simple single-phase
carbonitrides form. But as the temperature is lowered the miscibility gap extends
over much of the composition space and breakdown to TiN-rich and NbC-rich
phases is possible.

In reality, the modelling issues are even more interesting as the NaCl
carbonitride structure is formed by the filling of the octahedral sites of austenite
and there is actually a continuum between austenite and the carbonitride phase. The
duplex precipitation is therefore occurring by a breakdown of an Fe-rich phase to first
form a TiN-rich carbonitride which subsequently undergoes further separation.
Providing the f.c.c._Al phase is modelled correctly, the calculation can be made by
considering only two phases, the ferritic b.c.c._A2 and the f.c.c._Al phase which
then separates to form the austenite, the TiN-rich carbonitride and the NbC-rich
carbonitride phases. This has the advantage that non-stoichiometric effects in the
carbonitride can also be considered and the formula becomes (Fe,,Ti,Nby.w.x)
(C,N.Vaj.,.2). Figure 10.55 shows a calculation for a micro-alloyed steel with a
composition after Zou and Kirkaldy (1992) and the formation of the two types of
carbonitride is predicted to form, as is observed in practice.

NbN TiN

Site fraction: yy

 

0 0.2 0.4 0.6 0.8 1.0

NbC . Tic
Site fraction: y,;

Figure 10.54 Projected miscibility gap for the case of (Ti,Nb1.)(C,N1-.) from
Akamatsu ef al. (1994).

===========
356 N. Saunders and A. P. Miodownik
0.08
0.07
0.06
0.05

0.04 Nec

MOLE % PHASE

0.03

0.02 TIN

0.01

 

0
800 1000 1200 1400 1600
TEMPERATURE_CELSIUS

Figure 10.55 Calculated mole % vs temperature plot for a micro-alloyed steel
showing precipitation of TiN- and NbC-based carbides.

10.6.3 Sensitivity factor analysis

An interesting and important corollary of CALPHAD calculations is to predict
sensitivity factors for various important material properties, such as liquidus and
solidus temperature, solid state transus temperatures, heat-treatment windows, etc.
These can then be utilised both in alloy design and in production of alloys or
components.

10.6.3.1 Heat treatment of duplex stainless steels. An excellent example of the
application of CALPHAD methods to sensitivity analysis is in the work of
Longbottom and Hayes (1994) on duplex stainless steels. These materials contain a
mixture of austenite and ferrite, usually with a 50:50 proportion of each phase, and
are produced by suitable heat treatment, typically in the range 1050-1150°C. The
amount of austenite and ferrite is critically controlled by the composition of the
alloy which dictates the temperature where there is the ideal 50:50 ratio. The par-
ticular alloy of interest in their study was a Zeron 100 alloy with the nominal
composition Fe-25Cr-3.5Mo-6.5Ni-I1Mn-1Si-0.75Cu-0.75W-0.25N-0.15C (in
wt%). Using original experimentation, Longbottom and Hayes (1994) confirmed
that the correct austenite levels, as a function of temperature, were calculated for a
set of four Zeron 100 variants. Figure 10.56 shows the agreement between their
experimental work and calculations and, except for three cases, the calculations
agree within the error bar of the measurements.

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 357

Observed Austenite

© Alloy C4
© Alloy C6
4 Alloy C7
¥ Alloy C8

 

“0.40 045 050 055 0.60 0.65 0.70
Calculated Austenite

Figure 10.56 Comparison between thermodynamically calculated and experimentally
observed amounts of austenite in Zeron 100 duplex stainless steels (Longbottom and
Hayes 1994),

Rather than utilise a full thermodynamic calculation for their final sensitivity
analysis, they fitted their calculated results to a formula which could be used within
the composition specification range of Zeron 100 alloys, such that the fraction of
austenite, {7, was given by

f7=4+2.2-1.39 x 10°T

+ (1.35 x 1073 T — 0.78)%C + (1.30 x 1075 T — 0.037)%Cr

— (2.44 x 10° T — 0.099)%Cu — (5 x 107° T — 0.061)%Mn

— (3.08 x 10°, T + 0.0081) %Mo + (1.56 x 10-3 T — 1.40)%N

— (3.97 x 107° T — 0.11) %Ni + (3.32 x 1074 — 0.61) %Si

+ (2.11 x 1075 — 0.038)%W. (10.1)

Figure 10.57 compares the results obtained using this formula with the thermo-
dynamic calculations, while Fig. 10.58 shows the comparison with experimental
volume fractions. This formula can now be written in simple software code to
provide an almost instant answer to the temperature at which heat treatment will
give the ideal 50:50 ratio of austenite to ferrite.

===========
358 N. Saunders and A. P. Miodownik

0.65
© Alloy C4
© Alloy C6
x Alloy C7
« 0.60 A Alloy C8
&
3
e
a oss
&
2
é
2 oso
2
2
3
<
0.45
0.40

 

0.40 0.45 0.50 0.55 0.60 0.65
Calculated Austenite

Figure 10.57 Comparison between austenite amounts calculated thermodynamically
and calculated using Eq. (10.1) (Longbottom and Hayes 1994).

Observed Austenite

© Alloy C4
© Alloy C6
A Alloy C7
+ Alloy C8

 

. 0.40 0.45 0.50 0.55 0.60 0.65 0.70
Austenite from Equation

Figure 10.58 Comparison between experimental austenite amounts and those
calculated using Eq. (10.1).

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 359

10.6.3.2 o phase in Ni-based superalloys. Section 10.6.1.1 showed how CALPHAD
calculations could be used to predict o formation in Udimet 720 and 720LI alloys.
A corollary is to calculate how the o-solvus varies as the contents of the different
elements are altered, and Fig. 10.59 shows such variations in o-solvus temperature
for U720LI as each element is changed within its nominal specified composition
limits. It is interesting to note that the greatest sensitivity is to Al, with a Ti sensi-
tivity similar to that of Cr. This is because additions of Al and Ti increase the levels
of 7’ in the alloy and reject o-forming elements such as Cr, Mo and W into the 7
phase. As the amount of + decreases there is a significant increase in concen-
tration of these elements in , which leads to higher susceptibility to o formation.
Taking the information in Fig. 10.59 it is now possible to define o-sensitivity
factors for each of the elements with a simple mathematical formula, as in the
previous section. This can then be used to monitor o susceptibility of different heats
during alloy production, replacing PHACOMP methods. Such sensitivity factors
can be defined for all types of production features where phase equilibria are
important for Ni-based superalloys, for example -y’ heat-treatment windows, levels
of +’ at heat-treatment or forging temperatures, solidus and liquidus temperatures,
etc,

720

U720Li

SIGMA SOLVUS (T C)

 

Figure 10.59 Variation in calculated o-solvus temperature as elements in U720LI
change between maximum and minimum specified limits.

===========
360 N. Saunders and A. P. Miodownik

10.6.3.3 Liquid-phase sintering of high-speed M2 steels. High-speed steels, which
typically contain at least seven elements, can be produced in a variety of ways, for
example by casting, by water or gas atomisation with subsequent hot compaction of
the atomised powder, and by liquid-phase sintering. The latter provides a
production route whereby the steel can be produced directly to the correct shape.
The process relies on there being sufficient liquid to infiltrate the pores of a powder
compact and produce densification, but not too much, as this would cause the
compact to lose structural strength and distort. A reasonable level for liquid-phase
sintering is approximately 10% of the volume. It is also critical that the volume of
liquid is fairly insensitive to fluctuations in temperature in the furnace, i.e.,
dViiq/dT is as small as possible, otherwise the sensitivity of the process to
fluctuations in temperature control, or the intrinsic variations in temperature within
the furnace itself, makes the process uncontrollable.

Figure 10.60 shows a phase % vs temperature plot for an M2 steel with a
composition (in wt%) of Fe-6.2W-5.1Mo—4.2Cr—1.85V-0.3Si-0.8C. The alloy is
characterised by the formation of two types of carbide, MeC, which is the
predominant form, and MC. The calculated melting temperature is close to that
observed for such alloys and the amount of MgC and MC is also in good agreement
with experimental observation (Hoyle 1988). Chandrasekaran and Miodownik
(1989, 1990) and Miodownik (1989) examined M2 steels, with particular emphasis
on the effect of increasing V levels to increase the formation of the V-rich MC
carbide. Figure 10.61 shows the change in behaviour of M2 when the V level is
increased from 1.85 to 2.5wt%, calculated using Fe-DATA (Saunders and Sundman
1996). The MC carbide is stabilised as expected, but @ is also stabilised and
becomes involved in a fairly complex reaction scheme with the liquid, y, MgC and
MC. Both of these effects are qualitatively expected, but now the CALPHAD route
enables calculations to be made for the amount of liquid as a function of
temperature. Figure 10.62 shows such calculations as V levels are raised from
1.75% to 2.5% and the increase in solidus temperature with increasing V addition
reflects well the experimental measurements quoted by Chandrasekaran and
Miodownik (1989). It can now be seen that the slope of the liquid curve is flat for
the lower levels of V, i.e., dVjiq/dT is small, but as the V levels reach 2.5wt%V, the
slope becomes steep. Clearly there will be a limit around this composition at which
the alloy will become difficult to fabricate by liquid-phase sintering.

10.6.4 Intermetallic alloys

Intermetallic alloys (compounds) are becoming of increasing interest as materials
which possess significantly enhanced high temperature capabilities compared to
many conventional metallic alloys. However, they suffer intrinsic problems
associated with low-temperature ductility and fracture toughness. Two types of

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 361

MOLE % PHASE

 

TEMPERATURE_CELSIUS

Figure 10.60 Calculated mole % phase vs temperature plot for an M2 steel with
normal V level.

MOLE % PHASE

 

TEMPERATURE_CELSIUS

Figure 10.61 Calculated mole % phase vs temperature plot for an M2 steel with
high V level.

===========
362 N. Saunders and A. P. Miodownik

MOLE % LIQUID
3

  

0.
1240 1250 1260 1270 12801290
TEMPERATURE_CELSIUS

Figure 10.62 Calculate mole % liquid vs temperature plots for an M2 steel as V
levels are changed between 1.75 and 2.Swt%.

intermetallic alloys have attracted wide attention, those based on NiAl and those on
TiAl. The next two sections describe work on both types of alloy.

10.6.4.1 NiAl-based intermetallic alloys. Phase-diagram studies have been used
extensively in NiAl-based alloys as a method of designing microstructures. NiAl is
difficult to prepare as a binary alloy with reasonable levels of ductility and fracture
toughness. Therefore considerable effort has been placed in designing micro-
structures which might reduce this inherent brittleness. An approach has been to
make alloy additions to NiAl so that it forms a two-phase structure with a more
ductile phase, such as the f.c.c. Ni-Fe-based solid solution, ‘y, (Ishida et al. 1991),
or even +7’ based on Ni3Al (Kainuma et al. 1996). This has been shown to produce
high levels of ductility for such materials but, unfortunately, the process of
ductilisation by a softer second phase does lead to a degradation of intrinsic
strength and high-temperature creep capability. Another approach to designing
NiAI alloys has been to produce multi-phase structures containing NiAl + other
intermetallic compounds such as the Heusler-type phase NizAITi and +7’ (Yang et
al. 1992a,b). These alloys are less ductile but have significantly higher yield
strengths and potentially enhanced creep properties.

The approach of Ishida et al. (1991) and Kainuma ef al. (1996) utilised both
experimentally determined and calculated diagrams for Ni~Al-Fe (Fig. 10.63) to

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 363

(a) Isothermal Section at T=1100°C
6

 

 

at% Al

(b) Ni-25Al-XFe Vertical Section
1400

  

1300
1200
1100

1000

Temperature/°C

0 5 10 15 20 25
at% Fe

Figure 10.63 Phase equilibria in the Ni-Al-Fe system from Kainuma et al.
(1996).

define compositions whereby various mixtures of NiAl and +/77’ could be produced.
These authors optimised their alloys on the basis of the amounts of the various
phases as well as their microstructure. In their case, the initial microstructure was
an Llo martensite formed by transformation of the @ phase on cooling. By using a
series of heat treatments and varying the composition of the alloy they were able to
design three distinct types of microstructure (Fig. 10.64) and successfully produce

===========
364 N. Saunders and A. P. Miodownik

Llo Martensite

 

Room Temp. 300°C 700T 800°C
Heating Temperature

Figure 10.64 Schematic illustrations showing the microstructural evolution of
three kinds of 3 +7’ microstructures; widmanstatten, type } lamellar and blocky
type 2 lamellar structures in Ni-25Al-{a)18Fe, (b)15Fe and (c)13Fe alloys.

NiAl-based alloys with ductilities as high as 10% in tension and strengths in the
region of 750-1000 MPa.

Yang et al. (1992a, b) also utilised a combination of experiment and calculation
to critically determine the phase region for the A-NiAl, y’-Ni3Al and §’-Ni2AITi
phases. The philosophy of their approach was to produce an alloy with high levels
of @ and (', as mixtures of these phases had been shown to have enhanced creep
resistance in comparison to the monolithic phases themselves (Polvani et al. 1976).
The combination of experiment and calculated phase % vs temperature plots (Figs.

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 365

 

  

 

(b)
10
0.9
0.8
« 07
5 §
3 B06
; Z
a 0s
8 2
a @ 04
2 2
~ “03
0.2
. ot
00 | 0.0 t
600 800 1000-1200 1400 1600 © 600. 800.-«1000-«1200:«:1400 1600
Temperature, °C Temperature, °C
(c)
10
09
08
207
£
3 06
s
Eos
2
204
=
03
02

0.1

0.0
600 800 1000-1200 1400 1600

Temperature, °C

i

Figure 10.65 Calculated mole % phase vs temperature plots for Ni-Al-Ti
intermetallic alloys. (a) Ni-28Al-12Ti, (b) Ni-22AI-15Ti and (c) Ni-20AI-13Ti.

10.65(a—c)) allowed precise microstructures to be defined and subsequently pro-
duced in candidate alloys. In these alloys the microstructure was as much controlled
by the solidification mechanism as by any solid state transformation and, as such,
the calculations were invaluable as they could be used to predict solidification
patterns. Alloys produced as part of this programme had high compressive yield
stresses, in the range of 1000-2000 MPa, and, although the alloys still had quite
low tensile ductility, there is a significant enhancement in ductility due to the
generation of dislocations at interphase boundaries.

===========
366 N. Saunders and A. P. Miodownik

10.6.4.2 TiAl-based intermetallic alloys. Alloys based on the y-TiAl compound are
still very much in the early stages of development. Commonly used variants such as
Ti-48A1-2Mn-2Cr and Ti-48AI-2Mn-Nb (at%) are quaternary in nature and it is
only recently that alloys of a multi-component nature have been developed. As
alloy development has progressed, increasingly complex behaviour has been
observed and changes in transformation behaviour can now be tracked using a
recently developed TiAl database (Saunders 1997b). All alloys are based on the 7-
TiAl compound of Ti-Al and Fig. 10.66 shows the calculated diagram for the
binary system TiAl. Alloys usually contain between 43-5Oat%Al and, for the most
part, contain a-Ti3Al as well as 7-TiAl. They are usually heat treated in the high-
temperature, single-phase a-phase region, or just below it, before cooling when the
@ phase decomposes to a microstructure which exhibits a fine lamellar structure of
transformed 4-TiAl with fine laths of a2-Ti3Al.

Figure 10.67 shows a mole% phase vs temperature plot for a Ti48Al-2Mn-2Nb
alloy of nominal composition; variations of this alloy with Al in the range 45—
48at% are commonly used. It is a straightforward a2/-y alloy which can be heat
treated in the a condition before transforming on cooling to (a2 +-y) and very
much exhibits the prototype microstructure for the early type of alloys.

The replacement of Mn by Cr in the Ti48Al-2Cr-2Nb alloy (Fig. 10.68) causes
the predicted onset of instability with respect to a Cr-rich B2 phase. This in good
accord with experimental observations in alloys of this type (Fuchs 1995, Kelly and
Austin 1996) and at low temperatures there is also a potential for the formation of

1800
1600
1400

1200

1000

800

TEMPERATURE_CELSIUS

 

400 (Aly

0 20 40 60 Al,Ti 80 100
MOLE_PERCENT AL

Figure 10.66 Calculated Ti~Al phase diagram.

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 367

MOLE % PHASE

 

600 800 1000 1200 1400 1600
TEMPERATURE_CELSIUS

Figure 10.67 Calculated mole % phase vs temperature plot for a Ti-48AI-2Mn-2ND
alloy.

MOLE % PHASE

 

600 800 B2 1000 1200 14001600
TEMPERATURE_CELSIUS

Figure 10.68 Calculated mole % phase vs temperature plot for a Ti-48A]-2Cr-2Nb
alloy.

===========
368 N. Saunders and A. P. Miodownik

Table 10.2. Some recent +-TiAl-based alloys with comparison between experimentally observed and
calculated a-transus temperatures

a-transus q-transus
Alloy (exp) (calc) Reference
Ti-48AI-2Cr-2Nb 1364 1357 Fuchs (1993)
Ti-49,SAI-1.1Mn-2.5Nb 1436 1425 Lombard et al. (1992)
THATAI-2.5Nb-1Cr-1V 1350 1357 Kim (1992)
Ti-46.7Al-3Nb-1W 1350 1353 Bhowal ef al. (1995)
Ti-48A1-2Nb-2Cr-1W 1358 1371 Fuchs (1995)
Ti-47AI-1 5Cr-0.5Mn-2.6Nb-0.15B 1365 1367 Kim (1995)
Ti-47Al-2Nb-IMn-0.5W-0.5Mo-0.2Si ~ 1366 Seo et al. (1995)

 

almost pure Cr. Newer alloys have centred around the substitution and addition of
elements to the 48-2-2-type alloys and have compositions of the type shown in
Table 10.2, which also gives comparisons for experimentally observed and
calculated a-transus temperatures.

It is noticeable that heavy elements such as W and Ta are now being increasingly
used and that alloys are subsequently becoming more prone to formation of the B2
phase. This is seen for example in alloys such as Ti-48Al-2Nb-2Cr-1W, and
their variants (Fuchs 1995). One of the most complex alloys developed so far is
Ti-47Al-2Nb-1Mn-0.5W-0.5Mo-0.2Si. However, although truly multi-compo-
nent in nature, the total refractory metal addition to a basic Ti-Al alloy is still only
4at%. The microstructure of this alloy consists of second-phase particles enriched
in Mo and W and there is also evidence for silicides (Seo et al. 1995). Figure 10.69
shows the calculated phase % vs temperature plot for this alloy; the alloy is
predicted to be unstable with respect to a B2 phase enriched in Mo and W, and
TisSi; will form below 1020°C. The calculation also predicts that the alloy may
become unstable with respect to W precipitation at low temperatures.

It is clear that as these alloys have become more highly alloyed, the simple
prototype concept of an a2/‘y microstructure is having to be modified to take into
account borides, silicides and the B2 phase. It is now possible to understand the role
of the various elements in promoting these phases and also to design with them in
mind. For example, the B2 phase can inhibit grain growth if it is present in the
high-temperature a-phase field. This appears somewhat analogous to conventional
Ti alloys, where some small amounts of a in § grain boundaries during processing
and help prevent catastrophic grain growth during forging, but the role of the
phases is completely reversed.

10.6.5 Alloy design
Most of the previous examples show that CALPHAD calculations can enhance
knowledge of the general phase behaviour of alloys when a suitable thermodynamic

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 369

MOLE % PHASE

 

600 800 1000 ~Ti,Si, 1400 1600
" TEMPERATURE_CELSIUS

Figure 10.69 Calculated mole % phase vs temperature plot for a
Ti-47A1-2Nb-IMn-0.5W-0.5Mo-0.2Si alloy.

database is available. However, it is also interesting to look at some CALPHAD-
based work where the main aim has been to help design or optimise some specific
feature, or combinations of features, which are affected by phase behaviour. Such
features may be associated with a physical property such as modulus and
magnetism, a mechanical property such as strength, a chemical property such as
corrosion resistance or some more complex combination which might effect a
property such as weldability. The best examples centre around Fe-based materials,
which probably relates to historical reasons as Fe-based systems were one of the
first types of alloy to be thermodynamically characterised in any great detail.
However, it is clear that once good thermodynamic characterisations are available
the use of CALPHAD methods need not be limited to any particular material type
(Miodownik 1993).

10.6.5.1 Magnetic materials, The value of CALPHAD calculations for magnetic
alloys has been demonstrated for Fe~Cr—Co-based alloys, where alloys with
improved magnetic properties were made by designing their composition and heat-
treatment temperature to lie in a miscibility caused by magnetic forces (Nishizawa
et al. 1979a, Homma eft al. 1981, Ishida and Nishizawa 1991). Inden (1987) has
described in detail the background to the production of such hard magnets which
can be summarised as follows.

A good design for a hard magnetic material is to have small, elongated particles,

===========
370 N. Saunders and A. P. Miodownik

aligned and magnetised along their axis, embedded in a paramagnetic matrix. One
of the easiest ways to produce such a microstructure is by some form of preci-
pitation reaction, where the size of the particles can be controlled by heat treatment.
This then leaves the problem of producing the requisite shape and alignment of the
particles which leads to a further prerequisite that the precipitate/matrix interface
must have a low energy. It is not always possible to produce ‘ideal’ rod shapes, but
precipitates with a more plate-like morphology can also be aligned by applying a
magnetic field during the precipitation process.

For such materials it is desirable for there to be a miscibility gap due to mag-
netism (Fig. 10.70(a, b)) as described in Chapter 8. In these circumstances, spinodal
decomposition can occur by the formation of paramagnetic and ferromagnetic
phases. The best magnetic properties can be produced if annealing is performed just
below the temperature where instability begins.

Figure 10.71 shows a calculated isothermal section for Fe-Cr-Co at 1200 K,
showing how the miscibility gap in the binary systems is expanded in the ternary. It
should be noted that these sections are metastable, as the o phase would precipitate
out in equilibrium. However, if heat treatments are done for sufficiently short times,
spinodal decomposition occurs without precipitation of 7. The effect of the
expansion of the miscibility gap in the teary means that higher heat-treatment
temperatures can be used, allowing a material with a higher Curie temperature and
subsequently higher saturation magnetisation to be produced. Heat treatments for
these alloys can be sensitive to small changes in composition. Figure 10.72 shows a
vertical section in Fe-Co-Cr at a ratio of tpe/2co = 83/17 and it can be seen that
only a few at% differentiates alloys with a paramagnetic or a ferromagnetic matrix.

AI-Ni and AI-Ni-Co magnets work on identical principles to the Fe-Cr-Co
magnets but, instead of considering a miscibility gap between paramagnetic and
ferromagnetic phases which are disordered, the paramagnetic phase is, in this case,
ordered. Figures 10.73(a, b) show an isothermal and a vertical section through the
Fe-Ni-Al ternary system produced by a combination of experiment and calculation
(Hao et al. 1984). Additions of Co were made to this basic system and, in accord
with thermodynamic calculations (Nishizawa et al. 1983), both the peak
temperature of the miscibility gap and the region of immiscibility in the quaternary
are increased.

Good magnetic properties in these alloys are obtained under the following con-
ditions: (1) The ferromagnetic a phase is present as isolated particles embedded in
a weakly magnetic or non-magnetic matrix of a2; (2) the particles are uniaxially
aligned; and (3) the volume fraction of a is in the range 0.4-0.6

Unfortunately, AI-Ni and Al-Ni-Co magnets suffer from the disadvantage of
being hard and brittle, leading to problems with machining which becomes
expensive and difficult. Using a mainly experimental phase-diagram approach,
Ishida et al. (1991) were able to design an alloy which contained a small amount of
ductile f.c.c. -y phase distributed along the grain boundaries of the alloy. This

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide

(b)
(a)
1200 Sook
1000 chemical contribution
8004 BS
es
600 | FSO

Gibbs ~ energy (kJ/mol)

200

0 02 04 06 08 1.0
A MOLEFRACTION B

 

A os B

Figure 10.70 (a) Phase diagram for an A-B alloy system exhibiting phase

separation due to magnetism and (b) underlying Gibbs energy vs composition

curve showing the contribution from chemical and magnetic energies (from Inden
1987).

 

Figure 10.71 Calculated isothermal sections for Fe-Cr-Co at 1200 K
(from Inden 1987, Nishizawa et al. 1979b).

371

===========
372 N. Saunders and A. P. Miodownik

A B
matrix ay matrix a,

    
  

magnetic field

‘Temperature [°C]

FepgsCop 15 0.2 0.4 0.6 08 1.0

Figure 10.72 Calculated vertical section through the Fe-Cr-Co system at a
constant ratio xpe:Xco of 83:17 (from Inden 1987, Homma et al. 1981). T. is the
Curie temperature.

microstructure significantly improves hot workability and leads to the possibility of
producing ductile material.

10.6.5.2 Rapidly solidified in-situ metal matrix composites. A design project for
alloys based on the Fe~Cr-Mo-Ni-B system, and produced by rapid solidification,
was undertaken by Pan (1992). During processing a mixture of borides is formed
inside a ductile Fe-based matrix which makes the alloys extremely hard with high
moduli. These alloys provide a good example of how phase-diagram calculations
were able to provide predictions which firstly helped to identify unexpected boride
formation (Saunders ef al. 1992) and were ultimately used in the optimisation of the
modulus of a shaft material for gas turbines (Pan 1992).

The alloys are first produced by rapid solidification and are amorphous in nature.
They are either directly fabricated as powders, by a process such as high-pressure
gas atomisation (HPGA), or by melt-spinning of ribbons, which are subsequently
pulverised to form a powder (<150 zm). The powders are then consolidated by hot
extrusion between 950-1050°C where the initial amorphous structure breaks down
and forms a fine dispersion of stable borides in a ductile Fe-based matrix.

 

References are listed on pp. 402-408.

===========
Temperature/K

CALPHAD— A Comprehensive Guide

      
    

1
FeAl FeAl

  

 

(b) 2000
2000
1500
Disorder °
1500.9 9 0 5
ooaoo £
5
1000 8
3
3
1000 &
gap 4500
in disordered sey
500 oe

97.5 50 0

X/ Fe \ Concentration of Fe/at% Y/ NiAl
+
2.5% Al, 1.25%Al,

Figure 10.73 (a) Isothermal and (b) vertical sections from the Ni-Fe~Al phase

diagram (Ishida and Nishizawa 1991).

373

===========
374 N. Saunders and A. P. Miodownik

Because of the inherently non-equilibrium nature of the production route, the
first question which needed to be answered was whether the phases present in the
alloy were in fact stable, so that equilibrium calculations could actually be used to
design these alloys. To this end CALPHAD calculations were combined with a
detailed experimental characterisation of a Fe79Cr}gMo2Bio alloy (Kim et al. 1990,
Pan 1992). The TEM and XRD results confirmed earlier work (Xu ef al. 1985)
which stated that an orthorhombic boride M2B was present and its composition was
Cr-rich. However, they also showed that a proportion of the borides (~10%) were
Mo-rich and that the Fe-based matrix was martensitic. The latter result was
particularly surprising because of the high level (20at%) of a-ferrite stabilisers Cr
and Mo. Furthermore, initial analysis of diffraction patterns from the TEM work
indicated that the structure of the Mo-rich boride was a tetragonal type whose
structure had not been reported in previous literature (Kim and Cantor 1988).

Calculated phase equilibria for this alloy produced the following predictions:

(1) The existence of a Cr-rich M2B phase.

(2) There would be a substantial proportion (7.3%) of the U3Si-type, MsBz
boride in the alloy with high levels of Mo.

(3) The Fe-based matrix would be austenitic at 1000°C but transform to ferrite
below 857°C, thus giving a reason for the observed martensitic structure.

Based on the prediction for the M3Bz boride, and its observed lattice parameter
variation with Fe, Cr and Mo levels, the structure of the Mo-rich phase was re-
evaluated and clearly shown to be primitive tetragonal of the U3Si2-type (Kim et al.
1990). This work also gave results for ratio of Fe:Cr:Mo in the various phases
which were in excellent agreement with those predicted at 1000°C.

It is clear that the input of the phase-diagram predictions greatly helped in
understanding the evolution of microstructure in this alloy, and although the alloys
were produced by a highly non-equilibrium route, the calculations also showed that
the phases present after extrusion were the stable phases for the alloy, so design
criteria based on equilibrium calculations could therefore be used. A further
advantage of the calculation route was that the number of alloys which needed to be
examined, in order to achieve the optimum microstructure/property combination
for the design criteria of the turbine shaft, could be dramatically reduced (Pan 1992,
Miodownik 1993).

In order to evaluate the role of the various phases, it was necessary to design
distinct alloys where the matrix was either austenitic or ferritic. Figure 10.74 shows
the principle by which this was achieved for Fe~Cr-B alloys where it can be seen
that only a small change in Cr level puts an alloy into a region where it is fully
ferritic at consolidation temperatures. Alloys from the Fe-Cr-Mo-B system were
then designed so that the matrix was fully ferritic and a further set of alloys from
the Fe-Cr-Ni-B system which were fully austenitic. Although producing stable
microstructures, significant drops in strength and hardness were found in alloys

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 375

oy Or 0.2 03 % 04 0.5
MOLE-FRACTION CR
Figure 10.74 Calculated isothermal for Fe-Cr-B at 1000°C showing placement
of high-B alloys which have either a or y matrices at processing temperature (Pan
1992).

 

600
—— Eshelby Model

= Modified

500
= Heat Treated

400
300
200

100

Young's Modulus (GPa)

 

0
0 0.2 04 06 08 1.0
Volume Fraction of Boride

Figure 10.75 Comparison of calculated Eshelby curves for modulus with
experimentally determined moduli for high-B ferrous base alloys (Pan 1992).

whose matrix was either fully ferritic or austenitic, It also became clear that small
amounts of C were present in all alloys which was adding to the hardness of the
martensite, hence enhancing its properties.

The next step was to optimise the ratio of M3B to MB; and various alloys were
designed and tested to improve factors such as strength and modulus (Pan 1992).
Eshelby analysis (Eshelby 1957, Withers et al. 1989) was used to predict modulus
and good agreement was found with experimental measurement (Figure 10.75). It

===========
376 N. Saunders and A. P. Miodownik

was clear that modulus was significantly enhanced by increasing boride level but
owing to morphological considerations (the borides were not aligned and had low
aspect ratios) the modulus increase was less than was hoped for. In the end, alloys
were designed to have martensitic matrices, approximately equal volumes of MB
and MB, and predicted modulii of between 245-255 GPa. All of these properties
were achieved in the final experiments . One of the limiting factors in looking at
higher amounts of M3B2, which were more finely dispersed and, hence, potentially
gave greater strength, was that high liquidus temperatures made it difficult to melt
such alloys.

10.6.5.3 The design of duplex stainless steels. Lee (1995) reported on work
relating to the design of duplex stainless steels using a predominantly thermo-
dynamic approach. Four important properties were chosen as being critical to
performance, and these were: (1) strength, (2) toughness, (3) weldability and (4)
corrosion resistance. Of these, strength was considered to be the least critical in the
alloy design process, as this was heavily controlled by factors such as work
hardening and grain size, and would be more effectively controlled by thermo-
mechanical processing rather than design of composition. Lee (1995) then
identified critical factors associated with phase equilibria which would affect the
other three properties. These were the stability of austenite at high temperatures for
weldability, sigma formation for toughness and the composition of austenite in
local equilibrium with Mz3Cg for corrosion resistance. These factors could then be
combined to give an overall performance criterion. The rationale for the choice of
favourable thermodynamic properties was based on the following arguments.
Weldability. It had been previously reported (Norstrom et al. 1981) that an
increase in austenite amount was beneficial to weldability. Further, Cao and
Hertzman (1991) had reported that loss of impact toughness because of ferrite
formation during welding could be recovered by re-formation of austenite at lower
temperatures. Lee (1995) subsequently concluded that increased stability of
austenite above the heat-treatment temperature would be beneficial to weldability.
Therefore, the amount of austenite at 1350°C was taken as a criterion for alloy
design, higher values being given a positive rating compared to lower values.
Sigma formation. While o-phase formation is known to cause embrittlement in
duplex stainless steels, Lee (1995) argued that the important factor in the process
was the driving force for precipitation rather than the potential amount of o which
might be formed. This was because only small amounts are actually necessary to
cause embrittlement (Norstrom ef al. 1981) and, therefore, the early stage of
precipitation should be considered more important than the final equilibrium state.
While nucleation is a complex process, Lee (1995) suggested that, for the purpose
of alloy design, nucleation parameters for o such as interfacial energies, misfit
strain energies, etc., would be approximately equal for alloys which lay close in
composition to the original alloy. This would mean that the driving force for

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide

377

Table 10.3. Composition of candidate alloys and results of calculations on toughness, weldability and
corrosion resistance. Calculation was conducted assuming an annealing temperature of 1050°C,
0.8%Mn, 0.7%Si and 0.024%C (wt%). PRE value in the heading of the table indicates value for
SAF2205 (from Lee 1995)

 

 

 

Alloy composition (w1%) Toughness Weldability Corrosion resistance
High temp. Cr content PRE

N Ni Mo Cr AG foro austenite % in austenite (37.28)

014 75 0 27,15 x =- -

014 75 1 2621 x - -

014° 7.5 2 25.27 x _ -

O14 7.5 3 24.33 x ol =~

014 75 4 23.40 x _ —

014 65 0 25.93 x — -

014 65 1 2495 x - -

O14 65 2 23.97 x - —

O14 65 3 22.99 x - _

0.14 65 4 2201 Vv v @.2) x 4155

014 55 0 24.69 x = =

014 55 1 (23.67 Vv x (0.3) Vv 32.80

016 55 2 22.64 v xX (08) v 35.08

014 55 3 2162 v x (14) x 37.36

O14 55 4 20.60 v x (19) x 39.63

O14 45 0 23.43 v XXX (0.0) vv¥ 28.76

O14 45 1 2237 v XX (0.0) vv 31.00

014 45 2 21.29 Vv x (0.0) v 33.23
016 45 3° 2021 vv x (02) v 35.45
014 45° 4 19.13 vVvv xX (1.0) x 37.67

020 75 0 2847 x - ~

0.20 7.5 1 27.54 x -

0.20 7.5 2 26.61 x - _

0.20 7.5 3 25.69 x - _

0.20 «7.5 4 24.77 x _ _

0.20 65 0 27.24 x — —

0.20 6.5 1 26.27 x _ —_

0.20 65 2 2531 x _ _-

0.20 6.5 3 24.34 x - -

0.20 65 4 23.38 x _- =>

0.20 5.5 0 25.99 x —_ —

020 55 1 2499 x - -

020 55 2 23.98 v v5) v 38.22
020 55 3 2297 v vv (12) v 40.51

0.20 55 4 2197 Vv VVV (1.8) Vv 42.80
020 45 0 24.73 v v G6) vv¥ 31.87
020 45 1 23.68 v v.46) vv 34.12

020 45 «2 22.63 v Vv (5a) v 36.37

020 45 3° 2157 v v3) v 38.61

020 45 4 2051 vv vv (7.0) Vv 40.85

 

===========
378 N. Saunders and A. P. Miodownik

nucleation would effectively be the dominating criteria for the initial precipitation.

Corrosion resistance, The main criterion here was judged to be the level of Cr in
the matrix phase and the avoidance of Cr depletion in the austenite which would be
controlled by the precipitation of M23Cg in the early stages. A criterion was there-
fore placed on alloy design where high levels of Cr in the austenite phase in ‘local
equilibrium’ with M23C¢ would be given a positive rating.

It is also desirable for the alloy to have as high a Pitting Resistance Equivalent
(PRE) value as possible and Lee (1995) calculated this number using the formula

PRE = wt%Cr + 3.3wt%Mo + 30wt%N + 0.5wtNi — 0.5wt%Mn — 30wt%C.

Lee (1995) then constructed a matrix of 40 candidate alloys, close to the SAF2205
composition of Fe-22Cr-5.5Ni-3Mo-1.7Mn-0.4Si-0.14N-0.025C (in wt%) which
are given in Table 10.3. Calculations were then made to establish the magnitude of
the various criteria described previously and a tick (,/) is shown where improve-
ment was predicted over SAF2205, (X) where there would be a deterioration in the
property and (—) denotes that this property was not calculated. On the basis of this
approach it is clear that five alloys with high N would give an improvement in all
three criteria and also give a higher PRE number.

10.6.5.4 Design of high-strength Co-Ni steels. Grujicic et al. (1987) and Grujicic
(1991) have developed a procedure to design ultra-high-strength alloys based on
M,C-hardened Co-Ni steels. They set a design criterion for producing an alloy with
good fracture toughness (Kic~70-130 MPa,/m) and an ultimate tensile strength
(UTS) level between 2100 and 2400 MPa. They began with a commercial alloy
AF1410 which, although falling far short of their ultimate goal, served as a starting
point for their design programme. The composition of AF1410 is Fe-14Co-10Ni-
2Cr-1Mo-0.15C (in wt%). It is primarily strengthened by M,C, where M=Cr and
Mo, and peak hardness is found on tempering at 510°C for 5 hrs.

Their initial aims were to assess the role played by Co on the carbide phases and
to optimise the Cr, Mo and W levels subject to the requirements of a balanced
composition where mo + Zcr + Zw = 2zc¢. Further, constraints were to limit the C
level at 0.25wt% and the nickel level at 10wt%.

The first part of the work was to calculate the driving force for the precipitation
of M,C from their alloys, as this is the factor which would govern its precipitation
behaviour in the initial stages. They did this for an alloy with the fixed-base
composition Fe~14Co—-10Ni-0.25C, at the proposed heat-treatment temperature of
783 K, and varied the W, Mo and Cr levels using the formula given in the previous
paragraph, Results were plotted in a ternary format (Fig. 10.76(a)) and show how
the greatest driving force is found for Mo-rich alloys with the relative effect of
various elements on AG being in the order Mo>Cr>W. As carbides other than M2C
would also form in their alloys, they plotted driving forces to form Mz3C¢ and M,C,

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 379

which are shown in Figs. 10.76(b, c). It can be seen that the lowest driving forces to
form these carbides were in Mo-rich alloys and, hence, such alloys would maximise
the yield of MC.

Gnujicic (1991) then made a series of calculations to estimate the MjC coarsening
rate in these types of alloys. This is important because metastable cementite is often
a predecessor precipitate to M2C and deleterious to mechanical properties. The
cementite can be removed by prolonging the tempering treatment, but this causes
subsequent coarsening of the desirable M2C. Using simple coarsening theory, they
were able to determine that W-rich alloys would have the greatest resistance to

cr
Cr (2.17 we%)

         
 

0.25C-(W-Mo-Cr)

Fe-14Co-10Ni- Fe-14Co-10Ni-
0.25C-(W-Mo-Cr)
(a) T=783K (b) T= 783K
w

w Mo
(7.65 wi%) (4.0 wi%)

 

cr
Fe-14Co-10Ni-
0,25C-(W-Mo-Cr)

Figure 10.76 Variation of the driving force (kJ mot”) for precipitation of (a)

MAC, (b) Ma3Cs and (c) MgC from ferrite at 783 K in a Fe-14Co-10Ni-0.25C-

(W-Mo-Cr) alloys with balanced alloy additions of Mo, Cr and W (Grujicic et al.
1987).

===========
380 N. Saunders and A. P. Miodownik

Cr (2.17 w/o)

   

Fe-14Co-10Ni-0.25C Coarsening rate of M,C

T = 783 °K

w Mo
(7.65 w/o) (4.0 w/o)

Figure 10.77 Coarsening rate of M,C at 783 K in a Fe-14Co-10Ni-0.25C-(W-Mo-Cr)
alloys with balanced alloy additions of Mo, Cr and W (Grujicic 1991).

coarsening; their calculated results are shown in Fig. 10.77, again using ternary
axes. The design of the alloy now becomes a subtle balance of increasing W levels
to enhance the coarsening resistance of M2C, but keeping Cr and Mo levels
sufficiently high to minimise the potential for precipitation of the other carbides,
Ma3Cg and MgC.

The general design process for these alloys was extended by Grujicic and Olson
(1988) to consider how ferrite/M2C equilibria could be adjusted by considering
coherency strains at the matrix/carbide interface during the early stages of precipi-
tation. Their calculations indicated that Fe would substitute for Cr in the case of
coherent equilibrium and that the C stoichiometry would be shifted significantly
from an ideal M,C ratio. This affects coarsening resistance as well as driving force
for precipitation.

In a further aspect of the design, compositions were adjusted to maximise the
fracture toughness of the alloy by maximising its transformation toughening behaviour
(Haidemenopoulos et al. 1989). This toughening occurs because of deformation-
induced martensite which forms at the crack tip as it moves through the dispersion
of austenite which is retained in the alloy. The design criteria used here were that
there should be both as large a volume change on transformation to martensite as
possible and also that the driving force to form martensite should be as high as pos-
sible in the retained austenite. Magnetic Gibbs energy contributions, as well as those
due to composition, were taken into account and it was concluded that deformation-
induced transformation toughness would be maximised by moving from the ‘ideal’
AF1410 composition to an alloy with significantly higher levels of Ni.

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 381
10.6.6 Slag and slag—metal equilibria

10.6.6.1 Matte-slag—gas reactions in Cu-Fe-Ni sulphide ores. Sulphide ores are a
major source of Cu, Ni and precious metals. A basic principle of the extraction
processes is to blow air into the molten sulphide in order to oxidise (1) S, which
forms a gas and (2) Fe, which forms predominantly FeO and then partitions to a
slag phase which covers the matte. A key element in the recovery of the metals is
the solidification of the matte which separates into a sulphur-rich matte and metal-
rich liquid. This process may occur under non-equilibrium conditions with precious
metals concentrating in the last metallic liquid.

To obtain a better understanding of the process, calculations were performed by
Dinsdale et al. (1988) and Taylor and Dinsdale (1990) for a pre-fused matte of
Ni3S2, CuyS and FeS, heated to around 1270°C with an equivalent amount of oxide
slag, and with O being blown into the matte. Calculations from the model system
Cu-Fe-Ni-S-O are presented in Fig. 10.78 which shows the comparison between
calculated and experimental values of the Fe/S partitioning in the matte as a
function of SO, levels.

Calculations were then made for the amount of Cu and Ni levels in the slag as a
function both of Fe in the matte and SO, levels. This showed that partitioning was

TK pSO, atm.
1533 50
1573 05
1533 05
1493 0S

wt % S in matte

calculated

 

‘Wt % Fe in matte
Figure 10.78 Comparison between calculated and experimental matte compositions
(Ni:Cu wt ratio 2:1) at different temperatures and SO; partial pressures (from Taylor
and Dinsdale 1990).

===========
382 N. Saunders and A. P. Miodownik

 

“full equilibrium’ cooling

‘sequential’ intervals 20°
10°
5°
Po
io

% liquid left

 

Figure 10.79 Percent liquid remaining during matte solidification under both
equilibrium and ‘Scheil-Gulliver’ solidification conditions (from Taylor and
Dinsdale 1990).

insensitive to SO levels and it was only necessary to maintain significant levels of
Fe in the matte to ensure that Cu and Ni uptake in the slag was minimised. The
solidification of the matte was then modelled both when solidification occurred by
an equilibrium process and alternatively in a non-equilibrium fashion, diffusion in
the solid being considered negligible (the so-called ‘Scheil-Gulliver’ conditions,
see Chapter 11). Figure 10.79 shows the calculated results and it is evident that the
liquid is retained to lower temperatures than would occur by equilibrium freezing,
and the model for non-equilibrium solidification predicted the formation of a new
phase, which was consistent with experimental information.

10.6.6.2 Calculation of sulphide capacities of multi-component slags. The
thermo-dynamics and kinetics of desulphurisation are of great importance to iron
and steel making and the ability to predict the behaviour of sulphur associated with
multi-component slags is, therefore, very desirable. To this end Pelton et al. (1993)
recently described an approach to predict the sulphide-removing capacity in multi-
component oxide slags. While a comprehensive database for oxides was already
available, the inclusion of S had not yet been undertaken. Therefore it was not
possible to calculate the necessary S activity and solubility directly through a

 

References are listed on pp. 402~408.

===========
CALPHAD—A Comprehensive Guide 383

CALPHAD calculation. To overcome this difficulty they combined a semi-
empirical model from Reddy and Blander (1987, 1989) with an equilibrium
CALPHAD calculation for the multi-component oxide system Si02-Al.03-TiO.—
CaO-MgO-MnO-FeO. The approach can be summarised as follows.

The exchange of O and S between an oxide slag and other phases can be written
in general terms as

AnO pig) + hs, (eas) = AnSiiq) + do, (es) (10.2)

where A,,O and A,,S are components of a slag, with A being a particular cation. An
equilibrium constant can be defined for this reaction as

— os (Por\"?_  (-GR
Kan te (R) = 00(ze (10.8)

where a,4,o and a4,s are the activities in the slag and G% is the standard Gibbs
energy of reaction. As the amount of S in solution is small, it was assumed that
Henry’s law could be applied such that a4,5 varies directly as the amount of
dissolved S. Further, it was assumed that for a given oxide slag composition, a4,0
would be nearly equal to its value in the sulphur- free slag. From this the sulphide
capacity of a slag (Cs) can be derived (Fincham and Richardson 1964) as

 

1%
Cs = wis (7) ° (10.4)

where (wt%S) is the amount of dissolved sulphur. The sulphide capacity for any
given slag will be constant as long as the dissolved S is relatively low and, there-
fore, the higher the sulphide capacity, the higher the S content of the slag.

Equation (10.4) relies on a knowledge of both the sulphide and oxide activities.
However, S was not yet included in their database for oxides. They therefore
utilised the approach of Reddy and Blander (1987, 1989) to relate a4,5 to the S
content and sulphide capacities could then be predicted through calculation of a4,0
alone. The approach yields the following expressions for sulphide capacities for
basic and acid slags:

Basic slags 3) (1 — 2z¢i0,)

C8) = ay gp tb Psion) _
Zg0, S 1/3 "9 (3,0Ma,0 + 250,Ms0,)

Ge (10.5)

Acid slags (3) Zsi0; ( = i
—} =a, a ef 10.6
Zsio, 2 1/3 Ce. 0 y,0Ma,0 + 2si0,Msio,) \ 228i0, (10.6)

===========
384 N. Saunders and A. P. Miodownik

and
c= 1000 MsKa

10.7
Vas (0)

where x and M denote, respectively, the moles and molecular weights of the various
components. The Henrian activity coefficient of A,S, 74, ¢, is then assumed to be
equal to 1, and if K4 for each component is known, the sulphide capacity can be
calculated for each oxide component. Values of K4 were obtained from assessed
thermodynamic values. The various values of Cs for each oxide component were
then obtained from the following equation:

log Cs = ya log Ca) + ya log Csyay + yo log Cac) + + (10.8)

where log C45) is the value of log Cs in the binary A,O-SiO, at the same value of
‘gi, as in the multi-component system and

TA,O
=, 10.9)
4 exo + 48,0 +80,0+) (208)

The approach yielded excellent results and Figs 10.80-10.83 show comparison of
calculated and experimentally determined sulphide capacities in various multi-
component slags.

1503°C

log C, (Wt. %)

 

Wt. % FeO, MgO or Al,0,

Figure 10.80 Comparison between calculated and experimental (Bronson and St-
Pierre 1981) effects of Al;Os, FeO and MgO additions upon sulphide capacities of
CaO-SiO, slags at a constant (CaO+A0)/(SIO;+A1,03) ratio, where A=Fe or Mg.

References are listed on pp. 402-408.

 

===========
CALPHAD—A Comprehensive Guide 385

160°C

© Xgy

© Xs

log C, (Wt. %)

 

0 02 04 06 08 10
X mao! Xmno*Xmeo)
Figure 10.81 Comparison between calculated and experimental (Sharma and Richardson
1965) sulphide capacities at constant SiO, fraction in MnO-MgO-SiO, slags.

1650°C 1600°C 175°C

 

-1 0 1
ar 0 1650°C
&
3 3h 2b Ht °
= 1600°C
wv ks
e
Pua 3 -2 %
a
ts7s°c
ok ab -3 O Calculated
© Experimental
oi st ug

0.0 Ot 0.2 0.3 0.4 0.5

Xqo#0-1X go" 08K q,0,-Xsi0,

Figure 10.82 Comparison between calculated and experimental (Bronson and St-
Pierre 1981) sulphide capacities in SiO,-Al,0s-MgO-Ca0-FeO slags.

===========
386 N. Saunders and A. P. Miodownik

Calculated
~~ Experimental

204

Xsio,

+— Mn0-Si0, ~AI,0, (1650°C)

log C, (Wt. %)
log C, (Wt. %)

&__ €20-Si0, -A1,0; —>

Se (1650°C)
SS (1s00°C)

x

 

‘A1203

Figure 10.83 Comparison between calculated and experimental (Fincham and

Richardson 1954, 1964, Sharma and Richardson 1965) sulphide capacities in

AO-Si0;-Al,03 slags (where A=Mn, Mg, Ca) at a constant SiO, fraction of
0.4.

10.6.6.3 Estimation of liquidus and solidus temperatures of oxide inclusions in
steels. The deformation of inclusions in steels has significant consequences on the
hot workability of steels as well as for the mechanical properties of the final
product. In order to increase their deformability there are at least three strategies
(Matsumiya et al. 1987): (1), Reduction of their melting point; (2), deceleration of
crystallisation; and (3), reducing their flow stress. If the melting point can be
reduced sufficiently so that some liquid is present at the hot-working temperature,
the inclusions would be expected to deform easily.

To this end, Matsumiya et al. (1987) made calculations for inclusions from the
quinary system SiO0,-Al,0;-CaO-MgO-Mn0O, based on assessments of the com-
ponent binary and ternary sub-systems. Figures 10.84(a,b) show two of the
calculated ternary diagrams and Table 10.4 shows comparisons between calculated
and experimentally determined liquidus temperatures for five oxide inclusions.

Figures 10.85(a, b) show phase fraction plots for inclusions 1 and 2 in Table 10.4.
These are plotted in such a way as to show the cumulative amount of all phases as
well as their individual amounts. A quasi-ternary diagram was then plotted for an
‘ideal’ inclusion with a fixed level of Al,03=20.4wt% and MgO =8.2wt% (Fig.
10.86). From this it can be seen that a slight increase in SiO, reduces the liquidus

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 387

SiO,

   

CaO 20 40 60 80 FeO

CaO MgO SiO,

 

c20 20 40 60 80 MgO
wt% MgO

Figure 10.84 Calculated isothermal sections at 1600°C for (a) CaO-FeO-SiOz
and (b) Ca0-MgO-SiO, (Matsumiya ef al. 1987).

temperature of inclusion 1 from Table 10.4. Taking this into account in a new
‘ideal’ inclusion, they made further calculations by varying the various levels of the
component oxides with fixed SiO. content. From these calculations they were able
to conclude that the liquidus temperature was sensitive to changes in the component
oxides with sensitivity factors in the following order: MnO>Al,0;>MgO>Ca0. To
realise the potential reductions in liquidus temperature of the inclusions, changes
would be needed during the steelmaking process in the de-oxidiser, refining slags
and refractory materials.

===========
388

N. Saunders and A. P.

Miodownik

Table 10.4. Compositions, liquidus temperatures and primary phases of oxide inclusions

Oxide composition (weight fractions)

Liquidus (°C)

 

No. SiO

Al,O3

CaO MgO = MnO.

Calc. Exp, Primary phase

 

0.459
0.500
0.4208
0.5081
0.7749
0.5647

AUaene

0.204
0.050
0.2956
0.3559
0.1830
0.2712

0.153 0.082 0.102
0.020 0.230 0.200
0.2108 0.0441 0.0287
0.0833 0.0437 ——-0.0090
0.0012 0.0054 0.0355
0.0270 0.0010 0.1361

1290 1300 Mg0.Al,05

1390 1404 2MgO.Si0,

1450 1460 CaO.2Si02.Al,03
1550 >1500 CaO.2Si02.3A1,05
1280 >1650  2Si0;.3A1,03
1470 >1500 — 2Si0;.3Al,05

 

MOLE FRACTION* OF PHASES

MOLE FRACTION* OF PHASES.

Liquid

C20°2Si0,°A1,0,
MgO°Al,0,
J, = 190°C

 

1300 1400 1500

0
1000-1100 1200
TEMPERATURE °C
()
2MgO'SiO,,

   

he MnO-SiO,

PRS MnO-Al,0,

0.5

Mg0'siO,
/

ye 1065°C

0.0
1000 1100 1200

1300 1400 1500

TEMPERATURE °C

Figure 10.85 Calculated phase fraction vs temperature plots for oxide inclusions
nos (a) 1, (b) 2 and (c) 3 from Table 10.4,

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 389

Sid,

  
 

(@ : composition No.1)

ca0 MgO-Al,0, MnO

Figure 10.86 Calculated liquidus surface of the five-component oxide system
with fixed values of 20.4wt%Al,0; and 8.2 wt%MgO.

10.6.7 Complex chemical equilibria

10.6.7.1 CVD processing. CVD (chemical vapour deposition) processing is an
area where calculations using mainly a substance database have proved valuable in
understanding the process conditions for deposition of silicides, borides, carbides,
etc. A good example of such calculations is provided by Vahlas et al. (1996) who
looked at the deposition of WSiz from various gaseous environments. They utilised
a substance database for the elements Si-W~CI-H-O-Ar where 46 species in the gas
phase and 20 stoichiometric condensed phases were considered in the calculation.
They first calculated a so-called ‘CVD diagram’ for the system WFg-SiHs—H2—Ar,
representing the incoming gas, which shows the phases which will be deposited as a
function of partial pressure of WF¢ and SiH, (Fig. 10.87). The lines separating the
various deposition regimes have ‘bands of uncertainty’ superimposed to reflect the
uncertainty arising from the assessment of the thermodynamic data for the total
system. It is clearly seen that the deposition of pure WSi, will be difficult using these
input gases. In order to find a less sensitive system the case of WCl,-SiH,-~H2-Ar
was considered, whose CVD diagram is shown in Fig. 10.88. It can now be seen
that the single-phase region for WSiz has significantly expanded which means that
the CVD process will be less sensitive to composition fluctuations in the input gas

===========
390 N. Saunders and A. P. Miodownik

itself, or fluctuations in the gas due to transport phenomena within the CVD
deposition chamber. Further variations occur when SiH, is substituted for by
SiCl,H2 and the width of the WSi2 single-phase region expands even further (Fig.
10.89), providing even less demanding conditions for the deposition of pure
WSi2.

     
   
 

fWSSi3>|
$< WSi2>

<WSi2>4>Si>

 

Figure 10.87 Calculated CVD phase diagram for the WF<-SiH,-H,~Ar system at
T= 1000 K, Pru =1 atm and P,,=0.9 atm (from Vahlas et al. 1996).

 

sL_
ios 10+ 103 1072
P, tr
Poin, (tm)

Figure 10.88 Calculated CVD phase diagram for the WClz-SiH,-H;-Ar system
at T= 1000 K, Pua 1 atm and P,,=0.9 atm (from Vahlas et al. 1996).

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 391

The substitution of TiCl, for WCl, yields the CVD diagram as shown in Fig.
10.90 (Vahlas et al. 1996) and it can clearly be seen that the CVD diagram is totally
different, demonstrating both the system specific nature of such diagrams and the
importance of the underlying thermodynamics in determining how the process will
occur in practice.

we?

we

 

LZ

ws ww we Ww?

i, ate
‘sinc, 1")

Figure 10.89 Calculated CVD phase diagram for the WCly-SiClH,-Hy-Ar
system at T= 1000 K, Pio | atm and P,,=0.9 atm (from Vablas et al. 1996).

 

wh we we

Fauoim

Figure 10.90 Calculated CVD phase diagram for the TiCl-SiH,-H,-Ar system
at T= 1000 K, Pioui=1 atm and Py,=0.9 atm (from Vahlas et al, 196).

===========
392 N. Saunders and A. P. Miodownik

10.6.7.2 Hot-salt corrosion in gas turbines. In a wide variety of cases, Ni-based
super-alloys are protected from corrosive attack in gas turbine engines by the
formation of a surface layer of Cr,O3. However, in marine environments, NaC! can
become concentrated in the incoming gas and lead to reaction with sulphur-
containing combustion products to form Na2SO,. This then condenses onto the
Cr20; layer which leads to the dissolution of Cr.O3, exposing the alloy itself to cor-
rosive attack from the atmosphere, which is both oxidising and sulphidising. This
type of attack is often called ‘hot-salt corrosion’ and Barry and Dinsdale (1996)
examined this process using a substance database as the basis for their calculations.

The required data is for the gas and solid phases in the system NaCl-NaOQH-
NazCrO,-Na2SO,. Some solubility was allowed for in the condensed solid phases,
mainly in terms of binary interactions between the respective components which
form simple phase diagrams (see for example Fig. 10.91). Calculations were then
made relating to a gas turbine operating at a fuel/air ratio of 50:1, at 15 bar and
750°C. The fuel was taken to have a composition approximating to the formula
CH .. On the basis of these assumptions, the combustion products were calculated
to be predominantly N2, O2, CO, and H,0, their respective partial pressures being,
11.6, 2.216, 0.61 and 0.55 bars. 1% sulphur in the fuel would then cause the sum of
the pressures of SOQ, and SO; to be 0.0026 bar. If only 1 ppm of NaCl were present
this would cause the partial pressure of HCI in the gas to be 0.0046 bar, the residual
sodium forming mainly as Na2SO, on any exposed surfaces.

Na,SO,-Na,CrO,

Temperature (K)

 

500
0.0 0.2 0.4 0.6 0.8 1.0

Na,SO, Xwazcros Na,CrO,

Figure 10.91 Calculated phase diagram for the NaySO,-Na,CrO, binary system
(Barry and Dinsdale 1996).

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 393

10.6.7.3 Production of silicon in an electric arc furnace. Although not particularly
complex in terms of chemical equilibrium, the production of Si in an electric arc
furnace is a neat example of how equilibrium calculations can be made which take
into account material flow during a dynamic process (Eriksson and Hack 1990). In
practice, the furnace works continuously, with raw starting material supplied at the
top of the furnace while gases circulate in such a way that there is a flow upwards
with a counter-current flow of solid material which falls downwards. In order to
simulate the reactions taking place in the furnace, it is necessary to take into
account the fact that substances move in a temperature gradient during the process
and that the temperature is controlled as much by the heat exchange and enthalpy of
reactions as by external heating.

Eriksson and Hack (1990) developed a module for the ChemSage software code
which would help examine cases where there is material and heat flow as well as
chemical reactions. This is achieved by conceptually separating up the furnace into
a number of separate parts or ‘stages’ where local chemical equilibrium can be
assumed. Flow is then modelled by including distribution coefficients between the
stages. So, for example, in a reactor with two stages, material which reacts in one
stage can move to another stage, dependent on the flow direction. The accuracy of
the programme in dealing with dynamic flow, which is non-equilibrium in nature,
lies in how many stages are used. The use of many stages will allow smooth
changes to be considered but will cause a substantial increase in computational
time. For the Si arc furnace four stages were considered and these are shown
schematically below.

*AH =0 Input
Stage 1 TK = 1784 c
Phar = 1.0 SiO, (quartz)
*AH =0
Stage 2 TK == 2089
Phar = 1.0
*AWT =0
Stage 3 TK == 2079

Phar =10

Stage 4

 

*regulated quantity |
Condensed phases

===========
394 N. Saunders and A. P. Miodownik

 

1784 K T2058 k T 2079 K T2355 K

SiO (G)

Flow / mol

 

TOP BOTTOM

Figure 10.92 Flow scheme for various phases in a Si electric arc furnace (from
Eriksson and Hack 1990).

The raw materials, 1 mole of SiO and 1.8 moles of C are introduced into the top
stage where the temperature is 1784 K, while the energy from the arc, 875 kJ per
mole of SiO2, was taken to be released only in the bottom stage of the reactor. The
reactor assumes each stage has fixed temperature and therefore the enthalpy input
to the other three stages arises solely from heat exchange and reaction. The flow
scheme (Fig. 10.92), distribution coefficients, values for the heat balances in each
stage, input substances and initial temperatures are actually obtained by an
optimisation process and relate to a particular furnace rather than generically to all
Si arc furnaces. The example above is from Eriksson and Hack (1990) but later cal-
culations by the same authors (Eriksson and Hack 1996) give somewhat different
results. However, the latter relate to a specific Si arc furnace at KemaNord,
Ljungaverk, in Sweden.

10.6.8 Nuclear applications

Nuclear applications constituted a strong area in the early stages of CALPHAD
calculations, not only to obtain a better understanding of alloying in U- and Pu-
based systems but also for handling complex gas reactions. The interest in applying
CALPHAD to nuclear problems is well demonstrated by the papers of Potter and
Rand (1980, 1983) which reviewed work on a variety of problems, including simple
calculations for the U-O and U-Pt-O systems, and more complex calculations for
irradiated fuels and coolant reactions. Recently Ball et al. (1989, 1996) have looked
at the application of phase-equilibrium calculations to cladding failure in irradiated
pins for water-cooled thermal and liquid-metal-cooled fast-breeder reactors and the
analysis of accidents in nuclear reactors.

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 395

10.6.8.1 Cladding failure in oxide fuel pins of nuclear reactors. The long-term
operational performance of nuclear fuel pins is critically governed by the reactions
that occur in the gap between the fuel and its cladding. Ball ef al. (1989) examined
this for the cases of (1) Zircaloy-clad pellets of UO2,, in a pressurised water reactor
(PWR) and (2) stainless-steel-clad pellets of (U,P)O2+, in a liquid-metal-cooled
fast-breeder reactor (LMFBR). In particular they were interested in the influence of
O potential on Cs, I, Te and Mo and the effects of irradiation on the gaseous species
within the fuel-clad gaps.

In the case of PWRs, which operate at relatively low centre temperatures
(~1500 K), it was considered that little diffusion of fission product elements would
occur to the gap, the majority of material in the gap arising from athermal processes
such as fission-fragment recoil. The oxygen potential was taken to increase with
increasing irradiation and a series of calculations were made at 650 K to predict the
pressure of the predominant gas species as a function of oxygen potential. Two
cases were considered: (1), Mo and Zr being zero, i.e., no presence of the fission-
product Mo or interaction with the Zircaloy (Fig. 10.93(a)), and (2) with Mo and Zr
included (Fig. 10.93(b)). Although qualitatively similar, the calculations show that
the inclusion of Mo increased the I pressure in the gas due to the reaction of CsI
with Mo-containing species to form Cs;MoQ,.

In LMBFRs, operating temperatures at the centre are nearer 2300 K, far higher
than in PWRs, and the fuel is a mixture of U and P oxide (U, P)O2,,. Any reactions
must now include Cr from the oxide film of the stainless-steel cladding which has
replaced Zircaloy. Figure 10.94(a) then show the calculated ratios of Te:Cs, I:Cs
and Te:I for a reaction at 850 K, assuming that no fuel was involved in the reaction,
which is then predominantly controlled by Mo and Cr, while Fig. 10.94(b) shows
what happens when fuel is included, assuming similar levels of Mo and Cr. Again,
the calculations show that predictions are qualitatively similar in both cases, but
there are significant differences in the amounts of reaction.

On the basis of the above calculations, Ball et al. (1989) concluded that, for
PWRs, the potential of J in the gas from equilibrium reactions would be insufficient
to account for stress corrosion cracking (SCC) of the Zircaloy. The inclusion of Mo,
which can be present in the gap as a fission product, raised the iodine potential but,
again, not to a level sufficient to account for any SCC. However, the concentrations
of the elemental gaseous species could increase more significantly due to irradiation
by fission fragments, and this may be sufficient to produce SCC of the Zircaloy. For
the case of LMBFRs, I levels were also increased due to increased O potential.
More importantly, Cs and Te levels would also be increased and, with the ratio
Te:Cs>0.5, the calculations showed that these elements may deposit as solids onto
the cladding surface leading to corrosion of the stainless-steel cladding.

10.6.8.2 Accident analysis during melt-down of a nuclear reactor. The problem to
be considered here is the erosion of concrete by liquid material during a ‘melt-

===========
396 N. Saunders and A. P. Miodownik

 

 

-10 — ae
\ Pressure of I for are Tons
~15 SCC of Zircaloy _ 7

Log (P/atm)

 

 

-700 -660 -620 -580 540 -500 460 -420 380
Oxygen potential / kImol—1
(b)
0

 

   

  
    

Pressure of I for
SCC of Zirealoy

 

Log (P/atm)

 

 

-700 660 -620 -580 -540 -500 -460 -420
Oxygen potential / kImol-1

Figure 10,93 Calculated pressures of the predominant gas phase species as a

function of oxygen potential within the fucl-clad gap of a PWR fuel pin calculated

for the case (a) where Mo and Zr are absent and (b) where Mo and Zr are included
(Ball et al. 1989).

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide

397

 

 

 

 

 

(a)
we
ae
ab
— 0
&
&
ES 4k
2
3
“8h
2
2 Zo weer Log (Te/t)
7
a ———— Log (Tei)
16 Za = Log (1/Cs)
woe. 7
L t !
-700 500 -300

 

e

Log (ratio)
&

Oxygen potential / kJmol-1

 

 

  

corte Log (Te/l)

 

 

Log (Te/Cs)

[ . += Log (1/Cs)
See ito | t

 

~900 -700 ~$00 -300

Oxygen potential / kJmol-1

   

Figure 10.94 Calculated ratios of amounts of Te:Cs, I:Cs and Te:l in the gas

phase as a function of oxygen potential within the fuel-clad gap of a LMFBR fuel

pin assuming (a) no fuel takes part in the reaction and (b) fuel is included in the
reaction (Ball et al. 1989).

===========
398 N. Saunders and A. P. Miodownik

down’ of the reactor core. In this case the liquid core is ‘relocated’ into the bottom
of the reactor vessel where immiscible oxide and metal liquids are formed. This is
initially contained within a crucible of condensed material but, if the wall of the
reactor pressure vessel is breached, the molten ‘corium’, comprising components of
the core and structural materials, is ejected onto a concrete basemat in the
secondary containment building. This concrete basemat is both thermally ablated
and attacked by the molten ‘corium-concrete’ interaction (MCCI). In addition there
are gas reactions which can potentially lead to the release of dangerous radioactive
material into the atmosphere.

To examine this problem more closely it was necessary to develop (1) a
model for the nine-component oxide system UO 2-ZrO,-Si0,-CaO-MgO-
Al,0;-SrO-BaO-La,0; to account for the MCCI (Chevalier 1992, Ball er al.
1993) and (2) develop a database for the gas-phase reactions in the oxide sub-
system UO2-ZrO,-Si0,-CaO—-MgO-AI,03. The final oxide database included four
solution phases and 70 condensed stoichiometric phases.

Figures 10.95(a, b) show isopleths calculated between (a) corium and siliceous
concrete and (b) corium and limestone concrete. Comparison between experimental
(Roche et al. 1993) and calculated values for the solidus are in reasonable agree-
ment, but two of the calculated liquidus values are substantially different. However,
as the solidus temperature is more critical in the process, the calculations can
clearly provide quite good-quality data for use in subsequent process simulations.
Solidus values are critical factors in controlling the extent of crust formation
between the melt-concrete and melt-atmosphere interface, which can lead to
thermal insulation and so produce higher melt temperatures. Also the solidus, and
proportions of liquid and solid as a function of temperature, are important input
parameters into other software codes which model thermal hydraulic progression
and viscosity of the melt (Cole et al. 1984).

Calculations including the vapour phase were then made to determine the extent
of release of various components during the reaction. Two types of calculation were
made, one where ideal mixing in the solution phases was considered and the other
where non-ideal interactions were taken into account. For elements such as Ba, U
and, to a certain extent, Si, the calculations were relatively insensitive to the model
adopted. However, the amount of Sr in the gas was 24 times higher in the ‘full
model’ in comparison to the ideal model. This led to the conclusion that sensitivity
analysis was necessary to determine the extent to which accuracy of the
thermodynamic parameters used in the model affected the final outcome of the
predictions.

10.6.8.3 The effect of radiation on the precipitation of silicides in Ni alloys. While
chemical reactions in nuclear generators have dominated how CALPHAD methods
have been used in practice for nuclear applications, there has also been a significant
interest in the metallurgical aspects of materials under irradiation (Kaufman et al.

 

References are listed on pp. 402-408.

===========
Temperature (K)

Temperature (K)

CALPHAD—A Comprehensive Guide 399

(a) Temperature — composition isopleth

 

PHASES
1 Liquid 2 Cubic
3 Tetragonat 4 Monoctine
3000 8
5 Melilite 6 Anorthite
7 Wollastonite 8 Pseudowollastonite
9 Alpha CaSiO3 10 Al

  
 
   
     
   
 
    

 

 

  

      
  

 

  
 

 

11 Rankinite 12. Cris
13 Tridymite 14 ZrSi04
2500
2000
1500 Nexaas Woo TBH
24446
Esa ere Sov
0.0 0.2 0.4 0.6 0.8 1.0
Corium Proportion of concrete by moles Concrete
(b) Temperature - composition isopteth
PHASES
1 Liquid 2 Cubic
3 Tetragonal 4 Monocline
3000 1 5 Melilite 6 Anorthite
7 Wollastonite 8 Pseudowollastonite
9 Alpha CaSiO3 10 Alpha Prime CaSiO3}
TW Rankinite 12 Cristobelite
13 Tridymite 14 ZrSiO4
2500
2000
Tt Sao ee mene LtRthS,
1500 ff
[psp poser) tesco
294 2444547411 24445410411
+547
0.0 0.2 0.4 0.6 08 1.0
Corium Proportion of concrete by moles Concrete

Figure 10.95 Calculated isopleths from 100% corium to 100% concrete. (a) For
sicliceous concrete and (b) limestone concrete (Ball et al. 1996).

===========
400 N. Saunders and A. P. Miodownik

1978, Miodownik et al. 1979, Watkin 1979). Irradiation can cause void-swelling,
suppression of o formation in stainless steels and non-equilibrium precipitation of
silicides. These phenomena are complex and occur by a combination of thermo-
dynamic and kinetic effects. However, it was shown by Miodownik et al. (1979)
that a thermodynamic analysis could be used to good effect to rationalise the effect
of radiation on silicide formation. Although the work was done for a simple alloy
system, it demonstrates how thermodynamics can be used in unusual circumstances.

Barbu and Martin (1977) observed that increasing Ni* dose rate enhanced the
formation of Ni3Si in Ni-Si alloys (Fig. 10.96), causing it to form in ‘sub-saturated’
alloys whose Si levels were below the solvus composition for the formation of
equilibrium Ni;Si. From a purely thermodynamic point of view an additional Gibbs
energy (AG*) has to be taken into account which is shown schematically in Fig.
10.97. Miodownik et al. (1979) correlated this additional Gibbs energy to dose rate
for sub-saturated Ni-Si alloys with 2 and 6at%Si (Fig. 10.98), and generated a
diagram which showed how the formation of Ni3Si would occur in these alloys as a
function of temperature and dose rate (Fig. 10.99). The diagram is analogous to a
time-temperature-transformation diagram with the dose rate taking the place of the
time axis. Rotating the axes also gives a form of diagram similar to that of Barbu
and Martin (1977) shown in Fig. 10.96.

Although the work was in the form of pseudo-equilibrium in the presence of
irradiation, and did not take into account the effect of kinetics, it nevertheless gives
a Clear indication of an additional energy term due to irradiation. Similar studies
were done by Kaufman et al. (1978) to show the magnitude of the Gibbs energy
necessary to prevent o formation in Fe-Cr-Ni alloys.

 

o 200 400 600

TEMPERATURE, °C

Figure 10.96 Combinations of Ni* dose-rate and temperature leading to
precipitation of Ni;Si (from Barbu and Martin 1977).

 

References are listed on pp. 402-408.

===========
CALPHAD—A Comprehensive Guide 401

 

 
    

COMPOSITION SHOWING
‘PRECIPITATION UNDER
IRRADIATION CONDITIONS,

    
   

FREE ENERGY, G

NORMAL TANGENCY POINT ~
Gy, Si

 

 

 

Ni COMPOSITION

Figure 10.97 Definition of the Gibbs energy (AG*) required in order to
precipitate NisSi in subsaturated solid solutions (from Miodownik et al, 1979).

 

 

ASSOCIATED DRIVING FORCE, AG*

vo? 10"! 1o* 10 0-4 10°?
DOSE RATE, dpa s!

Figure 10.98 Correlation of AG” with dose rate for 2at% and 6at%Si alloys
(from Miodownik et al. 1979).

 

HIGH TEMPERATURE THRESHOLD. 1200

 

° 1 Low TEMPERATURE <=”
i THRESHOLD

wo* 107 0 oto toto? tt
DOSE RATE, dpa s-'

 

Figure 10.99 Calculated amount of Ni;Si precipitated in subsaturated Ni-Si
alloys in the presence of Ni* i ion (from Miodownik et al. 1979).

 

===========
402 N. Saunders and A. P. Miodownik

10.7. SUMMARY

This chapter has shown many examples of the use of CALPHAD methods, ranging
from an unusual application in a binary system, through complex equilibrium cal-
culations to calculations for 10-component alloy systems. In all cases the use of
CALPHAD methods has enhanced the understanding of processes, clearly defined
alloy behaviour and provided vital information for other models, etc. It is also clear
that equilibrium calculations can be used in many different areas and under a
surprising number of different conditions. For numerous reasons, modelling will
never completely replace experimental measurement. However, the quantitative
verification of the accuracy of CALPHAD calculations now means that they can be
seriously considered as an information source which can be used as an alternative
to experimental measurement in a number of areas and can also enhance inter-
pretation of experimental results.

For a number of applications, particularly those associated with conditions of
continuous cooling or heating, equilibrium is clearly never approached and
calculations must be modified to take kinetic factors into account. For example,
solidification rarely occurs via equilibrium, amorphous phases are formed by a
variety of non-equilibrium processing routes and in solid-state transformations in
low-alloy steels much work is done to understand time-temperature—transformation
diagrams which are non-equilibrium in nature. The next chapter shows how
CALPHAD methods can be extended to such cases.

REFERENCES

Akamatsu, S., Hasebe, M., Senuma, T., Matsumura, Y. and Akisue, O. (1994) /SUU
International, 34, 9.

Andersson, J.-O. (1988) CALPHAD, 12, 1.

Andersson, J.-O. and Sundman, B. (1987) CALPHAD, 11, 83.

Ansara, I. and Rand, M. H. (1980) The Industrial Use of Thermochemical Data, ed. Barry, T.
I. (Chemical Society, London), p. 149.

Anyalebechi, P. N. (1992) in Processing, Properties and Application of Metallic and
Ceramic Materials, eds Loretto, M. H. and Beevers, C. J. (MCE publications, UK), p. 219.

Bale, C. W. and Eriksson, G. (1990) Canadian Metallurgical Quarterly, 289, 105.

Ball, R. G. J., Mason, P. K. and Mignanelli, M. A. (1996) in The SGTE Casebook—
Thermodynamics at Work, ed. Hack, K. (Inst. Materials, London), p. 135.

Ball, R. G. J., Mignanelli, M. A., Barry, T. L. and Gisby, J. A. (1993) J. Nucl. Materials, 201,
238.

Barbu, A. and Martin, G. (1977) Scripta Met., 11, 771.

Barry, T. I. and Dinsdale, A. T. (1996) in The SGTE Casebook—Thermodynamics at Work,
ed. Hack, K. (Inst. Materials, London), p. 56.

Betteridge, W. and Heslop, J. (1974) in The NIMONIC Alloys and other Ni-Based High
Temperature Alloys: 2nd Edition, (Edward Amold Ltd, 1974).

===========
CALPHAD—A Comprehensive Guide 403

Bhadeshia, H. K. D. B and Edmond, H. V. (1980) Acta Met., 28, 1265.

Bhowal, G. E., Konkel, W. A. and Merrick, H. F. (1995) in Gamma Titanium Aluminides, eds
Kim, Y.-W. et al. (TMS, Warrendale, OH), p. 787.

Blavette, B., Caron, P, and Khan, T. (1988) in Superalloys 1988, eds Reichman, S. et al.
(TMS, Warrendale), p. 305.

Blenkinsop, P. (1993) ‘IRC in materials for high performance applications’’, University of
Birmingham, U.K., private communication.

Boniardi, M., lacoviello, F. and La Vecchia, G. M. (1994) in Proc. Conf. Duplex Stainless
Steels 94 (Welding Institute, Cambridge), Paper 89.

Brinegar, J. R., Mihalisin, J. R. and Van der Sluis, J. (1984) in Superalloys 1984, eds Gell, M.
et al. (Met. Soc. AIME, Warrendale), p. 53.

Bronson, A. and St-Pierre, G. R. (1981) Met. Trans. B, 12B, 729.

Cama, H., Worth, J., Evans, P, V., Bosland, A. and Brown, J. M. (1997) in Solidification
Processing 1997, eds Beech, J. and Jones, H. (University of Sheffield, UK), p. 555.

Cao, H.-L. and Hertzmann, S. (1991) in Proc. Conf. Duplex Stainless Steels ’91 (Les
Editions Physique, Les Ulis, France), p. 1273.

Caron, P. and Khan, T. (1983) Mat. Sci. Eng., 61, 173.

Chandrasekaran, L. and Miodownik, A. P. (1989) ‘‘Phase equilibria relevant to liquid phase
sintering in Fe-base alloys’’, Report to SERC under contract GR/D 99935 (University of
Surrey, Guildford, January).

Chandrasekaran, L. and Miodownik, A. P. (1990) in PM into the 90s; Proc. Int. Conf. PM90
(Inst. Metals, London), p. 398.

Charles, J., Dupoiron, F., Soulignac, P. and Gagnepain, J. C. (1991) in Proc. Conf: Duplex
Stainless Steels ‘91 (Les Editions Physique, Les Ulis, France), p. 1273.

Chart, T. G., Putland, F. and Dinsdale, A. T. (1980) CALPHAD, 4, 27.

Chatfield, C. and Hillert, M. (1977) CALPHAD, 1, 201.

Chen, C. C. and Sparks, R. B. (1980) in Titanium Science and Technology, eds Kimura, H.
and Izumi, O. (Met. Soc. AIME, Warrendale), p. 2929.

Chevalier, P. Y. (1992) J. Nucl. Materials, 186, 212.

Cole, R. K., Kelley, D. P. and Ellis, M. A. (1984) ‘*CORCON-Mod 2: A computer
programme for analysis of molten core—concrete interactions”, NUREG/CR-3920,
August.

Counsell, J. F., Lees, E. B and Spencer, P. J. (1972) in Metallurgical Thermochemistry
(NPL-HMSO, London), p. 451.

Cortie, P. and Potgeiter, J. H. (1991) Met. Trans. A, 22A, 2173.

Darolia, R., Lahrman, D. F. and Field, R. D. (1988) in Superalloys 1988, eds Reichmann, S.
et al. (TMS, Warrendale), p. 255.

Delargy, K. M. and Smith, G. D, W. (1983) Met. Trans. A, 14A, 1771.

Dharwadkar, S. R., Hilpert, K., Schubert, F. and Venugopal, V. (1992) Z. Metallkde., 83,
744,

Dinsdale, A. T. (1991) CALPHAD, 15, 319.

Dinsdale, A. T., Hodson, S. M., Barry, T. I. and Taylor, J. R. (1988) Computer Software in
Chemical & Extractive Metallurgy, Proc. Met. Soc. CIM, Montreal ’88, 11.

Dreshfield, R. L. and Wallace, J. F. (1974) Met. Trans, 5, 71.

Duerig, T. W., Terlinde, G. T. and Williams, J. C, (1980) Met. Trans. A, 11A, 1987.

Duval, S., Chambreland, S., Caron, P. and Blavette, D. (1994) Acta Met. Mat., 42, 185.

===========
404 N. Saunders and A. P. Miodownik

Eriksson, G. (1975) Chemica Scripta, 8, 100.

Eriksson, G. and Hack, K. (1990) Met. Trans. B, 21B, 1013.

Eriksson, G, and Hack, K. (1996) The SGTE Casebook, Thermodynamics at Work, ed. Hack,
K. (Inst. Materials, London), p. 200.

Erickson, G. L., Harris, K. and Schwer, R. E. (1985) ‘‘The development of CMSX-5 a 3rd
generation high strength single crystal alloy”, presented at the TMS Annual Meeting, New
York.

Eshelby, J. D. (1957) Proc. Royal Soc., London, 241A, 376.

Ferrer, L., Pieraggi, B. and Uginet, J. F. (1991) in Superalloys 718, 625 and Various
Derivatives, ed. Loria, A. (TMS, Warrendale, PA), p. 217.

Fincham, C. J. B. and Richardson, F. D. (1954) J. Iron & Steel Inst., 178, 4.

Fincham, C. J. B. and Richardson, F. D. (1964) Proc. Roy. Soc. (London), 223A, 40.

Fuchs, G. E. (1993) in Structural Intermetallics, eds Darolia, R. et al. (TMS, Warrendale,
OH), p. 195.

Fuchs, G. E. (1995) Mat. Sci. Eng. A, A192/193, 707.

Grujicic, M. (1991) CALPHAD, 15, 179.

ic, M. and Olson, G. B. (1988) CALPHAD, 12, 405.

Grujicic, M., Lee, H.-M. and Allen, S. M. (1987) in User Applications of Alloy Phase
Diagrams, ed. Kaufman, L. (ASM, Metals Park, OH), p. 195.

Gustafson, P. (1988) Met, Trans. A, 19A, 2547.

Gysel, W. and Schenk, R. (1991) in Proc. Conf. Duplex Stainless Steels ’91 (Les Editions
Physique, Les Ulis, France), p. 331.

Hack, K. and Spencer, P. J. (1985) Steel Res., 56, 1.

Haidemenopoulos, G. N., Grujicic, M., Olson, G. B. (1989) CALPHAD, 13, 215.

Hallstedt, B. (1992) Ph.D.Thesis, Royal Institute of Technology, Stockholm.

Hamalainen, E., Laitinen, A., Hanninen, H. and Liimatainen, J. (1994) in Proc. Conf. Duplex
Stainless Steels '94, (Welding Institute, Cambridge), Paper 122.

Hao, S. M., Talayama, T., Ishida, K. and Nishizawa, T. (1984) Met. Trans. A, 15A, 1819.

Harada, H., Ohno, K., Yamagata, T, Yokokawa, T. and Yamazaki, M. (1988) in Superalloys
1988, eds Reichman, S. et al. (TMS, Warrendale), p. 733.

Harvig, H., Nishizawa, T. and Uhrenius, B. (1972) in Metallurgical Thermochemistry (NPL-
HMSO, London). p. 431.

Hayes, F. H. (1985) J. Less Common Metals, 114, 89.

Hayes, F. H., Hetherington, M. G. and Longbottom, R. D. (1990) Mat. Sci. Tech., 6, 263.

Hertzman, S. (1995) Scand. J. Met., 24, 140.

Hillert, M. and Staffansson, L.-I, (1970) Acta Chem. Scand., 24, 3618.

Homma, M., Okada, M., Minowa, T. and Horikoshi, E. (1981) /EEE Trans. Magn., Mag-17,
3473.

Honnarat, Y., Davidson, J. and Duffaut, F. (1971) Mem. Sci. Rev., 68, 105.

Houghton, D. C. (1993) Acta Met. Mater., 41, 2993.

Hoyle, G. (1988) High Speed Steels (Butterworths, London).

Inden, G. (1987) in User Applications of Alloy Phase Diagrams, ed. Kaufman, L. (ASM,
Metals Park, OH), p. 25.

Ishida, K. and Nishizawa, T. (1991) in User Aspects of Phase Diagrams, ed. Hayes, F. H.
(Inst. Materials, London), p. 185.

Ishida, K., Kainuma, R., Ueno, U. and Nishizawa, T. (1991) Met. Trans. A, 22A, 441.

  
 

===========
CALPHAD — A Comprehensive Guide 405

Ishikawa, M., Kuboyana, O., Niikura, M. and Ouchi, C. (1992) ‘‘Microstructure and
mechanical properties relationship of f-rich, a — G Ti-alloy; SP-700"’, NKK Corporation,
Kawasaki 210, Japan.

Ito, Y., Moriguchi, Y., Nishimura, T. and Nagai, N. (1985) in Titanium Science and
Technology, eds Lutjering, G. et al. (Deutsche. Gess. Metallkunde E.V., Oberursal),
p. 1643.

Jaffee, R. I. (1958) in Progress in Metal Physics: Vol. 7, eds Chalmers, B. and King, R.
(Pergamon, London), p. 65.

Jannson, A. (1991) Met. Trans. A, 23A, 2953.

Jernkontoret (1977) A Guide to Solidification of Steels (Jemkontoret, Stockholm).

Jomard, F, and Perdereau, M. (1991) in Proc. Conf. Duplex Stainless Steels ‘91 (Les Editions
Physique, Les Ulis, France), p. 719.

Kahveci, A. I. and Welsch, G. E. (1986) Scripta Met., 20, 1287.

Kainuma, R., Imano, S., Ohtani, H. and Ishida, K. (1996) Intermetallics, 4, 37.

Kaufman, L. (1967) in Phase Stability in Metals and Alloys, (McGraw-Hill, New York),
p. 125.

Kaufman, L. and Bemstein, H. (1970) in Computer Calculation of Phase Diagrams
(Academic Press, New York).

Kaufman, L. and Clougherty, E. V. (1964) in Metallurgy at High Pressures and High
Temperatures: Met. Soc. AIME Symp. Vol. 22, eds Schneider, K.A. et al. (Gordon &
Breach Science, New York), p. 322.

Kaufman, L. and Nesor, H. (1978a) CALPHAD, 2, 295.

Kaufman, L. and Nesor, H. (1978b) CALPHAD, 2, 325.

Kaufman, L., Watkin, J. S., Gittus, J. H. and Miodownik, A. P. (1978) in Applications of
Phase Diagrams in Metalllugy and Ceramics (NBS Special Publication 496, Gaithesburg),
p. 1065.

Keefe, P. W., Mancuso, S. O. and Maurer, G. E. (1992) in Superalloys 1992, eds Antolovich,
S. D. et al. (TMS, Warrendale), p. 487.

Kelly, T. J. and Austin, C. M. (1996) in Titanium '95: Science and Technology, eds
Blenkinsop, P. ef al. (Inst. Materials, London), p. 192.

Khan, T. Caron, P. and Duret, C. (1984) in Superalloys 1984, eds Gell, M. et al. (Met. Soc.
AIME, Warrendale), p. 145.

Kim, W. T. and Cantor, B. (1988) University of Oxford, Oxford, UK, private
communication.

Kim, W. T., Cantor, B., Clay, K. and Small, C. (1990) in Fundamental Relationships
Between Microstructure and Mechanical Properties of Metal Matrix Composites, eds
Liaw, P. K. and Gungor, M. N. (TMS, Warrendale), p. 89.

Kim, Y.-W., (1992) Acta Met. Mat., 40, 1121.

Kim, Y.-W., (1995) Mat. Sci, Eng. A, A192/193, 519.

Kirkaldy, J. S., Thomson, B. A. and Baganis, E. A. (1978) in Hardenability Concepts with
Applications to Steel, eds Kirkaldy, J. S. and Doane, D. V. (TMS, Warrendale), p. 82.

Kriege, O. H. and Baris, J. M. (1969) Trans, ASM, 62, 195.

Kroupa, A. and Kirkaldy, J. S. (1993) J. Phase Equilibria, 14, 150.

Lampman, S. (1990) Metals Handbook, 10th Edition, Vol. 2 (ASM International, Materials
Park, OH), p. 592.

Lasalmonie, A. and Loubradou, M. (1979) J. Mat. Sci., 14, 2589.

===========
406 N. Saunders and A. P. Miodownik

Lee, B. J. (1995) in Applications of Thermodynamics in the Synthesis and Processing of
Materials, eds Nash, P. and Sundman, B. (TMS, Warrendale), p. 215.

Lee, B. J. and Saunders, N. (1997) Z. Metallkde., 88, 152.

Lee, Y. T., Peters, M. and Welsch, G. (1991) Met. Trans. A, 22A, 709.

Lemire, R. J., Paquette, J., Torgeson, D. F., Wren, D. J. and Fletcher, J. W. (1981)
Assessment of Iodine Behaviour in Reactor Containment Buildings from a Chemical
Perspective, Atomic Energy of Canada Ltd., AECL-6812.

Li, X. (1995) M.Sc. Thesis, Univ. of Birmingham, Edgbaston, UK.

Lin, F. S., Sarke Jr., E. A., Chakraborty, S. B. and Gybor, A. (1984) Met. Trans. A, 15A,
1229.

Lindemer, T. B. (1983) CALPHAD, 7, 125.

Lombard, C. M., Nekkanti, R. M. and Seetharaman, V. (1992) Scripta Met., 26, 1559.

Longbottom, R. D. and Hayes, F. H. (1991) User Aspects of Phase Diagrams (Inst. Metals,
London), p. 32.

Longbottom, R. D. and Hayes, F. H. (1994) in Proc. Conf. Duplex Stainless Steels '94,
(Welding Institute, Cambridge), Paper 124.

Loomis, W. T., Freeman, J. W. and Sponseller, D. L. (1972) Met. Trans., 3, 989.

Lorenz, J., Lukas, H. L., Hucke, E, E. and Gaukler, L. J. (1983) CALPHAD, 7, 125.

Lundberg, R., Waldenstrém, M. and Uhrenius, B. (1977) CALPHAD, 1, 159.

Maehara, Y., Ohmori, Y., Murayama, J., Fujino, N. and Kunitake, T. (1983) Metal Science,
17, $41.

Magrini, M., Badan, B. and Ramous, E. (1983) Z. Metallkde., 74, 314.

Marshall, G. J. (1996), Materials Science Forum, 217-222, 19.

Matsumoto, T. (1993) Kobe Steel Engineering Reports, 43, 103.

Matsumya, T., Yamada, W. and Ohashi, T. (1987) in User Applications of Alloy Phase
Diagrams, ed. Kaufman, L. (ASM, Metals Park, OH), p. 137.

Meng, Z.-Y. Sun, G.-C. and Li, M.-L. (1984) in Superalloys 1984, eds Gell, M. et al. (Met.
Soc. AIME, Warrendale), p. 563.

Merino, P., Novoa, X. R., Pena, G., Porto, E. and Espada, L. (1991) in Proc. Conf. Duplex
Stainless Steels '91 (Les Editions Physique, Les Ulis, France), p. 719.

Miodownik, A. P. (1989) Powder Metallurgy, 32, 269.

Miodownik, A. P. (1993) in Proc. Conf. Advances in Materials & Processes, ed.
Ramakrishnan, P. (Oxford & IBBH, New Delhi), p. 87.

Miodownik, A. P., Watkin, J. S. and Gittus, J. H. (1979) *‘Calculation of the driving force for
the radiation induced precipitation of Ni3Si in nickel silicon alloys’, UKAEA Report ND-
R-283(S), February.

Mondolfo, L. F. (1976) Aluminium Alloys: Structure and Properties (Butterworths, London).

Munson, D, (1967) J. Inst. Metals, 95, 217.

Nathal, M. V. and Ebert, L. J. (1984) in Superalloys 1984, eds Gell, M. et al. (Met. Soc.
AIME, Warrendale), p. 125.

Nilsson, J.-O. (1992) Mat. Sci. Tech., 8, 685.

Nishizawa, T., Hasebe, M. and Ko, M. (1979a) Acta Met., 27, 817.

Nishizawa, T., Hasebe, M. and Ko, M. (1979) Proc. CALPHAD VIII, Stockholm, Sweden,
113.

Nishizawa, T., Hao, S. M., Hasebe, M. and Ishida, K. (1983) Acta Met., 31, 1403.

Norstrom, L.-A., Pettersson, S, and Nordin, S. (1981) Z. Werkstofftech., 12, 229.

===========
CALPHAD— A Comprehensive Guide 407

Nystrom, M. and Karlsson, B. (1994) in Proc. Conf. Duplex Stainless Steels '94, (Welding
Institute, Cambridge), Paper 104.

Onodera, H., Ro, Y., Yamagata, T. and Yamazaki, M. (1985) Titanium Science and
Technology, eds Lutjering, G. et al. (Deutsche. Gess. fur Metallkunde E.V., Oberursal),
p. 1883.

Pan, L.~M. (1992) Ph.D. Thesis, University of Surrey, Guildford, UK.

Pelton, A. D., Eriksson, G. and Romero-Serrano, A. (1993) Met. Trans. B, 24B, 817.

Peters, M. and Williams, J. C. (1985) Titanium Science and Technology, eds Lutjering, G.,
Zwicker, U. and Bunk, W. (Deutsche, Gess. fur Metallkunde E.V., Oberursal), p. 1843.

Phillips, H. W. L. (1961) Equilibrium Diagrams of Aluminium Alloy Systems (The
Aluminium Development Assoc., London, UK, 1961).

Polmear, I. J. (1989) Light Alloys: Metallurgy of the Light Metals, 2nd Edition (Edward
Arnold, London).

Polvani, R. S., Tzeng, W. S. and Strutt, P. R. (1976) Met. Trans. A, TA, 23, 31.

Potter, P. E, and Rand, M. H. (1980) in The Industrial Use of Thermochemical Data, ed.
Barry, T .I. (Chemical Society, London), p. 149.

Potter, P. E. and Rand, M. H. (1983) CALPHAD, 7, 165.

Proctor, C. S. (1992) ‘*Characterisation of a need! morphology phase observed in CMSX-4”’,
Report to Rolls-Royce, University of Cambridge, May 1992.

Rand, M. H. (1980) in The Industrial Use of Thermochemical Data ed. Barry, T. 1. (Chemical
Society, London), p. 105.

Reddy, R. G. and Blander, M. (1987) Met. Trans. B, 18B, 591.

Reddy, R. G. and Blander, M. (1989) Met. Trans. B, 20B, 137.

Riedl, R., Karagéz, S., Fischmeister, H. and Jeglitsch, F. (1987) Steel Research 58, No. 8, 339.

Rivlin, V. G. and Raynor G. V. (1988) Phase Equilibria in Iron Ternary Alloys (Inst. Metals,
London).

Roche, M. F., Liebowitz, L., Fink, J. K. and Baker, Jr., L. (1993) NUREG report CR-6032,
June.

Rong, W., Andrén, H.-O., Wisell, H. and Dunlop, G. L. (1992) Acta Met. Mater., 40, 1727.

Saunders, N. (1995) Phil. Trans. A, 351, 543.

Saunders, N. (1996a) in Titanium '95: Science and Technology, eds Blenckinsop, P. et al.
(Inst. Materials, London), p. 2167.

Saunders, N. (1996b) Materials Science Forum, 217-222, 667.

Saunders, N. (1996c) In Superalloys 1996, eds Kissinger, R. D. et al. (TMS, Warrendale),
p. 101.

Saunders, N. (1997a) in Light Metals, ed. Huglen, R. (TMS, Warrendale, PA), p. 911.

Saunders, N. (1997b) ‘‘Phase diagram modelling of TiAl! alloys’’, presented at the Symp.
Fundamentals of y Titanium Aluminides, TMS Annual Meeting, Orlando, Florida, 10-13
February 1997.

Saunders, N. (1997c) unpublished research

Saunders, N. and Rivlin, V. G. (1987) Z. Metallkde., 78, 795.

Saunders, N. and Sundman, B. (1996) Fe-DATA, a database for calculation of phase
equilibria in Fe-based alloys.

Saunders, N., Pan, L.-M., Clay, K., Small, C. and Miodownik, A. P. (1992) in User Aspects
of Phase Diagrams, ed. Hayes, F. (Inst. Metals, London), p. 64.

Schmidt, R. and Feller-Kniepmeier, M. (1992) Scripta Met. Mat., 26, 1919.

 

===========
408 N. Saunders and A. P. Miodownik

Seo, D. Y., An, S. U., Bieler, T. R., Larsen, D. E., Bhowal, P. and Merrick, H. (1995) in
Gamma Titanium Aluminides, eds Kim, Y.-W. et al. (TMS, Warrendale), p. 745.

Sharma, R. A. and Richardson, F. D. (1965) Trans. AIME, 233, 1586.

Shaw, S. K. (1992) University of Birmingham, Edgbaston, Birmingham, UK, private
communication.

Shimanuki, Y., Masui, M. and Doi, H. (1976) Scripta Met., 10, 805.

Sigli, C., Vichery, H. and Grange, V. (1996) Materials Science Forum, 217-222, 391.

Sims, C. T. (1987) in Superalloys II, eds Sims, T. C. et al. (Wiley Interscience, New York),
p. 217.

Small, C. (1993) Rolls-Royce plc, Derby DE24 8BJ, UK, private communication.

Spencer, P. J. and Putland, F. H., (1973) J. Iron & Steel Inst., 211, 293.

Sugimoto, T., Kamei, K., Komatsu, S. and Sugimoto, K. (1985) Titanium Science and
Technology, eds Lutjering, G. et al. (Deutsche. Gess. fur Metallkunde E.V., Oberursal), p.
1583.

Sundman, B. and Agren, J. (1981) J. Phys. Chem. Solids, 42, 297.

Taylor, J. R. and Dinsdale, A. T. (1990) CALPHAD, 14, 71.

Thorvaldsson, T., Eriksson, H., Kutka, J. and Salwen, A. (1985) in Proc. Conf. Stainless
Steels, Géteburg, Sweden, 1984 (Inst. Metals, London), p. 101.

Trinckhauf, K. and Nembach, E. (1991) Acta Met. Mater., 39, 3057.

Vahlas, C., Bernard, C. and Madar, R. (1996) in The SGTE Casebook—Thermodynamics at
Work, ed. Hack, K. (Inst. Materials, London), p. 108.

Van der Molen, E. H., Oblak, J. M. and Kriege, O. H. (1971) Met. Trans., 2, 1627.

Vernot-Loier, C. and Cortial, F. (1991) in Superalloys 718, 625 and Various Derivatives, ed,
Loria, A. (TMS, Warrendale, PA), p. 409.

Walston, W. S., Schaeffer, J. C. and Murphy, W. H. (1996) in Superalloys 1996, eds
Kissinger et al. (TMS, Warrendale), p. 9.

Watkin, J. S. (1979) “tA review of suggested mechanisms for the phase stability of alloys
under irradiation’’, in Proc. CALPHAD VIII, Stockholm, Sweden, 21-25 May.

Wisell, H. (1991) Met. Trans, A, 22A, 1391.

Withers, P. J., Stobbs, W. M. and Pedersen, O. B. (1989) Acta Met., 37, 3061.

Wlodek, S. T., Kellu, M. and Alden, D. (1992) in Superalloys 1992, eds Antolovich, S. D. et
al. (TMS, Warrendale), p. 165.

Xu, J, Lin, Y., Zhang, J., You, Y., Zhang, X., Huang, W., Zhang, W. and Ke, J. (1985) in
Rapidly Solidified Materials, eds Lee, P. W. and Carbonara, R. J. (ASM, Metals Park),
p. 283.

Yang, R, Leake, J. A. and Cahn, R. W. (1992a) Mater. Sci. Eng., A152, 227.

Yang, R., Saunders, N., Leake, J. A. and Cahn, R. W. (1992b) Acta Met. Mater., 40, 1553.

Yoder, G. R., Froes, F. H. and Eylon, D. (1984) Met. Trans. A, 15A, 183.

Zou, H. and Kirkaldy, J. S. (1992) Met. Trans. A, 23A, 651.

Zou, J., Wang, H. P., Doherty, R. and Perry, E. M. (1992) in Superalloys 1992, eds
Antolovich, S. D. et al. (TMS, Warrendale), p. 165.
