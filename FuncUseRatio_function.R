# Copyright (C) 2025 - EuroMov - Universite de Montpellier - Gaël LE PERF
# Short description:
# Function to compute the normalized FuncUseRatio within the range (-1, 1)
#
# Calling sequence:
# FuncUseRatio(Paretic_FuncUse, Non_Paretic_FuncUse)
#
# Parameters:
# Paretic_FuncUse : FuncUse of the paretic arm (scalar)
# Non_Paretic_FuncUse : FuncUse of the non-paretic arm (scalar)
#
# Authors:
# Gael Le Perf – Univ Montpellier – France
#
# Version:
# 0.0.0 -- G. Le Perf -- 2025


FuncUseRatio <- function(Paretic_FuncUse, Non_Paretic_FuncUse){
  result <- (Paretic_FuncUse - Non_Paretic_FuncUse)/(Paretic_FuncUse + Non_Paretic_FuncUse)
  return(result)
}