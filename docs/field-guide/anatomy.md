# Anatomy of the toy

I spent a lot of time inside this toy before I understood it, and I really wish a page like this had existed when I started. So here it is: what the Sphero Spider-Man toy actually is, part by part and chip by chip. Almost everything below comes from the public FCC filing (the paperwork Sphero had to submit to sell a radio in the US, teardown photos included) and from looking carefully at real units on the bench. Where the paperwork and the hardware disagree, I say so instead of picking one and pretending.

This is the physical-reference page. It does not cover how to rescue a toy or what the app can do. For that, start with [Getting started](../getting-started.md) and [What we support](../what-we-support.md).

## What it is (identity and regulatory)

The full retail name is a mouthful: the Sphero "Spider-Man Interactive App-Enabled Super Hero," model **SP001** (the worldwide retail SKU is **SP001ROW**). Sphero made it in Boulder, Colorado, under a Marvel license. It is the roughly foot-tall talking Spider-Man figure with the light-up eyes, not any of the rolling ball robots Sphero is better known for.

The regulatory IDs are stamped where every radio device stamps them:

| Field | Value |
|---|---|
| Model | SP001 (retail SP001ROW) |
| FCC ID | SXO-SP001 |
| Industry Canada (IC) | 10016A-SP001 |
| Korea (KC) | 012-160022 |
| Maker | Sphero, Boulder CO, under Marvel license |

The compliance label is molded right into the underside of one foot, so if you ever want to confirm what you are holding, tip it over and look at the feet. And because it is a certified radio, there is a public FCC record with real internal teardown photos, which is a big part of why we can write this page at all.

