{smcl}
{* *! version 1.2  01jan2016}{...}
{viewerjumpto "Syntax" "cixr##syntax"}{...}
{viewerjumpto "Description" "levelsof##description"}{...}
{viewerjumpto "Options" "levelsof##options"}{...}
{viewerjumpto "Remarks" "levelsof##remarks"}{...}
{viewerjumpto "Examples" "levelsof##examples"}{...}
{viewerjumpto "Stored results" "levelsof##results"}{...}
{viewerjumpto "References" "levelsof##references"}{...}
{title:Title}

{p2colset 5 21 23 2}{...}
{p2col :{manlink P cixr} {hline 2}}calculates the concentration index (CIX) and can handle grouped data or microdata. For grouped data it is based on the calculation of the area of the concentration curve.{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}
{p 8 17 2}
{cmd:cixr}
{it:rankvar}
{it:outcomevar}
{ifin}
{weight} [, {it:options}]

{synoptset 21}{...}
{synopthdr}
{synoptline}
{synopt:{opt corr:ected}}present the "corrected" concentration indices proposed by Erreygers and Wagstaff{p_end}
{synopt:{opt gr:aph}}creates the concentration curve{p_end}
{synopt:{opt q:uant()}}change de default number of quantiles in the graph (microdata only){p_end}
{synopt:{opt c:luster()}}allows for clustered samples{p_end}
{synoptline}
{p2colreset}{...}


{marker description}{...}
{title:Description}

{pstd}
{cmd:cixr} calculates the concentration index (CIX) and can handle grouped data or microdata. For grouped data it is based on the calculation of the area of the concentration curve.
For microdata, estimation is based on convenient regression and Stata commands presented in O’Donnell O, van Doorslaer E, Wagstaff A, Lindelow M. Analyzing Health Equity Using Household Survey Data. A Guide to Techniques and Their Implementation. Washington, DC: The World Bank; 2008. 
Adapted to also calculate the "Corrected" Concentration Index proposed by Erreygers, G., Correcting the Concentration Index, J Health Econ (2008), doi:10.1016/j.jhealeco.2008.02.003, and the proposed by Wagstaff, Ad., The bounds of the concentration index when the variable of interest is binary, with an application to immunization inequality, Health Econ (2005), doi: 10.1002/hec.953, which are appropriate for bounded health variables.
The results are output in Stata scalars r(cix) and r(cix_se) for the CIX and its std. error. If requested, r(ecix) and r(ecix_se) and r(wcix) and r(wcix_se) are the "corrected" CIX and their std. error. 

{pstd}
{it:rankvar} must be ordinal and ordered so that low is poor/worst and high is rich/best.

{marker options}{...}
{title:Options}

{phang}
{cmd:weight} allows for the use a (sample) weights (must be integer). Usage is: [w={it:weightvar}]

{marker examples}{...}
{title:Examples}

Estimates CIX with confidence interval.

{phang}{cmd:. cixr income stunted}{p_end}

Estimates CIX with confidence interval and corrected versions.

{phang}{cmd:. cixr income stunted, corr}{p_end}

Estimates CIX with confidence interval and plot the concentration curve.

{phang}{cmd:. cixr income stunted, gr}{p_end}

Estimates CIX for weighted samples (only works with integer weights).

{phang}{cmd:. cixr assetindex development [w=sampleweight]}{p_end}

Estimates CIX for weighted samples with complex clusters.

{phang}{cmd:. cixr assetindex development [w=sampleweight], cluster(psu)}{p_end}



{marker developer}{...}
{title:Developer}
Developed by Aluisio J D Barros abarros@equidade.org (2012)
	version 1.1 - Apr 2014 - corrected for the case where CIX was calculated even if the rank variable was missing for all observations
	version 1.2 - Jan 2016 - corrected graph option; added stable option to sort rank variableclusters in the model using a local macro instead of if's. 
	version 1.3 - October 2025 - fixed an issue where the graph would not generate when the number of observations was small and the quantiles parameter was set.
	version 1.4 - May 2026 - included the option of the correction proposed by Wagstaff.

