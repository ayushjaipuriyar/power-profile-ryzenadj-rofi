#!/bin/bash

ryzenadj --stapm-limit=5000 --fast-limit=5000 --slow-limit=5000 --apu-slow-limit=5000
modprobe k10temp force=1
