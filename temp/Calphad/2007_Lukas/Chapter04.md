4 Experimental data used for

41

4.1.1

the optimization

For numerical use the parametric functions described in chapter 5 must be assessed using
experimental data. To get a maximum of information, all types of measurements that are
quantitatively related to any thermodynamic function of state must be considered. From
this dataset quantitative numerical data for the adjustable parameters of the Gibbs energy
functions are obtained using the methodology described in chapter 6.

In order to evaluate the reliability and accuracy of the experimental data, it is of great
help to know about the various experimental techniques used. Therefore, the main experi-
mental methods in thermodynamic and phase-diagram investigations shall be described
here. Nevertheless, this cannot be done here as deeply as in textbooks teaching experi-
mental techniques, for example Kubaschewski et al. (1993).

Here the main emphasis is on how to use various types of data for the optimization and

 

how to connect typical as well as more-exotic measured values with the thermodynamic
functions of state.

Since experiments are expensive and time-consuming, all data available in the literature
should be sought and their validity checked before one’s own experiments are planned.
An optimization using only literature data may be a good start, to give an overview,
and may reveal, where the knowledge is poor, which further experiments are best suited
to fill these gaps. Careful planning of one’s own experiments taking this overview into
account can very effectively keep the effort involved to a minimum and results in a very
significant improvement of the optimization.

The measurements can be classified into a few principal types. In the following part,
it will be explained how data may be measured and reported differently, although they
are equivalent, using examples from the literature. As the highest level of classification,
“thermodynamic data” and “phase-diagram data” shall be distinguished.

Thermodynamic data

Calorimetric data

Calorimeters measure heat transfer from a sample to its surroundings or vice versa.
Isobaric heat transfer is identical with the change of enthalpy of the sample, if no other
energy is simultaneously transferred. To be useful for the optimization, the sample must

58

===========
4.1.1.1

4.1 Thermodynamic data 59

represent a “system” that is in a well-defined state before the measurement as well as
there-after. Before the measurement the sample may be separated into several parts,
such that each is in a well-defined equilibrium state, but these parts are not in mutual
equilibrium and react on combination.

Mixing and reaction calorimetry

The principle of this method is that two (or more) well-defined different samples are
combined in the calorimeter and react to give a single sample, which again must be well
defined. Well defined means that all the variables upon which the enthalpy depends must
be known: each sample must be in internal equilibrium; its temperature and composition
must be known. (The pressure is assumed not to vary significantly and must be the same
for all three samples, since the heat change can be identified with the enthalpy change
only for isobaric changes.) The initial states, denoted "" and ", may be in metastable
equilibrium, as long as they are well characterized:

sample” + sample” => sample’

The measured heat loss AQ has to be compared with the corresponding calculated
enthalpy difference:

AQ = enthalpy of reaction product — enthalpy of reactants (4.1)
= enthalpy of sample’ — enthalpy of [sample” + sample”]

