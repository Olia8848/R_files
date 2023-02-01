#vars_no_interact obtained from vars matrix making it 'looking convex'
#a1, a2 -  matrices for loop working

vars_no_interact = vars

a1= matrix(7, 10, 10)
a2 = matrix(77, 10, 10)


while (identical(a1, a2) == FALSE) 
{  
  a1 = vars_no_interact
  print(a1)
  
  for (i in 1:9)
  {
    for (j in 1:9)  
    {
      if (vars_no_interact[i,j] ==   0 & vars_no_interact[i,j+1] ==   1 & 
          vars_no_interact[i+1,j] == 1 & vars_no_interact[i+1,j+1] == 1) 
        
      {vars_no_interact[i,j] = 1} 
      
      
      if  (vars_no_interact[i,j] ==   1 & vars_no_interact[i,j+1] ==   0 & 
           vars_no_interact[i+1,j] == 1 & vars_no_interact[i+1,j+1] == 1) 
        
      {vars_no_interact[i,j+1] = 1}
      
      if (vars_no_interact[i,j] ==   1 & vars_no_interact[i,j+1]   == 1 & 
          vars_no_interact[i+1,j] == 0 & vars_no_interact[i+1,j+1] == 1) 
        
      {vars_no_interact[i+1,j] = 1}
      
      if (vars_no_interact[i,j] ==   1   & vars_no_interact[i,j+1]   == 1 & 
          vars_no_interact[i+1,j] == 1 & vars_no_interact[i+1,j+1] ==   0) 
        
      {vars_no_interact[i+1,j+1] = 1}
    }
  }
  a2 = vars_no_interact
  print(a2)
}  

print(vars_no_interact)

