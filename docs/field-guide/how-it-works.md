# How the toy works

This is the "why does it act like that" page. The rest of the docs tell you which buttons to tap and how to rescue a stuck toy. This one opens the toy up (not literally, put the screwdriver down) and explains the model underneath, so the behavior you see in the app actually makes sense.

You do not need any of this to revive your toy. But I found the inside of this thing really charming once I understood it, and I think you will too.

*Not affiliated with, endorsed by, or sponsored by Marvel, Disney, or Sphero. This is a fan-made project to bring a discontinued toy back to life.*

## The two brains

The first thing that surprised me is that there are two brains in there, not one.

One is a small dedicated chip, a Tenx microcontroller, and its whole job is the real-time hardware. It drives the animated eyes, it fires the 38 kHz infrared "ping" the toy uses to sense things in front of it, and it watches the motion sensor. This chip never gets distracted. It just runs the body.

The other brain is a full little Android device tucked inside the figure, running an app. That is the part I would call the actual personality. It decides what to do next, picks the joke, runs the story, and tells the small chip what the eyes and body should do. So the toy is basically a self-contained Android computer wearing a Spider-Man costume, talking over a wire to a hardware controller that handles the twitchy real-time stuff.

Once you see it that way, a lot of the toy's behavior stops being mysterious. The higher brain thinks, the lower brain moves, and they trade messages back and forth.

## Personality is content, not code

Here is the part I really did not expect. The toy's personality is not baked into compiled software. It is data.

The jokes, the dialog, the stories, the reactions, the little games, all of it lives in downloadable "activity packs." Each pack is a bundle of small scripts. Change which packs are loaded and the toy behaves differently, and none of that requires rebuilding the firmware or updating the app. The behavior rides on top of the content.

Frankly, this is a smart way to build a talking toy. It meant Sphero could add a new villain or a new set of jokes by shipping new content, not new code. And for a preservation project like this one it is a gift, because keeping the toy's personality alive is really just a matter of keeping its content alive.

## How an activity runs

So what actually happens when the toy tells a joke? Each activity is a small script, and the toy runs it with an embedded JavaScript interpreter. Yes, there is a little JavaScript engine inside your Spider-Man toy. I laughed the first time I confirmed that.

The script does not do the hard work itself. It calls out to helpers built into the app:

- speak a clip
- animate the eyes
- play a sound effect
- listen for a phrase
- wait for motion or a tap
- save progress

A joke script might say: speak the setup, open a listening window, then speak the punchline. A story might animate the eyes, wait for you to answer, and save where you left off so it can pick back up later. The script is the director, and the helpers are the crew.

There is one more nice trick in how an activity gets picked. A spoken menu phrase resolves to an activity, but a lot of phrases actually resolve to a "selector," which just picks a random line from a pool of activities that all share the same name. That is why "tell me a joke" gives you a different joke almost every time. It is not remembering anything clever. It is reaching into a labeled bucket and pulling one out at random.

The interactive bits work the same tidy way. When a joke or a chat pauses for the kid, the toy opens a listening window for a few seconds and plays the payoff either on a recognized phrase or when the timer runs out. So the bit always finishes, whether the kid answers, mumbles, or wanders off. Needless to say, if you have ever watched a four-year-old "answer" a talking toy, you appreciate that fallback.

## Where the content lives (and the cloud's one job)

All of that content lives on the toy itself. This is the single most important thing to understand about reviving one.

Under the hood the storage is boring in the best way. There are per-pack SQLite databases, keyed by pack id and version, plus one shared flat folder of mp3 clips. Every spoken line maps to an mp3 by name. The audio is all the same format:

| Property | Value |
|---|---|
| Format | mp3 |
| Sample rate | 48 kHz |
| Channels | mono |
| Bitrate | 128 kbps |

When a toy is first set up, it self-extracts its entire content bundle out of the app, on the toy, with no network at all. After that it only reaches out to a cloud to pull updates. That is the whole reason most toys revive over Bluetooth with no Wi-Fi: the content was already inside them the day they left the factory.

So where does a cloud come in? Only in one narrow spot. A completely blank toy, one that has nothing loaded, needs content put onto it that first time, and that step originally came from Sphero's servers. Those servers are gone. This project runs a small replacement cloud that stands in for them for exactly that one-time, blank-toy step, and nothing more. Once the content is on board, the toy is on its own again. I want to be clear that the cloud is a stand-in for a discontinued service, not some always-on brain the toy phones home to.

## Voice recognition, entirely on the toy

