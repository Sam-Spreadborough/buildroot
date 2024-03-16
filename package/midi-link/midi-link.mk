################################################################################
#
# MIDI Link
#
################################################################################

MIDI_LINK_VERSION = 1.0
MIDI_LINK_SITE_METHOD = git
MIDI_LINK_VERSION = master
MIDI_LINK_GIT_SUBMODULES = YES
MIDI_LINK_SITE = git@github.com:Sam-Spreadborough/MIDI-Link.git
MIDI_LINK_INSTALL_STAGING = YES
MIDI_LINK_INSTALL_TARGET = YES
MIDI_LINK_DEPENDENCIES = alsa-lib

define MIDI_LINK_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644 package/midi-link/midi-link.service \
		$(TARGET_DIR)/usr/lib/systemd/system/midi-link.service
endef

define MIDI_LINK_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/midi-link  $(TARGET_DIR)/usr/bin/midi-link
endef


$(eval $(cmake-package))
