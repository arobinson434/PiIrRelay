# Pi IR Relay
This repo houses buildroot configs and package definitions for deploying my
[IrRelay](https://github.com/arobinson434/IrRelayDaemon). Head there for
information about that daemon and it's purpose.

Long story short, this project deploys the
[IrRelay](https://github.com/arobinson434/IrRelayDaemon) to a Raspberry Pi where
it will be controlled by my [PiMote](https://github.com/arobinson434/PiMote)
phone app.

## Customization
To use this project, you will need to do some slight customization before you
build an image for your Pi. Firstly, you will need to tell the Pi how to join
your WiFi. Secondly, you can, optionally configure the details of your IR Relay.

### Setup WiFi
To get the pi to automatically join your WiFi network, create a file in
`board/rootfs_overlay/var/lib/iwd/` named `<SSID>.psk`, where you replace
`<SSID>` with the SSID of the network to which you want to connect.

The contents of that `.psk` should look like this:
```
[Security]
PreSharedKey=<hashed-wifi-password>
```
I used `wpa_passphrase` to generate the hash.

Note: the `board/rootfs_overlay/var/lib/iwd` directory is in the `.gitignore`
file to avoid accidentally committing sensitive data.

### Set Relay Metadata
You will probably want to set the `RELAY_NAME` and `RELAY_DESCRIPTION` for your
relay instance. To do that, simply modify those variables in
`package/ir_relay_daemon/startIrRelayDaemon.sh`

By default, these will be set to "Living Room" and "Relay in the Living Room"
respectively.

## Building
To configure buildroot to use this repo, simply run the following in the root of
your buildroot tree:
```
make BR2_EXTERNAL=<path_to_this_project> rpiz2w_piirrelay_defconfig
```

After that, you should be good to go! Just run 'make' to build your image.

