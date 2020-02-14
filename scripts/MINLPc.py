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
def utility(x):
  df_EC = pd.read_csv("EC.csv")
  gt = np.arange(1,4,1)
  gx = np.arange(20,55,15)
  gy = np.arange(20,55,15)
  temp = df_EC.iloc[0:27]
  temp2 = temp.as_matrix()
  data1 = temp2.reshape(len(gt),len(gx),len(gy))
  temp = df_EC.iloc[81:108]
  temp2 = temp.as_matrix()
  data2 = temp2.reshape(len(gt),len(gx),len(gy))
  temp = df_EC.iloc[162:189]
  temp2 = temp.as_matrix()
  data3 = temp2.reshape(len(gt),len(gx),len(gy))
  axes = (gt,gx,gy)
  f1 = InterpolatingFunction(axes, data1)
  f2 = InterpolatingFunction(axes, data2)
  f3 = InterpolatingFunction(axes, data3)
  u1 = f1(x[0],x[3],x[6])
  u2 = f2(x[1],x[4],x[7])
  u3 = f3(x[2],x[5],x[8])
  u = u1+u2+u3
  return -u,
  
def DL(x):
  df_DL = pd.read_csv("DL.csv")
  gt = np.arange(1,4,1)
  gx = np.arange(20,55,15)
  gy = np.arange(20,55,15)
  temp = df_DL.iloc[0:27]
  temp2 = temp.as_matrix()
  data1 = temp2.reshape(len(gt),len(gx),len(gy))
  temp = df_DL.iloc[27:54]
  temp2 = temp.as_matrix()
  data2 = temp2.reshape(len(gt),len(gx),len(gy))
  temp = df_DL.iloc[5:81]
  temp2 = temp.as_matrix()
  data3 = temp2.reshape(len(gt),len(gx),len(gy))
  axes = (gt,gx,gy)
  f1 = InterpolatingFunction(axes, data1)
  f2 = InterpolatingFunction(axes, data2)
  f3 = InterpolatingFunction(axes, data3)
  d1 = f1(x[0],x[3],x[6])
  d2 = f2(x[1],x[4],x[7])
  d3 = f3(x[2],x[5],x[8])
  d = d1+d2+d3
  return d,

def problem_function(x):

    f = [0.0]*2 # Initialize array for objectives F(X)
    g = [0.0]*0 # Initialize array for constraints G(X)

    # Objective functions F(X)
    f[0] = utility(x)
    f[1] = DL(x) 
    
    #  Equality constraints G(X) = 0 MUST COME FIRST in g[0:me-1]
    # g[0] = x[0] - 1.0
    # Inequality constraints G(X) >= 0 MUST COME SECOND in g[me:m-1] 
    
    return f,g

########################################################################
#########################   MAIN PROGRAM   #############################
########################################################################

key = b'MIDACO_LIMITED_VERSION___[CREATIVE_COMMONS_BY-NC-ND_LICENSE]'

problem = {} # Initialize dictionary containing problem specifications
option  = {} # Initialize dictionary containing MIDACO options

problem['@'] = problem_function # Handle for problem function name

########################################################################
### Step 1: Problem definition     #####################################
########################################################################

# STEP 1.A: Problem dimensions
##############################
problem['o']  = 1  # Number of objectives 
problem['n']  = 4  # Number of variables (in total) 
problem['ni'] = 2  # Number of integer variables (0 <= ni <= n) 
problem['m']  = 3  # Number of constraints (in total) 
problem['me'] = 1  # Number of equality constraints (0 <= me <= m) 

# STEP 1.B: Lower and upper bounds 'xl' & 'xu'  
##############################################  
problem['xl'] = [ 1, 1, 1, 1 ]
problem['xu'] = [ 4, 4, 4, 4 ]

# STEP 1.C: Starting point 'x'  
##############################  
problem['x'] = problem['xl'] # Here for example: starting point = lower bounds
    
########################################################################
### Step 2: Choose stopping criteria and printing options    ###########
########################################################################
   
# STEP 2.A: Stopping criteria 
#############################
option['maxeval'] = 10000     # Maximum number of function evaluation (e.g. 1000000) 
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
option['param5']  = 0.0  # EVALSTOP  
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
         