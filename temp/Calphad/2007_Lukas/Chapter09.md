9

9.1

9.1.1

9111

Case studies

The systems described here are real assessments, most of which have been published
and the reference is given; but the descriptions here include some of the mistakes made
when solving the problems leading to the publication. Such things are never included
in the final publication. Discussing such problems does not mean that the assessment
technique described here is bad or wrong, only that learning from mistakes is the only
way to become a successful assessor, in the same way as many mistakes are inevitably
made before one can learn how to be a good experimentalist.

  

A complete assessment of the Cu-Mg system

The Cu—Mg system published by Coughanowr et al. (1991), shown in Fig. 9.2 later, is
very simple but offers some interesting examples of modeling. Assessments with two
different software packages will also be discussed.

Physical and experimental criteria for solution model selection

There are five phases in the system, the liquid phase, the Cu phase with fcc lattice with
some solubility of Mg, the Mg phase with hep lattice and hardly any solubility of Cu,
and two intermetallic phases:

© CuMg,, a stoichiometric phase, and
* Cu,Mg, with some range of homogeneity, having the cubic Laves-phase structure,
C15 in the Strukturbericht notation.

The Laves phase Cu,Mg

The range of homogeneity of the Laves phase is very well determined experimen-
tally; it deviates on both sides from the ideal composition of 66.7% Cu. The cubic
Laves-phase structural type has the following crystallographically equivalent atomic
positions:

264

===========
9.1 The Cu-Mg system 265

Pearson symbol: —cF24

 

 

Space group: Fd3m
8 Mg: 8(a) 1/8, 1/8, 1/8; 7/8, 7/8, 7/8
16 Cu: 16(d) 1/2, 1/2, 1/2; 1/2, 1/4, 1/4;1/4, 1/2, 1/4; 1/4, 1/4, 1/2

 

 

The physical background that determines the formation of Laves phases is close
packing of atoms of two different sizes. In a hard-sphere packing model the ideal ratio
of the atomic radii is r4/rg = 1.225; in practice it is known that the ratio of pure element
radii can vary from 1.05 to 1.68 in various systems. Although the ideal crystal structure
has been very well studied, there is no systematic evidence giving a hint about the species
occupancies for both sublattices on the Cu- and Mg-richer sides of the off-stoichiometric
ranges.

In order to model this phase using the CEF, some assumptions should be made.
According to the crystal structure, the description should present exactly two sublattices,
the first for the 16(d) Cu atoms and the second for the 8(a) Mg atoms.

In order to describe the experimentally determined range of solubility, anti-site defects
will be used, i.e., Cu atoms will occupy sites in the Mg sublattice and Mg atoms will
occupy sites in the Cu sublattice. Note that this is just a model for the crystallographic
occupancy, since the true nature of defects enabling the compositional range of stability of
the phase has not been determined experimentally (e.g., by measurements of the lattice
parameter versus x) or even theoretically. The model is then given by (Cu, Mg), (Mg, Cu).

This assumption is not demonstrably true, but, since the stabilization of the Laves
phase tolerates some deviation of the atomic radii of the components at the ideal com-
position, one can imagine an “effective” Cu radius that includes some Mg atoms and
vice versa. In the small range of solubility of this phase, this should be a reasonable
approximation.

The existence of vacancies in both sublattices would also allow the deviation from
stoichiometry; however, in a close-packed structure, the vacancy probability is not
expected to be large. The CEF for the selected crystallographic model is given by

G(T, x) — H* 298K) = Gey, ase, (UY) (1-9)

+ Gu, Uy)"

+ Ge rte, Uy")

+b a
+ Grg,.cu, “YY

 

