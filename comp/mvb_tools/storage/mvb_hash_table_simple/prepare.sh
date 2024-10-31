#!/bin/sh

ROOT_PATH=../../../../..

#swbase=../../../swbase/
swbase=git+https://github.com/CESNET/ndk-sw.git#subdirectory=

PKG_PYNFB=${swbase}pynfb/
PKG_LIBNFBEXT_PYTHON=${swbase}ext/libnfb_ext_python/
PKG_COCOTBEXT=$ROOT_PATH/python/cocotbext/

# Python virtual environment
python -m venv venv-cocotb
source venv-cocotb/bin/activate

python -m pip install cython wheel setuptools
python -m pip install pylibfdt fdt
python -m pip install scapy
python -m pip install colorama
python -m pip install pyyaml
python -m pip wheel -w ./cocotbwheels $PKG_PYNFB
python -m pip install --find-links ./cocotbwheels nfb
python -m pip install --find-links ./cocotbwheels $PKG_LIBNFBEXT_PYTHON
python -m pip install $PKG_COCOTBEXT

echo ""
echo "Now activate environment with:"
echo "source venv-cocotb/bin/activate"

