Combination_generation=function(predictions,tmpppt,trials){#insert prediction analysis from lower order analysis Ex:"predictions_db_1d 
  combinations_to_guess=matrix(NA,ncol = ncol(predictions),nrow = length(tmpppt)*trials)
  basevalues = NULL
  for (k in 1:trials-1) {
    for (i in 1:length(tmpppt)) {
      for (j in 1:ncol(predictions)-1) {
        basevalues[j]=predictions[k+1,j+1]
      }
      if (!(i %in% basevalues)) {
        combinations_to_guess[(i+(19*k)),]=c(basevalues,i)
      }
    }
  }
  combinations_to_guess = combinations_to_guess[complete.cases(combinations_to_guess),]
  return(combinations_to_guess)
}