+R-T-{p-[=y)-In(i—y)+y'-In(y’)]
+4-[-y’) In ~y") +y"- In") ]}
+ LE. agate y= y")

+ Lb stgcu (= y")-y-y"

===========
266

9.1.1.2

Case studies

+ Lesagcu (Uy) (= y") 9"

+ "LitespcuY(U=y")-y"

+ ‘LE. emg * (1 —y') y= 2y')- =")
+ "Lev stecu=y)-y (= 2y)-y"

+ "Lb cstgcu = y') (yy (1 = 29")
+ LrgatgcrY = y")-y" (129)

foe

This is the expression for the Gibbs energy of one mole of the phase (three moles of
atoms). The first term in this summation expresses the Gibbs energy of the ideal com-
pound. The second and third terms are the Gibbs energies for pure Cu and pure Mg, respec-
tively, in a metastable state with the Laves structure. The fourth term describes the Gibbs
energy of the metastable Laves phase containing only anti-structure (anti-site) atoms.

Lattice stability

Since the stable pure Cu phase has the fec-A1 structure, the end member Cu,Cu in a
Laves-phase state is not stable. The same is true for the end member Mg,Mg. One should
have a value that expresses the difference between the Gibbs energy of the stable phase
of the pure element phase and the Gibbs energy of these end members.

These differences are not determined experimentally and can be provided by band-
structure total-energy calculations, ab initio, if the C15 structure is dynamically stable for
the pure elements. If there are no values for these differences, a reasonable value should
be chosen. This value must be selected carefully, since it must be used for all binary or
higher-order systems with Cu or Mg dissolving in a cubic (C15) Laves phase.

In the published assessment of the Cu-Mg system by Coughanowr et al. (1991) these
differences, the lattice stabilities, were obtained as an extrapolation of the Gibbs energy
of the Laves phase to the pure elements. However, in a further update of the system
in order for it to be used in the COSTS07 Al light-alloys database, a value of 5000J mol!
of atoms relative to the SER was arbitrarily chosen.

The selection of the adjustable model parameters for all the phases present in this
system is well discussed in the original paper. The same assumptions were used in the
more recent update of this description used in the COST507 database.

The files containing the original description in the Lukas program format (cumg.coe)
are given in the website directory related to this chapter. The present COSTS07 description
is also available in Thermo-Calc format (cumg.tdb).

The original experimental data (cumg.dat) file in Lukas format was translated into
the Thermo-Calc format (cumg.pop) using the dat2pop.exe software (ftp account). The
obtained pop file was used in the following optimization using PARROT.

In Fig. 9.1 the enthalpies of the fictitious states of the Laves-phase model for various
compositions are shown. The stable composition is Cu,Mg.

===========
9.1 The Cu-Mg system 267

Molar enthalpy H

 

 

“ok Avigg

 

“4 Acung

 

 

 

Cu Mole fraction Mg Mg

Figure 9.1 A schematic figure of the enthalpies of the Laves phase.

 

1000 4

800 4

600 4

   
 
 

fec+C15

 

400 +

Temperature (°C)

IMggCu+hep
200 +

 

 

 

0 1 1 1 1
A o 02 04 06 08 10

Mole fraction Mg

 

Figure 9.2 The calculated phase diagram for the Cu-Mg system.

In Fig. 9.2 the calculated Cu-Mg phase diagram is shown. In Fig. 9.3(a) the calculated
Gibbs energies at 1000K are shown. In the original assessment the hcp was treated
without solubility of Cu since no experimental solubilities were available. When the
system was added to a database, an ad-hoc interaction parameter was added to describe
a low solubility. This was, probably by mistake, set to be positive, which creates a
metastable miscibility gap in hep. According to the recommendations in section 8.5.3,
the hcp phase should have an interaction parameter equal or similar to that of the fec
phase.

In Fig. 9.3(b) the calculated enthalpies at 1000K are shown. The miscibility gap in
hep is explained in connection with Fig. 9.3(a). The enthalpy of the Laves phase has a
“Vv"-shaped enthalpy due to the anti-site defects used. In fact, the model used here for
the Laves phase is a Wagner-Schottky model as described in section 5.8.2.3.

 

===========
268 Case studies

 

 

 

 

 

 

 

 

6
44
= 2 10 bE
3 of hep Z hep
S 5 |
Zz -24 —
> 2
gS -44 So
3 |
5 64 3
8 -84 2
3 a is L
G -10+4
-124 cis liquid
14 -10 C15 L
oO 0.2 0.4 0.6 0.8 1.0 A 0 0.2 0.4 0.6 0.8 1.0
Mole fraction Mg Mole fraction Mg
(a) (b)

Figure 9.3. The calculated Gibbs energies (a) and enthalpies (b) for the Cu-Mg system, both at
1000K.

9.1.2 Assessment showing features of PARROT

The Cu—Mg system assessed by PARROT is now described as a comparison with the use
of BINGSS software for the same problem. The choice of models and the experimental
data are described above. The choice of optimizer is mainly dependent on the availability
of someone who can answer questions, but one of the advantages of PARROT is that it
can treat ternary and higher-order systems; also it is extremely flexible.

It must be emphasized that BINGSS, PARROT, and other software for assessment
of thermodynamic data can never be used as a substitute for an understanding of
thermodynamics and phase diagrams. They are just tools that make it possible to han-
dle large amounts of diverse types of data when trying to model a system. They are
indispensable for the creation of large validated databases.

9.1.2.1 The setup file and experimental data file

As described in section 7.3 on software, two files should be prepared before the assessment
starts. One is a file with data for the elements, phases, and models (the “setup” file).
The other contains the experimental data (the “POP” file). These files may need changes
during the assessment and at the end they should reflect the final choices of models and
experimental data. The original files for BINGSS were converted using the conversion
software and, to make it easier to understand, the file has now been edited and put into a
form suitable for interactive use in PARROT.

It is also advisable to have a file with the experimental data in a format that is suitable
for use in the graphical post-processor. It is often easier to see differences on a diagram.
It is also useful to have some additional macro files to calculate and plot results together
with the experimental data.

===========
9.1.2.2

9.1 The Cu-Mg system 269

The setup file is a macro file that is run using the macro command in Thermo-
Calc. It creates a “work” file in PARROT with the elements, phases, and models with
parameters to optimize. The experimental data are then compiled:

te
SYS: macro cumg

+ -output deleted
PARROT: compile
input file: cumg
-+.-output deleted
PARROT:

 

After this, the user continues to run PARROT interactively in order to obtain the
best set of parameters to describe the experiments. For description and explanation of
the various commands, please read section 7.3 about PARROT or the PARROT user’s
guide. It is the responsibility of the user to select the best experimental information and
determine what to keep if there are conflicting experimental data. One should not keep
two experimental datasets that are in conflict because that will confuse the optimizer.
With PARROT it is possible to change the selection interactively at any time if all data
are in the POP file. The use of LABEL and COMMENT in the POP file to identify
different datasets is recommended, since that simplifies later selection.

 

 

The alternate mode

In order to minimize the error between the experimental data and the corresponding values
calculated from the models, it must be possible to calculate the experimental equilibria.
Since the parameters in the thermodynamic models that should be assessed are initially
zero, it might not be possible to calculate some equilibria corresponding to experimental
points.

PARROT has a special mode called alternate to find initial values of model
parameters. The reason for having an alternate mode is to handle initial values of
model parameters using an alternate equilibrium calculation as described in section 7.1.1.
Experimental equilibria involving two or more phases might not exist if the start val-
ues of the parameters are zero. The alternate mode in PARROT is further described
in section 7.3.7.3. When the alternate mode has found a set of values for the model
parameters that makes it possible to calculate the experimental equilibria using normal
equilibrium calculations, one should turn off the alternate mode.

The number of experimental data is very large for this system. To make it easier to
explain using PARROT, one can first try to fit just the single-phase data in the liquid phase
and the invariant equilibria. To select experimental data, one uses the set-weight command
in the EDIT module. In the EDIT module the experimental data must first be read from the
work file. Setting the weightings to zero for all equilibria and then to | for the equilibria
with label ABA means that one will use only the experimental data with that label:

 

PARROT: edit
EDIT: read 1
EDIT: set-weight 0 first-last

===========
270

9.1.2.3

Case studies

EDIT: set-weight 1 aba
EDIT: select-equil first
EDIT: compute-all

EDIT: save

EDIT: back

PARROT: opt 0

PARROT: list-result,,,

After having set the weightings, the first equilibrium was selected and all equilibria
were calculated to check that there were no errors. Finally, all changes were saved back
to the file. The first time the equilibria are calculated usually reveals some errors in the
input POP file. These should be corrected by editing the POP file, of course, and the
compilation and calculation run again.

It is essential to use SAVE in the EDIT module in order to make any changes there
permanent. The command BACK goes back to the PARROT module and it is advisable
to calculate all equilibria once again by activating the command OPT 0. The command
LIST-RESULT will write a condensed output of all experimental data and their currently
calculated values; see Table 7.3. It may be necessary to go to the EDIT module again many
times and correct or modify the initial compositions or weightings of the experimental
equilibria before the first real optimization in order to have a good set of experimental
data to optimize.

The first diagram

When the optimization with the alternate mode has converged, it is possible to calculate
the phase diagram and other thermodynamic properties and compare the simulation
graphically with experimental data. This is done by running a macro file for this in the
PARROT module. Of course, it is possible to do such calculations interactively, but,
since they may be done very often, it is convenient to have the necessary commands on
macro files.

The calculated diagram shown in Fig. 9.4(a) together with experimental data has the
main features correct and further optimization will most certainly lead to a correct diagram,
maybe after adjusting some of the weightings of the experimental data. However, in
Fig. 9.4(b), which was optimized with the same experimental data but a slightly different
set of parameters, the fec phase has become much too stable and one has to change
strategy a little in order to achieve good results. The recommended method is to optimize
fewer parameters initially and maybe only two or three of the phases, for example the
liquid and the terminal phases.

One may wonder what the optimizer is doing when it produces a diagram like
Fig. 9.4(b), but actually it has done quite a good job of fitting the liquid and solid com-
pounds as shown in Fig. 9.4(c), which was calculated with the same set of parameters
as Fig. 9.4(b) but with the fee phase suspended. In the experimental data file (POP file)
the equilibria are usually created with just the known phases set stable, with all others
suspended. During the optimization, other phases more stable than those in the POP file
may appear. It is possible to add other phases as DORMANT, for example, and set as

 

===========
9.1.2.4

9.1 The Cu-Mg system 271

 

 

 

 

 

 

 

 

 

 

 

1400 1400 1400 R
> 1200 > 1200 > 1200}
= = =
@ 1000 @ 1000 @ 1000
B 800 B 800 S 8004,
2 600 2 600 2 600 |"
5 5 5
F400 F400 F400

200 + 200 200

Ao 02040608 10 A 0 0204 06 0810 A 0 02 04 06 08 1.0

Mole fraction Mg Mole fraction Mg Mole fraction Mg
(a) (b) (c)

Figure 9.4 The first calculated phase diagram after optimizing with PARROT using only
alternate mode. In (a) the features of the diagram are correct and, with further optimization using
normal mode, the congruent-melting temperatures will change and the liquidus curves will be
correct. However, often the first diagram calculated during an optimization is far from correct. As
an example, in (b) a Cu-Mg diagram in which the fcc phase has extended far across the system is
shown. In (c) the metastable diagram without fcc for the same set of parameters as in (b) is
shown; see the text for an explanation.

an experimental criterion that their driving forces should be negative. Such things are
typically done interactively when necessary. The number of experimental points for fec is
fewer than for the compounds and, depending on the parameters selected to be optimized,
results like those in Figs. 9.4(b) and (c) are not unusual until one has found the most
reasonable set of parameters that should be included in the optimization.

The normal mode

When the optimization with the alternate mode has converged, the user must switch
off the alternate mode. After turning off the alternate mode, he must try to calculate
all experimental equilibria in the EDIT module. This is done by setting the weightings
of all experimental data to unity. Some equilibria may fail to converge, but it is not
necessary at this stage to include all of the experimental data. The most important
experimental equilibria to be included are the invariants, such as eutectics and congruent
transformations. If some invariant cannot be calculated, it may be better to exclude
optimization of some parameters of the corresponding phases and try to optimize them
later when a good representation of the other phases has been obtained. Maybe the
alternate mode will have to be used again to obtain initial values for such parameters.

One should not switch back and forth between alternate and normal mode. The alternate
mode should be used only to find initial values for parameters so that normal-mode
calculations can be used.

When starting to use the normal mode it is important to rescale the variables. The
RESCALE command will set the current values as initial values and scaling factors.
This makes it easier for the optimizing software to vary them to obtain the best fit. The
complementary command RECOVER will overwrite the current values with the initial
values and thus make it possible to restore the previous set of parameters. Note that this

===========
272

9.1.2.5

Case studies

will not restore the compositions and temperatures for the experiments and it is usually
necessary to calculate all equilibria in the EDIT module after a RECOVER command,
and maybe also correct problems with convergence. For this reason it is advisable to
make copies of the PAR file now and again, to make it easier to start again from an
earlier point when the optimization fails.

At this stage it is also important to look carefully at the error for each experiment
and try to identify conflicting and inconsistent information. A selection of the consistent
data must be made, otherwise the optimization will not be able to give any reasonable
result. The selection of data is made in the EDIT module using the weightings. It may
also be necessary to add information that was not originally included in the POP file. For
example, a phase may appear in the wrong part of a phase diagram. A convenient way
to suppress such a phase is to add the lines

CHANGE-STATUS PHASE phase = DORMANT
EXPERIMENT DGM(phase)< -0.01:.001

These lines can be added to some existing experimental information for the composition
and temperature range where the phase appears. The state variable DGM(phase) is the
driving force for “phase” and, if this is negative, the phase is unstable. With this additional
information, PARROT will try to change the parameters of all phases to achieve this.
Such changes of the experimental information can be made directly in the POP file.

