import pandas as pd
import numpy as np
from Scientific.Functions.Interpolation import InterpolatingFunction

df_EC = pd.read_csv("EC.csv")

df_DL = pd.read_csv("DL.csv")

gt = np.arange(1,4,1)
g1 = np.arange(20,55,15)
g2 = np.arange(20,55,15)
WCU = np.arange(2,7,2)
temp = df_EC.iloc[0:27]
temp2 = temp.as_matrix()
data = temp2.reshape(len(gt),len(g1),len(g2))

axes = (gt,g1,g2)
print(axes)
print(data)
f = InterpolatingFunction(axes, data)

print(f(2.5,25.5,40.5))