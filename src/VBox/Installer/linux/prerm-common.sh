# Oracle VM VirtualBox
# VirtualBox Linux pre-uninstaller common portions
#

# Copyright (C) 2015 Oracle Corporation
#
# This file is part of VirtualBox Open Source Edition (OSE), as
# available from http://www.virtualbox.org. This file is free software;
# you can redistribute it and/or modify it under the terms of the GNU
# General Public License (GPL) as published by the Free Software
# Foundation, in version 2 as it comes in the "COPYING" file of the
# VirtualBox OSE distribution. VirtualBox OSE is distributed in the
# hope that it will be useful, but WITHOUT ANY WARRANTY of any kind.

# Put bits of the pre-uninstallation here which should work the same for all of
# the Linux installers.  We do not use special helpers (e.g. dh_* on Debian),
# but that should not matter, as we know what those helpers actually do, and we
# have to work on those systems anyway when installed using the all
# distributions installer.
#
# We assume that all required files are in the same folder as this script
# (e.g. /opt/VirtualBox, /usr/lib/VirtualBox, the build output directory).
#
# Script exit status: 0 on success, 1 if VirtualBox is running and can not be
# stopped (installers may show an error themselves or just pass on standard
# error).

# This is GNU-specific, sorry Solaris.
MY_PATH="$(dirname $(readlink -f -- "${0}"))/"
cd "${MY_PATH}"
. "./routines.sh"

# Stop the ballon control service
stop_init_script vboxballoonctrl-service 2>/dev/null
# Stop the autostart service
stop_init_script vboxautostart-service 2>/dev/null
# Stop the web service
stop_init_script vboxweb-service 2>/dev/null
# Do this check here after we terminated the web service
check_running
# Terminate VBoxNetDHCP if running
terminate_proc VBoxNetDHCP
# Terminate VBoxNetNAT if running
terminate_proc VBoxNetNAT
delrunlevel vboxballoonctrl-service
remove_init_script vboxballoonctrl-service
delrunlevel vboxautostart-service
remove_init_script vboxautostart-service
delrunlevel vboxweb-service
remove_init_script vboxweb-service
# Stop kernel module and uninstall runlevel script
stop_init_script vboxdrv
delrunlevel vboxdrv
remove_init_script vboxdrv
# Stop host networking and uninstall runlevel script (obsolete)
stop_init_script vboxnet 2>/dev/null
delrunlevel vboxnet 2>/dev/null
remove_init_script vboxnet 2>/dev/null
exit 0