#!/bin/bash
az deployment group create \
--resource-group NT-LE-LenderLink-CtrlPlane-RG \
--template-file kv.bicep \
--parameters resgrp='NT-Le-Lk-CPlane' \


##--confirm-with-what-if \