It is also possible to change the set of model parameters to be optimized in order to
find a better solution. In general, the fit is improved the more parameters are added but is
better the fewer parameters are used. Below will be described how to determine whether
too many parameters have been used. Changing the set of parameters may require a return
to the alternate mode in order to determine initial values. It is advisable to have copies of
the PAR files that represent the best set of parameter values for each set tried because it
is not always easy to reproduce a fit that has once been obtained but for which the PAR
file has been lost. The current PAR file, selected by the SET-STORE-FILE command in
the PARROT module, is continuously updated to the last optimized set. If the user wants
to retain a copy of the present results before continuing, he must copy the PAR file using
commands in the operating system of the file manager. When the user has several such
PAR files, he may compare the results using various selections of experimental data and
parameters.

In the assessment of the Cu-Mg system, the result of experiment 205 was found to
be inconsistent with the other liquidus information, for example equilibrium 297, so its
weighting was set to zero and the parameters were optimized again.

 

 

Large numerical values

Optimizations should continue until PARROT thinks it has found a minimum. If the
weighting and selection of the experimental information is not done carefully, it some-
times happens that the optimized parameters reach very large values. The user must
then again carefully examine his experimental data and their weightings. He may also
have to reduce the number of parameters to avoid having large numerical values of

===========
9.1.2.6

9.1 The Cu-Mg system 273

parameters compensating for each other. For example, if the temperature range of data
for a phase is very small, the temperature dependence sometimes appears to be very
large. That happens typically if the temperature dependence is not determined by the
experimental information. Then one has to set a constraint relating temperature-dependent
and -independent coefficients of the parameter in Eq. (5.13) or Eq. (5.66), as suggested
in section 6.2.1.3. Another way to avoid this is to use the same temperature-dependence
coefficient for several phases. Such tricks should be used only when there is a theoretical
foundation.

The final steps

When PARROT has reached a minimum for the selected set of experimental data and
parameters and the user is satisfied with this, or fed up with the system and software, there
are still some final checks that should be made. The criterion for reaching a minimum,
which may be a local minimum, is that the optimization terminates with as many iterations
as there are parameters to be optimized.

The first check may be to ascertain that the parameter values are reasonable. It may be
very difficult for a beginner to decide, but, as a general rule, enthalpies should not exceed
a few times 100kJ mol”! and entropies should not exceed few times 10J mol"! K~!. One
may use the experimental information on enthalpies of mixing or formation to estimate
a reasonable range of values. If several coefficients in the excess parameters are used,
these should not increase with the increasing degree.

Another thing to check is whether the number of parameters used is reason-
able. Since the sum of errors usually decreases with the number of parameters, it
may be tempting to use as many as possible. There are several problems with hav-
ing many parameters, though. One problem is that the values of the parameters are
less well determined or significant the more parameters are used. The significance
of the value of a parameter is given by the column labeled REL.STAND.DEV,
which is shown for each parameter in the LIST-RESULT and LIST-ALL-VARIABLES
commands.

In order for values in this column to be significant, the user must have rescaled the
variables before the last OPTIMIZE command and the parameter values must be almost
the same as the initial values and scaling factors. This is necessary in order for values
in the final column, “REL.STAND.DEV” (relative standard deviation), to be significant.
Study the values in this column carefully. The value in this column shows how significant
the parameter value is. One may change the parameter within the range of this standard
deviation and the reduced sum of errors will then change only by unity. Parameters
with large REL.STAND.DEV may be set to zero and the optimization re-run with fewer
parameters will still give almost the same result.

In the Cu-Mg case the REL.STAND.DEV is around 0.8 for one of the parameters in
the CuMg, phase. One may thus change this parameter value by 80% and still not change
the sum of errors significantly. In this case it is not possible to put it to zero, but maybe
it could be rounded off to a value like 2 to indicate that it is not well determined. The
other parameters must then be optimized again to obtain the best fit with this new fixed

===========
274

9.1.2.7

9.2

Case studies

4000 +
3500
3000
2500
2000
1500
1000

500 + \

A 0 02 04 06 08 1.0
Mole fraction Mg

liquid

Temperature (K)

 

 

 

 

Figure 9.5 The calculated phase diagram for the Cu-Mg system extending to high temperatures.

parameter value. The values of REL.STAND.DEV for these parameters now generally
tend to be smaller as they become more well determined. One may continue this rounding
off of parameter values, but this is a matter of taste for the assessor.

Why constant updating is needed

After all the efforts put into this assessment by experts of types 1 and 3, a recent use of this
system revealed some problems. A calculation of the system at much higher temperatures
than had been considered during the assessment showed that the Laves phase becomes
stable above 3000 K as shown in Fig. 9.5.

This is due to the fact that the heat-capacity expression of the Laves phase can be
assessed only up to the melting temperature. The term a;-7? of the G description
contributes as 6a;-7? to C,,, leading to impossible values at very high temperatures. The
simplest solution is to set breaks in the parameter descriptions of the end members of
the Cu,Mg model slightly above the melting temperature (e.g. 1100 K) and continue with
descriptions using only dp, a), and a, corresponding to constant C,,.

Checking metastable diagrams: the Ag-Al system

This binary system presents interesting features with which to illustrate many of the
comments in the methodology chapter. The Al and Ag phases are both terminal fcc solid
solutions that present extended ranges of homogeneity. These terminal solid solutions are
modeled as the same phase. Two intermediate solution phases are stable in this system;
they are disordered and their crystal structures are different from those of the terminal
solutions: one phase is an hep and the other is a bec phase.

When modeling phases, one should take into account that not only the stable calculated
phase diagram but also metastable diagrams should be reproduced by the calculations.
Having reasonable metastable descriptions increases the quality of extrapolations to
higher-order systems.

===========
9.2 The Ag-Al system 275

The stable phase diagram assessed by Lim et al. (1995) is shown in Fig. 9.6 together
with several metastable diagrams with only selected phases. In Fig. 9.6(b) it is shown
that the fee phase has a metastable miscibility gap. In Fig. 9.6(f) the stable phase
diagram is shown overlayed with the metastable solubility lines from the previous
diagrams.

When a phase is stable only within a small composition range but the model extends
across the whole system one must take care to ensure that the phase behaves reason-
ably well. In Fig. 9.6(d) the metastable fee + hep diagram is shown and its shape is
strange. The reason is that the excess parameters in the hcp model have been fitted
to the small stable composition range. However, hep and fee are very similar; both
have 12 nearest neighbors and the regular-solution parameter should be almost the
same for hep and fc

 

ince it depends mainly on the first-nearest-neighbor interaction.
Higher-order coefficients in the RK series may be different, but as a rule of thumb
one should have the same regular-solution parameter in fec as in hep. However, this
“rule” is quite recent and one will normally not find that it is used in any existing
assessment. The rule was created to estimate parameters in unstable phases in order
to allow extrapolations to ternary systems. For example, see the hcp description for

 

 

   

 

 

 

 

 

 

 

 

 

 

 

1500 3300
liquid < liquid oO
= tO00 = 1200 £
° 2 © 2400
5 900 2 5 2100
® 800 { fcc} |hep| © 900 ® 1800
& 700 3 8 1500 bee
& 600 | 600 feo E 1200
© 500 F © 900
400 feo+fect2! 600 | fcc
300 | 300 300 contect
A 0 02 04 0.6 08 1.0 A 0 02 04 06 08 1.0 A 0 02 04 06 08 1.0
Mole fraction Al Mole fraction Al Mole fraction Al
(a) (b) (co)
3300 140 1300
g 270 g g tivo
g 5 hey g
‘e240 2 ° ‘@ 1000
2 ia00 we | 2 60 2 800
g 1500 hep| B 40 & 700
E 1200 J fec # 2 liquid £ 600
© 900 2 & 500
600 uo Tec 400
300 -20 300
A 0 02 04 0.6 08 1.0 A 0 02 04 06 08 1.0 A 0 02 04 06 08 1.0
Mole fraction Al Mole fraction Al Mole fraction Al
(a) (e) ()

Figure 9.6 Various stable and metastable phase diagrams and the enthalpies of mixing for the
‘Ag-Al system. (a) The stable phase diagram for the Ag-Al system. (b) The metastable phase
diagram for the Ag-Al system with only liquid and fec. (c) The metastable phase diagram for the
‘Ag-Al system with fec and bec. (d) The metastable phase diagram for the Ag-Al system with foc
and hep. (¢) The enthalpy of the liquid, fec Al, bec A2 and hep A3 phases at 873K in the Ag-Al
system. (f) The stable phase diagram for the Ag-Al system with overlayed metastable solubility
curves.

===========
276

9.3

Case studies

the Cu—Fe system mentioned in section 8.5.3 and shown in Fig. 8.1(b). Since fec and
hep are so similar, it is natural to set their excess parameters equal. For bee it may
be more adequate to set them equal to the excess parameters for the liquid. Since the
phases in the Ag—Al system are typical Hume-Rothery phases, differences in G,, between
these phases may mainly be due to the contribution of the electron gas to G,, (see
section 6.2.8).

