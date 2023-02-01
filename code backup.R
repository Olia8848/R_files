#Old Code

require('compiler')
enableJIT(3)

source("prediction_creation.R")

model2D = create_model2D(fia_db_with_Bins, res, dim1 = 'Bio1s_bin', dim2 = 'Bio3s_bin')

#prediction2d = crop(raster(paste0(data_path,'WORLDCLIM/bio_1.bil')),extent_limit)
#saveRDS(prediction2d, file='prediction2d_261.rds')
prediction2d = readRDS(file='prediction2d_261.rds')
values(prediction2d) = NA
names(prediction2d) = 'Predicted2D'

values(prediction2d) = extract_model2D(model2D, tmpppt_raster_bins[[1]],tmpppt_raster_bins[[3]])
plot(prediction2d, main='Potential Distribution of Eastern Hemlock')
map('state', add=T)
points(fia_db$LON, fia_db$LAT, cex=fia_db$PRESENCE_261)
source('niche_fcts.R')
compute_potential(prediction2d)


source('nd_models.R')
tst = generate_model_nD(fia_db_with_Bins, res=10, data_name='PRESENCE_261', 'Bio1s_bin', 'Bio3s_bin')
pred = extract_model_nD(tst, tmpppt_raster_bins[[1]], tmpppt_raster_bins[[3]])


tst_sparse = generate_model_nD_sparse(fia_db_with_Bins, res=10, data_name='PRESENCE_261', 'Bio1s_bin', 'Bio3s_bin')
pred_sparse = extract_model_nD_sparse(tst_sparse, tmpppt_raster_bins[[1]], tmpppt_raster_bins[[3]])

values(prediction2d) = pred















source("prediction_creation.R")
model3D = create_model3D(fia_db_with_Bins, res)

prediction3d = crop(raster(paste0(data_path,'WORLDCLIM/bio_1.bil')),extent_limit)
values(prediction3d) = NA
names(prediction3d) = 'Predicted3D'

values(prediction3d) = extract_model3D(model3D, tmpppt_raster_bins[[1]],tmpppt_raster_bins[[2]],tmpppt_raster_bins[[3]])
plot(prediction3d, main='Potential Distribution of Eastern Hemlock')
map('state', add=T)
points(fia_db$LON, fia_db$LAT, cex=fia_db$PRESENCE_261)

source('niche_fcts.R')
compute_potential(prediction3d)

source("variable_analysis.R")
possible_combinations_3d = combn(c(seq(1,length(tmpppt))), 3)
number_of_predictions_3d = NROW(possible_combinations_3d)

predictions_db = computed_predictions2d(possible_combinations_2d,number_of_predictions_2d,tmpppt_Bins,tmpppt_raster_bins)