In most cases the two samples before and the single sample after the measurement
are single phases, but samples in heterogeneous equilibrium may in principle also be
used. For single-phase samples the superscripts denoting the samples (’”,”, and ') can be
identified with phase indices. The enthalpy difference of Eq. (4.1) can be calculated by
summing up the molar enthalpies (H') of the samples multiplied by their amounts (m'),
where the amount of the reaction product is the sum of amounts of the reactants. Each
molar enthalpy is calculated with the appropriate expression from chapter 5 using the
independent variables temperature (7') and composition (x'), which may be different for
all three samples. They must be referred to the same reference state, for example HS®®
(SER denotes the stable-element reference state at 298.15 K and 1 bar):

AQ =(m"+m")-H(T',x!)—[m" HT", x") 4m" HL") (4.2)

The independent variables m", m’”, x", x", T’, T", and T"” of the samples have to be

evaluated from the reported data; x’ is calculated from m", m'’, x”, and x”.
Equation (4.2) may be normalized with respect to amount | mol for the reaction

product; then for simplification m’”” is called m and m" is called 1 —m:

AQve” = H'(T',x')—[(l—m)-H"(T"",.x")+m-H"(T", x") (4.3)

===========
60

Experimental data for optimization

 

 

H(x) H(x) H(x)

 

 

 

 

 

 

x7 a4 x" x

(a) (b) (c)

Figure 4.1 (a) integral enthalpy; (b) partial enthalpy; (c) curvature of H(x).

Measurements of this type appear in many variations in the literature, depending on

what is mixed in the calorimeter, as shown in Figs. 4.1(a)-(c)

1.

Enthalpies of mixing of binary liquid alloys (Fig. 4.1a). The two liquid pure
elements (amounts 1 —m and m, x” =0, x”” = 1) are separated inside the calorimeter.
After the calorimeter has been heated and is ready for measurement, the two liquids
are mixed, for example by breaking a glass crucible or by opening a stopper. In this
case the three temperatures 7’, T” and 7” in Eq. (4.2) are equal and identical to the
calorimeter temperature:

 

AQ = H(x’)—(1—m)-H(x")—m- Hx”)

x = (l-m)-x"+m-x""

Series of mixing-enthalpy measurements (Fig. 4.2). Known amounts of one of the
pure elements are dropped consecutively from room temperature 7” into the liquid
alloy inside the calorimeter, which is the result of the previous measurement. Here
T" =T' is the calorimeter temperature. The enthalpy difference H!""(T’) — HS®® (T"”)
of the pure element which has been dropped in is often subtracted from the
measured value by the authors and only this difference is reported as the result.
Furthermore, if the sample inside the calorimeter is the other pure element in the
first measurement, each measurement of the series is reported as the sum of all
previous measurements, giving directly the integral molar enthalpy of the liquid.
For use in the optimization it is strongly recommended that one recalculate from the
reported values the heat effect of each single measurement by subtracting the effects
of the previous measurements. In measurements with a solid element, the original
temperature 7” may also be important, because the value of H/'"(7’) — HS®8(T"”)
included in the accepted parameters for G of the pure element i may differ from the
value adopted by the authors of the experiments.

Partial enthalpies (Fig. 4.1b). If the amount m'” = m of the dropped pure element
in Eq. (4.2) is small relative to the amount m” = 1—~m of the liquid in the
calorimeter, the measurements yield partial enthalpies, approximating dH/dN,

===========
4.1 Thermodynamic data

Integral enthalpy

Mole fraction B
A lole fraction B

Figure 4.2. Measuring a series of enthalpies of mixing of a liquid by dropping successively
small portions of the second element (B) into the calorimeter, starting with the pure first
element (A) there.

61

by AQ/m. This approximation is exact for one composition between x’ and x", but
this composition is not known exactly. If x’ and x” are not very different, the mean
(x'+.x")/2 is a good approximation for this mole fraction, where AQ/m is exactly
the partial enthalpy. Unfortunately, some papers report only the resulting partial
enthalpies. In others, however, these partial enthalpies are summed up with all the
previous heat effects of the series and reported as integral enthalpies of mixing as
described in the previous paragraph. The partial enthalpies are then available only
by reconstructing the originally measured values from the reported ones.
Direct-reaction calorimetry. Inside a calorimeter a mixture of the powders of
the pure elements (amounts m” and m"’) is quickly heated in a small furnace
until it reacts to form a compound. The power input of the furnace is subtracted
from the heat measured. The measurement must include all the heat released until
the sample has cooled down to the starting temperature. Then AQ/(m" + m'’)
directly represents the enthalpy of formation of the compound at the starting
temperature of the calorimeter. The completeness of the reaction has to be
checked.

Solution and combustion calorimetry. The terms of Eq. (4.2) may be measured
separately, once by dissolving the compound or solid solution (single-prime
variables) and once by dissolving a mechanical mixture of the two pure elements
(double- and triple-prime variables) in the same solvent inside a calorimeter. If the
final solutions in both cases have the same state (7, x), the difference of the two
heats of solution is equivalent to AQ of Eq. (4.2). The solvent may be an aqueous
acid at room temperature or a liquid metal (Sn, Al,... ) in a high-temperature

 

calorimeter.
Combustion in a bomb calorimeter is treated similarly. The heats of combustion of
the pure components are subtracted from the heat of combustion of the compound.

===========
62

Experimental data for optimization

 

HOOAL

Enthalpy
\
ce
8
=

 

 

 

Mole fraction Al
Co lole fraction Al

Figure 4.3 Solution calorimetry of an intermetallic compound (CoAl) in liquid of one of the pure
components (Al). The heat of solution of the compound is relatively small and the shape of the
H(x) curve can be measured more accurately than can the value itself.

An advantageous special case of solution calorimetry is when the solvent liquid metal
is one of the elements of the binary system itself. As an example the determination
of the enthalpy of mixing of the CoAl,.., phase by solution calorimetry in liquid
Al (Henig et al. 1980) is given in Fig. 4.3. The enthalpies of solution of the
CoAI phase, A*"'H, are relatively small and measured accurately to within about
5%, which contributes less than +1 kJ mol”! to the enthalpy of formation. The heat
of solution of the pure components is the negative of the partial enthalpy of Co in
liquid, AHS, times the mole fraction of Co in the compound, because the partial
enthalpy of Al in dilute molten Al is virtually zero. To get the enthalpy of formation
from the heat of solution of the phase, one has to subtract the partial enthalpy of
pure Co in nearly pure molten Al. This heat of solution of pure Co, corresponding to
the amount of Co in the phase, is given in Fig. 4.3 by the dashed straight line. The
heats of solution of the phase have to be added to the values given by this straight
line. This is visualized by double arrows for two phases with different Co contents.

The partial enthalpy of Co is much larger than the heat of solution of the phase
and is also measured accurately to within about 5%, contributing about +7kJ mol!
to the enthalpy of formation of CoAl. This contribution, however, is the same for
all CoAl samples. The difference of the accuracies of the samples is thus less
than 1kJmol~!. The shape of the H(x) curve is therefore determined to within
+£1kJ mol"!, although the values themselves may have uncertainties of +7kJ mol”.
The shape of the H(x) curve (Fig. 4.1c). If samples 2 and 3 are liquid solutions with
mole fractions that are not very different, the heat effect on mixing mainly reflects
the curvature of the plot of integral enthalpy of mixing versus mole fraction, H(x).
Experiments of this type are seldom reported in the literature because the results
cannot be presented directly in terms of conventional thermodynamic functions, but,
as experiments done especially for the optimization, they may be very useful.

===========
4.1.1.2

4.1.2.1

4.1 Thermodynamic data 63

Further modifications of these techniques may be found in the literature. The treatment
of the experimental results for the optimization, however, should give no additional
problems.

Drop and scanning calorimetry

The principle of these two methods is that a single, well-defined sample in internal
equilibrium is brought from one temperature to another temperature, at which it again
reaches internal equilibrium, and the heat loss or gain AQ is measured. AQ is identified
with the enthalpy difference between the two equilibrium states:

AQ=H'(T',x)—H"(T", x) (4.4)

In drop calorimetry the temperature change is usually large, whereas in scanning
calorimetry it is usually small. The sample in any of the two states may be either single-
phase or in heterogeneous equilibrium. The overall composition x is the same for both
states. The phases in the two states may, however, be different.

In scanning calorimetry, if both states contain the same single phase, then, instead of
using Eq. (4.4), the measurement may be identified with the heat capacity C,,:

AQ

C,(T, x) © ar (4.5)

In continuous sc:

 

ning calorimetry even @Q/0T may be measured directly. With scanning
calorimetry across a melting or transformation temperature, the enthalpy of isothermal
melting or transformation may be measured by extrapolating to AT = 0. For more details
see Hoehne et al. (1996).

 

Chemical-potential data

These measurements are classified into evaluations of the emf of reversible galvanic cells,
of vapor pressure, of equilibria with a well-defined gas mixture, and of the solubility
in a nearly inert solvent (treated as a Henrian solution). In these cases two different
equilibrium states are considered, between which just one element can be transferred by
a process that, in a Gedankenexperiment, can be carried out reversibly. One of the states
is usually the pure element itself.

The data may be reported either as differences of chemical potentials (partial Gibbs
energies) A or as activities a, which are connected by the formula Aw = RT In(a). In
the least-squares method it is important to have nearly equal probabilities for positive
and negative “errors,” so the function mw or In(a) = 4/(RT) is in most cases more suitable
than the activity a.

 

 

Galvanic cells

In a reversible galvanic cell the more electronegative element can be transferred from the
pure element to the alloy (single-phase solution or two-phase equilibrium state) or vice

===========
64

Experimental data for optimization

versa by an electric current. If the current is interrupted, in a reversible cell the exchange
is totally inhibited. The electric energy per mole transferred is identical to the difference
in partial Gibbs energy,

alloy

 

=U-Z-F (4.6)

where U is the voltage of the cell, Z the charge of the ion, and F the Faraday constant.
Z.-F is the electric charge transported with one mole of the element and thus U-Z- F is
the electric energy which can be gained by diluting one mole of the pure element in the
alloy or which must be provided to retrieve it from the alloy.

There are various experimental realizations of galvanic cells, but they always contain
two electrodes separated by an electrolyte. The electrolyte may be a molten salt (one that
is often used is the eutectic mixture of KCI and LiCl with some chloride of the metal, the
ions of which are to be transferred), a solid ionic conductor (Y-doped ZrO,, CaF,), or an
aqueous solution. The electrode may be of the “first kind,” i.e., the metal is in equilibrium
with its own ion (Zn/Zn?*), or of the “second kind,” i.e., the electrode is surrounded by
an insoluble salt and discharging of cations releases anions into the electrolyte or vice
versa (Ag/AgCl/Cl, Ni/NiO/O* ). An electrode of the second kind may be measured
against a reference electrode based on an anion, for example

Cu (in an Au-Cu alloy) + Cu,0/ZrO, (doped with Y,03)/0,(Pt)

or the reference electrode may be an electrode of the second kind with another cation,
for example

(Mo)/Cu (in an Au-Cu alloy) +Cu,0/ZrO, (doped with Y,03)/Ni + NiO/(Mo)

The condition of reversibility of the cell is that the conductivity of the electrolyte
must be purely ionic and that only one element must be discharged or ionized at each
electrode and the valence of ionization must be well defined. The reversibility is proved
by reaching the same stable equilibrium voltage after passing a current in both directions.

Usually the results are reported as the voltages U of the cells, sometimes only the
resulting values of Au (U-Z-F in Eq. (4.6)) or In(a) (U-Z-F/(RT) in Eq. (4.6))
are reported.

Since it is possible to make many measurements with the same cell by changing
the temperature, the measured values are often reported not directly but rather as linear
functions smoothing the measured values of each cell, U = A+B-T or w=A+B-T.
More exactly, that should be a very slightly curved function with a three-term formula
U=A+B-T+C-T-In(T), but usually the values are not accurate enough for one to
determine C, which represents the difference AC, between °C,, of the pure element i and
the partial C,, ; of the alloy. When using such information for an optimization, the values
for one sample may be represented by two or three values from this formula, taken from
the lowest and highest quarter of the temperature range investigated and, if C is given,
also from the center of the range.

===========
4.1.2.2

4.1 Thermodynamic data 65

Aps values in a two-phase field between an intermediate phase ® and the nearly pure
element B are usually reported as Gibbs energies of formation of the intermediate phase
®. This is possible because generally G = > x,- 1, and, in a two-phase field with pure
element B, ug —°G, = 0 and therefore G® — 0(x;-°G,) = x, -(@a —°Ga), ie., the Gibbs
energy of formation of phase ® and Ay, in the two-phase field between ® and the pure
element B are proportional. If the formula for @ is A,B,, the Gibbs energy of one mole
of ® (ie., of p+1 moles of atoms of ®) is identical to Aw, since x = 1/(p+1).

If the galvanic cell contains a reference electrode other than the pure element, the
voltage of a cell with this reference electrode and the pure element must be subtracted from
the measured voltage in order to get the voltage U of Eq. (4.6). If this was not measured in
the same investigation, it must be calculated from a thermodynamic database considering
the Gibbs energy change of the reaction connected with the cell containing the reference
electrode and the pure element; and then this value of G must be divided by Z- F.

Vapor pressure

If one of the elements of an alloy is much more volatile than the other one(s), the vapor
phase above this alloy contains virtually this element only. Its partial pressure can be
compared with that above the pure element at the same temperature. In a Gedanken-
experiment the element can be transferred reversibly between the two vapor phases by
an ideal-gas engine. The work connected with the transfer of | mol of vapor of element
7 is equal to the change in chemical potential of element i. It is calculated by integrating
V dp between the two pressures, assuming the volume V to be expressed by the ideal-gas
equation of state, V = R-T/p:

alloy
pil 9G, = arf" “ =R-T-In(pt"/°p,) (4.7)
Spi
where °p; is the vapor pressure of the pure component i at the same temperature.

This is true for monatomic vapor only. For diatomic vapor molecules Eq. (4.7) gives
half the 1-value and for n-atomic vapor molecules one nth of the j-value. If the vapor
phase is a mixture of monomer atoms and polymeric molecules, the partial pressure of a
single species should be measured rather than the total vapor pressure above the alloy as
well as above the pure element.

There are several experimental methods for vapor-pressure measurements.

4.1.2.2.1_ Direct pressure measurement Direct measurement of the vapor pressure
by a manometer can seldom be done at high temperature. Firstly the material of the
manometer must not react with the sample and secondly the manometer must not be
affected by high temperature. The vapor pressure of Te was measured in this way: the
sample was included in a sealed silica-glass vessel with a deformable thin-walled part
enclosed in an atmosphere of nitrogen with adjustable pressure. By use of a lever with
a mirror a deviation of the position of the thin-walled part could be recognized. The
pressure of the outer atmosphere was always controlled to keep the mirror at the same
position and thus was equal to the vapor pressure of the sample.

===========
66

Experimental data for optimization

4.1.2.2.2 Optical spectroscopy of the vapor phase _ If the volatile component does not
attack glass, the sample may be sealed into a glass vessel with two parallel windows,
which is put into a furnace. By measuring the absorption at a characteristic wavelength
of the gas, the partial pressure is measured. For calibration, the pure volatile element may
be measured similarly.

4.1.2.2.3 The gas-transport method The substance is in a boat inside a furnace,
where an inert gas (usually argon) flows a measured flow rate. The volatile component
evaporates, is transported with the gas, and, before the end of the furnace, is condensed
on a water-cooled finger of glass or ceramic. The amount of condensed material is
determined by measuring the change in weight of the finger or by chemical analysis of
the dissolved deposit, and divided by the total volume of gas that has flowed through the
furnace. The measurement is usually done with different flow rates of the gas and the
measured concentration of the volatile component in the gas is extrapolated to zero flow
rate. This is assumed to be the concentration of the saturated gas and is transformed into
a partial pressure.

4.1.2.2.4  Isopiestic and dew-point methods The sample is sealed in an evacuated tube,
within which at some distance a sample with known partial pressure of the same volatile
component is situated. The tube is kept in a furnace, where the temperatures of sample
and reference sample can be controlled independently. The volatile component may now
move from the reference sample to the sample or vice versa until both have the same
vapor pressure. Then the tube is rapidly cooled and the sample analyzed.

The partial pressure of the reference sample should not vary rapidly with composition;
preferably it is a binary two-phase sample or the pure volatile element itself at a lower
temperature. It has to be checked that no part of the tube has a temperature lower than
the boiling point or sublimation temperature of the pure component.

A modification of this method is the measuring of the dew point: the pure element is
present not as a sample, but at the end of the tube, which is usually of glass. The furnace
has a small window and the temperature there is slowly decreased until a dew of liquid
or solid pure element condenses there. The temperature is raised and decreased again by
small values, to see whether condensation and re-evaporation can be done reversibly and
to get the equilibrium temperature as accurately as possible. The vapor pressure of the
pure element must be known as a function of the temperature:

In(p) = 2484-17) (4.8)

which reflects the AG between condensed and gaseous pure element; then the logarithm
of the activity In(a) = In(p/p,) can be directly calculated from the temperature difference
AT between sample and dew point:

din(p)
dT

 

In(p/po) © —

(4.9)

 

===========
 

4.1 Thermodynamic data 67

The temperature T in this formula is approximated by taking the mean of the sample
temperature and the dew-point temperature.

4.1.2.2.5. The Knudsen cell Low vapor pressures, below 10~! Pa, are measured by a
Knudsen cell. The sample is enclosed in a container with a small orifice. The volume
inside the container virtually reaches the equilibrium vapor pressure and the molecular
beam emanating from the orifice is proportional to this vapor pressure. To measure the
intensity of this molecular beam several methods have been used.

1. It may be collected on a target during a measured time and then analyzed.

2. The Knudsen cell is suspended on a very sensitive micro-balance and the weight
loss is recorded continuously.

3. The molecular beam is bombarded with low-energy (*10-eV) electrons and the
resulting ions are analyzed by mass spectrometry. This is the most-often-used tech-
nique nowadays.

In using the Knudsen cell together with mass spectrometry, the main problem is
deviations of the calibration after changing the sample, which makes it difficult to get
comparable values for p3"°” and °p, in Eq. (4.7). The main sources of variation are the
size of the orifice, the orientation of the Knudsen cell with respect to the ionization
chamber, and the effectivity of the ionization, which is the factor correlating the density
of the molecular beam with that of the ion beam and, finally, with the recorded signal.

Various methods to diminish the influence of these effects have been reported.
Most of them cannot be discussed here, but for each use of reported experimental
Knudsen-cell data in an optimization the description of the experimental procedure
must be carefully studied with respect to this problem in order to judge the quality of
the data.

Neckel and Wagner (1969) proposed that, if the vapor pressures of the two com-
ponents are of the same order of magnitude in a binary system, one could measure
the ratio of the two vapor pressures over the whole composition range. Their only
assumption is that the factor of proportionality between the vapor pressure and the
recorded signal changes equally for both components in different experiments. This
eliminates the influence of the size of the orifice, orientation of the Knudsen cell, and
electron-beam intensity in the ionization chamber (which is not the mean energy of an
electron).

Equilibria with gases of known activity

A gas mixture containing H, and H,O molecules at high temperatures provides a well-
defined chemical potential of oxygen. Depending on the H,/H,O ratio, between 0.01
and 100 a range of Aug = RT In(10000) is covered. A sample in contact with such a
gas mixture will take up or release oxygen until 4 reaches the equilibrium value. By
analyzing the final oxygen content of the gas the chemical potential of oxygen can be
determined.

===========
68

4.1.2.4

4.2

Experimental data for optimization

 

Solubilities in Henrian solutions

In dilute solutions, according to Henry’s law the activity of a solute is proportional to its
mole fraction. Therefore the mole fraction of an element in a dilute solution may be used
as a measure for the activity. A sample may be immersed in a liquid that does not dissolve
in it and itself dissolves only small amounts of the sample at a particular temperature, at
which equilibrium is reached within a reasonable time. The equilibrium mole fraction(s)
of one or several components in the liquid are compared with those of samples with
known activities of these components, which have been treated in the same way.

Binary phase-diagram data

The quantities measured in binary phase diagrams are either (i) temperatures of invariant
(three-phase) equilibria (points (a) in Fig. 4.4), or points (x’, 7) on the boundaries of
two-phase fields. The latter points can be measured either (ii) for samples of known
composition x’ by determining the temperature T (points (c) in Fig. 4.4), or (iii) for
a series of samples of different composition x, annealed to equilibrium at the same
temperature 7, determined to be single-phase or two-phase (points (b) in Fig. 4.4).
The corresponding values calculated with the least-squares method are (i) the calculated
temperature, where besides the amounts of the three phases (arbitrary, but >0) only the
pressure is given; (ii) the calculated temperature of the two-phase equilibrium, where
besides the pressure, the amounts of the two phases and the composition of one phase are
given; or (iii) the calculated composition x’ of one phase in the two-phase equilibrium
at given temperature and pressure. (Note that in cases (ii) and (iii) the two phases of the
equilibrium are treated differently in the least-squares calculation.)
There are several experimental methods to measure phase-diagram data.

 

 

Temperature

 

 

 

 

Mole fraction B
A lole fraction B

Figure 4.4 Types of measurements in a binary phase diagram: (a) @ the temperature of
three-phase equilibrium, (b) ll the mole fraction x’ measured at a given temperature T, and
(c) @ the temperature T measured at a given mole fraction x’.

===========
4.2.1

4.2 Binary phase-diagram data 69

Thermal analysis

A sample is heated or cooled and its temperature recorded with time. When the sample
is going from a single-phase equilibrium state into a two-phase field, some heat of
precipitation is released. This leads to a kink in the temperature versus time curve. The
sensitivity of the method can be very much enlarged by the use of differential thermal
analysis (DTA). The sample and an inert reference sample are symmetrically located in a
block. Besides the temperature of the sample, the temperature difference between sample
and reference sample is recorded (Fig. 4.5). As long as there is no reaction in the sample,
the temperature difference follows the furnace temperature in approximately the same
manner as does the temperature of the reference sample and the A7(t) curve remains
near zero. If now the sample crosses the boundary to a two-phase field, the released heat
delays the temperature change of the sample and A7(t) shows a kink. The temperature
difference versus time curve (A7(r)) can be much more amplified than the 7(t) curve of
a normal thermal analysis.

In a three-phase (invariant) equilibrium the reaction evolving the heat takes place at
constant temperature. In the thermal analysis this shows up as a horizontal part in the
T(t) curve. The length of the horizontal part is roughly proportional to the amount of
matter reacting in the three-phase equilibrium. Plotting this length versus mole fraction
for a eutectic reaction gives a triangle, called a Tammann triangle, whose vertex indicates
the mole fraction of the eutectic liquid. If the DTA is performed in a scanning calorimeter,
the result of the Tammann triangle is quantitatively correct. For peritectic reactions,
however, due to usually severe segregation, the Tammann triangle must be used with

 

 

 

 

 

 

 

 

 

 

 

 

caution.
1200
g 1000 ,
e COOLING AT 0.1 K/S ~ liquid
ga Oo
a" = 800
=) ©
og 5
ge @ 600
20 5
BE a
se HEATING AT 0.067 K/S 5 400
gu e
2 200
500 550 600 650 700 750 800 0

 

 

 

