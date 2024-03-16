################################################################################
#
## Embedded App
#
#################################################################################

EMBEDDED_APP_VERSION = 1.0
EMBEDDED_APP_SITE_METHOD = git
EMBEDDED_APP_VERSION = master
EMBEDDED_APP_GIT_SUBMODULES = YES
EMBEDDED_APP_SITE = git@github.com:Sam-Spreadborough/EmbeddedApp.git
EMBEDDED_APP_INSTALL_STAGING = YES
EMBEDDED_APP_INSTALL_TARGET = YES
EMBEDDED_APP_DEPENDENCIES = alsa-lib freetype libcurl xlib_libX11 xlib_libXext xlib_libXrandr xlib_libXrender

define EMBEDDED_APP_INSTALL_INIT_SYSTEMD
        $(INSTALL) -D -m 644 $(@D)/scripts/embedded-app.service \
		$(TARGET_DIR)/usr/lib/systemd/system/embedded-app.service
endef

define EMBEDDED_APP_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/embedded-app  $(TARGET_DIR)/usr/bin/embedded-app
endef


$(eval $(cmake-package))
