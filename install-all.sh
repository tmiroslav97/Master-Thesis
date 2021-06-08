#!/bin/bash

if [ "$1" == "-r" ]; then
	remflag=$1
else
	name=$1
	remflag=$2
fi

if test -z "$name"
then
	name="master-env"
fi

ENVS=$(conda env list | awk '{print $1 }')
if [[ $ENVS = *"$name"* ]]; then
	if [ "$remflag" == "-r" ]; then
		conda deactivate &&
		conda env remove --name "$name"
		printf "Environment '$name' removed\n\n"
		printf "Installing '$name' environment\n\n"
	else
		printf "Updating '$name' environment\n\n"
	fi
else
	printf "Environment '$name' not exists\n\n"
	printf "Installing '$name' environment\n\n"
fi

conda deactivate &&
conda create -n master-env python=3.7 -y &&
conda activate master-env &&
conda install -y -c conda-forge jupyterlab=3.0.16 &&
conda install -y -c anaconda numpy=1.19.2 &&
conda install -y -c anaconda pandas=1.2.4 &&
conda install -y -c anaconda openpyxl=3.0.7 &&
conda install -y -c conda-forge matplotlib=3.4.2 &&
conda install -y -c anaconda seaborn=0.11.1 &&
conda install -y -c anaconda scikit-learn=0.24.1 &&
conda install -y -c conda-forge imbalanced-learn=0.8.0

printf "\nEvnironment '$name' activated\n"
