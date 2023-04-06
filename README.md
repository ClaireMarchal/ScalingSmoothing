# ScalingSmoothing
Scripts to scale and smooth repli-seq data. Could probably be used with any chromatin profile data.

# Usage
Run this command for each or your log2 ratio bedGraph file:

`Rscript /path/to/scaling.R /path/to/Input_log2Ratio.bedGraph /path/to/Output_log2Ratio_scaled.bedGraph /path/to/Ouput_log2Ratio_scaled_smoothed.bedGraph`

with

- /path/to/Input_log2Ratio.bedGraph = path to the input log2ratio file

- /path/to/Output_log2Ratio_scaled.bedGraph = name of the output file containing the scaled (before smoothing) log2ratio to generate, including the path

- /path/to/Ouput_log2Ratio_scaled_smoothed.bedGraph = name of the output file containing the scaled and smoothed log2ratio to generate, including the path