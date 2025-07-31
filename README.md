Abstract
This dataset provides comprehensive fish community and environmental data from the Pearl River Basin in South China, focusing on the effects of urbanization on community structure and functional traits. Data were collected from 44 sampling sites covering both highly urbanized (Huadi River) and relatively natural (Zengjiang River) river sections during both summer and winter of 2024. For each site, we recorded fish species composition, abundance, and key functional traits (including pollution tolerance, critical oxygen demand, and activity layer). Environmental variables such as dissolved oxygen, pH, temperature, and conductivity were measured simultaneously. The dataset supports analyses of indicator species, functional diversity, and environmental filtering, and is suitable for advanced statistical methods such as RLQ ordination and structural equation modeling (SEM). This resource enables researchers to explore urbanization-driven changes in fish communities, test ecological hypotheses, and inform river management and biodiversity conservation strategies.

Methods
Fish and environmental data were collected from 44 sites across the Huadi River (urbanized) and Zengjiang River (natural) in the Pearl River Basin, South China. Surveys were conducted in both summer and winter of 2024 to capture seasonal variation. At each site, fish were sampled using standardized collecting, ensuring representative coverage of available habitats. All captured fish were identified to species, counted, and measured for total length. Functional traits, including pollution tolerance, critical oxygen demand, and activity layer, were assigned to each species based on published literature 、authority database and expert knowledge. Environmental variables were measured in situ at each site, including dissolved oxygen, pH, temperature, and conductivity, using portable water quality meters. Data were entered and validated to ensure consistency and accuracy. Functional and community-level metrics were calculated according to established ecological indices. The dataset is suitable for analyses of species-environment relationships, functional diversity, and multivariate statistical modeling.

Subjects
Agriculture, forestry, and fisheries, Agricultural sciences, Other agricultural sciences, urbanized river, environmental factors, functional traits, community diversity

Research facility: Chinese Academy of Fishery Sciences Pearl River Fisheries Research Institute, Ecology
Funding
Ministry of Agriculture and Rural Affairs of the PRC, CARS-45: the China Agriculture Research System of MOF and MARA
 Data submitted will be published under the Public domain license waiver.

 The data does not contain information on human subjects.

Data files hosted by Dryad
NMDS-figure_（Fig_3）.R 6.05 KB
RLQ-data（Fig4_and_Fig_5）.R 7.61 KB
RLQ-figure（Fig4_and_Fig5）.py 3.02 KB
Sampling_sites-environmental_factors_Matrix（Huadi_River）（Fig4_and_Fig5）.csv 1.58 KB
Sampling_sites-environmental_factors_Matrix（Zengjiang_River）（Fig4_and_Fig5）.csv 1.54 KB
Sampling_sites-species_matrix_in_both_rivers_in_summer（fig_2_and_fig_3）.csv 3.15 KB
Sampling_sites-species_matrix_in_both_rivers_in_winter（fig_2_and_fig_3）.csv 3.52 KB
Sampling_sites-Species_Matrix（Huadi_River）（Fig4_and_Fig5）.csv 3.46 KB
Sampling_sites-Species_Matrix（Zengjiang_River）（Fig4_and_Fig5）.csv 2.33 KB
SEM-data_（Fig_6）.py 3.39 KB
SEM-data（Huadi_River）（Fig_6）.xlsx 15.36 KB
Species-Functional_traits_Matrix（Huadi_River）（Fig4_and_Fig5）.csv 1.03 KB
Species-Functional_traits_Matrix（Zengjiang_River）（Fig4_and_Fig5）.csv 661 B
The_IRI_of_Huadi_River_in_summer_and_winter（Tab3）.xlsx 13.04 KB
The_IRI_of_Zengjiang_River_in_summer_and_winter（Tab2）.xlsx 11.13 KB
UPGMA-figure_（Fig_2）.R 1.25 KB
README: Findings from the Pearl River Basin: Dissolved Oxygen Alone Determines Community Stability via Functional Trait Filtering in Urban Rivers
Dataset DOI: 10.5061/dryad.p2ngf1w49

Description of the data and file structure
These datasets provide the raw data underpinning the analyses presented in the associated manuscript, including the calculation of the Index of Relative Importance (IRI), UPGMA hierarchical clustering, NMDS ordination, and the Indicator Value (IVal) index. The files contain species-level abundance and biomass data, which serve as the basis for community structure assessment and multivariate analyses. Additionally, these datasets include environmental variables and functional trait information necessary for RLQ analysis and structural equation modeling (SEM). Data were collected from both highly urbanized (Huadi River) and relatively natural (Zengjiang River) sites during summer and winter 2024, enabling robust comparisons of fish community structure and ecological drivers across a gradient of urbanization.

Files and variables
File: Sampling_sites-environmental_factors_Matrix（Huadi_River）（Fig4_and_Fig5）.csv
Description: 