The calculated enthalpies for the various phases at 873K are shown in Fig. 9.6(e).
They are all reasonable except the high positive enthalpy of hcp A3 on the Al-rich side.
This does not matter in the binary system, but, if a ternary element were added, forming
a stable hcp A3 phase at lower Ag contents it would be very difficult to fit any ternary
parameters for hep. In the ternary Ag—Al-Zn system hep has a continuous range of
solubility from the Ag—Al binary system to Ag—Zn with a Zn mole fraction between 0.7
and 0.85 (Késter er al. 1964). Thus far no-one has attempted a thermodynamic assessment
of this ternary system. The lack of experimental data on the extension of the other binary
phases into the ternary system is another possible reason for why this has not yet been
done.

The Re-W o phase refit using first-principles data

The o phase has the Strukturbericht designation D8, and a complex structure with five
different crystallographic sites. It is shown in Fig. 5.22.

The coordination number (CN) for sublattices 1 and 4 is 12, i.e., the same as for fcc,
so these sublattices are preferred by elements that have fcc lattices as pure elements.
The second sublattice has CN = 15 and is preferred by bec-type elements such as V, Cr,
and W. The remaining two sublattices have CN = 14 and have more-random occupancy.
Assuming that Re and W can occupy any sublattice, one has the CEF model

 

(Re, W)(Re, W),(Re, W),(Re, W),(Re, W), (9.1)

This gives 32 end members for the o phase in the Re—-W system. Their 0-K Gibbs
energies were calculated ab initio by Berne et al. (2001). They are listed in Table 9.1 and
plotted in Fig. 9.7(a). The figure is reprinted with permission from Fries and Sundman
(2002). In the figure the Gibbs-energy curve calculated from the CEF model using the
tabulated end-member values is also given.

It is worth noting that the primary ab initio data should always be included in a publi-
cation, not only fitted CVM cluster energies. It is the primary calculated or experimental
data that are needed in the Calphad method.

The CEF model using the ab initio data was constructed by Fries and Sundman
(2002) in order to demonstrate that the difference between the CVM and the CEF is
very small for intermetallic compounds that never undergo disordering. In Fig. 9.7(b)
the difference between the site fractions calculated from the CVM and from the CEF
is shown. With a CEF model it is easy to calculate also other quantities, such as the

===========
9.3 The Re-W o phase refit using first-principles data 277

Table 9.1 The ab initio calculated energies for the 32 configurations of Re and W, also translated
into Jmol” used as CEF end-member energies (see also Fig. 9.7(a))

 

 

Lattice occupation

 

a a Energy
1 2 3 4 5 (meV/atom) x CEF parameter Jmol”!

Re Re Re Re Re 0 0 °GrereiReReRe 0
W Re Re Re Re 5.9598 0.0667 °Gwrenerere 17349
Re W Re Re Re —41.8254 0.1333 °Grewarerere  —121754
W W_ Re Re Re —34.5563 0.2 °Gww.nenee —100593
Re Re W_ Re Re 58.8566 0.2667 RekeWReke  ~ 171332
W Re W_~ Re Re 50.4266 0.3333 °Gw.re.wrere —146792
Re W W_ Re. Re -85.7745 0.4 °Grew.wrere —249 690
Ww W WwW. Re Re —10.2813 0.4667 °Gwawawererre —204 589
Re Re Re W_ Re 16.0299 0.2667 °Gre-peske-w:ke 46 663
W Re Re W_ Re 31.0186 (0.3333 °Gwrerew-ke 90 295
Re W Re W_ Re —20.5734 0.4 °Grew:new-Re —59889
Ww WwW Re W_ Re -0.9511 0.4667 °Gwiw.re.wte —2769
Re Re W W_ Re 8.7176 0.5333 Re-RewW.W:Re 25377
W Re W W_ Re 25.7323 0.6 ° Gyy.rew.were 74907
Re W WW. Re 16.6055 0.6667 °Ge.waw-w.re —48 339
w Ww WwW WwW. Re 5.7152 0.7333 °Gwaw.wawre 16812
Re Re Re Re W 44.2292 0.2666 °Gre-rerreire:w —128751
W Re Re Re W —29.1608 0.3333, °Gy.perrerreaw —84887
Re W Re Re W —86.4593 0.4 ° Gre.wine Rew 251683
W W Re Re W 67.4605 0.4667 °Gw.w.kenew —196378
Re Re W Re W —79.9138 0.5333 Re-ReW-Re:W —232629
W Re W Re W 61.4605 0.6 FWekesW:Re-W —178911
Re W W Re Ww —107.0972 0.6667 °Greswew-re-w —311760
w W WwW Re W —85.0240 0.7333 °Gwaywirew 247505
Re Re Re W Ww 0.3771 (0.5333 °Gre-reste-waw 1098
W Re Re W W 21.6766 0.6 ° Gw.reireww 63101
Re W Re W Ww —31.6385 0.6667 °Gre.winesw.w —92100
w WwW Re W W =7.8781 0.7333 °Gyawirewow —22933
Re Re W W Ww 6.7427 0.8 °Geneswaww 19.628
Ww Re W W WwW 24.2583 0.8667 °Gwreswawaw 70616
Re W W Ww —27.5870 0.9333 °Grewawaw.w —80306
w Ww w WwW wWw 0 1 ° Gwavwawaw 0

 

 

variations of site fractions and configurational heat capacity with temperature, as shown
in Fig. 9.8.

In the paper by Fries and Sundman (2002) the new CEF model for the o phase was com-
bined with an existing assessment of the whole phase diagram from Liu and Chang (2000)
to obtain a complete description of the whole system. In order to obtain fit to the other
phases, it was necessary to adjust the stability of the o phase for the pure elements and a
parameter describing the disordered substitutional regular solution was introduced for
according to Eq. (5.161). The reason why a regular-solution parameter was needed may
be that, in an assessment without experimental enthalpy data, only differences between
values of G,, of the phases are needed in order to calculate the phase-diagram data. Thus
an enthalpy contribution common to the Gibbs energies of all phases in the system cannot
be found by the assessor.

===========
278

Case studies

 

Energy (meV/atom)
A
6
Site fractions
°
a

   

 

 

 

 

60 | 04
0.3
-80 4
02
-100 4 01
° z
-120 1 1 r 1 0 —e 1 1 t
A ° 02 04 06 08 10 SX 0 02 04 06 O8 10
Mole fraction W Mole fraction W
(a) (b)

Figure 9.7. The symbols in (a) are the ab initio calculated energies and the curve was calculated
using a model based on the CEF. The triangular points represent those end members with Re in
sublattices 1 and 4 and W in sublattice 2, i.e., those which were expected to have the lowest
energy. In (b) site occupancies in the o phase, calculated for 1500 K, are compared with
experimental data and with curves calculated from a CVM model by Berne ef al. (2001) (dotted).
Copyright 2002, reprinted with permission from the American Physical Society.

 

 

 

 

 

 

 

 

1Opee 40 pe
09 4 35 4 L
08 | bos
& 304 L
07 4 t &
@
5 064 } £254 r
3 2 2
3
8 054 3 + = 204 +
£ 2
2 044 + 8
a a> 8 154 L
08) 1 . = 10
= 104 L
0.24 +
01 5 r
ot} 0 a
A 01234567 8 910 PX 0 500 1000 1500 2000 2500 3000
Temperature (10°) Temperature (K)
(a) (b)

Figure 9.8 In (a) the site fractions on the various sublattices for xy = 0.4 are plotted as a
function of temperature up to 10000 K and in (b) the contribution to the heat capacity from the
configuration is plotted up to 3000 K. Note that the phase never undergoes disordering and that
the rapid change in the slopes of the fractions around 200K gives a bump in the heat-capacity
curve. Reprinted with permission from the American Physical Society.

===========
9.4

9.4.1

9.4 A complete binary system: Ca-Mg 279

A complete binary system: Ca-—Mg

The optimization described here was published by Agarwal et al. (1995).

Experimental data from the literature

A literature review and critical evaluation was given by Nayeb-Hashemi and Clark
(1987). Most of the arguments given there could be used to select the more reli-
able one from among the contradictory sets of experimental results in Table 9.2 (see
section 6.1.2). Since the least square of errors is a good indicator of the best fit only
if the errors are distributed randomly and are small, contradictory experimental values
must be judged before the optimization and values suffering from systematic errors must
be removed (section 2.4.1). The following selections could be done before any calcula-
tion.

The liquidus data of Haughton (1937), Vosskiihler (1937), and Klemm and Dinkelacker
(1947) agree fairly well, whereas those of Baar (1911) and Paris (1934) deviate signifi-
cantly (Fig. 9.9). Since contradictory data cannot both be correct, the latter data, being the
older ones, were rejected in the optimization. The (Mg) solvus data published by these
authors disagree so heavily (see Fig. 9.12 later) that a Gaussian distribution of errors
cannot be assumed. Only the data of Vosskiihler (1937) and Burke (1955) agree well
enough for the scatter to be interpreted as randomly distributed errors. Therefore only
these values were used, not those of Haughton (1937), Nowotny er al. (1940), and Bulian
and Fahrenhorst (1946). For the temperatures of the invariant equilibria the values selected
by Nayeb-Hashemi and Clark (1987) were accepted as the result of a critical judging of
various measurements representing data that must have a unique value. The following
values were used for the optimization: congruent-melting temperature of CaMg,, 986 K;
of Mg-rich eutectic, 789.5 K; and of Ca-rich eutectic, 719 K.

