# Copyright (C) 2025 - EuroMov - Universite de Montpellier - Gaël LE PERF

# Short description:
# Function to compute FuncUse

# Calling sequence:
# FuncUse(data, SampleFrequency, range, amplitude)

# Parameters:
# data : forearm orientation data relative to the vertical,
#        computed from accelerometer signals:
#        alpha(t) = arccos(ay(t) / svm(t))
# SampleFrequency : signal sampling frequency (Hz)
# range : orientation range relative to the horizontal within which
#         forearm movement is considered functional
# amplitude : amplitude threshold above which the movement is
#             considered functional

#Authors
# Gael Le Perf - Univ Montpellier - France
# Version 0.0.0 -- G. Le Perf --  2025

FuncUse <- function(data, epoch = 2, SampleFrequency = 50, range = 50, amplitude = 15){
  # Number of data points to analyze per epoch
  lengthToAnalyse = epoch * SampleFrequency
  # Initialize a variable to store the results for each window
  results <- 0
  # Loop over data windows
  for (i in seq(1, length(data), by = lengthToAnalyse)) {
    # Select the data window (slice of lengthToAnalyse)
    window_data <- data[i:min(i + lengthToAnalyse - 1, length(data))]
    # Indices of values within the orientation range
    index_range <- which(window_data >= 90 - range & window_data <= 90 + range)
    # If no data fall within the range, FuncUse = 0
    if (length(index_range) == 0)
    {results = results + 0}
    # If data are within the range and the amplitude is sufficient,
    # FuncUse = 1; otherwise, FuncUse = 0
    else if (max(window_data[index_range]) - min(window_data[index_range]) >= amplitude)
    {results = results + 1}
    else 
    {results = results + 0}
  }
  return(results)
}