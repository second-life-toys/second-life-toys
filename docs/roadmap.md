# Roadmap

This is an honest snapshot of where Second Life Toys is and where it is headed. Dates are deliberately absent; this is a community project and things ship when they are ready. Everything below is labeled so you can tell what exists today from what is planned.

## Where we are today

**Status: Private Beta.**

- **iOS app** on Apple TestFlight (invite-only). This is our feature reference.
- **Android app** distributed as a signed APK for direct install (sideload).
- **Replacement cloud service** standing in for the discontinued official servers, for the one-time content download a blank toy needs.
- **Rescue flow** that diagnoses a stuck toy and walks it back to playable, plus dashboard, activities, guard mode, eyes, alarm, Wi-Fi setup, settings, and an on-device diagnostics log with Share Log.

The [recovery matrix](recovery-matrix.md) tracks exactly which toy states are proven versus still in validation. That table is the most accurate picture of "what works."

## Available today

- Rescue for the common toy states (never-set-up, shelved-and-stuck, stuck-in-setup, "grab the app" limbo).
- Bluetooth-only revive for toys that already carry their content (no Wi-Fi, no account).
- Wi-Fi provisioning to bring a blank toy online for its content download.
- Play and control features: dashboard, activities, guard mode, eyes, alarm.
- Diagnostics log and Share Log for bug reports.
- Demo / preview mode to see the experience without a physical toy.

## Planned / in progress

- **Android on Google Play (internal testing track).** Pending Play developer-account verification. This will make Android installs a normal Play flow instead of a sideload.
- **Public TestFlight and, eventually, App Store release** on iOS, once the beta is solid.
- **Broadening recovery coverage.** Confirming the fully-offline revive of a never-set-up toy end to end, nailing down factory-reset behavior, and validating self-heal for older stuck-in-setup toys. These are the open items in the [recovery matrix](recovery-matrix.md).
- **More polish across both apps** as beta feedback comes in.

## Not planned

- **Support for other Sphero robots.** This project is specifically for the Spider-Man interactive toy.
- **Reviving hardware-dead toys** (dark eyes, no Bluetooth advertising). There is no software path for that today, and it may be a genuine hardware fault.

## How you can move the roadmap

The fastest way to help is to try the app on your toy and report what happened, good or bad, with a diagnostic log. Real-world reports are what turn "in validation" rows into "proven" rows. See [Report a bug](report-a-bug.md) and [CONTRIBUTING.md](../CONTRIBUTING.md).
