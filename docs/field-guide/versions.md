# Firmware and app versions

This is the reference for the version side of the toy. The owner-facing pages stay in plain language on purpose, so they talk about *states* a toy can be in ("used before," "never set up," "factory-reset") and never once mention a firmware date or an app version number. This is the page where those numbers actually live. If you are contributing, imaging a unit, or trying to work out why two toys that look identical behave differently, start here.

One quick note before the numbers. Everything below is about identifying and preserving hardware people already own. When a version difference changes what an owner should *do*, this page does not repeat the rescue steps. It points you back to the [recovery matrix](../recovery-matrix.md), which is where the "so what do I do about it" lives.

## The known-versions catalog

There are two things worth tracking separately: the **firmware build** (the date-stamped ROM burned at the factory) and the **toy app** (`com.smarttoy.core`, the program that actually runs the toy). They are decoupled, so I keep two small tables.

The "Units seen" column counts the physical units I have imaged and logged in the [intake log](intake-log.md), so the numbers here line up with that record. A dash (—) means a build I have run into on a toy I helped someone with remotely but have not imaged myself, so it is a known build with no unit in the intake log. It is not a census of every toy ever made, just what has passed through this project.

### Firmware builds

| Build date-stamp | Released | Factory app | Kernel | What's notable | Units seen |
|---|---|---|---|---|---|
| 20160803 | Aug 2016 | 2.34 | 3.4.39 | Earliest build I know of. Content read straight from source files, small recognizer, no endpointing. The build-date string is in Chinese (compiled at a Shenzhen-area Allwinner/Exdroid build shop). | — |
| 20160831 | Aug 2016 | 2.34 | 3.4.39 | Same 2016 generation, a later stamp. | 1 |
| 20170223 | Feb 2017 | 3.12 | 3.4.39 | The cleanest early 2017 reference. Same OS, kernel, and bundled app as August, without the productionization changes on top. | 1 |
| 20170511 | May 2017 | 3.12 | 3.4.39 | 2017 generation, a mid-year stamp. | — |
| 20170824 | Aug 2017 | 3.12 | 3.4.39 | Productionization pass: graceful shutdown, self-heal, formalized eye-animation flashing, and a Wi-Fi-aware updater. | 4 |

### Toy-app versions (`com.smarttoy.core`)

| Version | Internal code | Era | Approx. size | Content model | Notes |
|---|---|---|---|---|---|
| 2.34 | 234 (by the same scheme, not separately confirmed) | 2016 | ~220 MB | Read from source files (predates the bundling scheme) | Predates the content-bundling scheme the 3.x line uses. Shipped a real AR marker feature. Pairing it with 3.x-era content crashes in a loop. |
| 3.12 | 312 | 2017 (~Mar) | ~574 MB | Everything bundled on the toy | The ROM factory build. Works fully offline. This is what a toy that never phoned home is still running. |
| 3.48 | 348 | 2017 (approx.) | not recorded | not characterized | An OTA that sits between 3.12 and 3.82 in the version numbering. We have seen it but have not characterized it closely. |
| 3.82 | 382 | latest OTA | ~11 MB | Content fetched from a cloud at runtime | Latest OTA. A ~52x size drop from 3.12. A factory reset reverts it back to the ROM-bundled 3.12. |

## How to tell which version a toy has

The date-stamp is mirrored in the build version and fingerprint strings, so once you can read those, the firmware build tells you itself.

For the app, the plain answer for an owner is the app's own device-info readout. And here is the useful shortcut. A toy that never contacted the cloud is still on the factory 3.12 and works fully offline. A toy that got updated over the air is on 3.82. So "did this toy ever go online" and "which app is it running" are basically the same question, and you can often infer one from the other before you ever read a string.

## What stayed the same: kernel and partitions

This is the single most important fact on the page, so I am putting it up front. Under all of this, the platform never moved.

Every build runs **Android 5.1.1 (LMY47V, SDK 22)** on an **Allwinner A33**, with the same **Linux 3.4.39** kernel. The **11-partition storage layout was frozen at launch and never changed.** From 2016 through the last OTA, nobody reflashed a kernel or repartitioned anything in the field.

What that means in practice is simple. Every single "update" this toy ever got was a userspace or app change. Not a kernel change, not a partition change. Once that clicks, a lot of the version differences stop being mysterious. They are all the same computer running different software on top.

## February 2017 to August 2017: productionization

The February build (20170223) and the August build (20170824) share the same OS, the same kernel, and the same bundled app (3.12). August is not a new generation. It is a productionization pass over February, and it added a handful of practical things:

- **A graceful shutdown path.** On power-off you get about a 30-second window where the toy plays a shutdown reaction at the current volume before it actually powers down.
- **A self-heal.** If the toy app goes missing, the toy auto-recovers instead of just sitting there dead.
- **Formalized eye-animation flashing at first boot.**
- **The Wi-Fi-aware updater** (more on that below).

The factory test suite also picked up a stereo left/right audio-channel test between the two builds. Small thing, but it is a clean tell for which build you are looking at.

Because February is the same core with none of this productionization layered on, **February units are the cleanest early 2017 reference.** If I want to study "2017 as shipped" without the extra August behavior in the way, I reach for a February unit.

## The app content-model shift: 3.12 versus 3.82

This is the version difference that actually decides whether a toy needs the cloud, so it is worth being precise.

