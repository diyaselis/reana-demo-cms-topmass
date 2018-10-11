 REANA example - CMS Top quark mass measurement from b-jet energy spectrum
==========================================================================

About
=====

This repository provides a simplified particle physics analysis example for the
[REANA](http://reanahub.io/) reusable research data analysis plaftorm. The objective 
is to extract the top-quark mass by measuring the peak position of the energy of b-tagged 
jets in the laboratory frame as portrayed in the [CMS Data Analysis School exercises](https://twiki.cern.ch/twiki/bin/view/CMS/SWGuideCMSDataAnalysisSchoolLPC2018TopExercise). 
More information can be accessed in the CMSDAS example repository [here](https://github.com/CMSDASAtLPC/LongExerciseTopMass).

Analysis structure
==================

Making a research data analysis reproducible basically means to provide
"runnable recipes" addressing (1) where is the input data, (2) what software was
used to analyse the data, (3) which computing environments were used to run the
software and (4) which computational workflow steps were taken to run the
analysis. This will permit to instantiate the analysis on the computational
cloud and run the analysis to obtain (5) output results.


### 1. Input data

The analysis takes the following inputs:

- the list of sample CMS runs from 2015 and 2016 included in the ``inputs`` directory:

  - ``samples_Run2015_25ns.json``
  - ``samples_Run2015_25ns_m169p5.json``
  - ``samples_Run2015_25ns_m175p5.json``
  - ``samples_Run2016_25ns.json``
  - ``samples_Run2016_25ns_m169p5.json``
  - ``samples_Run2016_25ns_m175p5.json``
  - ``samples_Run2016_m169p5.json``
  - ``samples_Run2016_m175p5.json``
  
### 2. Analysis code

The analysis will consist of three stages. In the first stage, we shall process
the original and simulated collision data (using ``analyzeNplot.py``) to select 
top-pair events that decay in the eμ channel, compare the selection (control distributions 
and event yields), and propagate the sources of systematic uncertainties to the 
b jet energy peak;. In the second stage, we shall fit the b jet energy peak and
calibrate the peak measured for the set of selection criteria previously defined 
to the expected b jet energy peak, from which the top-quark mass can be easily extracted. 
In the third stage, we shall compare the results with the standard top-quark mass 
measurements performed with 8 TeV data.

<!-- The ``finalize`` directory
contains the analysis code plugin for the [CMSSW](http://cms-sw.github.io/)
analysis framework.-->

### 3. Compute environment

In order to be able to rerun the analysis even several years in the future, we
need to "encapsulate the current compute environment", for example to freeze the
software package versions our analysis is using. We shall achieve this by
preparing a [Docker](https://www.docker.com/?) container image for our analysis
steps.

This analysis example runs within the [CMSSW](http://cms-sw.github.io/)
analysis framework that was packaged for Docker in [clelange/cmssw](https://hub.docker.com/r/clelange/cmssw/).

### 4. Analysis workflow

The analysis workflow is simple and consists of the above-mentioned stages:
<!--
.. code-block:: console

                              START
                             /     \
                            /       \
                           /         \
   +-------------------------+     +------------------------+
   | process collision data  |     | process simulated data |
   +-------------------------+     +------------------------+
                   \                       /
                    \ Higgs4L1file.root   / DoubleMuParked2012C_10000_Higgs.root
                     \                   /
                  +-------------------------+
                  |    produce final plot   |
                  +-------------------------+
                             |
                             | mass4l_combine_userlvl3.pdf
                             V
                            STOP -->

We shall use the [CWL](http://www.commonwl.org/v1.0/) workflow specification
to express the computational workflow:

- [workflow definition](workflow/workflow.cwl)

and its individual steps:

- [analyze data](workflow/analyze.cwl)
- [fit mass peak](workflow/fit.cwl)
- [final comparison](workflow/compare.cwl)