Variables
Sampling sites:Unique identifiers for each sampling location.
WT:Water temperature (°C)

DO:Dissolved oxygen concentration (mg/L)
Scon: Specific conductivity (µS/cm).

Con: Conductivity (µS/cm).
pH: Water pH value.
NH4+-N: Ammonium nitrogen (mg/L).
File: Sampling_sites-environmental_factors_Matrix（Zengjiang_River）（Fig4_and_Fig5）.csv
Description: 

Variables
Sampling sites:Unique identifiers for each sampling location.
WT:Water temperature (°C)

DO:Dissolved oxygen concentration (mg/L)
Scon: Specific conductivity (µS/cm).

Con: Conductivity (µS/cm).
pH: Water pH value.
NH4+-N: Ammonium nitrogen (mg/L).
File: Species-Functional_traits_Matrix（Huadi_River）（Fig4_and_Fig5）.csv
Description: 

Variables
Species: Scientific name of each fish species.
BS: Body shape ，Ratio of fish body length to height
MP: Mouth position ，Position of the fish’s mouth
COC: Critical oxygen concentration，Minimum oxygen concentration fish can survive in
TIP: Tolerance index to pollution.
TL: Trophic level
AL: Activity layer (e.g., bottom, middle, surface).
File: Sampling_sites-Species_Matrix（Huadi_River）（Fig4_and_Fig5）.csv
Description: 

Variables
Sampling sites: Unique identifiers for each sampling location.
A1-An：Fish code
File: Sampling_sites-Species_Matrix（Zengjiang_River）（Fig4_and_Fig5）.csv
Description: 

Variables
Sampling sites: Unique identifiers for each sampling location.

A1-An：Fish code

File: SEM-data（Huadi_River）（Fig_6）.xlsx
Description: 

1. Species abundance matrix
Sampling sites: Unique identifiers for each sampling location in the Huadi River.
A1–A17: Abundance of each fish species at each site. Each “A” code corresponds to a specific fish species (see supplementary species code reference).
2. Environmental variables matrix
Sampling sites: Unique identifiers for each sampling location.
WT: Water temperature (°C).
DO: Dissolved oxygen concentration (mg/L).
Scon: Specific conductivity (µS/cm).
Con: Conductivity (µS/cm).
pH: Water pH value.
NH4+-N: Ammonium nitrogen (mg/L).
3. Functional traits matrix
Species: Scientific name or code for each fish species.
BS: Body shape; ratio of fish body length to height.
MP: Mouth position; anatomical position of the fish’s mouth.
COC: Critical oxygen concentration; minimum oxygen level tolerated by the species.
TIP: Tolerance index to pollution.
TL: Trophic level.
AL: Activity layer (e.g., bottom, middle, surface).
4. Site-level species diversity matrix
Sampling sites: Unique identifiers for each sampling location.
Species richness: The total number of fish species recorded at each site (a measure of alpha diversity).
File: Species-Functional_traits_Matrix（Zengjiang_River）（Fig4_and_Fig5）.csv
Description: 

Variables
Species: Scientific name of each fish species.
BS: Body shape ，Ratio of fish body length to height
MP: Mouth position ，Position of the fish’s mouth
COC: Critical oxygen concentration，Minimum oxygen concentration fish can survive in
TIP: Tolerance index to pollution.
TL: Trophic level
AL: Activity layer (e.g., bottom, middle, surface).
File: Sampling_sites-species_matrix_in_both_rivers_in_summer（fig_2_and_fig_3）.csv
Description: 

Variables
Sampling sites: Unique identifiers for each sampling location.

A1-An：Fish code

File: Sampling_sites-species_matrix_in_both_rivers_in_winter（fig_2_and_fig_3）.csv
Description: 

Variables
Sampling sites: Unique identifiers for each sampling location.

A1-An：Fish code

File: The_IRI_of_Huadi_River_in_summer_and_winter（Tab3）.xlsx
and File: The_IRI_of_Zengjiang_River_in_summer_and_winter（Tab2）.xlsx
Description: 
species: The scientific name of the fish species found at each location.
Quantity: The number of individuals of each species collected.
Occurrence frequency: The proportion of each species observed at the total sampling points.
Weight (g) : The total wet weight (g) of each species recorded in all samples at a given location and season.
(1)RLQ-data（Fig4and_Fig_5）.R、(2)RLQ-figure（Fig4_and_Fig5）.py、(3)UPGMA-figure（Fig_2）.R、(4)NMDS-figure_（Fig_3）.R、(5)SEM-data_（Fig_6）.py

The above five documents are the programs used to implement the results of this thesis
Code/software
The R language program adopts Rstudio, with version 4.3.2

The Python program uses PyCharm, with the version being 2024.3.3
The program code has been uploaded in the file
Access information
Other publicly accessible locations of the data:

No
Data was derived from the following sources:

No