Here is one nice detail for anyone tracking versions: there are **two filings under the same FCC ID**. The original 2016 grant (dated 2016-07-05) covers board revision `Smart Toy-II-Main-V03`, and a 2017 Class II Permissive Change (2017-03-02) covers revision `V04`. Electrically they are the same design. I get into what actually changed in [The two board revisions](#the-two-board-revisions-and-the-motor-question) below.

**Size.** Marketing and the boxes call it about a foot tall, roughly 13 inches, and that matches how it feels in your hand. The FCC SAR paperwork lists a smaller figure, about 200 x 140 x 105 mm (call it 7.9 inches).[^size] I lead with the marketed height because that is the toy you actually own. My best guess is the FCC number is a sub-measure of the body rather than the full standing figure, but I have not confirmed exactly what they measured, so take the FCC dimension as "documented, probably a sub-assembly."

[^size]: FCC SAR equipment description for FCC ID SXO-SP001. The gap between the ~200 mm FCC figure and the ~330 mm marketed height is unresolved. My best read is that the FCC measured a body sub-assembly, not the full standing figure, but I would not swear to it.

## The head: the brain and the eyes

The whole computer lives in the oval of the head, under an RF shield.

The brain is an **Allwinner A33** system-on-chip: a quad-core ARM Cortex-A7 (the `sun8i` family, on an `astar_chiphd` board). It runs a headless build of **Android 5.1.1** (build `LMY47V`, SDK 22). "Headless" just means there is no normal phone screen or launcher. Android is running the whole thing, it just talks to you through eyes and sound instead of a touchscreen. If that sounds like overkill for a talking toy, I thought so too, and then I saw how much content it juggles.

Around the SoC:

| Part | Chip | Role |
|---|---|---|
| RAM | Samsung K4B4G16 | 512 MB DDR3 |
| Main storage | Samsung KLM8G1WEPD-B031 | 8 GB eMMC |
| Eye co-processor | Tenx TR16F900B | 16-bit MCU, drives the eyes over I2C |
| Eye frame store | Winbond W25Q128 | 16 MB SPI-NOR, holds eye animation frames |

The eyes are the part people fall in love with, and they are a lot more interesting than they look. Behind the faceplate is a single small **portrait TFT-LCD**, a real little screen, connected by a flex ribbon (an FPC). Both eyes are one display, not two fixed lenses. But the A33 does not draw the eyes pixel by pixel. Instead there is that dedicated **Tenx TR16F900B** 16-bit MCU sitting on the I2C bus, and it works like a closed animation co-processor: the main computer sends it a high-level command like "blink" or "look mad," and the Tenx chip replays a canned frame sequence on its own. You cannot just push arbitrary pixels at it. You pick from the expressions it already knows.

Those frames do not live in the 8 GB main storage. They get their own chip, a **16 MB Winbond W25Q128 SPI-NOR**, and they are burned into it at the toy's very first boot. Keeping the animation store separate from the main filesystem is a smart little design choice, because the eyes can play smoothly without waiting on the busy main storage.

The expression set you get at the consumer level is bigger than you would guess:

- Static faces: neutral, open, closed, blink, mad, skeptical, squint, roll
- Animated: smile/laugh, surprised, spider-sense, and a Venom face
- Five solid fill colors: red, green, blue, white, black
- PWM-adjustable backlight brightness (so the eyes can dim and brighten)

## The camera question

Here is one I have to be honest and hedged about, because I chased it for a while.

The A33 reference platform that this board is built on ships a full Allwinner camera pipeline in the kernel (the `VFE`/`V4L2` stack), and at boot the kernel dutifully tries to probe image sensors. So if you only read the software, it looks like there is a camera in here.

There is not, as far as I have seen. Every unit I have examined has **no populated camera module** and **no working video-capture nodes**. My read is that the camera code is a vestigial leftover from the reference platform Sphero started with, the kind of thing that gets carried along because nobody deletes it, not evidence of a shipped camera. And I want to say this clearly: I have not personally torn down every retail SKU ever made, so I am stating it as "no shipped unit I have seen had a working camera," not an absolute. If you ever find one that does, I would genuinely love to hear about it.

## Radios and antenna

There is exactly one radio in the whole toy, and it does double duty: a **Realtek RTL8723CS** combo module that handles both 2.4 GHz Wi-Fi (802.11 b/g/n) and Bluetooth/BLE. This is the radio the phone app connects to over Bluetooth, and the same radio the toy uses for the one-time Wi-Fi content step.

The antenna is a single internal antenna up in the head. It is fed by a coax cable running from a u.FL connector on the torso board (about 1.73 dBi, for the antenna nerds). One antenna, shared by Wi-Fi and Bluetooth.

The FCC numbers, for anyone who likes the specifics:

| Function | Band | Power |
|---|---|---|
| Bluetooth LE 4.0 | 2402-2480 MHz | under 10 dBm |
| Wi-Fi | 2412-2462 MHz (US channels 1-11) | under 20 dBm |

And the safety side, SAR (how much RF energy your body would absorb), which is the whole reason the size and antenna paperwork exists:

| Test | Face | Body |
|---|---|---|
| 2016 original | ~0.270 W/kg | ~0.225 W/kg |
| 2017 re-test | ~0.126 W/kg | ~0.123 W/kg |

The legal limit is 1.6 W/kg, so this thing is well under it, very comfortably. Frankly, for a toy that mostly sits on a shelf and talks, the RF exposure is a non-issue.

## Senses: chest button, motion, IR proximity, touch, microphone

The toy has more ways of sensing you than most people realize. Here is the whole list.

**Chest button (the spider emblem).** The spider on the chest is a single tactile/capacitive button. A short press is how you wake the toy or kick off an interaction, and it is the control you will use the most.

**Motion.** There is one motion sensor, a **Bosch BMA250** three-axis accelerometer. That single chip does all of it: shake, tilt, the "dodge" moments in play, and it also serves as a motion wake source (the toy can notice it has been picked up).

**IR proximity.** This is the sneaky-clever one. Up in the head there is a small daughterboard carrying an IR emitter, an IR photodiode, and a white LED, and together they form a reflective proximity/gesture sensor. It fires a fixed **38 kHz coded IR "ping" about 8 times a second** and watches for the reflection off a nearby hand. That is how the toy senses you reaching toward it. Two things worth knowing: it is **not** an IR remote receiver (you cannot point a TV remote at it and expect anything), and the pulses are actually visible if you look at the toy through a phone's IR-capable camera, including while it is charging. The first time I saw it blinking away on camera I thought something was wrong. Nope, that is just it sensing.

**Touch.** There are two capacitive touch points, left and right, and they are read through the same Tenx MCU that drives the eyes.

**Microphone.** An electret microphone on its own small flex PCB captures your voice for the toy's voice commands.

## Voice and sound

Sound comes out of a round dynamic speaker in the torso, driven through the standard Android audio path. Nothing exotic there.

The talking is a mix of two things: an on-device **Pico TTS** engine (a small text-to-speech voice that lives on the toy itself, no internet needed) plus a big library of **pre-recorded clips**. That combination is why the toy can say your custom hero name out loud and still deliver its scripted jokes and story lines in a proper performed voice.

The one change in the whole 2017 revision was about sound, and it is a really nice bit of engineering. The 2017 Class II Permissive Change added a **speaker-to-mic line-in reference path for acoustic echo cancellation**. In plain terms: the toy can now hear itself through a wire, so when it is talking and you talk back, it can subtract its own voice and understand you better. The radio was not touched at all. That was it. That was the entire difference the FCC re-test covered.

## Power: battery, charging, PMIC

The toy runs off a single LiPo pouch cell, a **PTI PL683086P**: 3.7 V nominal, 2000 mAh, 7.4 Wh, with a built-in thermistor for temperature safety. Real-world runtime is about 2 hours per charge, which honestly tracks with how mine behaves.

Two honesty notes on the battery:

- I follow the **FCC filing, which says LiPo**. You may see a stray summary somewhere call it "LiFePO4." That looks like a mistake, and the authoritative paperwork plus the photographed cell both say lithium-polymer, so LiPo it is.
- There is a genuine **label conflict on capacity**. The 2016 molded foot label reads 3000 mAh, while the 2017 artwork and manual read 2000 mAh. The cell actually photographed in the teardown is a 2000 mAh part. So the as-built battery is 2000 mAh, and the 3000 mAh reading looks like an early labeling error that got corrected later. If your foot says 3000, do not get excited, the cell inside is 2000.

Managing all of that is an **X-Powers AXP223** power management IC, which is the standard companion chip for the A33. It handles the power rails, charging, the fuel gauge, and even the audio in and out.

Charging happens two ways: a **micro-USB port in the underside of one foot** (5 V / 1.2 A), or the web-shaped **pogo-pin dock**. It is a Class II device rated to operate from 0 to 40 C and charge from 0 to 45 C, so it is a normal room-temperature toy, not something to leave in a hot car.

## How it comes apart

The layout follows the body, which makes it easy to picture:

- **Head (the oval):** the mainboard and the eye display live here, under the RF shield. The IR-proximity daughterboard and the antenna are up here too.
- **Neck:** carries the wiring harnesses between the head and the torso.
- **Torso:** holds the battery and the speaker, and the antenna's u.FL feed point sits on the torso board.
- **Feet:** one foot holds a small charge/reset PCB with the micro-USB port, the dock pins, and a reset button. The compliance label is molded into a foot.
- **Fists:** the red fists are separate pull-off parts. They come off, and that is by design, not you breaking anything.

One flash chip is worth calling out because people mix it up with the main storage. There is a **16 MB Winbond SPI-NOR near the micro-USB** that holds the bootloader and its environment as well as the eye-animation frames. That is not the 8 GB main storage. It is the little chip that gets the toy up and running before the big storage even matters.

## The two board revisions and the motor question

As I mentioned up top, there are two board revisions on record: `Smart Toy-II-Main-V03` (silkscreened right on the board) and `V04`. The back label indicates the build I have described: an 8 GB flash and 512 MB RAM configuration with the RTL8723 Wi-Fi/BT combo. Electrically the two revisions are the same design, and the only functional change between them was the echo-cancellation audio path I covered under [Voice and sound](#voice-and-sound).

Now the honest discrepancy, and I do not have this one fully nailed down.

The **FCC internal photos of both board revisions clearly show a DC motor plus a plastic gearbox actuator**. On paper, this toy has a moving part. But every unit I have examined in detail had **no vibration motor and no actuator at all**, and behaved as a stationary talking figure: eyes and sound, nothing that moves. So there is a real gap between what the FCC teardown shows and what the toys on my bench actually contain.

I am presenting this as a documented discrepancy, not a conclusion. Maybe some retail units shipped with the motor populated and others did not. Maybe the motor was designed in, photographed for certification, and then cut before or during production. I do not know yet. If you have a unit that physically moves, or that clearly has a motor inside, that would answer a question that has bugged me for a while.

## Sources (FCC filing and teardown)

Almost everything here traces back to two places:

- **The public FCC filing for FCC ID SXO-SP001**, including the 2016 grant (board rev V03) and the 2017 Class II Permissive Change (rev V04), the internal photos, the SAR reports, and the equipment descriptions. Intertek Hong Kong did the radio and SAR testing in a semi-anechoic chamber. For the trivia lovers: the tightest margin in the whole test was a restricted-band emission at **201.569 MHz that passed by just 1.0 dB**. That is the closest this toy ever came to failing certification, and it still passed.
- **Direct teardown observations** from real units on the bench, which is where the camera and motor discrepancies came from, and where I could confirm the chips and the battery against the paperwork.

All in all, what surprised me most is how much real computer is hiding inside a talking Spider-Man doll: a quad-core Android machine, its own animation co-processor for the eyes, five different ways to sense you, and a couple of genuine mysteries the paperwork and the hardware still argue about. If you own one of these, you are holding a much stranger and more capable little machine than the box ever let on. And that, honestly, is a big part of why I think it is worth saving.