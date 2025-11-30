################################################################################
#
# ir_relay_daemon
#
################################################################################

IR_RELAY_DAEMON_VERSION = 2.0.0
IR_RELAY_DAEMON_SOURCE = v$(IR_RELAY_DAEMON_VERSION).tar.gz
IR_RELAY_DAEMON_SITE = https://github.com/arobinson434/IrRelayDaemon/archive/refs/tags
IR_RELAY_DAEMON_CONF_OPTS = -DCMAKE_INSTALL_PREFIX=/
IR_RELAY_DAEMON_DEPENDENCIES = boost protobuf libgpiod2

define IR_RELAY_DAEMON_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 $(IR_RELAY_DAEMON_PKGDIR)/S99IrRelayDaemon \
		$(TARGET_DIR)/etc/init.d/S99IrRelayDaemon
	$(INSTALL) -D -m 755 $(IR_RELAY_DAEMON_PKGDIR)/startIrRelayDaemon.sh \
		$(TARGET_DIR)/etc/IrRelayDaemon/startIrRelayDaemon.sh
endef

$(eval $(cmake-package))
