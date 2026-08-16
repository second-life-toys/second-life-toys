# Frequently asked questions

## Is this legal?

Yes. Second Life Toys is an independent project made for people who already own the hardware. It revives a product whose official support was discontinued, so those toys are not thrown away. The apps use no Marvel, Disney, or Sphero artwork, logos, or copyrighted assets, and the project name does not reference any character. We name "Sphero" and "Spider-Man" only to state which discontinued toy the apps are compatible with. Second Life Toys is not affiliated with, endorsed by, or sponsored by Marvel, Disney, or Sphero. See [DISCLAIMER.md](../DISCLAIMER.md).

## Is it safe? Will it damage my toy?

The apps talk to the toy over Bluetooth using the same kinds of commands the original app used, plus the recovery steps needed to get a stuck toy moving again. We use it on our own toys constantly. That said, this is a community project and beta software, so we ask you to use it at your own risk (see the [disclaimer](../DISCLAIMER.md)). We are not aware of it damaging hardware, and the recovery flow is designed to bring toys back, not brick them.

## Is it free?

Yes, completely. There is no purchase, no subscription, and no paywalled feature. It is a hobby project.

## Do I need an account?

No, not to rescue or play. Reviving your toy and controlling it need no sign-in and no personal information at all. There is an optional sign-in that unlocks advanced/developer features, and it only becomes available after you have verified you own the toy by connecting to it locally over Bluetooth first.

## What data do you collect?

For the core experience, we do not collect personal information; rescuing and playing work with no account. If you send us a diagnostic log for a bug report, that log contains technical Bluetooth and connection data, not personal content (no passwords, contacts, or location). See [Report a bug](report-a-bug.md) for exactly what is in it. The optional sign-in uses your chosen sign-in provider only to unlock advanced features.

## Which toys work?

The Sphero Spider-Man interactive toy: the roughly foot-tall talking Spider-Man figure from 2017 with light-up eyes and voice interaction, set up through the manufacturer's old app. It advertises over Bluetooth with a name starting with `ST`. Other Sphero robots (like the ball-shaped droids) are different products and are not supported. See [What we support](what-we-support.md).

## Do I need Wi-Fi?

Usually not. These toys carry their content internally, so most can be revived to full play over Bluetooth alone. Wi-Fi is only needed once, to load content onto a completely blank toy (for example some factory-reset units), or to fetch content updates. See the [recovery matrix](recovery-matrix.md).

## Why isn't it on the App Store or Google Play yet?

It is in private beta while we get it solid. On iOS we distribute through Apple's TestFlight (invite-only for now). On Android we currently share a signed APK you install directly, with a Google Play testing track planned once the developer-account verification clears. The plan is to graduate to public store releases; see the [roadmap](roadmap.md).

## How do I get in?

For iOS, email us to be added to the TestFlight beta. For Android, install the provided APK. Full steps are in [Getting started](getting-started.md).

## My toy shows up as "ST..." in my phone's Bluetooth settings. Should I pair it there?

No need. Let the app find and connect to it. Pairing it manually in the phone's Bluetooth settings is not how the toy is meant to connect, and the toy's broadcast window is short, so just wake the toy (press its chest button) and scan from inside the app.

## The app cannot find my toy. What is the single most likely cause?

Either your phone's Bluetooth is not actually on, or the toy's short broadcast window (about 30 seconds after a button press or reboot) has already closed. Turn Bluetooth fully on, press the toy's chest button, and scan immediately. See [Troubleshooting](troubleshooting.md).

## My toy is completely dead (dark eyes, no response). Can you fix it?

If it powers on but the eyes never light, it never appears in a Bluetooth scan, and the reset button does nothing, we currently cannot recover it in software; it looks like a hardware fault. Please still let us know, since more examples help us understand these cases.

## Can I help?

Yes please. The most useful thing is trying the app on your toy and telling us what happened, especially the odd cases. See [CONTRIBUTING.md](../CONTRIBUTING.md) and [Report a bug](report-a-bug.md).
