 REANA example - CMS Top quark mass measurement from b-jet energy spectrum
==========================================================================

About
=====

This repository provides a simplified particle physics analysis example for the
`REANA <http://reanahub.io/>`_ reusable research data analysis plaftorm. The objective 
is to extract the top-quark mass by measuring the peak position of the energy of b-tagged 
jets in the laboratory frame.

Analysis structure
==================

Making a research data analysis reproducible basically means to provide
"runnable recipes" addressing (1) where is the input data, (2) what software was
used to analyse the data, (3) which computing environments were used to run the
software and (4) which computational workflow steps were taken to run the
analysis. This will permit to instantiate the analysis on the computational
cloud and run the analysis to obtain (5) output results.


1. Input data
-------------

The analysis takes the following inputs:

- the list of CMS runs from 2015 and 2016 included in the ``inputs`` directory:

  - ``samples_Run2015_25ns.json``
  - ``samples_Run2015_25ns_m169p5.json``
  - ``samples_Run2015_25ns_m175p5.json``
  - ``samples_Run2016_25ns.json``
  - ``samples_Run2016_25ns_m169p5.json``
  - ``samples_Run2016_25ns_m175p5.json``
  - ``samples_Run2016_m169p5.json``
  - ``samples_Run2016_m175p5.json``

