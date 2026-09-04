# The game: story, activities, and personalization

*Not affiliated with, endorsed by, or sponsored by Marvel, Disney, or Sphero. This is a fan project to bring a discontinued toy back to life.*

This page is about the game the toy itself plays. Not the app. The app has buttons that trigger things (that is covered in [What we support](../what-we-support.md)), but the toy is the thing running the actual story, keeping the actual score that has no numbers, and talking back to you. I spent a long time listening to what this figure can do, and honestly it is a lot more of a game than I expected from a talking toy. So here is the whole thing, as best as I have been able to piece it together.

If you just want to know which button in the app fires which activity, go read [What we support](../what-we-support.md) instead. This page is the lore and the mechanics behind those buttons.

## What playing it is like

The toy is a roughly 13-inch talking Spider-Man figure.[^height] There is no screen anywhere on it. Everything you do, you do by talking to it, pressing its chest button, or moving it. That is the whole interface. You say "tell me a joke" and it tells one. You say "go on patrol" and it goes on patrol. You attack a villain by shouting "attack" at the right moment. It is closer to a very chatty audio game than to a phone app, and I think that is what makes it hold up. You are not staring at a display, you are having a conversation.

Because there is no screen, the toy leans hard on voice recognition and pre-recorded audio. When it was new it understood something like 94 spoken commands, and it has a large library of recorded lines to answer with. It listens, it figures out what you said, and it plays the matching clip. Simple idea, and it works really well.

## Progression without points

Here is the thing that surprised me most. There is no score. No stars, no coins, no XP bar, nothing to grind. I kept looking for the point economy and there just isn't one.

Instead the game tracks your progress with a handful of named story-state markers, and it gates them behind two things: real-world time that has actually passed, and content the toy has unlocked. You cannot rush it. The pacing is deliberately slow, hours to days between story beats, so the game unspools over weeks the way a serialized show would.

Three independent markers do the bookkeeping:

| Marker | What it tracks |
|---|---|
| Training status | Whether you have finished the combat tutorial |
| Main-story pointer | Where you are in the villain campaign |
| Villains-defeated count | How many villains you have beaten, up to 4 |

And then there are two hidden values the toy keeps that nothing ever shows you:

- A **trust meter**, 0 to 100, a quiet karma score for how you play.
- An **ambient crime level**, 0 to 3, that creeps up when you ignore the toy.

Frankly, a kids' toy with a hidden karma system that reacts to whether you're honest or a show-off is a wild design choice, and I love it for that. More on both of those below.

## The training tutorial

Before the story opens up, you do combat training once. This is the gate. Side content stays locked until you finish it, and the very first win hands you off to the main campaign.

The combat loop is two voice commands. When the villain attacks, you say **"defend."** When the villain is vulnerable, you say **"attack."** Land three hits and you win round one. You lose if you miss three defends, or if the roughly 120-second timer runs out first. That is the core fight mechanic for the whole game, so it is worth getting a feel for the rhythm early.

There is a nice little bonus buried here. If you go back and replay the training and post a high score, you unlock a hidden Simon-Says minigame. As far as I have seen, most people never find it, because who replays the tutorial. But it's there.

## The villain campaign

The main story is a fixed chain of four villains, always in this order:

**Mysterio, then Electro, then Kraven, then Doc Ock.**

A counter tracks how many you have defeated, up to 4. Now, here is where I have to be honest about what actually shipped versus what exists in the files.

- **Mysterio and Electro** are the fully finished, wired-up playable path. That part works the way you'd expect.
- **Kraven** is confirmed completable. I have seen it done, but only on a save that had been played for a very long time, so it sits behind a lot of that slow pacing.
- **Doc Ock** is the strange one. A complete Doc Ock mission exists, the "Roxxon reactor" infiltration, and it is genuinely playable. But as far as I can tell it was never actually wired into the campaign. So there is no explicit win screen, no credits, no "you beat the game" moment. The story just kind of runs out of connective tissue before the last boss.