**3.12 is about 574 MB, and all of the content is bundled right on the toy:** the voice-clip library, the activity and game packs, and the voice-recognition model. It works fully offline. Nothing needs to be fetched.

**3.82 is about 11 MB.** That is roughly a 52x drop, and it is not because they deleted features. About 589 MB of content moved *out* of the app to be fetched from a cloud at runtime. 3.82 still ships a minimal seed on board (the eye-animation blob, a few setup prompt sounds, the echo-cancellation reference audio, and a packs manifest), but the packs and the voice recognition are no longer baked in.

The consequence is direct. A factory-reset 3.82 toy comes back up with no packs and no voice recognition until something re-serves them. A 3.12 toy that got reset still has all of that on board.

One thing I want to be clear about, because it is easy to assume otherwise. The 3.12-to-3.82 change was an **architecture** change. They externalized the content and refactored the transport layer. It was not a feature grab or a permission grab. The 29-permission set and the component surface stayed the same across the two. Same app, restructured guts.

## The oldest app (2.34) and the cut AR feature

The 2016-era app, 2.34, is a different animal. It is about 220 MB, it predates the content-bundling scheme entirely, and it delivered audio differently.

The interesting part is what it had that nothing after it did: **a real augmented-reality marker-tracking feature.** It was built on the Metaio AR SDK (the company Apple bought in 2015), and it scanned a printed marker to show an AR overlay. This got cut from every later app. By the time you get to the August 2016 build, the Metaio native runtime is already stripped down to a vestigial stub, which lines up with Metaio shutting down around December 2015. So the AR feature was on its way out even inside the 2016 generation.

There is a compatibility catch here too, and it bites. **App and content are coupled.** Pair a very old app (2.34) with newer 3.x-era content and you get a crash loop. The 3.x line is the compatible pairing. Do not mix eras and expect it to hold together.

## The updater's evolution

The over-the-air updater component went through three versions: **1.2, then 2.3, then 3.2.** The big one is 3.2, which shipped with the August 2017 firmware. That is the updater that became **Wi-Fi-aware**, gaining the ability to inspect and manage Wi-Fi during an update rather than just assuming a working connection was already there.

So if you are wondering why the August build handles a mid-update Wi-Fi situation more gracefully than February, this is why. The updater itself got smarter, not the network stack under it.

## Voice recognition: 2016 versus 2017

The recognizer is a good example of "the software changed, the platform did not."

- **2016 firmware** recognized a small vocabulary, about **195 words**, with no utterance endpointing. Recognition was poor, and the missing endpointing is a big part of why.
- **2017 firmware** roughly tripled the vocabulary to about **701 words** and added endpointing plus streaming voice-activity detection.

Here is the part I found genuinely surprising. **The underlying acoustic model is byte-identical between the two.** The 2017 improvement did not come from a new acoustic model at all. It came entirely from a larger vocabulary and from adding endpointing. Same ears, better dictionary, and a better sense of when you stopped talking.

One aside on counting, because these numbers get read as contradictory and they are not. The 701-word figure is the *recognizer's vocabulary*. That is a different thing from the count of top-level voice commands, or the menu phrase list, or the app's tile grid. They measure different layers, so do not try to reconcile them into one number.

## Why version matters for reviving a toy

Pulling it together, here is why a contributor should care which version is in front of them:

- **A 3.12 unit is the better offline reference.** All the content is on board, so you can study it without a cloud in the loop at all.
- **A factory-reset 3.82 unit needs a content-serving cloud** to restore its packs and voice recognition, because that content was externalized. This is the one place the small replacement cloud (which stands in for the discontinued servers) actually earns its keep.
- **A 2016-era toy can report itself fully set up and still not work.** That is not a broken toy. It is an *orphaned* one. Its original cloud was discontinued, so the "set up" flag is telling the truth about a service that no longer exists.
- **The 2016/2.34 generation reads packs directly from their source files** rather than building the separate runtime pack databases the 3.x model uses. So do not go looking for those pack databases on a 2016 unit and conclude something is missing. It was never that way.

For what any of this means an owner should actually *do*, go to the [recovery matrix](../recovery-matrix.md). This page is deliberately just the reference.

## Updating this catalog

Both of the living tables in the field guide are built to be updated by appending a single row, so logging a toy is a one-place, one-line edit. There are two of them and they live in different files:

- **This page** holds the known-versions catalog (the two tables at the top).
- **The [intake log](intake-log.md)** holds the per-unit record.

**When to touch this page:** only when a *new* build date-stamp or a *new* app version shows up that is not already in a table. When that happens, append one row to the right sub-table and bump the "Units seen" count on the matching firmware row. That is the whole edit.

**When to touch the intake log instead:** every unit that comes in. That is the one-toy workflow, and it is three single-line edits: (1) append one intake-log row, (2) bump the "At a glance" counts on that page, and (3) *only if* the unit brought a new build or app version with it, append the row here. Most units skip step 3 entirely.

And the rule that never bends: keep it anonymous. No serial numbers, no MAC addresses, no BLE advert names, no account, customer, or team IDs, and never a real owner's hero name. Units get sequential labels (Unit A, Unit B), provenance stays coarse ("~Christmas 2017 timestamps," "played 2018"), and imaging dates stay at month-year. If you catch yourself about to paste something that could fingerprint one specific toy or one specific person, stop and generalize it first.