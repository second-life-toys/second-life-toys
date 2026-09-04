# Product history and museum notes

This is the museum wing of the field guide. The rest of these docs are about getting your toy working again. This page is different: it is the story of the thing itself. What it was, who made it, how it was sold, and why it went quiet. If the how-to pages are the repair manual, this is the plaque on the wall next to the exhibit.

A quick note before we start. This is a preservation project, and it is not affiliated with, endorsed by, or sponsored by Marvel, Disney, or Sphero. The full statement lives in [DISCLAIMER.md](../../DISCLAIMER.md), and everything below is written in that same spirit: a fan documenting a discontinued product he cares about.

## What it was and when

The toy is "Spider-Man" by Sphero, a 2017 interactive, app-enabled Marvel Super Hero figure. It stands about a foot tall,[^height] it has animated LCD eyes, it talks and listens, it senses motion, and it ran an app-driven and cloud-driven story. Naturally, for a toy from 2017, all the interesting behavior leaned on a phone app and a cloud service.

It was marketed in 2017. By late 2018 into 2019 the web product pages had already been retired to redirects, which tells you the retail life was short. Two years, give or take. That is the whole window, and it is part of why so few people know this toy existed at all.

## Who made it, and the likeness

It was made by Sphero, Inc. of Boulder, Colorado, under a Marvel license. The packaging says it plainly: "Dreamed in Boulder, Colorado. Assembled in China." I like that line a lot, and it is a nice piece of the record.

The figure wears the 2017 MCU costume from *Spider-Man: Homecoming*, with the raised-leg spider emblem on the chest and the web-shooter cuffs at the wrists. So if you are trying to place which Spider-Man this is out of the dozens, it is the Tom Holland era, first solo movie. That dates the design as clearly as the firmware does.

## Model numbers, SKUs, and price

Here is the retail paperwork, for the collectors who care about exactly this kind of thing.

| Identifier | Value |
|---|---|
| Model | SP001 / SP001ROW |
| Best Buy SKU | 5565400 |
| App distribution | Apple App Store and Google Play |
| Documented retail price | about $34.99 |

A documented unit retailed around $34.99 and was bought new in early 2018, which lines up cleanly with that 2017 to 2018 retail window. Frankly, $34.99 for a talking, listening, foot-tall connected figure was a good deal even then, and it is a little sad that the price is part of why these ended up in closets instead of on shelves.

On the connectivity side, the toy carried two radios: Bluetooth SMART (BLE) for local control from the phone app, and Wi-Fi for the cloud and content updates. It ran about two hours per charge, and it charged by sitting on a micro-USB pogo-pin dock that the marketing called the "web-base." That dock is the little base it stands on, and the charging contacts are pogo pins, so there is no plug to line up. You just set it down.

What it actually did, feature for feature, reads like a wish list for a 2017 connected toy:

- An on-board speaker, so it talks out loud.
- A motion detector, so it knows when something moves near it.
- Real LCD eyes. This is worth saying twice: the eyes are a little display, not fixed plastic lenses, so they animate and change expression.
- A capacitive "spider button" you touch with a finger to wake it.
- Advertised advanced on-device speech recognition, so it listens and responds.
- A per-user personalization profile, including a Super Hero alter-ego name you create during onboarding.
- A branching story engine. The marketing line was "every decision creates a new path," and it tracked your progress through it.
- Utility skills on top of the play: it could guard a room and it could wake you up like an alarm.

The packaging and marketing name-dropped villains too, including Venom, Lizard, and Kraven. Whether every one of those got fully populated as playable content on every toy is a separate question, and I get into the content side on the other field-guide pages.

## The two board revisions

There are two board revisions on record, and here is the part that surprises people: they both live under a single FCC grant. The original grant is from 2016 on a board marked Smart Toy-II-Main-V03, dated 2016-07-05. Then there is a 2017 Class II Permissive Change on a V04 board, dated 2017-03-02.

A Permissive Change is FCC-speak for "we changed something small enough that we do not need a whole new grant." And that is exactly what happened here. Electrically the two boards are the same design. As far as the filings show, the 2017 change only added an echo-cancellation reference path, which is the kind of tweak you make so the toy can hear you better while it is also talking. Same radio, same everything that matters, one small audio improvement.

