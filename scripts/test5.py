import numpy as np
import pandas as pd
from matplotlib.pyplot import figure, show
from kapteyn import kmpfit

def model(p, v, x, w):       
   a,b,c,d,e,f,g,h,i,j,k = p      #coefficients to the polynomials      
   return  a*v**2 + b*x**2 + c*w**2 + d*v*x + e*v*w + f*x*w + g*v + h*x + i*y + k  

def residuals(p, data):        # Function needed by fit routine
   v, x, w, z = data            # The values for v, x, w and the measured hypersurface z
   a,b,c,d,e,f,g,h,i,j,k = p   #coefficients to the polynomials  
   return (z-model(p,v,x,w))   # Returns an array of residuals. 
                               #This should (z-model(p,v,x,w))/err if 
                               # there are error bars on the measured z values


#initial guess at parameters. Avoid using 0.0 as initial guess
par0 = [1.0, 1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0] 

#create a fitting object. data should be in the form 
#that the functions above are looking for, i.e. a Nx4 
#list of lists/tuples like (v,x,w,z)
data = pd.read_csv("data.csv")
print(data) 
fitobj = kmpfit.Fitter(residuals=residuals, data=data)

# call the fitter 
fitobj.fit(params0=par0)