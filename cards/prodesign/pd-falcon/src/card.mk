# Makefile.card: Makefile include for PD-FALCON card
# Copyright (C) 2022 CESNET z. s. p. o.
# Author(s): Jakub Cabal <cabal@cesnet.cz>
#            Vladislav Valek <valekv@cesnet.cz>
#
# SPDX-License-Identifier: BSD-3-Clause

# Optional parameters (can be changed in user Makefile)
###############################################################################

# Name for output files (rootname)
# This value is set as default in SYNTH_FLAGS(OUTPUT)
OUTPUT_NAME ?= pd-falcon

USER_ENV ?=

# Private parameters (do not change these values in user Makefile)
###############################################################################

# Get directory of this Makefile.inc
CARD_BASE_LOCAL := $(dir $(lastword $(MAKEFILE_LIST)))
CARD_BASE ?= $(CARD_BASE_LOCAL)/..
CORE_BASE ?= $(COMBO_BASE)/core

# Load correct paths to build system
include $(CORE_BASE)/ndk_paths.mk

NETCOPE_ENV = \
    OFM_PATH=$(OFM_PATH)\
    COMBO_BASE=$(COMBO_BASE)\
    FIRMWARE_BASE=$(FIRMWARE_BASE)\
    CARD_BASE=$(CARD_BASE)\
    CORE_BASE=$(CORE_BASE)\
    APP_CONF=$(APP_CONF)\
    OUTPUT_NAME=$(OUTPUT_NAME)\
    ETH_PORT_SPEED=$(ETH_PORT_SPEED)\
    ETH_PORT_CHAN=$(ETH_PORT_CHAN)\
    DMA_TYPE=$(DMA_TYPE)\
    $(USER_ENV)

include $(CORE_BASE)/core.mk
include $(OFM_PATH)/build/Makefile.Quartus.inc
