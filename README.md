# Pi IR Relay
WiP


## What's In This Project
Todo


## Building
To configure buildroot to use this repo, simply run the following in the root of
your buildroot tree:
```
make BR2_EXTERNAL=<path_to_this_project> rpiz2w_piirrelay_defconfig
```

After that, you should be good to go!


## Additional Notes
### Hardware
Todo

### WiFi Info
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