The thermodynamic values agree well, except the enthalpies of mixing of Sommer
et al. (1977) and the enthalpy of formation of CaMg, of Smith and Smythe (1959).
The values of Sommer et al. (1977) disagree significantly with later values from the
same laboratory (Agarwal er al., 1995) and the authors of the later paper assume the
earlier data to suffer from systematic errors. The values of Sommer et al. (1977) were
therefore not used. The values of Agarwal et al. (1995) were treated and plotted (see
Fig. 9.13 later) as partial enthalpies of Ca in liquid (see section 4.1.1.1, on mixing
calorimetry). The enthalpies of formation of CaMg, at 298 K of King and Kleppa (1964)
and Davison and Smith (1968) agree well (—13.4 and —13.1kJmol”', respectively,
referred to moles of atoms), but the bomb-calorimetry measurement of Smith and Smythe
(1959) (—19.5 + 13kJ mol~') deviates significantly. The latter was characterized as only
tentative by the authors themselves; thus it was not used. From the heat-content values
of Agarwal et al. (1995) (see Fig. 9.15 later) three points in the vicinity of the melting
temperature were not used, since the possibility of some partial melting there, which
might give some discrepancy between the measured value and its interpretation, cannot
be excluded. All other values given in Table 9.3 were used for the optimization.

===========
280

9.4.2

Case studies

Table 9.2. A summary of experimental phase-diagram data on the Ca-Mg system

 

 

 

 

Ranges
Reference Experimental method — Equilibria XMg T (K)
Baar (1911) Thermal analysis Liquidus 0.000-1.000 750-1100
Paris (1934) Thermal analysi Liquidus 0.125-0.988 750-1000
Haughton (1937) Thermal analysis Liquidus 0.667-0.970 790-1000
Mg-rich eutectic 0.895 790
Metallography (Mg) solvus 0.987-0.997 570-790
Vosskiihler (1937) Thermal analysis Liquidus 0.578-0.977 800-1000
Mg-rich eutectic 0.894 789
Metallography (Mg) solvus 0.995-0.999 570-790
Nowotny et al. (1940) Metallography, (Mg) solvus 0.992-0.995 570-780
Hardness, X-ray
Bulian and Electrical resistivity (Mg) solvus 0.992-0.995 670-790
Fahrenhorst (1946)
Klemm and Thermal analysis Liquidus 0.350-0.839 790-990
Dinkelacker (1947)
Ca-tich eutectic 0.270 718
Burke (1955) Metallography (Mg) solvus 0.994-0.999 640-790

 

 

1100

 

1000
<
®
5 900
3
oS
3
§ L+
F 800) Ca(bec)
719K
700 716K
Ca(fcc) + CaMgy
0 0.2 04 06
Ca Mole fraction Mg

790 K

Magthep) +
CaMg,

 

08 1
Mg

Figure 9.9 The optimized phase diagram of the Ca-Mg system. Data from @ Haughton (1937),
Mi Vosskithler (1937), and @ Klemm and Dinkelacker (1947) were used. Data from & Baar (1911)

and W Paris (1934) were not used.

Selecting the models

Five phases have to be modeled, the liquid, the fec and bec phases of pure Ca, the hep
phase of pure Mg, and the intermediate Laves phase CaMg,. For both Ca modifica-
tions and for the intermediate phase the ranges of homogeneity are very small and not

===========
9.4.3

9.4 A complete binary system: Ca-Mg 281

Table 9.3. A summary of experimental thermodynamic data on the Ca-Mg system

 

 

 

 

 

 

Ranges
Reference Experimental method Quantity x T (kK)
Smith and Smythe (1959) Mg vapor pressure Bye tS — "p14 0.300-0.667 298-770
Bomb calorimetry ATHOM#2 (298K) 0.667 298
Chiotti er al. (1964) Equilibrium with H,+CaH, wM"*M*—°y¢, 0.667-0.800 298-773
King and Kleppa (1964) Sn solution calorimetry ATH (298K) 0.667 298
Gartner (1965) Reaction calorimetry ATHOM#2 (298K) 0.667 532
Mashorets and Puchkov (1965) Mg vapor pressure Ht — Ae 0.158-0.962 1200
Chiotti er al. (1966) Adiabatic calorimetry Afs 77CaMg2, 0.667 987
Davison and Smith (1968) Acid solution calorim. ATHOM#2 (298K) 0.667 298
Sommer (1979) Mg vapor pressure By HN 0.050-0.920 1010
Agarwal et al. (1995) Mixing calorimetry Ane 0.557-0.964 1023
Drop calorimetry H(T)—HQ98K) 0.667 752-1170

 

 

known quantitatively, therefore they are ignored and these three phases are modeled as
stoichiometric phases, describing the Gibbs energy G as a function of temperature T only.

The enthalpy of mixing versus mole fraction of the liquid phase exhibits roughly
parabolic behavior, indicating that the bonding is predominantly metallic. Therefore the
RK formalism is adequate for modeling the Gibbs energy of the liquid.

The solubility of Ca in the hcp Mg solid solution was measured several times. Since
it is small, (Mg) may be treated as a Henrian solution, which is described by the regular-
solution formula, Eq. (5.65), with a single parameter °L;; = dy +a,T, using the fixed
value for the unary Ca(hcp) parameter proposed by Dinsdale (1991).

Selecting the adjustable parameters

The unary parameters must be identical in all systems containing the same component
and must not be changed in the optimization of a binary system. The Ca(bec) and Ca(fec)
phases are thus totally defined and their descriptions do not contain adjustable parameters.
For these unary parameters the SGTE values compiled by Dinsdale (1991) were adopted.

For the Gibbs energy of the CaMg, phase as a function of temperature G°™ (7) —
HER (T)) — 2HSEX(T)) with T) = 298K three coefficients of Eq. (5.2) can be defined
independently because the H(T) — H(T,) measurements of Agarwal et al. (1995) describe
well enough the heat capacity given by the third coefficient. The enthalpy of formation
(King and Kleppa 1964, Davison and Smith 1968) essentially determines the first coeffi-
cient. The f4y,, values in the two-phase field Ca + CaMg, are directly related to the Gibbs
energy of CaMg, and thus give a description of GC defining independently the second
coefficient. The same is true for fy, in the two-phase field Mg +CaMg,, since the devi-
ation due to non-zero solubility of Cain (Mg) is far below significance. The heat-content

===========
282

9.4.4

Case studies

values are not smooth enough to allow differentiation in order to get the heat capacity
C, as a function of T and define a fourth coefficient. Therefore the fourth and fifth
coefficients were estimated using partially the idea of Kubaschewski and Unal (1977).
These authors proposed estimating C, by assuming the fixed value 30.3Jmol"'K~! at
the melting temperature and using the fixed fifth coefficient E = 21000JK mol” in the
expression

C,=-C-2D-T-2E.T? (9.2)

Both numerical values are referred to one mole of atoms. The determination of the
two coefficients C and D cannot be done by estimating C, at 298K, as was done in
the paper of Kubaschewski and Unal (1977), since the method given there requires
a tendency toward ionic structure. Therefore here they were adjusted during the opti-
mization, keeping C, as 30.3J mol! K~! at the melting temperature of 986K. This
procedure seems to be better than usage of the Kopp-Neumann rule assuming coe
to be the sum of $C, cy + $C) mg- C, after this definition would exhibit several kinks
due to the transformation and melting of Ca and Mg, which, however, have no reason
to appear in C, of the CaMg, phase. The term —2E-T~? may be regarded as repre-
senting the most significant term of a Taylor-series expansion of the difference between
a Debye function and a constant C, after Dulong and Petit. Thus the method used
by Agarwal et al. (1995) is compatible with the “Ringberg recommendation” (Chase
et al. 1995) that one should express C,, as the sum of a Debye function and a linear
function of T.

For the Mg(hep) solid solution the only binary parameter is the regular-solution
parameter. It is adjusted using the solubility data of this phase (Vosskiihler 1937,
Burke 1955). Since these solubilities are known over a significant range of tempera-
ture, as explained in section 6.3, it is possible to adjust the regular-solution parame-
ter as function of temperature using two coefficients A and B of the linear function
OLE ye =A BT.

The RK description of the excess Gibbs energy of the liquid phase needs at least
the two parameters OLE ste and LE ste of Eq. (5.65), since the enthalpy of mixing
sis (7) (Agarwal et al. 1995) is clearly asymmetrical. Since the enthalpy (Agarwal
et al. 1995) and Gibbs-energy data (Mashorets and Puchkov 1965, Sommer 1979) of the
liquid are measured independently, it is possible to adjust these parameters as (linear)
functions of temperature, OLE ste =9A4°B-T and 'LE Me ='A+'B-T. The question
of whether a third parameter is useful can be answered by doing the optimization with
two and then with three parameters and comparing the results. From that Agarwal et al.
(1995) decided to use a third parameter.

