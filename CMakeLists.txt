cmake_minimum_required(VERSION 3.21)

# initialize the SDK based on PICO_SDK_PATH
# note: this must happen before project()
include(/usr/local/pico-sdk/pico_sdk_init.cmake)
#include(pico_sdk_import.cmake)

project(busscan)

# initialize the Pico SDK
pico_sdk_init()


if (TARGET tinyusb_device)
    add_executable(busscan
            busscan.c
            )

    # pull in common dependencies
    target_link_libraries(busscan pico_stdlib hardware_i2c)

    # enable usb output, disable uart output
    pico_enable_stdio_usb(busscan 1)
    pico_enable_stdio_uart(busscan 0)

    # create map/bin/hex/uf2 file etc.
    pico_add_extra_outputs(busscan)

    # add url via pico_set_program_url
    ##example_auto_set_url(busscan)
elseif(PICO_ON_DEVICE)
    message(WARNING "not building busscan because TinyUSB submodule is not initialized in the SDK")
endif()






