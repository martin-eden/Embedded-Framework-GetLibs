#!/bin/bash

# Install dependencies
arduino-cli \
  lib install \
    --git-url \
      https://github.com/martin-eden/Embedded-me_BaseTypes \
      https://github.com/martin-eden/Embedded-me_Bits \
      https://github.com/martin-eden/Embedded-me_Console \
      https://github.com/martin-eden/Embedded-me_ConvertUnits_Angle \
      https://github.com/martin-eden/Embedded-me_Heap \
      https://github.com/martin-eden/Embedded-me_InstallStandardStreams \
      https://github.com/martin-eden/Embedded-me_List \
      https://github.com/martin-eden/Embedded-me_ManagedMemory \
      https://github.com/martin-eden/Embedded-me_MemorySegment \
      https://github.com/martin-eden/Embedded-me_Menu \
      https://github.com/martin-eden/Embedded-me_ParseInteger \
      https://github.com/martin-eden/Embedded-me_ReadInteger \
      https://github.com/martin-eden/Embedded-me_RgbStripe \
      https://github.com/martin-eden/Embedded-me_RgbStripeConsole \
      https://github.com/martin-eden/Embedded-me_SerialTokenizer \
      https://github.com/martin-eden/Embedded-me_StoredCall \
      https://github.com/martin-eden/Embedded-me_String \
      https://github.com/martin-eden/Embedded-me_Uart \
      https://github.com/martin-eden/Embedded-me_UartSpeeds \
      https://github.com/martin-eden/Embedded-me_UnoAddresses \
      https://github.com/martin-eden/Embedded-me_Ws2812b