Optimization

The selected coefficients were adjusted to the experimental values using the program
BINGSS. The optimization was started with all adjustable coefficients zero, except C

===========
9.4.5

9.4 A complete binary system: Ca-Mg 283

Table 9.4 Adjusted coefficients of the Ca-~Mg system (to express G in Jmol"! of atoms)

 

 

 

Phase Parameter A, or A B, or B Cc D-103 E
Liquid LE sty ~32322.4 16.7211
Le Ma 60.3 6.5490
21 Me —5742.3 2.7596
Mg(hep) Le sig —9183.2 16.9810
CaMg, GoM —67874.7 466.5126 —82.72014 4.76223 630000

=e 201

 

 

of the term C-T -In(7) for the CaMg, phase, which was set to 92.1987 to give C, =
90.9J}mol"' K~! at 986K after Eq. (9.2) (1 mole=3 moles of atoms). By imposition
of constraints (section 7.2), the coefficient C was forced to change by —1972 for unity
change of D in this equation, in order to keep C,,(986 K) constant.

All values mentioned in Tables 9.2 and 9.3 were put into the file camg.dat, but,
as explained above, the values from Baar (1911), Paris (1934), Haughton (1937),
Nowotny et al. (1940), Bulian and Fahrenhorst (1946), and Sommer et al. (1977)
and the A‘'H°™M: yalue of Smith and Smythe (1959) were excluded from the
calculation.

The calculation was started with the variable “IVERS” set equal to 1 (see sections 7.2
and 7.1.1). The Marquardt parameter became 10.0 after ten calculations in the first run.
After this run, the mean-squared error dropped significantly in relation to the definition
of the dimensionless errors in Eq. (2.59). The calculation was continued with “IVERS”
equal to 2, i.e., using common tangents, the Marquardt parameter 10.0 and eight cal-
culations. After four more steps with “IVERS” equal to 2, the Marquardt parameter
became 10~° and, after two more calculations, the mean-squared errors remained con-
stant. The resulting parameters were taken as the optimized dataset. They are given in
Table 9.4.

Results

Diagrams calculated with these parameters are compared with the experimental data in
Figs. 9.9-9.14. There is a small disagreement for the heat of melting, the enthalpy of
formation of CaMg,, and the enthalpy of mixing of the liquid. Because the enthalpy is
a state function (section 2.1.7), the enthalpy of formation plus the heat content plus the
enthalpy of melting must be the same as the heat content of the liquid pure elements
plus the enthalpy of mixing of the liquid with an Mg content of 66.7 mol%. The dis-
agreement, although it is visible in Fig. 9.15, is fairly well within the accuracy of the
measurements.

===========
 

1000]

800-|

600-}

Temperature (K)

400-4

 

 

 

T T T
40 30 -20 ~10 0

ca (kd mol")

Figure 9.10. The chemical potential of Ca in the
two-phase equilibria of the Ca-Mg system,
with data from Chiotti er al. (1964).

 

 

 

 

 

 

900 |
Liquid + Mgthep)
= 00 | 798K
g or Ma(nep)
2 v
# 7004
3 v +
€ cl
© 6004
‘woe as
500] Mathep) +CaMo,
T T T T
992 994 996 © 99.8100

Mole percent Mg

Figure 9.12. The Mg-rich edge of the Ca-Mg
phase diagram. Data from ll Vosskiihler (1937)
and @ Burke (1955) were used. Data from

¢ Haughton (1937), & Nowotny et al. (1940), and
¥ Bulian and Fahrenhorst (1946) were not used.

 

° 02 04 06 08 1
ca Mole fraction Mg Mg

Figure 9.14 The chemical potential of Ca and Mg

in liquid Ca-Mg alloys. The data are for Ca @ and
Mg Mi from Mashorets and Puchkoy (1965), and
for Ca ¥ and Mg & from Sommer (1979).

 

1000 |

800 |

600 +}

‘Temperature (K)

400 |

 

 

 

T T T T
25-20-15 108 0

tg (Kd mot)

Figure 9.11 The chemical potential of Mg in
the two-phase equilibria of the Ca-Mg system,
with data from Smith and Smythe (1959).

 

 

 

o
Se
.
°
-s0-|
T T rT r
0 02 of 06 o8 14
Ca Mole faction Mg Mg

Figure 9.13. The partial enthalpy of Ca at
1032K, with data from Agarwal er al. (1995).

 

ao 7
35
30-|

2s

20-|

H(T) -H(298 K) (kd mol")

 

 

 

T T T T
700 800 900 1000 = 1100

Temperature (kK)

Figure 9.15 The heat content of CaMg,,
with data Agarwal et al. (1995), @ used and &
not used.

===========
9.5 Modeling the y-y’ system

9.5 Modeling the y-y’ phases: the Al-Ni system

9.5.1

285

When assessing a system with phases that can undergo disordering, like the B2 and
L1, phases, it is strongly recommended that a model that includes the disordered states
be used, i.e., that the same Gibbs-energy function can be used also for A2 and Al,
respectively. The models recommended for ordered phases are described in section 5.8.4.
The Calphad models usually do not include an explicit dependence on short-range order
(SRO) as in the CVM, for example, because the contribution to the Gibbs energy from
SRO is usually much smaller than many others. As described in the chapter on modeling,
it is possible to describe the topological features of fee ordering with a Bragg—Williams-
type configurational entropy.

Order-disorder reactions

The stable phase diagram for AI-Ni is shown in Fig. 9.16(a). There is both an ordered
phase (B2) based on the bee lattice (A2) and an ordered phase (L1,) based on the fec

lattice (A1). Al and Ni are both fee

 

s pure elements and the bec phase (A2) is not stable

in this system. This system is of great technological interest because superalloys are based
on the Al + LI, equilibria, so it has been assessed several times using various models.
Superalloys contain from five to eight additional elements and thus it is important to
use a model that can easily be extended to multicomponent systems and also can calculate
equilibria and chemical potentials rapidly enough for it to be used in simulations of phase
transformations using phase-field methods.

2000

1800 -
1600 +

Temperature (K)

800
600
400
200

A

1400 4
1200 4
1000 +

 

 

 

L1\

 

 

Temperature (K)

2100 +

1800

1500

1200

900

600

300 +

14+A1#:

 

0

0.2

04 06
Mole fraction Ni
(a)

0.8

1.0

0

0.2

04 06
Mole fraction Ni
(b)

0.8

1.0

Figure 9.16 Calculated stable (a) and metastable (b) phase diagrams for the AI-Ni system, from
an assessment by Ansara er al, (1997b) and Sundman (unpublished work, 2002).

===========
286

9.5.2

Case studies

By suspending all phases except the fcc, one can calculate a metastable phase diagram
for AI-Ni with only ordered and disordered states of the fec phase. Such a phase diagram
is shown in Fig. 9.16(b). In order to perform an assessment of these phases, one can use
first-principles calculations of the energies for the various end members in the model,
ie, °Garnir “Garni and °Gayy;,. The stable parts of the phase diagram must also be
reproduced correctly, of course. It is interesting to note that on the Al-rich side there is a
miscibility gap rather than an ordered L1, phase.

The driving force and thermodynamic factor

In a simulation of phase transformations, one must know the chemical potentials out-
side the stability range of the phase. That is provided by the Gibbs-energy function,
which has been assessed for the whole composition range, not just for the stability
range. In Fig. 9.17(a) the Gibbs-energy functions for the disordered Al, ordered L1,,
and metastable L1, ordered phases are shown. The L1, ordered phase is metastable
because another ordered phase, B2, is more stable, but the Gibbs energy for B2
is not shown.

The diffusion follows gradients in the chemical potentials and the diffusion coefficient
is dependent on the thermodynamic factor (also known as the stability function), which
is obtained from the second derivatives of the Gibbs energy. The values of the ther-
modynamic factor as functions of composition are shown in Fig. 9.17(b), for the stable
L1, phase as well as for the metastable Ll) phase at T = 1273 K. This figure illustrates
the abrupt changes of these quantities at the ideal ordering composition. In Fig. 9.18 a
simulation using diffusion in a superalloy is shown.

 

 

 

 

 

 

 

 

30 a 40° po
U4
-35 4 ~ °
2 tow L
% it 3
2 -a0 4 2 &
2 =
§
B 45 441 % 10° u, F
2 5
2 s
g -904 s
3 a
a B 0! L
55-1115
60 40°
AX 050 0.55 0.60 065 0.70 0.75 0.80 JX 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80
Mole fraction Ni Mole fraction Ni
(a) (b)

Figure 9.17 Thermodynamic functions for the fec phase in the AI-Ni system. (a) The Gibbs
energy of the fcc and ordered fec based phases. (b) The stability function for the ordered
phases.

===========
9.6

9.6.1

9.6 A ternary oxide system 287

 

