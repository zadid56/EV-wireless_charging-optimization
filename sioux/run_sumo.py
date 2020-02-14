#!/usr/bin/env python

import sys
import os

infile=sys.argv[1]
os.system("/home/mdzadik/software/sumo/0.30.0/bin/sumo "+infile+"/sioux.sumocfg")