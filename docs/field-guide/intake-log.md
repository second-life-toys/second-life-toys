# The intake log

This is my running record of the physical toys I've taken in. Every time a new Sphero Spider-Man lands on my bench, it gets a row here. That's the whole idea. One toy, one line, and the list grows a little each time.

I keep this log for a simple reason. Once you're working on more than two or three of these, it gets really easy to mix them up. One is on a 2016 build, one showed up half-set-up, one was clearly some kid's Christmas present in 2018. If I don't write that down the moment a toy arrives, I lose it, and then I'm sitting there second-guessing which unit did what. So this is the anonymized, shared memory of the fleet.

## What this log is (and what it deliberately is not)

This log is an anonymized record of the physical units the project has taken in, and it's here so I never confuse builds and arrival states between one toy and the next. For each unit it holds exactly three things: which generation (firmware build) it is, what state it arrived in, and a coarse, anonymized provenance signal. That last one is the kind of hint that tells you "this was a used toy from around Christmas 2017" without ever pointing at an actual person.

Here's what it deliberately is **not**, and I want to be really clear about this. This log carries **zero** of the following:

- serial numbers
- MAC or Bluetooth addresses
- per-unit advertising names (the `ST`-prefixed name a toy calls out over Bluetooth)
- account, customer, or profile IDs
- a previous owner's hero name

Some of these toys came to me used, which means somewhere on them is a real kid's saved game. That kid is not part of this record, full stop. The only things that go in this table are generation, arrival state, provenance, and preservation status. If you're ever updating this log, keep it that way. When in doubt, leave it out.

## At a glance

This little rollup is hand-maintained. When you add a toy, bump these counts in the same edit.

- **Total units:** 6
- **By generation:** 2016 (20160831) x1, 20170223 x1, 20170824 x4
- **By arrival state:** new-old-stock x1, pristine-unused x2, half-set-up x1, used-with-owner-history x2

Every one of these is the same model, an **SP001 on an Allwinner A33 running Android 5.1.1**. What changes from toy to toy is the firmware build and the app version. Across the whole fleet I've seen three firmware date-stamps (20160831, 20170223, and 20170824) and two app versions, 3.12 (internal code 312) and 3.82 (internal code 382). The toys that came in on 3.12 I later updated over the air to 3.82. The one exception is the new-old-stock unit, which I've left exactly as it came, app never touched.

## The units

Each toy gets an anonymous sequential label, Unit A, Unit B, and so on. **The label is the only identifier. Never put a serial, a MAC, an advert name, an account or profile ID, or an owner's hero name in this table, and keep the "First imaged" column to month-year so a precise timestamp can't help fingerprint a specific unit.**

| Unit | Generation (firmware build) | Arrival app | Arrival state | Provenance signal | Preservation | First imaged |
|------|------------------------------|-------------|---------------|-------------------|--------------|--------------|
| Unit A | 2016 (20160831) | 3.12 | new-old-stock | never used; all on-device data at one factory-imaging minute | imaged + diagnostics | 2026-03 |
| Unit B | 20170223 | 3.82 | used-with-owner-history | ~Christmas 2017 timestamps | imaged + diagnostics | 2026-04 |
| Unit C | 20170824 | 3.82 | used-with-owner-history | played ~Christmas 2018 to late March 2019, then shelved | imaged + diagnostics | 2026-05 |
| Unit D | 20170824 | 3.12 | half-set-up | prior campaign progress, Wi-Fi/content unfinished (~Christmas 2018) | imaged + diagnostics | 2026-06 |
| Unit E | 20170824 | 3.12 | pristine-unused | factory-fresh, no prior consumer setup | imaged + diagnostics | 2026-07 |
| Unit F | 20170824 | 3.12 | pristine-unused | factory-fresh, no prior consumer setup | imaged + diagnostics | 2026-08 |

One thing jumps right out of the provenance column. These were gifts. The used ones carry a Christmas pattern almost every time. One arrived with on-device timestamps landing right around Christmas 2017. Another was clearly set up and played starting Christmas 2018. And one has a whole little arc to it, opened around Christmas 2018, played through late March 2019, and then it went quiet and got put away. Needless to say, that last one hits a little. Somebody's kid loved it for a season, then the app died and it turned into a doorstop. That's the exact thing this project exists to undo.