Figure 9.18 A simulated microstructure for an Ni-based five-component model alloy (Warnken
et al. 2002) obtained using an assessed thermodynamic database. The simulation was done using
the MICRESS code for the phase-field model http://www.micress.de. It reproduces the horizontal
section of a directionally solidified alloy, showing y dendrites and interdendritic y’ particles.
Courtesy of N. Warken.

Assessment of a ternary oxide system

This case study will describe the first steps of an assessment of the quasiternary system
Al,0,—CaO-SiO,. This is a fairly well established system with some particular modeling
problems. It will be used to show some special features of the Thermo-Calc software,
including

¢ how to handle quasiternary (and quasibinary) systems,

e how to control a ternary miscibility gap, and

e how to select ternary parameters.

The quasibinary assessments were taken from previous publications: Al,O,;—CaO from
Hallstedt (1990), Al,O;-SiO, from Wang and Sundman (unpublished work, 1992), and
CaO-SiO, from Hillert and Sundman (1990). The phase diagrams calculated from these
assessments are shown in Figs. 9.19(a), (b), and (c), respectively.

The quasiternary system

The term “quasi” means that one of the components is redundant, insofar as its amount
cannot vary independently of those of the others. For example, the amount of oxygen is
fixed when the amounts of the other elements have been set. Of course, no real system
has this property, but it is a useful approximation. The Gibbs phase rule states that there
should be one condition for each component plus two for temperature and pressure. In
a “quasi” system the last degree of freedom can be removed by imposing the condition
that the activity of the “redundant” component is set to an arbitrary value. However, one
must be careful to ensure that the modeling of all the phases in the system does not allow
the composition to vary outside the “quasi” limits. If this is not the case, the equilibrium
results are not independent of the selected activity.

===========
288

9.6.2

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

Case studies

3000 2000 000

2800 2300 2300

2600 2800 2800
© 2400 © 2400 © 2400
© 2200 © 2200 © 2200
000 = 2000 = 2000
é é é
1800 1800 1800

1600 1600 1600

1400 1400 1400

1200 1200 1200

om 40} 100 om 40} 100 0 7 4060 8100
A Mass percent Al,O, A Mass percent SiO, A Mass percent Ca0
(a) (b) (

Figure 9.19 The three quasibinary phase diagrams: (a) CaQ-Al,0,, (b) Al,0;-SiO, (the dotted

line is a metastable miscibility gap in the liquid), and (c) Si0,-CaO.

The liquid model

The partially ionic two-sublattice liquid model described in section 5.9.4 was used for the
liquid phase. This is a very flexible model, which can take into account many kinds of
ions and other species. In the original model, both CaO and AI,O, were treated as “basic
oxides,” i.e., they give away oxygen and form Ca”* and Al** cations and O?~ anions in
the liquid:

(Ca, AP),(07-, SIOF, SiO3) 9 (9.3)

whereas SiO, is treated as an “acid oxide” because it takes up oxygen, creating the
complex, SiO. This model has a reciprocal subsystem,

(Ca**, AP*),(O*, SiO} )g (9.4)

and it was found to be impossible to control the appearance of a reciprocal miscibility
gap in this subsystem, see section 5.8.1.2, without using too many parameters. No such
reciprocal miscibility gap is found in the real system. One reason for the problem is that
there existed no experimental data to enable the determination of values for the “end
member” Al,(SiO,)3.

The model was then simplified by treating Al,O; as “amphoteric,” i.e., it neither
gives up oxygen nor forms any complexes with oxygen, and thus can be modeled as
a neutral species. The size of this species was taken to be half of Al,O3, i-e., AlO3/.,
because too large a molecule would change the entropy in the liquid and using the AlO,,,
molecule made the model (Ca?*),(O7-, AIO3/9)9 identical to the previous ionic model
(Ca**, AP*),(O?-) 9. The ternary model was thus

(Ca®*) (0%, SIOF , A105), SIO) (9.5)

Since there are no Al** ions in the first sublattice, there is no longer any reciprocal
miscibility gap. In both sublattices only a single ionic species is left. Because they have

===========
9.6.3

9.6 A ternary oxide system 289

the same charge, their amounts must always be equal. Owing to this condition, the model
can be further simplified, without any change in the mathematical formulation, to

(AlO,,», CaO, Ca,SiO,, SiO») (9.6)

and this is a model for an associate solution as discussed in section 5.9.4.3.

Owing to the problems with this model discussed below, a recent assessment of the
Al,0;-CaO-SiO, system by Mao et al. (2006) treated the Al,O; oxide as an acid by
introducing the anion AlOS- into the liquid. This new constituent removes most of the
problems on extrapolating into the quasiternary system, but it is anyway useful to learn
about the problems with the previous model since such problems can occur with any
model or system.

The ternary extrapolation

On putting the three quasibinary assessments together, extrapolating to the ternary system,
and calculating the isothermal phase diagram at 2000K, one obtains Fig. 9.20(a). In
this diagram there is a small liquid miscibility gap in the SiO, corner arising from the
quasibinary CaO-SiO, system. Additionally there is a large miscibility gap in the liquid
in the central part of the diagram.

This miscibility gap originates from modeling the Ca,SiO, complex in the liquid
with a very large stability. The assessed parameters for interaction between CaO and
AI,O, and between CaO and SiO, are very negative, whereas that for interaction between
AI,O, and SiO, is weakly positive at 2000 K. On starting from a liquid with composition
0.4 and adding A1,O,, the liquid splits up into one rich in Ca,SiO, and
another that is rich in Al,O. Since this miscibility gap does not appear in experimental
investigations, the first objective in the assessment of ternary parameters is to suppress

Xeuo = 0.6, X;

 

  

100 A oO 20 40 60 80 100
Mass percent Al,O,, Mass percent Al,O,,

(a) (b)

Figure 9.20 The ternary extrapolation from the binaries of the liquid at two temperatures (a)
2000 K and (b) 1800K. In (b) all solid phases have been suspended. The upper miscibility gap is
correct, but the lower closed miscibility gap should be suppressed.

===========
290

9.6.4

9.6.5

Case studies

the appearance of this miscibility gap below the stable liquidus temperature. This is not
the only possibility; in some cases it may instead be reasonable to reassess the binary
subsystems in order to avoid the appearance of ternary miscibility gaps, which are due to
the very different interaction parameters in the binaries, as was done in the most-recent
assessment (Mao et al. 2006).

In Fig. 9.20(b) the miscibility gaps at 1800 K, are shown; in this calculation all solid
phases have been suspended. In the top corner the stable miscibility gap in the CaO-SiO,
binary extends toward the binary Al,O;—SiO, edge, where it is metastable with respect
to liquid + solid SiO, equilibria.

Control of the ternary miscibility gap

It is difficult to calculate whether the composition of a phase is inside a miscibility gap in
a ternary system, but it is easy to ascertain whether the composition is inside the spinodal
by calculating the stability function

def OO

(* ‘he }
Ox, Ax,

Inside the spinodal this determinant is negative; along the spinodal it is equal to zero.
The smallest eigenvalue of this stability function can be obtained in Thermo-Cale by
use of the function QF (phase name) and its value at various points in the liquid phase
can be calculated. In PARROT one can create equilibria at the relevant compositions
and temperatures and use “EXPERIMENT QF (ION_LIQ)>0.1:.001,” which means that
there will be a contribution to the sum of errors if this inequality is not fulfilled, which
will force the adjustable variables to change during the optimization in order to suppress
the miscibility gap.

 

Experimental liquidus projection