If you want the board-level anatomy in detail, the parts, the sensors, the measurements, that lives on the [anatomy page](anatomy.md). This page is just here to say there are two revisions, they share a grant, and the difference is minor.

## How it was sold and localized

For a toy with such a short retail life, Sphero localized it broadly. The product and its marketing were done in ten languages:

English, French, Italian, German, Spanish, Portuguese, Japanese, Korean, Simplified Chinese, and Traditional Chinese.

That is a real international rollout, not a token gesture. It tells you Sphero expected this to sell in a lot of places, which makes the quiet discontinuation a little more melancholy. It was built like a product that was going to be around.

## Discontinuation: why the toys went quiet

Here is the part that started this whole project. Sphero, the manufacturer, discontinued the official app and shut down the servers the toy relied on. And just like that, a lot of these toys could no longer finish setup or play. They became paperweights.

The mechanism is worth understanding, because it explains why a dead toy behaves the way it does. An un-updated toy still wants to reach its old cloud. With the servers gone, it never gets an answer, so it just sits there in a connectivity retry loop, calling out to a service that no longer exists. It is not broken. It is waiting for a friend who is never coming back.

That is the whole reason a small stand-in cloud exists in this project. It is not there to run the toy day to day. It stands in for the discontinued servers for the one-time step of loading content onto a completely blank toy, and after that the toy plays over Bluetooth with no cloud at all. If you want the practical side of that, the [getting started guide](../getting-started.md) walks through it.

## The original companion app

The original app was Sphero's "Spider-Man Interactive Super Hero" app. Its final version was 1.1.5, which shipped around October 2018, and after that the development just stopped. So the app's own version history basically tells you the same story the web redirects do: things wound down through 2018.

One detail from that app is worth preserving, because it explains a lot about how setup works. The original setup wizard ended on a screen that said "SUCCESS! Spider-Man is online!" And that screen was gated on the real thing, not a fake one. It did not appear just because your phone had shaken hands with the toy over Bluetooth. It appeared only once the toy had actually joined Wi-Fi and reached the cloud. In other words, "online" meant online. That is exactly why, with the cloud gone, an untouched toy can never reach that screen on its own, and it is the behavior this project had to work around.

## Provenance: a holiday-gift toy

I want to keep this part strictly aggregate and anonymized. No serial numbers, no order numbers, no owners. Just the pattern that shows up across the toys that have been studied, because the pattern itself is a nice little piece of social history.

The evidence fits these toys commonly being holiday gifts. Used units carry on-device timestamps clustered around Christmas 2017 and Christmas 2018, which is about what you would expect for a gift-shaped toy at a gift-shaped price. One used toy's history told a very ordinary and honestly kind of touching story: played starting Christmas 2018, last used in late March 2019, then shelved. A few months of a kid loving it, then the closet. That is a typical short consumer lifespan, and it is probably the most common life story this toy ever had.

One more note that widens the map. One studied older-generation unit belongs to an owner who is far away, helped only through read-only diagnostics. That matters for two reasons. It shows the 2016-generation boards are still out in the field, sometimes a long way from anyone working on this, and it shows you can look at a toy's state without touching anything on it. These things are still scattered around, waiting, more than you would think.

## Sibling toys on the same engine

Here is a fun one to close on. The same Sphero engine that ran the Spider-Man figure also powered co-branded sibling toys. The menu roots that survive on the Spider-Man units hint at other variants built on the same platform, including a Qubo kids-TV variant and an American Girl variant.

Now, before anyone gets excited: those menu branches were almost certainly never populated on a Spider-Man toy. A Spider-Man unit is not secretly hiding an American Girl adventure. What you are seeing is shared plumbing. Sphero built one flexible engine and dressed it up differently for different licenses, and the Spider-Man firmware just carries the empty hooks where a sibling's content would have gone. It is a little archaeological footprint of a bigger platform, and I think that is the most interesting thing on this whole page. The toy in your closet is one member of a small family that ran on the same brain.

---

[^height]: Marketing and the museum records call it roughly a foot tall, about 13 inches, and that is the number I would go by. As an aside, the FCC SAR equipment description lists a smaller measurement of around 200 by 140 by 105 mm (about 7.9 in), which looks like it may be a sub-assembly rather than the whole standing figure. I have not confirmed exactly what that FCC dimension was measuring, so treat the ~13 in as the real height and the FCC figure as a footnote.
