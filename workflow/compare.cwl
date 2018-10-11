cwlVersion: v1.0
class: CommandLineTool

baseCommand: /bin/zsh

requirements:
  DockerRequirement:
    dockerPull:
      clelange/cmssw:9_2_14
  InitialWorkDirRequirement:
    listing:
      - $(inputs.code)
      - $(inputs.data)

inputs:
  data:
    type: Directory
  code:
    type: Directory
  showComparison:
    type: File
    
stdout: compare.log

outputs:
  compare.log:
    type: stdout
  #plot_comparison.pdf:
   # type: File
    #outputBinding:
     # glob: "results/plot_comparison.pdf"

arguments:
  - prefix: -c
    valueFrom: |
      root -l 
      .L showComparison.C
      showComparison(lumi, value, stat, syst)
      .q
