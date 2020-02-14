from __future__ import print_function
from ortools.constraint_solver import pywrapcp
from ortools.constraint_solver import solver_parameters_pb2

#import pandas as pd
#import numpy as np
#from Scientific.Functions.Interpolation import InterpolatingFunction

#def utility(gt1,gx1,gy1,gt2,gx2,gy2,gt3,gx3,gy3):
#  df_EC = pd.read_csv("EC.csv")
#  gt = np.arange(1,4,1)
#  gx = np.arange(20,55,15)
#  gy = np.arange(20,55,15)
#  temp = df_EC.iloc[0:27]
#  temp2 = temp.as_matrix()
#  data1 = temp2.reshape(len(gt),len(gx),len(gy))
#  temp = df_EC.iloc[81:108]
#  temp2 = temp.as_matrix()
#  data2 = temp2.reshape(len(gt),len(gx),len(gy))
#  temp = df_EC.iloc[162:189]
#  temp2 = temp.as_matrix()
#  data3 = temp2.reshape(len(gt),len(gx),len(gy))
#  axes = (gt,gx,gy)
#  f1 = InterpolatingFunction(axes, data1)
#  f2 = InterpolatingFunction(axes, data2)
#  f3 = InterpolatingFunction(axes, data3)
#  u1 = f1(gt1,gx1,gy1)
#  u2 = f2(gt2,gx2,gy2)
#  u3 = f3(gt3,gx3,gy3)
#  u = u1+u2+u3
#  return u,


def main():
  # Instantiate a CP solver.
  parameters = pywrapcp.Solver.DefaultSolverParameters()
  solver = pywrapcp.Solver("simple_CP", parameters)

  # x and y are integer non-negative variables.
  gt1 = solver.IntVar(10, 30, 'gt1')
  gx1 = solver.IntVar(20, 50, 'gx1')
  gy1 = solver.IntVar(20, 50, 'gy1')
  gt2 = solver.IntVar(10, 30, 'gt2')
  gx2 = solver.IntVar(20, 50, 'gx2')
  gy2 = solver.IntVar(20, 50, 'gy2')
  gt3 = solver.IntVar(10, 30, 'gt3')
  gx3 = solver.IntVar(20, 50, 'gx3')
  gy3 = solver.IntVar(20, 50, 'gy3')  
  obj_expr = solver.IntVar(-1000, 1000, "obj_expr")
  
  solver.Add(obj_expr == utility(gt1,gx1,gy1,gt2,gx2,gy2,gt3,gx3,gy3))
  objective = solver.Minimize(obj_expr, 1)
  decision_builder = solver.Phase([gt1, gx1, gy1, gt2, gx2, gy2, gt3, gx3, gy3],
                                  solver.CHOOSE_FIRST_UNBOUND,
                                  solver.ASSIGN_MIN_VALUE)
  # Create a solution collector.
  collector = solver.LastSolutionCollector()
  # Add the decision variables.
  collector.Add(gt1)
  collector.Add(gx1)
  collector.Add(gy1)
  collector.Add(gt2)
  collector.Add(gx2)
  collector.Add(gy2)
  collector.Add(gt3)
  collector.Add(gx3)
  collector.Add(gy3)
  # Add the objective.
  collector.AddObjective(obj_expr)
  solver.Solve(decision_builder, [objective, collector])
  if collector.SolutionCount() > 0:
    best_solution = collector.SolutionCount() - 1
    print("Objective value:", collector.ObjectiveValue(best_solution))
    print()
    print('gt1= ', collector.Value(best_solution, gt1))
    print('gx1= ', collector.Value(best_solution, gx1))

if __name__ == '__main__':
  main()