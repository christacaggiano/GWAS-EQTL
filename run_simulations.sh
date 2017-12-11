#!/usr/bin/env bash
# bash script to simulate genotypes and eqtls and test 
# colocalization software 
# author <christa.caggiano@ucsf.edu> 



# run instructions: 
# ./run_simulation.sh RUN_DIRECTORY_PATH eCAVIARPATH HAPGENPATH RSCRIPTPATH

RUN_PATH=$1
eCAVIAR_path=$2
hapgen_path=$3
r_path=$4
num_simulations=$5

# iterates for number of times given
for (( i=1; i<=$num_simulations; i++))
	do
		# makes a folder for this particular simulation and changes so output will be contained 
		# in that directory 
		mkdir -p 'simulation'$i 
		cd 'simulation'$i 

		# runs hapgen 
		$hapgen_path/hapgen2 -m $hapgen_path/genetic_map_chr1_combined_b36.txt -l $hapgen_path/CEU.0908.chr1.legend -h $hapgen_path/CEU.0908.chr1.hap -o hapgen_out_chr1.txt -dl 168262426 1 1.5 2.25 -int 168162426 168362426 -n 100 100
		
		# runs marc's R script 
		R CMD BATCH $r_path/ecaviar_data_sim.R 
		
		# runs ecaviar 
		$eCAVIAR_path/caviar/CAVIAR-C++/eCAVIAR -z gwasFscore.txt -z eqtlFscore.txt -l LDgwas.txt -l LDgwas.txt -o ecaviar$i -c 1 
		
		# changes back to run directory to start next simulation 
		cd $RUN_PATH 
	
	done

