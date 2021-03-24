#! /bin/bash
set -euo pipefail

# check mpeg-pcc-dmetric-master.tar.gz exists
if [ ! -f evaluator/mpeg-pcc-dmetric-master.tar.gz ]; then
    echo "[File not found] evaluator/mpeg-pcc-dmetric-master.tar.gz"
    echo "Please download it from eLearn (Check README again)"
    exit 0
fi

# check SNC_scale1024_test_sample100.tar.xz exists
if [ ! -f datasets/SNC_scale1024_test_sample100.tar.xz ]; then
    echo "[File not found] datasets/SNC_scale1024_test_sample100.tar.xz"
    echo "Please download it from Google Drive (Check README again)"
    exit 0
fi

# check SNC_normal_scale1024_test_sample100.tar.xz exists
if [ ! -f datasets/SNC_normal_scale1024_test_sample100.tar.xz ]; then
    echo "[File not found] datasets/SNC_normal_scale1024_test_sample100.tar.xz"
    echo "Please download it from Google Drive (Check README again)"
    exit 0
fi

# check SNCC_scale1024_test_sample100.tar.xz exists
if [ ! -f datasets/SNCC_scale1024_test_sample100.tar.xz ]; then
    echo "[File not found] datasets/SNCC_scale1024_test_sample100.tar.xz"
    echo "Please download it from Google Drive (Check README again)"
    exit 0
fi

# check SNCC_normal_scale1024_test_sample100.tar.xz exists
if [ ! -f datasets/SNCC_normal_scale1024_test_sample100.tar.xz ]; then
    echo "[File not found] datasets/SNCC_normal_scale1024_test_sample100.tar.xz"
    echo "Please download it from Google Drive (Check README again)"
    exit 0
fi

# check geocnn_v2_pretrained_models.tar.xz exists
if [ ! -f algorithms/geocnn_v2_pretrained_models.tar.xz ]; then
    echo "[File not found] algorithms/geocnn_v2_pretrained_models.tar.xz"
    echo "Please download it from Google Drive (Check README again)"
    exit 0
fi

# ========== In [root] ==========
conda env create -f cfgs/conda_env/GeoCNNv2.yml



cd datasets
# ========== In [root]/datasets/ ==========
wget https://365nthu-my.sharepoint.com/:u:/g/personal/108065520_office365_nthu_edu_tw/Eb-V8SKORXBGpoxZjLKsdLABJROIe3zjuTnq47Ob0iQFww?e=vJIw9M
tar Jxvf SNC_scale1024_test_sample100.tar.xz
rm SNC_scale1024_test_sample100.tar.xz

wget https://drive.google.com/uc?export=download&confirm=YzWC&id=1ltfXcra_EOq_090u3CA4RTdw6XG5c610
tar Jxvf SNC_normal_scale1024_test_sample100.tar.xz
rm SNC_normal_scale1024_test_sample100.tar.xz
cd ..



cd algorithms
# ========== In [root]/algs/ ==========

## Draco
git clone --depth 1 --branch 1.3.6 https://github.com/google/draco.git Draco
cd Draco
mkdir build && cd build && cmake .. && make
cd ../..

## GeoCNNv2
git clone https://github.com/mauriceqch/pcc_geo_cnn_v2.git GeoCNNv2
mv geocnn_v2_pretrained_models.tar.xz GeoCNNv2/
cd GeoCNNv2
tar Jxvf geocnn_v2_pretrained_models.tar.xz
rm geocnn_v2_pretrained_models.tar.xz
cd ../..



cd evaluator
# ========== In [root]/evaluator/ ==========

# MPEG pcc dmetric
# Download mpeg-pcc-dmetric-master.tar.gz v0.13.5 
# from http://mpegx.int-evry.fr/software/MPEG/PCC/mpeg-pcc-dmetric
tar zxvf mpeg-pcc-dmetric-master.tar.gz
rm mpeg-pcc-dmetric-master.tar.gz
patch -sp0 < mpeg-pcc-dmetric.patch
cd mpeg-pcc-dmetric-master
./build.sh
cd ..

# libgdiam
wget https://sarielhp.org/research/papers/00/diameter/libgdiam-1.0.3.tar.gz
tar zxvf libgdiam-1.0.3.tar.gz
rm libgdiam-1.0.3.tar.gz
patch -sp0 < libgdiam-1.0.3.patch
cd libgdiam-1.0.3
mkdir build && cd build && cmake .. && make
cd ../../..

echo "Done!"