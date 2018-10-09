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
  #plotter:
    #type: File
    
stdout: fit.log

outputs:
  fit.log:
    type: stdout
  #mass4l_combine_userlvl3.pdf:
   # type: File
    #outputBinding:
     # glob: "outputs/mass4l_combine_userlvl3.pdf"

arguments:
  - prefix: -c
    valueFrom: |
      cp -r ../../code/fitNcalibrate .; \
      cd ../../code/fitNcalibrate; \
      mkdir -p ../../../results; \
      cp $(inputs.plotter.path) ../../../results; \
      python fitPeak.py -i "results" -j "../analyzeNplot/data/samples_Run2016_25ns.json" -l 35867.
      python fitPeak.py -i "results" -l 35867. -d