A 0 02 04 06 08 1.0
Mole fraction Cu

(b)

Temperature in °C
(a)

Figure 4.5 The diagram in (a) shows heating and cooling DTA curves for a sample with
81 mol% Cu in Ba-Cu, courtesy of R. Schmid-Fetzer. The phase diagram assessed by
Konetzki et al. (1993) is shown in (b). The curve illustrates the large undercooling for the
high-temperature peritectic and very small undercooling for the medium-temperature
three-phase equilibrium.

===========
70

4.2.2

4.2.3

Experimental data for optimization

For a two-phase field boundary the sensitivity of the thermal analysis is much larger
for flat boundaries than for steep boundaries. First the amount of matter reacting in a
given temperature interval, for example 1K, can be derived by the lever rule from a
tie-line just 1 K below the boundary and is the larger, the flatter the boundary. Secondly
the Gibbs—Konovalov rule (Goodman et al. 1981) Eqs. (2.50) and (2.50), shows that also
the “enthalpy of reversible precipitation” is larger for flatter boundaries. The enthalpy of
reversible precipitation in principle is identical to the heat released in the DTA experiment.
An overview on the field of thermal analysis is given by Shull and Joshi (1992). A very
detailed paper about DTA measurements and interpretation of the corresponding results
is that by Boettinger and Kattner (2002).

