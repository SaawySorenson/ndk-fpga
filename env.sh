#!/bin/sh
if [ -z "${NDK_FPGA_PATH}" ]; then
	NDK_FPGA_PATH=$(dirname "${BASH_SOURCE[0]}")
fi

source $NDK_FPGA_PATH/build/common.sh


# REALPATHs are necessary for local Python packages based on PDM
NDK_FPGA_REALPATH=$(realpath $NDK_FPGA_PATH)

# ####################################################################
# Default package paths

# OFM extension for cocotb
export NDK_FPGA_COCOTBEXT_OFM_URL="file://${NDK_FPGA_REALPATH}/python/cocotbext/"

# NDK software Python packages are dependencies of cocotbext-ofm[nfb]
export NDK_SW_PYTHON_URL="git+https://github.com/CESNET/ndk-sw.git#subdirectory="
# NDK software alternative path for local ndk-sw repository
#NDK_SW_REALPATH=$(realpath $NDK_FPGA_PATH/../swbase)
#NDK_SW_PYTHON_URL="file:///$(realpath $NDK_SW_PATH)/"