### The Roxxon / Doc Ock mission

Since it's playable, here is roughly how it goes. It is a room-by-room infiltration, and you navigate by saying locations out loud to move through the building. There is a reactor puzzle in the middle where you say, in order, **"computer," "automated systems," "oxygen level," "yes,"** and then **"reactor test."** Then there's a boss battle whose ending changes depending on how many mistakes you made along the way.

One handy detail: each boss mission has an internal resume checkpoint, so if you stop partway through, it picks up where you left off rather than starting over.

### How slow is "slow"

Really slow. I looked at one save that had been played on and off for about three years, and across roughly 121 main-story sessions it had only reached Kraven-done and the very start of Doc Ock. So this is not a weekend game. It is designed to be a little bit at a time, for a long time.

## The hidden trust meter and school side-stories

The trust meter is the part I find most charming. It is a silent 0-to-100 value, and nothing in the game ever tells you it exists or shows you the number. It just quietly watches how you play.

Playing restrained, honest, and civilian-first raises it. Showing off, sneaking around, hiding, or blowing action beats lowers it. Big decisive moments move it more than small ones, and the mission finales scale it by how many civilians you actually saved. So the game is rewarding a certain kind of hero, gently, without ever nagging you about it.

Trust does not gate the main campaign. What it gates is a set of optional school side-stories, which is a whole slice-of-life track running alongside the superhero stuff:

- Around trust **15**, a **Track & Field** story opens up.
- Around trust **30**, a branching **Flash Thompson** arc opens, full of Peter-versus-Spider-Man choices.
- The school router will skip ahead on weekends, so the school stuff has its own little sense of a calendar.
- There is an **Aunt May heart-to-heart** that raises trust when you're honest, and the single biggest trust gain in that whole conversation comes from choosing to keep her secret.

I really like that the reward for being a good, low-key hero is more ordinary teenage-Peter content. It fits the character.

## The free-play menu

When you are not in a mission, the toy sits in a home loop. It idles, and after about 30 minutes with no motion it drops into a low-power standby (any motion wakes it back up). Say **"go to sleep"** and it goes into a deeper sleep on purpose.

Any wake, or any chest press, drops you into the voice menu, which is the hub of the whole free-play experience. The hub listens for something like 190 phrases, and roughly 150 of those are just conversational question-and-answer. You can genuinely just talk to it.

The menu commands are the load-bearing ones. A sampling:

- **"tell me a joke"**
- **"go on patrol"**
- **"what's the crime report"**
- **"guard my room"** / **"activate guard mode"**
- **"stand down"**
- **"let's chat"**
- **"go to sleep"**
- **"be quiet"**
- **"let's play"** / **"fight"** / **"story"**

A quick note on the different numbers you will see thrown around, because they measure different things and it's easy to read them as contradicting each other:

| Count | What it actually measures |
|---|---|
| ~94 commands | Top-level spoken commands the toy understood when new |
| ~190 menu phrases | The free-play hub's listen list (~150 of them conversational Q&A) |
| 83 Ask Spidey tiles | The app's grid of promptable voice commands |
| Recognizer word list | The raw dictionary of words the speech engine knows |

None of those contradict each other. They are a command set, a phrase list, an app grid, and a raw dictionary, respectively.

### Jokes

There are 76 unique jokes. Ask for one and it plays a random joke with an animation, and then about half the time it offers **"another joke?"** so you can loop into another. Simple, and it holds up better than you'd think for 76 lines.

### Patrol

"Go on patrol" is a framing wrapper. It launches a light side-mission, and it can also quietly nudge the main story forward, so patrol is not purely filler. It's a low-commitment way to keep the campaign inching along.

### The crime report