Figure 9.21 shows an assessed liquidus-surface phase diagram, reprinted with permission
from the ACerS-NIST Phase Equilibria CDROM V.3.1 (http://www.ceramics.org). There
is a stable miscibility gap only close to the SiO, corner. In the central part of the
system there are two ternary compounds with the compositions (CaO),.Al,0;.SiOs, called
gehlenite, and CaO.Al,0,.(SiO,),, called anorthite. The gehlenite will be called melilite
because it has the same structure as (MgO),.Al,0 .SiO, and melilite is the generic name
of this structure. Both melilite and anorthite melt congruently and their melting points
will be used in the experimental file. There are also experimental thermochemical data
for the compounds.

From the liquidus surface, one may use the invariant equilibria with the liquid in equi-
librium with three solid phases as experimental points. This is not strictly correct because
experimentally one has determined only points on the liquidus and this information has
been graphically interpolated and extrapolated to provide isotherms, monovariant lines,

===========
9.6.6

9.6 A ternary oxide system 291

  
   

(2572"),

 

0 CasAl,O5 CasAlOs% \®, CaAlOs
cao 9 %.\%, 1604")
at Wt %e al-Ca,Si0,

CaAlOre, %, Cahl,,0
3%, Clore

%,
%
" (1765°) Po
* Al,O;

Figure 9.21 The experimental liquidus surface in the Al,O;-CaO—SiO, system. Reprinted with
permission from ACerS-NIST Phase Equilibria CDROM V.3.1 (http://www.ceramics.org).

and invariant equilibria. In a proper assessment one should go back to measure all these
experimental liquidus points because a graphical extrapolation might not be accurate, but,
for the sake of simplicity, in this case study we will just use the invariant equilibria from
the phase diagram.

There are also some measurements of the activities of the various oxide species. With
this information, one can create an experimental data file for the system.

The interaction parameters

In the above selected model for the liquid there are four constituents, the three “end
members,” AlO3,., CaO, and SiO,, and the complex Ca,SiO,. There is no corresponding
complex for Al-Si-O because AIO,,, is treated as a neutral species in the liquid.

The interaction parameters involving the end members were assessed when the binaries
were modeled, and this also includes the interaction parameters involving the complex and
the CaO and SiO, end members. However, there is a new “quasibinary” interaction between
Ca,SiO, and AlO,,, that can be assessed inside the ternary system since it will give zero
contribution to the three initial quasibinary systems. In fact, the interaction between Ca, SiO,
and AlO,,. is the most important one to suppress the miscibility gap in the central part.
Figure 9.22 shows the miscibility gaps at 1800 K, calculated using the parameter

 

Laioy)..casio, = — 15000 (9.7)

===========
292

Case studies

 

fy 9 (02 04 06 08 1.0
Mass fraction Al,O3

Figure 9.22 The liquid miscibility gap at 1800 K with all solid phases suspended and using the
quasibinary parameter L,,si0,,a10; = —15000J mol~!, Compare this with Fig. 9.20(b).

The parameter should be negative in order to stabilize the liquid along the line from
Ca,SiO, to Al,O . It is possible to model this quasibinary parameter in a composition-
dependent way by using an RK series, in which each parameter ”L can be temperature-
dependent.

There are three ternary parameters, each of which involves three different constituents:

Latos.Cx0 Si0; (9.8)
Enioy2.CaSi0,,Si02 (9.9)
EA105)1,Ca0,CaySi05 (9.10)

All three of these interaction parameters may be both temperature-dependent and
composition-dependent according to Eq. (5.68).

As pointed out before, one needs some parameters to suppress the miscibility gap and,
by testing, one can find that the quasibinary parameter has the largest effect. Checking
the output from the PARROT module shows that the largest error occurs close to the
SiO, corner where the experimental temperature for the invariant equilibrium of liquid +
SiO, + mullite + pseudo-wollastonite is much lower than the calculated value. The very
steep liquidus from the Al,O,—SiO, side that is found experimentally indicates that
either there are more species contributing to the ideal entropy of mixing than considered
in the model, which would be difficult to model, or the excess parameters need to
give larger contributions. The ternary parameter having the largest effect in the SiO,
corner is Lai, .casio,.sio, and it is actually necessary to model this parameter in a
composition-dependent way. Making the quasibinary parameter temperature-dependent
significantly improves the assessment. Finally, the optimization was done using five
ternary coefficients.

===========
9.7

9.7 Some notes on Cr-Fe-Ni 293

Some notes on a ternary assessment, the Cr—-Fe-Ni system

The POP file with experimental data for the Cr-Fe—-Ni system is from an assessment
done many years ago by Hillert and Qui (1990). It contains many types of experimental
data: tie-lines between fec, bec, and liquid; liquidus temperatures; activities and activity
coefficients; heats of mixing; and partition coefficients.

Most of the experimental information is just the same as one would have in a binary
assessment. Since it is a ternary system, one must have one more condition for each
equilibrium. Ternary tie-lines can have two experimental compositions in each phase
and one of these must be used in a SET-CONDITION while the others are used as
EXPERIMENT. As the condition one should select the experimental composition that
has the smallest estimated uncertainty, but the problem is not so critical because there is
the possibility of setting an estimated error also for a condition. One may thus give

SET-CONDITION P=1E5 T=1473 X(fcc,NI)=.0
EXPERIMENT X(fcec,CR)=.22:.01

or

SET-CONDITION P=1E5
EXPERIMENT X(fcc,NI)

ol

 

  

1473 X(fcc,CR)=.22:.01
05:.01

and the optimizer will give the same result.

For some activities obtained by measuring the ratio of ion currents of two elements, an
“instrument constant” relating the two ion currents was optimized with a special feature
available in PARROT. The measured quantity, ap,/ay; for example, was multiplied by
the instrument constant, VALI in the POP file, and VALI was allowed to be varied by
PARROT until the best fit was found. This is achieved by the IMPORT VAL1#11 line in
the POP file. The command IMPORT will connect a variable in the POP file, VALI in
this case, with an optimizing variable, V11 in this case. The value after the hash sign “#”
specifies to which V-variable it is connected. V11 can either be set constant or allowed
to be an optimizing variable. The same technique can be used also in other cases, for
example if several samples are kept at the same carbon activity but the activity itself is
not well determined. The activity in several experimental equilibria can thus be set to the
same value but allowed to be varied by PARROT to get the best fit.

Data for the binary systems Fe—Cr, Cr—Ni, and Fe-Ni can be extracted from the SGTE
binary database, for example. All phases, except the o phase, are solution phases and
one may add ternary interaction parameters to all three or just for the liquid. A ternary
parameter can either be just an a + bT function or composition-dependent. The special
form for composition dependence derived by Hillert and used in Thermo-Calc requires
that one use three composition-dependent parameters. The principle is that each of these
three parameters will have the most influence in one of the corners of the ternary system.
A possible set of commands to enter the ternary parameters is

ENTER-PARAM L(LIQUID,CR,FE,NI;0) 298.15 V1+V4*T
ENTER-PARAM L(LIQUID,CR,FE,NI;1) 298.15 V1+V2+V4*T
ENTER-PARAM L(LIQUID,CR,FE,NI;2) 298.15 V1+V3+V4*T

===========
294

9.7.1

Case studies

If one has just the first parameter, ending with “;0,” that would represent the
composition-independent parameter. If all three parameters are equal, that would also
mean that there is no composition dependence. If the assessment gives small values for
V2 and V3, it is advisable to use just a single composition-independent ternary parameter.
This is the reason for using V1 and V4 as optimizing variables for all three parameters.
There will rarely be enough data to evaluate the temperature dependences of three ternary
parameters.

Assessing binary and ternary data together

A common problem is that one may wish to assess binary and ternary data together. This
is possible in PARROT and one may add binary information to the same POP file as for
the ternary or compile several POP files together into PARROT. When more than one
POP file is used, one must answer NO to the third question of the COMPILE command
when the second or later POP file is compiled. For example,

PARROT: compile

INPUT FILE: abe. POP

LIST-FILE /SCREEN/:

INITIATE STORE FILE /Y/:
+ .output...

PARROT: compile

INPUT FILE: ab. POP

LIST-FILE /SCREEN/:

INITIATE STORE FILE /Y/: N
+ .output...

If one answers Y (the default) to the prompt INITIATE STORE FILE, any experimental
data from previously compiled POP files will be deleted and the first experimental data
will be placed in the first block in the PARROT/EDIT workspace. If there is a FLUSH
command in the POP file, that will continue storing experimental data in the second block.
The second compile command when the POP file for the ab system has been compiled
and when the prompt INITIATE STORE FILE has been answered N or NO will store
the experimental data on this file in the next block, keeping whatever has been compiled
in the previous blocks. In the EDIT module, one must use the READ command to select
the block with equilibria.

Note that a binary POP file may require some modification before it can be used
in a ternary assessment. The CREATE-NEW-EQUILIBRIUM command has a second
argument that specifies the initialization code. Normally this initialization code is unity (1)
and that means that all components in the system will be entered and all phases suspended
initially. One may then explicitly set the phases FIXED, ENTERED, or DORMANT.
For a binary file compiled with a ternary system, one should change the initialization
code to zero (0) because that means that all components and phases are suspended
initially.

===========
9.7 Some notes on Cr-Fe-Ni 295

Thus one should change from the binary file

CREATE-NEW 1 1
CH-ST PH fcc bec=FIX 1
SET-COND T=1273 p=1E5

to

CREATE-NEW 1 0

CH-ST COMP A B=ENT
CH-ST PH fcc bec=FIX 1
SET-COND T=1273 p=1E5

or

CREATE-NEW 1 1

CH-ST COMP C=SUS
CH-ST PH fcc bec=FIX 1
SET-COND T=1273 p=1E5

However, the latter is less safe. It is always possible to have problems with equilibria
with one or more components suspended. Even when one enters only a few, the suspended
components may appear with non-zero fractions. There is a fix to this, which may have to
be executed explicitly for each troublesome equilibrium. By simply setting the component
first entered and then suspended, the Gibbs Energy System (GES) will explicitly set the
fractions to zero for the suspended components.

There may also be trouble with phases that dissolve the suspended component on a
sublattice together with one of the other components. For example, if one has a phase with
the model (A)(B, C) and suspends component C, then the phase appears as stoichiometric
in the AB system and for stoichiometric phases the calculation of G is different when one
calls GES to calculate it. Deeper inside GES there will be an error when GES discovers
the suspended component. This bug may be fixed in a later version, but at present one
may have to enter the same phase twice, both as (A)(B) and as (A)(B,C), with the same
coefficients for the parameter °Ga.p.
