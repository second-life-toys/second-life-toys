# Second Life Toys

[![Status: Pre-alpha](https://img.shields.io/badge/status-pre--alpha-orange)](https://github.com/second-life-toys/second-life-toys/releases)
[![Platforms: iOS & Android](https://img.shields.io/badge/platforms-iOS%20%26%20Android-blue)](docs/getting-started.md)
![Price: Free](https://img.shields.io/badge/price-free-brightgreen)
![Docs: CC BY 4.0](https://img.shields.io/badge/docs-CC%20BY%204.0-lightgrey)

**Bring your dead Sphero Spider-Man toy back to life.**

I bought a Sphero Spider-Man years ago, played with it a bit, then it went in a closet. Then Sphero shut down the app and the servers, and just like that my toy was a paperweight. A couple months ago I pulled mine out and told myself I was going to revive it. Spoiler alert, it worked. So I built these apps so you can revive yours too.

**Second Life Toys** is a pair of free apps that talk to the toy over Bluetooth, plus a small cloud I run to replace the servers Sphero took down. No account, no sign-in. It works, and it has already brought real toys back.

<img src="docs/media/rescue-success.png" alt="The Second Life Toys app showing a revived toy: Your toy is back!" width="320">

## Get the app

**Android (pre-alpha):** [Download the signed APK](https://github.com/second-life-toys/second-life-toys/releases/latest/download/second-life-toys.apk) from [GitHub Releases](https://github.com/second-life-toys/second-life-toys/releases), then sideload it. It's pre-alpha, so expect some rough edges, but it works. Google Play review is in progress.

Signed APK. No account, no sign-in, no personal data. Free. Independent community project.

**iOS (TestFlight):** invite-only right now. DM me on Reddit (r/Sphero) with the email on your Apple ID and I'll get you in.

New to sideloading, or want the step-by-step? See [Getting started](docs/getting-started.md).

---

## The problem

When the official app and cloud got retired, the toys did not stop being good hardware. They just lost the ability to *finish what they were doing*. You point one at the old app and nothing happens. Some are stuck partway through setup. Some got factory-reset and can never come back on their own. Some say "download the app" forever. The toy is fine. The service it was leaning on is the part that's gone.

## What Second Life Toys does

- **Free companion apps for iOS and Android** that connect to the toy over Bluetooth LE.
- **A replacement cloud service** that stands in for the discontinued official servers, for the one step that still needs the internet (loading content onto a completely blank toy).

Once the toy has its content on board, everything works over Bluetooth with no Wi-Fi and no account. The apps can:

- **Rescue** stuck, half-set-up, "bricked," or factory-reset toys and walk them back to a playable state.
- **Load content** onto a blank toy. Most of the content already lives on the toy, so most toys revive over Bluetooth with no Wi-Fi at all. Wi-Fi is a one-time step only for a completely blank toy.
- **Control the toy**: play activities, guard mode, eye colors and expressions, alarms, volume, and the play dashboard.

<table>
<tr>
<td><img src="docs/media/dashboard.png" alt="The app dashboard: hero name and power, connection status, battery, volume, Wi-Fi, and the slide-to-use-power control" width="320"></td>
<td><img src="docs/media/dashboard-activities.png" alt="Activity cards in the app: pick an activity for the toy to play" width="320"></td>
</tr>
</table>

## Rescue your toy (quick start)

**Not sure which situation you're in?** Press the chest button. If it plays a joke or a game, you used it before. If it just blinks and waits, it was never set up. I cover both in [Getting started](docs/getting-started.md).

1. **Get the app.** Grab the [Android APK](https://github.com/second-life-toys/second-life-toys/releases) up top, or for iOS DM me on r/Sphero for a TestFlight invite. Details in [Getting started](docs/getting-started.md).
2. **Turn on Bluetooth** on your phone, and keep the toy right next to it.
3. **Get the toy broadcasting.** If you *used it before*, do a [full reboot](docs/troubleshooting.md#full-reboot-to-get-a-bluetooth-window-case-a) and let the startup music finish. If you *never set it up*, it is already broadcasting.
4. **Open the app and tap Rescue, then Scan.** The app finds the toy, figures out what state it is in, and runs the fixes it can do on its own. It only asks you for a Wi-Fi password or a hero name if the toy actually needs one.
5. **Play.** Once the toy is set-up-complete, press its chest button and it comes back to life.

See it step by step: the [Getting Started guide](docs/getting-started.md#then-for-both-paths) walks through the whole rescue with a screenshot of every screen.

Stuck? The [troubleshooting guide](docs/troubleshooting.md) covers the common gotchas (most of them are "the phone's Bluetooth is off" or "the toy is not broadcasting yet").

## Documentation

- [What we support](docs/what-we-support.md) - supported toys, recovery scenarios, features today, and known limitations.
- [Recovery matrix](docs/recovery-matrix.md) - the plain-language table of "toy states we can recover" and current support.
- [Getting started](docs/getting-started.md) - install the app, device requirements, and the two paths (used it before / never set it up).
- [Troubleshooting](docs/troubleshooting.md) - friendly tips for when a scan or connection does not work, including the full-reboot steps.
- [Report a bug](docs/report-a-bug.md) - how to file an issue and share a diagnostic log.
- [FAQ](docs/faq.md) - is it legal, is it safe, is it free, what data do you collect, and more.
- [Security](SECURITY.md) - how to verify your download, what permissions the app asks for, and how to report a vulnerability.
- [Roadmap](docs/roadmap.md) - where the project is and what is next.
- [Field guide](docs/field-guide/README.md) - a deeper reference layer: what the toy is (anatomy), how it works, the game it plays, its firmware and app versions, its product history, and our living intake log.

## Contributing and community

This is a community project and I'd love the help. See [CONTRIBUTING.md](CONTRIBUTING.md) and our [Code of Conduct](CODE_OF_CONDUCT.md). The friendliest first contribution is just trying the app on your toy and telling me what happened.

## Disclaimer

Second Life Toys is an independent community project. **It is not affiliated with, endorsed by, or sponsored by Marvel, Disney, or Sphero.** "Sphero" and "Spider-Man" are used only to describe which discontinued toy this project is compatible with. All trademarks belong to their respective owners.

The full statement, along with a safety and "use at your own risk" note, is in [DISCLAIMER.md](DISCLAIMER.md).

## License

Documentation in this repository is licensed under [Creative Commons Attribution 4.0 (CC BY 4.0)](LICENSE). The apps are distributed as builds; their source is maintained separately.
