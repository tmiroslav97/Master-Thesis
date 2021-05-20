#!/bin/bash
conda create -n master-env python=3.7 -y &&
conda activate master-env &&
conda install -y -c anaconda numpy=1.19.2 &&
conda install -y -c anaconda pandas=1.2.4
