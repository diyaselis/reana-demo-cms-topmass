#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.code)
      - $(inputs.data)

inputs:
  data:
    type: Directory
  code:
    type: Directory

outputs:
  final_plot.pdf:
    type: File
    outputSource:
      results/final_plot.pdf

steps:
  analyze:
    run: analyze.cwl
    in:
      code: code
      data: data
    out: [plotter.root, analyze.log]
  fit:
    run: fit.cwl
    in:
      code: code
      data: data
    #out: [plotter.root, fit.log]
  compare:
    run: compare.cwl
    in:
      code: code
      data: data
      #DoubleMuParked2012C_10000_Higgs: step1data/DoubleMuParked2012C_10000_Higgs.root
      #Higgs4L1file: step1mc/Higgs4L1file.root
    out: [final_plot.pdf, compare.log]
