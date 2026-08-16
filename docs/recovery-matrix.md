# Recovery matrix

This is the plain-language version of "which toys can we bring back, and how sure are we?" It is distilled from our internal hardware test notes. We keep the honest status labels so you know what is proven versus what is still being validated.

## Start with your path

Everything below falls under one of the two situations from [Getting started](getting-started.md#which-one-are-you):

- **Path A: I used it before.** The toy has its content and plays on a chest press. It just needs a [full reboot](troubleshooting.md#full-reboot-to-get-a-bluetooth-window-case-a) to start broadcasting Bluetooth, then a rescue to clear whatever left it stuck. Covers states 2, 4, and 5 below.
- **Path B: I never set it up** (new in box, or factory-reset to fresh). It boots into setup mode, blinks, and broadcasts Bluetooth on its own, so the app finds and rescues it directly. Covers states 1 and 3 below.

## How to read the status

- **Proven** - we have done this end to end on a real toy and watched it come back.
- **Mostly proven** - every piece has worked, but the exact full run for this case is still being confirmed.
- **In validation** - the logic is built and partially tested, not yet confirmed end to end on hardware.
- **Not recoverable (yet)** - no software path has worked so far.

## The states

Find the row that sounds like your toy. The "Path" column tells you which first step to take.

| # | Path | What you see | What is going on | What the app does | Status |
|---|------|--------------|------------------|-------------------|--------|
| 1 | B | **Brand new / never set up.** Blinking chest, plays a "grab the app" prompt on a button press. Never connected to anything. | It was never finished through setup, but it already carries its content internally. | Finds it (it broadcasts on its own), seeds a profile, marks setup complete, and starts play. In most cases **no Wi-Fi needed at all.** | Mostly proven |
| 2 | A | **Was working, now shelved and stuck.** Plays on a chest press, but the app cannot see it and it will not fully behave. May still remember your Wi-Fi. | Setup or an app handoff left it in a not-playable state, but its content is on board. | After a [full reboot](troubleshooting.md#full-reboot-to-get-a-bluetooth-window-case-a) to start broadcasting, connects, clears the stuck setup flag, and starts play. | Proven on hardware |
| 3 | B | **Factory-reset toy.** You reset it and now it boots blank into setup mode. | Its setup, content, and profile were wiped. Depending on the toy, a reset can also remove part of its own software. | If the toy's software survived, same as state 1. If content was wiped but the app is intact, it reloads. Bringing it online via Wi-Fi to re-download content is proven. | Wi-Fi path proven / offline path in validation |
| 4 | A | **Stuck in setup, never finishes.** Progress bar sits below 100 percent forever. | It is waiting on content the old servers can no longer deliver. | Our replacement cloud fixed the cause for new setups. For a toy already stuck, the app can un-stick it by marking setup complete. | Mostly proven |
| 5 | A | **Says "grab the app" even though setup showed "all set."** Plays on a chest press, but the phone said it was done and the toy is offline. | It was offline during setup, so it never recorded that it finished. Its content is still on board. | Treated like state 2: [full reboot](troubleshooting.md#full-reboot-to-get-a-bluetooth-window-case-a), connect, and run the offline revive to playable. | Mostly proven |
| 6 | - | **Dead / dark eyes.** Powers on (maybe a boot chime) but eyes never light, never appears in a Bluetooth scan, reset button does nothing. | The toy's main software never comes up. This looks like a hardware fault. | No non-invasive software path recovers this today. | Not recoverable (yet) |

## The headline: most toys do not need Wi-Fi

A never-set-up toy is not empty. These toys carry their content internally and lay it out on their own the first time they boot, with no network involved. That means the most common cases (states 1, 2, and 5) can be revived to full play **entirely over Bluetooth, with no Wi-Fi and no account.**

Wi-Fi and our replacement cloud only matter for one thing: loading content onto a completely blank toy (like some factory-reset units), or fetching content updates beyond what the toy already has.

## Still being confirmed

A few things need more real-world toys to nail down, and honest reports from beta users are exactly how we close them:

- The single fully-offline, Bluetooth-only revive of a never-set-up toy, start to finish (state 1).
- Exactly what a factory reset wipes on a given toy, and whether content reloads offline afterward (state 3).
- Whether older stuck-in-setup toys heal themselves now that the server-side cause is fixed, or still need the manual un-stick (state 4).

If your toy matches one of these, your report genuinely helps. See [Report a bug](report-a-bug.md).
