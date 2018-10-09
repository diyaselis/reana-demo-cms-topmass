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

stdout: analyze.log

outputs:
  analyze.log:
    type: stdout
 # plotter.root:
   # type: File
    # outputBinding:
     # glob: "results/plotter.root"

arguments:
  - prefix: -c
    valueFrom: |
      cp -r ../../code/analyzeNplot .; \
      scram b; \
      cd ../../code/analyzeNplot; \
      mkdir -p ../../../results; \
      python runBJetEnergyPeak.py -i /store/user/cmsdas/2018/long_exercises/TopMass -j data/samples_Run2016_25ns.json -o results -n 8
      python plotter.py -i results -j data/samples_Run2016_25ns.json  -l 35867.
      python getNumberOfEvents.py -i results -o table -j data/samples_Run2016_25ns.json
