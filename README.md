# CS3570-GrandChallenge-PCC
[Course Page](https://nmsl.cs.nthu.edu.tw/cs3570-schedule-2021/)

[TA session slides](https://nmsl.cs.nthu.edu.tw/wp-content/uploads/2021/03/Challenge2.pdf)

## Environments
Ubuntu 20.04

## Prerequisites
- Ananconda 3
- git
- gcc
- g++

```bash=
wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh
sh Anaconda3-2020.11-Linux-x86_64.sh
source .bashrc
sudo apt install git gcc g++ -y
```
Detailed instructions please refered to the slides.

## Installation
```bash=
git clone https://github.com/xtorker/CS3570-GrandChallenge-PCC.git
cd CS3570-GrandChallenge-PCC
conda env create -f cfgs/conda_env/pcc_arena.yml
conda activate pcc_arena
python setup.py
```
Download `mpeg-pcc-dmetric-master.tar.gz` from [eLearn](https://elearn.nthu.edu.tw/mod/resource/view.php?id=31207).

Download datasets and pretrained models from [Google Drive](https://drive.google.com/drive/folders/1rf088BC1oCXlLijOy39eT4DsnD_OcMsw?usp=sharing)

Put all the files you downloaded under `CS3570-GrandChallenge-PCC/`

```bash=
./setup_env_ds.sh
```

## Run Experiments
```bash=
python run_experiments.py
```

## Add Your Own PCC Algorithm
Check with the Template in the project folder.

Detailed instructions please refered to the slides.