Properties versus temperature

In thermal analysis a singularity of the enthalpy versus temperature curve H(T) is used
to identify the boundary between different fields of a phase diagram. In principle any
other property can be measured versus T instead of the enthalpy H. A kink of the
property versus temperature plot indicates a boundary in the phase diagram. Examples of
properties used for this purpose are dilatometric measurements (the length of a sample
versus temperature) in the Mg-Zn system, used by Grube (1929); electric conductivity
in the Zr-O systems, used by Gebhardt er al. (1961); and magnetic susceptibility in the
Fe-Nb system, used by Ferrier and Wachtel (1964).

Properties versus composition

Similarly to how a property can be plotted versus temperature, it can be plotted versus
composition (mole fraction). The main difference is that the temperature of a single sample
may be changed continuously and the property recorded. For the composition dependence,
however, many samples with different compositions are annealed to equilibrium at the
same temperature and the property is measured for these different samples. In principle the
same properties can be plotted versus temperature or composition, but several properties
are much more usefully plotted versus temperature whereas others are better plotted
versus composition.

A property preferably plotted versus composition is the lattice parameter measured by
X-ray diffraction. It is constant in a two-phase field and varies in a single-phase field. If
the decomposition of supersaturated single-phase samples can be prevented by quenching,
this facilitates its use. Several samples of a phase ¢ are equilibrated at the temperature
of maximum solubility and quenched and a lattice parameter versus mole fraction curve
a*(x) of # is generated. A single two-phase sample containing ¢ is now equilibrated at
different temperatures and quenched, and the lattice parameter of ¢ is measured. Using
the a®(x) curve as the inverse function, x(a®), the corresponding mole fraction of @ is
read. For non-cubic phases this procedure should be carried out with all the different
lattice parameters of the phase.

