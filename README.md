# agi-dev-releases

This repository is used as a placeholder for [Android GPU Inspector](https://gpuinspector.dev) dev-releases.

The [latest **stable** release of AGI is accessible here](https://github.com/google/agi/releases/latest).

Dev-releases are **unstable** preview releases for developers, they are NOT
stable releases. The [release.md](releases.md) file lists dev-releases.

The [latest **unstable** dev-release is available
here](https://github.com/google/agi-dev-releases/releases/latest).

## Temporary: work around notarization issues on macOS releases

We are currently dealing with issues related to macOS notarization. As a
temporary work around, we stop embedding a JRE in our macOS releases. We
recommend to install Azul Zulu community JRE 11, which seems to work fine with
AGI on macOS.

> :warning: This JRE is offered by a third-party, please read [Azul Zulu
> community terms of
> use](https://www.azul.com/products/zulu-and-zulu-enterprise/zulu-terms-of-use/)
> before using it.

You can obtain the Azul Zulu JRE 11 and install it in AGI folder with the
following commands, also provided as the `temp-macos-install-zulu-jre.sh` helper
script:

```sh
# Path to AGI install
agipath="/Applications/AGI.app/Contents/MacOS"

# Sanity check
if [ -d ${agipath}/jre ] ; then echo "Error: please remove the ${agipath}/jre directory before running this script" ; exit 1 ; fi

# Download and install Azul Zulu JRE 11
wget https://cdn.azul.com/zulu/bin/zulu11.39.15-ca-jre11.0.7-macosx_x64.zip
echo "d5f40f9a221816e3f4c3219ac658d184d8cb4f99c7a1fb19f4ffc45d88bafd73  zulu11.39.15-ca-jre11.0.7-macosx_x64.zip" | sha256sum --check
unzip zulu11.39.15-ca-jre11.0.7-macosx_x64.zip
mv zulu11.39.15-ca-jre11.0.7-macosx_x64/zulu-11.jre/Contents/Home ${agipath}/jre
```

## How to get notifications for new dev-releases

Launch AGI, go to the `Edit -> Preferences` menu, and tick both “Automatically
check for AGI updates” and “Include unstable developer releases” options:

![alt text](https://github.com/google/agi-dev-releases/raw/master/images/preferences-menu.png "Screenshot of AGI preferences menu")

Make sure to **relaunch AGI**.

When a new dev-release is published, a "New update available" notification will
be displayed on the startup screen:

![alt text](https://github.com/google/agi-dev-releases/raw/master/images/new-update.png "Screenshot of AGI startup screen with 'New update available' notification")

Clicking on this notification will bring you to the latest dev-release page on
GitHub from where you can download the build relevant to your platform.

---

This is not an officially supported Google product.
