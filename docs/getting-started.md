# Getting started

Second Life Toys is in **private beta**. This page walks you through joining the beta on your platform, what you need, and how to make your first connection to the toy.

## What you need

- The **Sphero Spider-Man interactive toy** (the 2017 talking figure), charged and powered on.
- A phone or tablet with **Bluetooth**:
  - **iPhone or iPad** running **iOS 16 or later**, or
  - An **Android phone** running **Android 8.0 or later**.
- A few minutes and, for a completely blank toy only, your **Wi-Fi network name and password**. (Most toys do not need this. See the [recovery matrix](recovery-matrix.md).)

You do **not** need an account, a sign-in, or to give us any personal information to rescue or play with your toy.

## Join the beta

### iOS (Apple TestFlight)

The iOS app is distributed through Apple's TestFlight, and it is invite-only during the private beta.

1. **Email us to request an invite.** Send your email address to **`<BETA_REQUEST_EMAIL>`** (maintainer: fill this in) and ask to join the Second Life Toys TestFlight beta. Use the same email you use for your Apple ID / App Store, since that is the address we add to the beta.
2. **We add you to the TestFlight group** and you will get an email invitation from TestFlight.
3. **Install TestFlight** from the App Store on your iPhone or iPad if you do not already have it.
4. **Open the invitation** and tap Accept, then install Second Life Toys from within TestFlight.
5. TestFlight will notify you when there is a new beta build to update to.

TestFlight is Apple's official beta system, so this is a normal, safe install path. TestFlight builds do expire periodically; if the app stops opening after a while, check TestFlight for an update.

### Android (sideload the APK)

The Android app is currently distributed as a **signed APK** that you install directly. A Google Play testing track is planned (see the [roadmap](roadmap.md)), but for now you install the APK by hand. This is called sideloading.

1. **Download the APK** to your Android phone from: **`<ANDROID_APK_DOWNLOAD_URL>`** (maintainer: fill this in).
2. **Allow installs from this source.** When you open the APK, Android will ask whether to allow installing apps from that source (your browser or Files app). Approve it. On modern Android this is a per-app permission (Settings can also be reached under Apps > Special access > Install unknown apps).
3. **Tap the downloaded APK** and choose Install.
4. **Open Second Life Toys.**

Notes on safety: only install the APK from the official link above. The APK is signed, so once you have installed our build, updates signed with the same key will install cleanly over it. If an APK ever refuses to install over an existing one, that is Android telling you the signatures do not match, which is a signal to double-check where you got it.

## First connection

Once the app is installed:

1. **Turn on your phone's Bluetooth.** This sounds obvious, but a disabled Bluetooth adapter is the single most common reason a scan finds nothing. Make sure it is fully on.
2. **Put the toy right next to the phone.** Bluetooth LE range for setup is short; keep them close.
3. **Wake the toy.** Press the toy's chest/stomach button. This makes it start advertising over Bluetooth. The broadcast window is short, only about 30 seconds, so do the next step promptly.
4. **Open the app and scan / tap Rescue.** The app will look for a toy advertising with a name starting with `ST`. When it finds yours, connect.
5. **Let Rescue do its thing.** The app diagnoses the toy's state and runs the fixes it can do on its own. It only stops to ask you for a Wi-Fi password or a hero name if the toy actually needs one.
6. **Play.** When the toy is set-up-complete, press its chest button and it should come back to life.

If the app does not find the toy, do not worry, that is usually one of a handful of simple things. Head to [Troubleshooting](troubleshooting.md); the top tip is to re-wake the toy (its broadcast window closes fast) and confirm the phone's Bluetooth is truly on.

Want to see how it works before you have your toy handy? Both apps include a **demo / preview mode** that walks through the rescue-and-play experience with a simulated toy.
