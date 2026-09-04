# Security

You're about to sideload an APK from someone you don't know, so here is how to check it, what it can touch on your phone, and how to reach me privately if you find a problem.

## Verifying your download

Every GitHub Release publishes two values you can check before you install:

- The **SHA-256 of the APK file** (published in the release notes).
- The **APK signing-certificate SHA-256 fingerprint**, so you can confirm every build came from the same signing key.

<!-- MAINTAINER: the APK SHA-256 changes every release, update it when you cut a new build. The signing-certificate fingerprint stays the same as long as the signing key does not change. -->
- Release APK SHA-256 (v1.2.0): `3a42d05817e8c11a260151db26bb5cbf2ac6c8f05cb4323ed62ac4974ecbc39c`
- Signing-certificate SHA-256: `9bf366314a916be0afd358aa2ff78cd2735ff5a4dcebdc842d0fbdc6ff37484b`

Check the file hash:

```
shasum -a 256 second-life-toys.apk
```

Check the signing certificate:

```
apksigner verify --print-certs second-life-toys.apk
```

The certificate fingerprint should match the one above on every release. If it ever changes without an announcement, do not install it.

## App permissions

The app asks for what it needs to talk to the toy over Bluetooth and nothing more:

- **Bluetooth** to find, connect to, and control the toy.
- **Location** on older Android versions only, because the OS requires it to allow a Bluetooth LE scan (not because the app wants your location).

It does not request contacts, storage, accounts, SMS, or the camera. There is no account and no sign-in.

## Reporting a vulnerability

Please report security issues privately, not in a public GitHub issue. DM the maintainer on [r/Sphero](https://www.reddit.com/r/Sphero/) with the details and I'll follow up.