The toy understands speech, and it does the whole thing on-device and offline. There is no server listening.

The recognizer is Cobalt "Rubik," which is a Kaldi-style, grammar-constrained decoder. In plain terms, it is not free dictation. It is not trying to transcribe anything you say. Instead each activity hands it a short, predefined list of phrases it should listen for, and it decides which of those (if any) it just heard. That is why the wake word and the menu phrases work with no internet: the toy already knows the small vocabulary it is listening for.

There is a catch worth knowing. The recognizer needs its own data files on the toy to work. A toy that got factory-reset can lose that data, and when it does, it can stop understanding speech until the data is restored. So if you ever meet a toy whose eyes light up and whose body works but who has suddenly gone "deaf," a missing recognizer is a prime suspect, not a broken microphone.

## Everything it says is pre-recorded

Every single thing the toy says is pre-recorded studio audio. There is no text-to-speech anywhere. Not on the toy, not in a cloud. That one fact changes how you think about the whole thing.

I checked this with the toy fully offline, and it holds up. The toy is not generating a voice, it is playing recordings, the same way a soundboard does. That is why the audio sounds so good, and it is also why the toy can only ever say names and powers that someone actually recorded in a booth. If a clip does not exist, the toy simply has nothing to play. The whole personality is a very well-organized pile of mp3s.

## How the hero name is spoken

This is where the pre-recorded model gets clever, and it is my favorite corner of the design. When you give your toy a hero name, the toy has to say it back. It cannot synthesize it, so it uses a three-tier fallback and reaches for the best option it has:

| Tier | What plays |
|---|---|
| 1 | A bundled combined clip for that exact name, if one exists |
| 2 | Otherwise, a combined clip cached from the cloud the first time the name is used online |
| 3 | Otherwise, the two chosen words played back to back as separate clips |

Tier three is the graceful catch-all. If nobody pre-recorded your specific two-word combination, the toy just plays word one, then word two, and it still sounds like it said your name.

The super-power is handled differently, and simpler. It is always a single pre-recorded combined clip, with no fallback at all. The reason is charming: the pool of possible powers is small enough that every combination could just be recorded ahead of time, so there was never any need for a fallback.

And here is the detail that ties it together. The hero-name and super-power scripts each end in a block of code that can never actually run, which lists every possible word and combination. It looks like dead code, but it is not junk. It is a manifest. It tells the content-build tooling exactly which clips to bundle, so the right recordings ship with the toy. I thought that was a genuinely elegant little trick.

One more thing to make the model click: when you choose a name or a power, the toy just saves your choice to its on-board profile. No audio gets made at that moment. The scripts simply read the saved choice later and play the matching clip. Choosing is bookkeeping. Speaking is playback.

## On-board voice services

I want to flag one finding carefully, because it surprised me and I would rather be honest than overstate it.

We found an Amazon Alexa voice service on the figure itself, not just in a phone app. That is unusual enough that I am reporting it as a documented on-device capability and not making bold claims about it. As far as we have seen it is present on the device, but I have not confirmed whether it was a live, active service or a bundled software kit that was never really switched on. Take it as an open question I am still chasing, not a feature to go looking for.

## Privacy: nothing is streamed

The toy has a microphone and it lives in a kid's room, so this is the part I care about most, and it is genuinely reassuring.

The toy does not record you and it does not transmit audio. The recognition runs entirely on the device, on that little offline decoder, matching against its short phrase lists. Your voice never leaves the toy.

Even guard mode, where the toy watches the room while you are away, only sends tiny state tokens across the link, things like "motion detected" or "alarm fired." It never sends voice or microphone audio. So the toy is watching for events, not listening in. That distinction matters a lot to me, and it is worth knowing when you hand one to a kid.

## Bluetooth: the consumer app link

Last piece. How does the phone app talk to the toy at all? Over Bluetooth LE, the same short-range wireless your phone uses for headphones and fitness bands.

That is the normal consumer path, the one the original app used and the one Second Life Toys uses now, for setup and everyday control. There is nothing exotic about it from your side. Turn on your phone's Bluetooth, keep the toy nearby, and the app and toy find each other. That is the whole transport.

All in all, that is the toy in one breath: a small Android brain full of pre-recorded content and a tiny scripting engine, wired to a real-time chip that runs the eyes and the body, listening offline for a handful of phrases, and reachable from your phone over Bluetooth. Once I understood that shape, reviving one stopped feeling like magic and started feeling like a repair, which is exactly what it is.