The ambient crime level is 0 to 3. It rises by one for each idle day you neglect the toy, and it caps at 3, which the toy calls **"Extreme."** Playing any mission resets it back down. Saying **"crime report"** just reads the current level out loud, it never changes it. So the crime report is a guilt trip, basically. Leave your toy in a drawer for four days and it will tell you the city has gone to Extreme.

### Guard mode as a game mechanic

Guard mode shows up as a control card in the app, but in the game it is a real little mechanic. You arm it by voice, and then the toy goes to sleep and treats any motion as an intrusion. It calls out **"who's there!"**, logs up to several disturbances with timestamps, and when you say **"stand down"** it reads the whole report back to you. It also reacts to being flipped upside down. So it is half security camera, half bit. (The app's Guard Mode card is the same feature, just triggered from the phone instead of by voice.)

### Hang-Out chats

Saying **"let's chat"** opens conversations, like a Homecoming chat or a Doc Ock story chat. These are the same things that appear as the **"Hang Out"** tiles in the app. Same content, two doors into it.

### The alarm

The toy can be an alarm clock. It plays a looping Spider-Man alarm until you dismiss it, and it supports per-weekday repeats that persist across reboots, apparently for years. One real limitation worth knowing: the toy cannot set its own absolute clock over Bluetooth. To actually know what time it is, it needs Wi-Fi and network time. The timezone can be provided separately, but the wall-clock itself needs the network. (This matches the Alarm card in the app.)

## Personalization: hero name, power, and birthday

You do not have to be Spider-Man. Well, you are, but you get your own hero identity on top.

**Hero name** is a two-part name you pick in the app: a prefix plus a suffix. There are 20 prefixes and 20 suffixes, which is 400 combinations, and every single combination has its own recorded clip. The flavor is fun: prefixes like *amazing, spark, frost, sonic*, suffixes like *wolf, raven, king, shark*. You pick, and the toy actually speaks your chosen name out loud.

**Super-power** works the same way, 20 by 20, another 400 pre-recorded combinations. And here's a nice touch: the suffix you pick for your power also selects a background sound effect, so your power has its own little audio signature.

Both of these are app-driven. The name and the power are chosen in the app and pushed over to the toy, which only reads them back and speaks them. The app also lets you record a custom spoken name in your own voice for the toy to play back, if none of the 400 combos are quite you.

**Birthday** is the one piece of personalization the toy captures itself, no app needed. In a chat it asks you what month you were born, and then it plays a matching birthday greeting. Small thing, but it's the only self-captured personal detail in the whole game, which makes it kind of sweet.

## Easter eggs

There are a bunch of hidden things, and some of them are clearly the developers having fun.

- **Developer hero names.** There are roughly eight hidden hero names that are just members of the original team: *codeman, chris, isaac, yunja, naoko, rydawg, andrew, sally*. Each one has its own dedicated voice line, and they are only reachable under a special team identity, so a normal player would never stumble into them. It's a little signature hidden in the toy.
- **Menu easter eggs.** There's a Winter Soldier trigger word, and a "toggle pop mode."
- **The swear jar.** If you swear at it, it scolds you. And if you keep going, on the ninth swear in a row it plays a longer "wash your mouth out with soap" monologue. Somebody wrote a whole escalating bit for the kids who were absolutely going to test this. Needless to say, that is exactly the kind of detail I'm glad got preserved.

## Seasonal and special content

A couple of things exist that are not part of the normal loop at all.

**Watch With Me** is the one that really got me. The toy will watch a Spider-Man cartoon *with* you. The phone's microphone listens to the show's audio, figures out exactly where in the episode you are by fingerprinting the sound, and then drops scripted commentary in at the right timestamps. It's basically the toy doing a running MST3K bit over the cartoon. This was built for 21 preserved episodes.

**New Year's Eve 2017** was a one-off countdown. The toy does a choreographed eye animation: a smile, then rapid 10-to-1 blinks for the countdown, then a "Happy New Year" surprise at the end. A single-night feature that most owners probably never saw, and it survived.

## Two content waves: 2017 and 2018

The content came in two waves, and it helps to know which is which because the second one is a real expansion, not just a patch.

| | 2017 baseline | 2018 refresh |
|---|---|---|
| Rough pack ID range | up to the low 500s | roughly 510-659 |
| Scope | the original shipped game | a larger content update |

What the **2018 refresh** added, specifically:

- Expanded villain and hero **"talk about"** lines.
- **Kraven** as a villain (the third campaign boss).
- **Trivia, quiz, and drawing** minigames.
- Extra tips.
- The swear-response packs.
- An **Iron Man / Tony Stark "alien tech"** chat branch.
- A **stealth minigame** where you sneak up on Spidey, with its own best-record flag.

So if a toy feels thin on content, it may just be sitting on the 2017 wave and missing all of that. The 2018 material is a meaningful chunk of the game.

### What the toy could do when new

For a sense of scale, a fresh toy came with something like 94 spoken commands. That included villain lore about nine villains (Venom, Carnage, Doc Ock, Electro, Kraven, Lizard, Mysterio, Vulture, Green Goblin, plus J. Jonah Jameson), banter about a long list of Marvel heroes, personality Q&A, jokes, stories, games, missions, and the alarm. It was a full little world out of the box.

### Ask Spidey and unlocking

The **Ask Spidey** grid is a fixed list of 83 voice-command tiles. A base set is always available, and the rest are designed to unlock as a kid discovers hidden phrases over time. The toy records which ones have been triggered, so it knows your discovery progress. For a sense of how the pacing lands in practice: one heavily-played save had only found 38 of the 83. Even a well-loved toy leaves more than half of it undiscovered, which tells you how much is buried in here.

### Team Up

The toy can pair with a second toy. Team Up records a teammate alias and powers that are kept distinct from your own, and this is a genuine device-to-device pairing. I've confirmed it working between two physical toys, so it's a real two-toy feature, not just app flavor.

## Shipped-game quirks

Every game ships with bugs, and this one is no exception. Two of them are baked into both content waves and are actually kind of interesting.

- **The Aunt May trust bug.** A trust variable is misspelled, and because of that the first Aunt May trust-gated conversation can never actually trigger from earned trust. The gate is looking at a name that doesn't exist, so it never opens. That heart-to-heart is sitting right there, and the earned-trust path to it is quietly broken.
- **The Electro reverse-karma bug.** The Electro fire-rescue penalty is computed with the wrong sign. So instead of docking your trust for failing to save civilians, it *raises* it. In that one mission, being bad at the rescue makes you a better hero on paper. Nobody caught it, and it shipped in both waves.

I point these out not to dunk on the developers, who clearly cared a lot, but because they are part of the real, preserved game. If you ever wonder why an Aunt May conversation won't fire, now you know.

## A note on localization

The product and its marketing were localized into a wide set of languages: English, French, Italian, German, Spanish, Portuguese, Japanese, Korean, Simplified Chinese, and Traditional Chinese. So this was a real global toy, not an English-only release, and that scope is part of why there's so much content to preserve in the first place.

---

All in all, the thing that keeps striking me is how much actual game is hiding inside a foot-tall plastic Spider-Man. A slow-burn campaign, a secret karma system, school side-stories, a security mode, a watch-along feature, and a swear jar with a nine-strike payoff. Most of it, most kids never saw. That is exactly why it's worth keeping alive. If you want to know how to trigger any of this from the app, the [What we support](../what-we-support.md) page maps the app's cards onto the in-game meanings covered here.

[^height]: I lead with the marketed size of about 13 inches, which is what the packaging and the collector sources all say. There is one official technical filing that lists a smaller sub-measure (around 200 x 140 x 105 mm), and I'm not fully certain yet whether that dimension is describing a sub-assembly rather than the whole standing figure, so treat the exact millimeter figure as documented-but-unconfirmed. The marketed roughly-13-inch figure is the safe answer.