The electric conductivity p is a property that can be used as a function of either
temperature or mole fraction. An example is in the paper of Grube (1929), which was

===========
4.2.4

4.2.5

4.2 Binary phase-diagram data 71

used in the assessment of the Mg-Zn system (Agarwal et al. 1992). In a p(x) plot as well
as in a p(T) plot, there is just a kink of two not necessarily linear curves at the boundary
between a single-phase and a two-phase field.

Metallography

A very useful tool in phase-diagram determination is micrography, which, for metals, is
often called metallography. Much of the information from metallography is qualitative
and, although very useful in general, cannot directly be used for the thermodynamic
optimization.

Boundaries in phase diagrams are often deduced from series of samples of different
compositions equilibrated at several selected temperatures. The results for a “single phase”
or “two phases” are plotted in a temperature versus mole fraction diagram (a conventional
phase diagram). The boundaries between single-phase and two-phase fields are now
mapped in such a way as to satisfy these results. Quantitatively, a result may be expressed
as a point on the boundary (represented by x’ and 7), centered between two consecutive
samples found to be respectively “single-phase” and “two-phase” + half the distance
(Ax'/2 or AT/2).

A large advantage of micrography is that phases decomposing on quenching can usually
still be identified from their shapes. For example, droplets of liquid present in the sample
at the annealing temperature, although they become solidified during quenching, are
usually well detected as rounded areas of fine-grained material between solid crystallites
of much larger grain size.

Electron micrography and scanning micrography may in principle be used for the
determination of boundaries in phase diagrams in the same manner as optical micrography.

Quantitative metallography

In the micrograph of a two-phase sample the ratio of the areas covered by the images of
the two phases can be measured and it is approximately identical to the volume ratio of
the two phases. If the molar volumes of the two phases are known, the molar ratio can
be calculated from the volume ratio. This molar ratio may, for example, be expressed as
moles of atoms of phase | in a total amount of one mole of atoms, m’. This value appears
also as the calculated value in the description of an equilibrium in Eq. (2.23) and thus
can be used in the least-squares calculation.

Unfortunately, in the literature this type of measurement is seldom used for the con-
struction of a phase diagram. In the above-mentioned use of micrography the “two-phase”
samples have the potential to give more information: even a very rough estimate of the
amount of the second phase (here usually a very small amount) quantitatively gives the
distance of the boundary from the composition of this sample.

For the quantitative use of this type of measurement, a source of systematic errors
must be taken into account, namely that during grinding and polishing one of the phases
may be more easily removed than the other. Then, compared with the ideal geometry of

===========
72

4.2.6

4.3

4.3.1

4.3.2

Experimental data for optimization

the micrograph surface, this other phase presents a larger surface area than it should do
according to the above statistical consideration.

Microprobe measurements

In the electron microprobe, areas of the order of 1m? can be chemically analyzed
by X-ray spectroscopy. If a two-phase sample is annealed for long enough for it to
have grain sizes of several diameter micrometers and to have both phases in equilib-
rium, the equilibrium composition of both phases can directly be analyzed. The litera-
ture contains several methods used to take care of the X-ray absorption in the sample
by deducing amounts of elements from measured X-ray intensities of their character-
istic wavelengths. Transmission electron microscopy (TEM) instruments can also do
this, with a very much higher resolution. A good general reference for TEM is the
book by Williams and Carter (1996). With the technique called ALCHEMI (Spence
and Tafto 1983) the state of ordering can be determined and point defects identified
(Jones 2002).

Ternary phase-diagram data

The methods used to localize boundaries in ternary phase diagrams are in principle the
same as for binary ones, but there are now two independent variables describing the
composition and consequently there may be two different types of measurements of mole
fractions for the same phase with two different interpretations.

 

Thermal analysis in ternary systems

The temperature of the beginning of primary crystallization (on cooling a single-phase
liquid until the first precipitation occurs) and the temperature of an invariant equilibrium
are found in the same manner as in a binary system. The Tammann triangle, constructed
from the duration of isothermal solidification, now becomes a pyramid constructed over
two independent composition variables, e.g., mole fractions. Between primary crystal-
lization and invariant equilibrium, however, there may be the beginning of a secondary
crystallization with an additional kink in the thermal-analysis line (section 4.3.4).

Two-phase tie-lines

At the end of a two-phase tie-line the two independent variables defining the composition
may be interpreted as two vectors, which can be combined to give one in the direction
of the tie-line and another one parallel to the boundary of the two-phase field against a
single-phase field. Changing the latter vector, without looking also to the second phase,
simply means selecting another tie-line. The first vector, however, describes the length
of the tie-line and thus the position of the boundary, for example a ternary solubility.
By the same methods as in binary systems, two different types of measurements may be

 

===========
4.3 Ternary phase-diagram data 73

performed: either the temperature may be measured, where this boundary is at a given
composition; or the composition may be measured, where this boundary is found at a
given temperature. At a given composition the temperature may be measured by thermal
analysis, whereas the composition can be determined by metallography, X-ray lattice
parameter measurements, microprobe measurements of quenched samples, or any other
of the methods used for binary systems. The lattice parameters, however, in contrast to
those of a binary system, may vary also within the two-phase field, unless the samples
are situated along the same tie-line.

If temperature is the measured quantity, the “calculated value” F, of Eq. (2.52) is
the temperature of the tie-line, calculated for the composition of phase 1 fixed at the
experimentally determined composition using Eq. (2.38). Both phases must be identified
for the calculation.

If the composition of a is the measured quantity at a given temperature, the tie-line
passing through this experimentally determined composition is calculated for the given
temperature by using Eq. (2.42), see Fig. 4.6. The difference between “calculated” and
“measured” compositions must be taken parallel to the tie-line and may be related to
the total length of the tie-line. This is equivalent to calculation of the phase amount of
B referred to the measured composition of a@ as the overall composition (symbols Ml in
Fig. 4.6).

m® = (x (calc) — x*(meas))/(x* (calc) — x4 (calc)) (i=B, C) (4.10)

This “amount” can directly be interpreted as the “error” F;— L; according to Eq. (2.52). It
is zero if the calculation exactly reproduces the experiment. If the measured composition
is outside the calculated two-phase field (a + B in Fig. 4.6), then this “amount” formally
becomes negative.

Figure 4.6 Tie-lines of a ternary two-phase field at a given temperature: ill measured
composition of phase @, @ calculated composition of a in the tie-line passing through Ill, & two
points experimentally determined to be on the same tie-line (not necessarily the endpoints of the
tie-line), and @ calculated endpoints of tie-lines not directly related to measured points.

===========
74

4.3.3

 

Experimental data for optimization

Directions of two-phase tie-lines

The composition vector parallel to the boundary between two-phase and single-phase
fields becomes meaningful when it is compared with the other end of the same tie-line.
Measuring both ends of the same tie-line means measuring the “direction of the tie-line.”
An often-used method for that is the simultaneous determination of the compositions of
both phases by microprobe measurements. Another common procedure is measuring the
lattice parameters of one or both phases for two series of samples along two lines in
the two-phase field that are approximately parallel and near the two boundaries. Samples
with the same lattice parameters but in the two different series lie on the same tie-line
(Fig. 4.7).

As a measure of the “error” F; — L; in Eq. (2.52), the vector product of calculated and
measured tie-lin

 

may be used, both tie-lines being interpreted as vectors in the xz—x¢
plane. The calculated tie-line may be selected using the center of the measured tie-line
as the overall composition in Eq. (2.42),

(4.11)

 

where °x and "x? denote the calculated and measured mole fractions of component i in
phase ®, respectively.

A tie-line connects composition points where the chemical potentials 1; are the same
in both phases. This point of view is often helpful if the two phases are nearly binary in
two different subsystems of the ternary. An experimental tie-line of this kind indicates
equality of the chemical potential of the element common to both binary subsystems. The

 

Lattice parameter a‘
o

 

 

 

 

xeI xD
(a) (o)

Figure 4.7 Determination of the direction of tie-lines by lattice-parameter measurements. With
two-phase a +8 samples of compositions along the two dashed lines I and 2 in (a) (e) the lattice
parameter of the a phase, a®, is measured and plotted against a composition variable in (b) (here
X¢/xe*, ie. 0-1 along dashed lines 1 and 2). Points with the same lattice parameter a* are on the

same tie-line. Two pairs of points, (a) and (¥), are selected in (b) and re-translated to (a).

 

===========
4.3.4

44

4.4 Multicomponent and other types of experimental data 75

calculated values of these chemical potentials, however, are given by the descriptions of
the previously optimized binary systems. Such a measurement is therefore a check of the
compatibility of the two binary descriptions.

Ternary three-phase equilibria

The composition of one phase of a three-phase equilibrium is described by two inde-
pendent mole fractions. Similarly to the case of a ternary two-phase field, two different
measurements of the composition of one of the equilibrium phases can be defined for a
given temperature. They may be described as two different linear combinations of the
mole fractions, perpendicular or parallel to the line connecting the compositions of the
other two phases. The measurement perpendicular to this line corresponds to the length of
a two-phase tie-line, whereas the measurement parallel to it corresponds to the direction
of a tie-line. The latter, like the directions of two-phase tie-lines, may help as a check of
the binary descriptions. Besides the two composition variables of one of the phases of a
three-phase equilibrium, also those of a point on the boundary between the three-phase
equilibrium and one of the adjacent two-phase equilibria can be measured.

The experimental methods are the same as for isothermal two-phase equilibria. Lattice
parameters are constant within a three-phase field.

Instead of measuring the composition at a given temperature, the temperature can be
measured for a given composition, for example by thermal analysis. The secondary effect
of a thermal analysis corresponds to the temperature at which the boundary between the
three-phase field and an adjacent two-phase field crosses the overall composition of the
sample. If the phase of primary crystallization has a range of homogeneity, its composition
usually changes during solidification and the measured temperature, due to this segre-
gation, might not be the equilibrium temperature. Therefore this kind of measurement
should be used for the optimization only, if the primary phase is stoichiometric.

In principle, for temperature measurements at a given composition the same cases
should be distinguished as for isothermal composition measurements. Fixing both inde-
pendent mole fractions of an overall composition is, however, usually incompatible with
getting a single phase of a three-phase equilibrium.

Besides measurements of boundaries of a phase diagram, phase amounts in equilibrium
can be measured by various methods, for example by quantitative metallography, for
three-phase as well as for two-phase equilibria at a given overall composition. The
corresponding calculated value is determined by applying the lever rule, if it is not taken
directly from the solution of the equilibrium conditions Eqs. (2.23)—(2.27).

Multicomponent and other types of experimental data

Experimental data from multicomponent systems are usually not used directly in an
assessment, but, if the extrapolation from the lower-order systems gives wrong results,
one may use them to modify parameters describing the lower-order systems. For example,

===========
76

4.5

4.5.1

4.6

4.7

Experimental data for optimization

phases that are not stable in a binary system may have parameters assessed from a higher-
order system such as the fec phase in the Cr—-Mo system. Great care must be taken to
ensure that such modifications do not change the descriptions of the lower-order systems,
for example by letting a metastable phase appear to be stable.

In PARROT any measured quantity of a state variable, or a combination of state
variables, can be used as experimental data, provided that there is at least one extra
quantity measured in addition to those needed to be set as conditions for the equilibrium.

X-ray and neutron diffraction

These techniques are especially important for the determination of crystal structures and
require a single-crystalline sample. Lattice parameters and site occupancies as functions
of composition and temperature can be obtained. In cases of crystals with elements having
similar X-ray-scattering factors, these techniques can be used complementarily since
the atoms can be distinguished on the basis of their different nuclear scattering factors
(Grytsiv et al. 2005). Ordering can be observed as shown in Fig. 4.8, where superstructure
lines related to carbon-vacancy ordering are observed only by neutron diffraction (Grytsiv
et al. 2003).

Rietveld refinement

The Rietveld method allows the determination of site-o

 

ccupancy parameters by analyzing
intensity ratios of X-ray- or neutron-diffraction spectra of polycrystalline samples. An
overview of this technique is given by Joubert (2002).

Méssbauer spectroscopy and perturbed angular-correlation
measurements

These techniques can measure local states of ordering and site occupancy as well. The
former, described by Lee et al. (2005), is very appropriate for systems containing Fe.
The latter requires the incorporation of a radioactive probe into the sample. Binczycka
et al. (2005) reported a combination of these two methods and compared their results
with neutron-diffraction results. Both techniques can measure properties as functions of
temperature, composition, and pressure.

Final remarks

There are certain experimental data that cannot be used with the selection of models
described in the next chapter; they are, however, important and should also be scanned in
order to help provide an educated guess about the models to be used. For example, even
if lattice vibrations are not modeled explicitly, the literature data about phonon spectra

===========
4.7 Final remarks 77

a) 90000

X-ray

70000 = 0.154056nm.

(Cto.7Reo.3)2Co.9

50000

30000

Intensity (counts)

 

10000

 

10000

b) 2500

e'W,C-type Neutron
2200 ® 2 = 0.122510nm
1900 4
(Cto.7Rep.2)2Cog (e'W2C-type)
1600
1300
1000

700

Intensity (counts)

400

100

 

 

-200
1013 °«416 «19 «422 25 28 31 34

(A)

Figure 4.8 X-ray and neutron data showing superstructure formation due to carbon-vacancy
ordering. Courtesy of Peter Rogl.

should be scanned. Information about the order of magnitude of these effects can give
hints about the size and sign of the excess terms for the Gibbs energies. Techniques
measuring the elastic constant, bulk modulus, and thermal expansion are important and
give results that should also be taken into account since they are related to derivatives of
the Gibbs energy.