## Arrival-state definitions

These are the words the log uses in the "Arrival state" column, and what each one actually means when a toy lands:

- **new-old-stock.** Forensically never used. No Bluetooth pairings, no stored account, no profile, the app never updated, and all the on-device data dated to a single factory-imaging minute. In plain terms, it left the factory, sat in a box for years, and reached me having never met a child. It's the closest thing there is to a time capsule of how these shipped.
- **pristine-unused.** Factory-fresh, with no prior consumer setup. Very close to new-old-stock, but I don't hold it to the same forensic "not a single pairing ever" bar. It just never got past the box.
- **half-set-up.** A previous owner played a real chunk of the campaign, so the intro is finished and there's genuine story progress on board, but they left Wi-Fi and the content download unfinished. So it's a toy caught mid-onboarding, and that partial state is its own puzzle to walk back to playable.
- **used-with-owner-history.** Genuinely used, carrying a previous owner's saved game state. One in the fleet dates to 2018 usage, one to 2017. These are the ones I'm most careful with, because there's a real person's play history sitting in there.
- **factory-reset** and **dark-eyes.** These I triage more broadly rather than pin to a specific fleet unit. Factory-reset means the toy got wiped and can't come back on its own. Dark-eyes is the scary-looking one where the toy powers up but the eyes never light. Both are usually recoverable, they just start from a rougher place.

## How units are preserved

Before I do anything else to a toy, I image it. Every intake starts with a full multi-partition disk image, roughly 11 to 13 partitions, captured before any further work. The point is to freeze the as-received state so I can always get back to exactly how the toy showed up, no matter what I try on it afterward. Alongside the image I keep an as-received diagnostics log that writes down the toy's arrival condition, so even after I've poked at a unit, its original state is documented and I'm not leaning on memory.

There's a nice integrity check that falls out of doing this across a fleet. Toys on the same firmware build share **byte-identical system content and identical boot and recovery partitions**. So when a new unit's system, boot, and recovery match another unit on the same build, that's real evidence the firmware is intact and genuine, not quietly modified. It's a free authenticity check, and I lean on it.

The images also confirmed something I'd hoped was true, which is that these toys are far more self-contained than people assume. A few things the imaged units taught me:

- **The voice library lives entirely on the toy.** One imaged unit carried about 6,057 mp3 clips, roughly 495 MB of spoken lines, right there on device. Pulled together across every unit and content wave, the consolidated corpus runs about 10,044 clips, around 890 MB. That's a lot of Spider-Man talking, and none of it needs the internet once it's on board.
- **Recognition runs locally.** The speech recognition is an on-device Cobalt/Kaldi decoder, not a cloud service listening in.
- **Activities ship as numbered JavaScript packs**, with the script and manifest databases kept separate from the audio. On one unit the pack IDs I saw ran roughly 454 to 509.
- **The eyes are driven from a 16 MB on-board frame store.** The expressions are baked in, not streamed.

All of which is to say, the toy is the archive. The imaging isn't just backup insurance, it's how I learned what these things actually are.

## Adding a new unit

When a new toy comes in, logging it is a one-place, one-line job. Here's the whole workflow:

1. **Append one row to the table above.** Fill in the seven columns for the new unit, using the next letter for the label.
2. **Bump the At-a-glance counts.** Update the total, the by-generation line, and the by-arrival-state line in the same edit.
3. **Only if the toy introduced something new**, a firmware build date-stamp or an app version I haven't seen before, add one row to the known-versions catalog over in `versions.md` and bump the matching "Units seen" count there. Most intakes won't need this step, because most new toys land on a build I already have on record.

Every step is a single-line edit, and that's on purpose. The easier this is, the more likely it actually gets done the day a toy arrives instead of a week later when I've forgotten the details.

And one more time, because it's the thing that matters most. Keep it anonymous. No serials, no MACs, no advert names, no account or profile IDs, no owner hero names, and keep imaging dates to month-year. In the end this log is only useful if it's safe to share, and it's only safe to share if nothing in it ever points back at a real toy or a real kid.