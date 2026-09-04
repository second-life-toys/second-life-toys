# Power, sleep, and setup: reading a toy's state

Most of the time, when someone tells me their toy is "broken," it is not broken at all. It is just in a state they cannot see from the outside. The lights, the sounds, and the little Bluetooth call-out it makes are the toy telling you exactly what it is doing, and once you learn to read them, half the mystery goes away.

This page is the reference behind the [recovery matrix](../recovery-matrix.md). It explains the *why*: how the toy powers up and sleeps, why a quick wake stays quiet when you expect it to broadcast, how the short Bluetooth window works, and what the setup process is actually doing while it churns. It does not tell you what buttons to press to fix your toy. That lives in the [recovery matrix](../recovery-matrix.md) and the [troubleshooting guide](../troubleshooting.md). Think of this as the map, not the turn-by-turn.

*Not affiliated with, endorsed by, or sponsored by Marvel, Disney, or Sphero. This is a fan project to bring a discontinued toy back to life.*

## Powering on and off

The chest button does everything, and how long you hold it is the whole trick.

- **Power on:** press and hold the chest button about **3 seconds**. The chest lights up, and then the startup music plays roughly **10 to 15 seconds later**. That gap trips people up all the time. The toy is awake and booting well before it says a word, so give it a moment before you decide nothing happened.
- **A short tap does not power it on.** A tap only wakes an already-on toy so it will listen for a second. If the toy was actually off, a tap does nothing useful, and you will sit there wondering why it is dead. Hold, don't tap.
- **Power off:** press and hold the chest button about **5 seconds**. You know it is truly off when the **chest light and the eyes both go fully dark**. If either one is still lit or glowing, it is not off yet, it is just asleep.

Naturally, "off" and "asleep" look almost identical from across the room, and that confusion is behind a lot of "why won't it wake up" moments. The dark-both-lights rule is your tell.

## Sleep, idle, and waking

Left alone, the toy does not stay wide awake forever, and that is on purpose. Battery life would be miserable otherwise.

- **Idle:** after you stop playing, the toy waits around **30 minutes** for motion. If nothing moves it, it drops into a **low-power standby**.
- **Motion wakes it.** Pick it up, bump the table, and it comes back. This is the same motion sensing that makes it react when you play with it.
- **"Go to sleep" is deeper.** If you tell it to go to sleep, it goes into a heavier sleep than plain idle standby.

Here is why that matters for reading state. A toy in standby is silent and not calling out over Bluetooth, exactly like a toy that is off. So "it does nothing when I walk up to it" is not a diagnosis. It might be off, it might be asleep, and the only way to know is to actually power it on and watch the startup sequence.

## The Bluetooth advertising window

This is the single most important thing on the page, because it explains more "the app can't find my toy" reports than everything else put together.

The toy does not broadcast over Bluetooth all the time. It **advertises only for a short window**, then it goes quiet to save power. ("Advertising" and "broadcasting" are the same thing. The app pages call it broadcasting because it is friendlier, but under the hood it is Bluetooth advertising.) The window works like this:

- After a **power-on or a chest press**, the toy advertises for about **30 seconds**, then stops.
- It **also stops advertising when its screen sleeps**, even inside that window. So if the display dozes off, the call-out ends early.
- A toy that **cold-boots into setup mode** is a bit different. It begins advertising roughly **1 to 4 minutes after boot** (it has housekeeping to do first), and then it **keeps advertising the whole time** it is online or working through setup. That is why a never-set-up toy is so easy for the app to find. It is basically waving the entire time.

So when a scan comes up empty, the toy is usually not broken and not out of range. It just already went quiet. You reopen the window and try again.

### The warm-wake trap

This one cost me real time before I understood it, so I want to spell it out. If you take a used, already-set-up toy and give it a **warm wake** with a chest press, the toy will happily **speak its "grab your mobile device and download the app" prompt**, but it will **not start advertising over Bluetooth**. Nothing shows up in a scan. It looks completely broken.

