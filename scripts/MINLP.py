########################################################################
#
#     This is an example call of MIDACO 6.0
#     -------------------------------------
#
#     MIDACO solves Multi-Objective Mixed-Integer Non-Linear Problems:
#
#
#      Minimize     F_1(X),... F_O(X)  where X(1,...N-NI)   is CONTINUOUS
#                                      and   X(N-NI+1,...N) is DISCRETE
#
#      subject to   G_j(X)  =  0   (j=1,...ME)      equality constraints
#                   G_j(X) >=  0   (j=ME+1,...M)  inequality constraints
#
#      and bounds   XL <= X <= XU
#
#
#     The problem statement of this example is given below. You can use 
#     this example as template to run your own problem. To do so: Replace 
#     the objective functions 'F' (and in case the constraints 'G') given 
#     here with your own problem and follow the below instruction steps.
#
########################################################################
######################   OPTIMIZATION PROBLEM   ########################
########################################################################

import pandas as pd
import numpy as np
from Scientific.Functions.Interpolation import InterpolatingFunction

def problem_function(x):

    f = [0.0]*1 # Initialize array for objectives F(X) 
    
    m	= -5.68037016015187000
    n = -0.00021506741098090
    o	= 0.00382495551355789
    p	= -0.00218074532991249
    q	= 0.00025802199136216
    r	= -0.09040774810243480
    s	= 27.90745106090330000
    t	= 0.00870040750277754
    u	= -0.15157445475061100
    v	= 23.32129102402100000

    # Objective functions F(X)
    f[0] = m*x[0]*x[0] + n*x[1]*x[1] + o*x[2]*x[2] + p*x[0]*x[1] + q*x[1]*x[2] + r*x[2]*x[0] + s*x[0] + t*x[1] + u*x[2] + v 
    
    # Dummy value
    g = [0.0]    
    
    return f,g

########################################################################
#########################   MAIN PROGRAM   #############################
########################################################################

key = b'Sakib_Mahmud_Khan_(Clemson_University)[ACADEMIC-SINGLE-USER]'

problem = {} # Initialize dictionary containing problem specifications
option  = {} # Initialize dictionary containing MIDACO options

problem['@'] = problem_function # Handle for problem function name

########################################################################
### Step 1: Problem definition     #####################################
########################################################################

# STEP 1.A: Problem dimensions
##############################
problem['o']  = 1  # Number of objectives 
problem['n']  = 3  # Number of variables (in total) 
problem['ni'] = 2  # Number of integer variables (0 <= ni <= n) 
problem['m']  = 0  # Number of constraints (in total) 
problem['me'] = 0  # Number of equality constraints (0 <= me <= m) 

# STEP 1.B: Lower and upper bounds 'xl' & 'xu'  
##############################################  
problem['xl'] = [ 1, 20, 20 ]
problem['xu'] = [ 3, 50, 50 ]

# STEP 1.C: Starting point 'x'  
##############################  
problem['x'] = problem['xl'] # Here for example: starting point = lower bounds
    
########################################################################
### Step 2: Choose stopping criteria and printing options    ###########
########################################################################
   
# STEP 2.A: Stopping criteria 
#############################
option['maxeval'] = 20000     # Maximum number of function evaluation (e.g. 1000000) 
option['maxtime'] = 60*60*24  # Maximum time limit in Seconds (e.g. 1 Day = 60*60*24) 

# STEP 2.B: Printing options  
############################ 
option['printeval'] = 1000  # Print-Frequency for current best solution (e.g. 1000) 
option['save2file'] = 1     # Save SCREEN and SOLUTION to TXT-files [0=NO/1=YES]

########################################################################
### Step 3: Choose MIDACO parameters (FOR ADVANCED USERS)    ###########
########################################################################

option['param1']  = 0.0  # ACCURACY  
option['param2']  = 0.0  # SEED  
option['param3']  = 0.0  # FSTOP  
option['param4']  = 0.0  # ALGOSTOP  
option['param5']  = 1000  # EVALSTOP  
option['param6']  = 0.0  # FOCUS  
option['param7']  = 0.0  # ANTS  
option['param8']  = 0.0  # KERNEL  
option['param9']  = 0.0  # ORACLE  
option['param10'] = 0.0  # PARETOMAX
option['param11'] = 0.0  # EPSILON  
option['param12'] = 0.0  # BALANCE
option['param13'] = 0.0  # CHARACTER

########################################################################
### Step 4: Choose Parallelization Factor   ############################
########################################################################

option['parallel'] = 0 # Serial: 0 or 1, Parallel: 2,3,4,5,6,7,8...

########################################################################
############################ Run MIDACO ################################
########################################################################

import midaco

if __name__ == '__main__': 

  solution = midaco.run( problem, option, key )

# print(solution['f'])
# print(solution['g'])
# print(solution['x'])

########################################################################
############################ END OF FILE ###############################
########################################################################
         