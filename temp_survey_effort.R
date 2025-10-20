# see code used in Isaac et al 2014 at 
# https://github.com/BiologicalRecordsCentre/RangeChangeSims/blob/master/Sim_Wrapper.r


# parameters --------------------------------------------------------------

change_scenario <- c("fixed", "more_detectable", "less_intrasampling_effort", "nonfocal_declines")
sampling_type <- c("structured", "semi-structured")

n_grids <- 1000
n_year <- 10
n_sp <- 25
# n_runs <- number_of_runs
n_year_per_site <- 2 # threshold no. of years for including site


# # later
# ps = list(init = 0.6, final = 0.9) # from c(1/3, 2/3): higher starting value but less steep increase
# di = 0.2 # parameters defining the degree of bias and under-recording
# pF = list(Occ = 0.5, DetP = 0.5) # the probability of occurrence & detection for the focal species
# d = 0 # extinction rate of the focal species (over the full timeframe, not per annum)
# pSVS = 0.05 # the proportion of sites receiving a single visit
# vrs = list(sel=FALSE,num=TRUE) # correlation between richness and probability of being a) selected for a visited and b) number of visits
# mv = 10 #maximum number of visits to any one site in any one year
# st = T # should the number of visits vary stochastically from year to year? Say yes, since this is what i used before (inadvertently)
# combos = F
# ExtractOnly = F

# # code
# save_data_files <- FALSE # save data files - set to TRUE to save copies of the 'records' (adds very little time)
# save_data <- FALSE # should the data be saved to

# # ignore
# Sc <- 'BCDF' # which scenarios should be run. 
# Fr = 1:2# should the frescalo method be run - set to FALSE to bypass this
# MM = c(2,4)# should the Mixed model be run - set to FALSE to bypass this (about 50% of the total runtime excl Frescalo)
# Occ <- c('Simple', 'Full') # Specifies the occupancy models to run

# simulate settings -------------------------------------------------------

grids <- paste0("G", 1:n_grids)
grids_sampled <- if (sampling_type == "semi-structured") {
  sample(grids, size = n_grids, prob = p_grid_sampling)
} else {
  sample(grids, size = n_grids/10, prob = 0.95) # some replicates always absent
}

species <- LETTERS[1:n_sp]