It is not broken. This is normal behavior. The Bluetooth advertiser only comes up on a **cold boot**, and a warm wake skips that. So the fix is a full power-off-then-on, nothing drastic. And I want to be clear about what the fix is *not*: it is **not** a factory reset. A reset here would throw away your content and progress to solve a problem that a plain reboot solves in twenty seconds. Do the reboot.

The [troubleshooting guide has the exact reboot steps](../troubleshooting.md#full-reboot-to-get-a-bluetooth-window-case-a). This page is just telling you *why* the reboot is the answer.

## The setup lifecycle

When a toy is being set up for the first time, it is not doing one thing, it is walking through a sequence of checks, in order. Knowing the sequence tells you where a stalled toy got stuck.

The phases go like this:

| Phase | What it is doing |
| --- | --- |
| 1. Extract content | Unpacks the bundled content that already ships on the toy |
| 2. Firmware / OS check | Checks for a firmware or OS update, applies one if there is one |
| 3. App check | Checks for an app update, applies one if there is one |
| 4. Content update | Checks whether any content is missing or out of date, updates it |
| 5. Setup complete | Latches as done |

A low-battery state can show up along the way, which is one more reason to have the toy on power while it works.

The key thing to understand is this: the toy reports setup as **complete only once all of these are satisfied at the same time**. It has to *not already be set up*, its **OS/firmware has to be current**, its **app has to be current**, and its **content has to have finished updating**. If any one of those has not finished, setup **stalls short of complete** and just sits there. So a toy stuck partway through is not confused, it is waiting on whichever phase did not finish, and it is recoverable. It does not need a reset.

### What content actually needs the internet

People assume reviving a toy means a big download, and for most toys that is just not true. **Most of the content already lives on the toy.** The app only pulls a pack down when the toy's own copy is **missing or older** than what is available. A fully-provisioned toy needs **zero downloads** to play, and once it is provisioned it needs no internet to play at all.

The one time the internet genuinely comes into it is **first-time setup on an online toy**, when the toy reaches out to a cloud to log in, fetch profiles, and run those OS / app / content checks. Since the official servers are gone, a **small stand-in cloud** covers that one-time online step, and only that step. Once a toy has its content on board, it is done with the cloud for good.

## Reading a toy's state from its signals

Put the pieces together and the toy's outward signals map cleanly onto its internal state. This is the table I wish I had at the start.

| State | Speaks? | Advertising over Bluetooth? | What you are seeing |
| --- | --- | --- | --- |
| **Off or asleep** | No | No | Silent and dark. Could be genuinely off, could be standby. Power it on to tell. |
| **Warm wake** | Yes (the "download the app" prompt) | **No** | The warm-wake trap. Talks but won't show in a scan. Needs a **cold boot**. |
| **Cold-boot setup mode** | Yes | **Yes** | Booted fresh into setup. Speaks and broadcasts. The app can find it. |
| **Online, mid-setup** | Yes | Yes | Advertising *plus* talking to the cloud through a setup phase. |
| **Online, setup complete** | Yes | (short window) | Plays activities normally. This is a healthy, finished toy. |

Notice the row that catches everybody: **warm wake speaks but does not advertise.** If you only listen for the voice, a warm-wake toy sounds perfectly alive, and you will never understand why the app can't see it. The advertising column is the one that actually tells you whether the app has any chance of finding the toy.

One more useful signal: the toy **reports its charging state and battery level to the phone app** over Bluetooth once connected. So if you are connected and worried about power, the app can just tell you.

## Two dark-eyes causes and how to tell them apart

"The eyes never light up" is the report that scares people the most, and it splits into two very different situations. Telling them apart is the whole game, because one is a real hardware fault and the other is not.

First, some anatomy. The eyes are a **real LCD display behind the mask**, riding on a **ribbon cable**. That display is a **separate subsystem from the audio**. Because they are separate, **the toy can talk perfectly while the eyes stay dark**. So a toy that boots, plays its startup chime, and whose chest light and button work fine on battery, but whose **eyes never come on**, is not necessarily dead. Audio working tells you nothing about the eyes one way or the other.

So which is it? The **Bluetooth advertising signal** is the fork:

| Does it still advertise over Bluetooth? | What that means |
| --- | --- |
| **Yes, it still advertises** | The app software booted fine. The fault is **isolated to the eye-display hardware**, often a ribbon that **loosened or got damaged in shipping**. Sometimes this is fixable by reseating the ribbon. |
| **No, nothing advertises at all** | The app is **not coming up at all**. This is the deeper fault, and it is the "dead" state in the [recovery matrix](../recovery-matrix.md) that no non-invasive software path recovers today. |

In other words: dark eyes plus a live Bluetooth call-out is a display problem, not a brain problem, and there is real hope for it. Dark eyes plus total Bluetooth silence is the discouraging one. Same symptom on the face, completely different story underneath, and Bluetooth is how you tell.

## Healthy-toy baselines

It helps to know what "fine" looks like so you are not chasing a problem that isn't there. A healthy toy sitting on its dock, **charging, will idle with a gently pulsing chest light.** That slow pulse is the toy being content, not a warning. If that is what you are looking at, the toy is doing exactly what it should.

And to say it plainly, because it saves people from a bad decision: a **factory reset is essentially never the right fix for a connectivity problem.** "Speaks but no advertising," "offline," and "stuck mid-setup" are all recoverable **without a reset**. A reset **wipes user data and re-runs a content restore that takes around 10 minutes**, so all it buys you for a connectivity issue is lost progress and a long wait. Save the reset for a genuinely corrupt system, which is rare. When in doubt, reboot, don't reset.

## Judging online or offline reliably

Two of the toy's own signals lie a little, and if you trust them blindly they will send you down the wrong path. Both are worth knowing about.

- **The Bluetooth "setup done" flag is unreliable.** The toy exposes a flag over Bluetooth that is supposed to mean "I'm set up," and it can read **false on a toy that is completely working**. So do not treat that flag as gospel. A more dependable "already set up" signal is the **toy's own record that it has run its intro** at least once. If it has been through its intro, it has been set up, whatever the flag says.
- **A single ping can lie about Wi-Fi.** The toy's Wi-Fi can be flaky enough that **one short ping fails and makes a perfectly online toy look offline.** So do not judge up-or-down from one probe. Run a **continuous ping and watch several packets** in a row. If most of them come back, the toy is up, even if one or two dropped. One missed packet is noise, not a verdict.

Frankly, both of these come down to the same lesson: a single instantaneous reading is not a diagnosis. Watch the signal for a beat before you believe it.

### A quirk on the earliest firmware

One more, because it surprised me. On the **2016 firmware**, a set-up toy will only **download new content while it is asleep and undisturbed.** So if a 2016-generation toy is missing content, poking at it constantly actually prevents the very download you are waiting for. As far as we have seen, the move is to leave it **alone on Wi-Fi and power for a long, uninterrupted stretch** and let it pull the content in its own time. Patience is the fix, which is an annoying fix, but there it is.

## Where to actually fix it

This page is the reference, so it stops at understanding. When you know what state your toy is in and you want to *do* something about it, here is where to go:

- **[Recovery matrix](../recovery-matrix.md)** for the plain table of toy states and what we can recover today, including the "dead / dark eyes" state.
- **[Troubleshooting](../troubleshooting.md)** for the actual step-by-step, including the [full reboot](../troubleshooting.md#full-reboot-to-get-a-bluetooth-window-case-a) that reopens the Bluetooth window and beats the warm-wake trap.
- **[Getting started](../getting-started.md)** if you are new and just want to get the app on your phone and connect.
- **[What we support](../what-we-support.md)** for the supported toy, the features today, and the known limits.

In the end, almost everything on this page comes back to one habit: read the toy's signals before you act. The lights tell you off versus asleep, the voice-without-broadcast tells you it needs a cold boot, and a live Bluetooth call-out (or the lack of one) tells you whether a dark-eyed toy has a display problem or a deeper one. Learn those three tells and you will fix far more toys than you break, and you will almost never reach for a factory reset you did not need.