# Vertical Antenna Considerations for Fall 2016

I want to install a vertical antenna at my house.  I was orignally
considering a vertical antenna installed on teh roof but the more I've
learned abou the ground plane requirements for such and antenna the more
I've decided that it should be stood on the ground.

## DX Engineering Parts List

 - [6BTV and Kit](https://www.dxengineering.com/parts/dxe-hsr-5btv-p1)
 - [Extra Radial Hardware](https://www.dxengineering.com/parts/dxe-radp-1hwk)
 - [Extra Radial Kit](https://www.dxengineering.com/parts/dxe-radw-1000kbd)
 - [Extra Radial Anchors](https://www.dxengineering.com/parts/dxe-stpl-100bd)

Using the analysis in the [Maximum-Gain Radial Ground Systems for
Vertical
Antennas](http://ncjweb.com/bonus-content/k3lcmaxgainradials.pdf)

[Ground System Experiments - N6LF](http://www.antennasbyn6lf.com/2009/12/series-of-qex-articles-on-ground-system-experiments.html)

I have determined that using 30 Radials running them out as far as
possible at each radian angle is a pretty good optimum for my purpose
without needing too much wire.  This will be about 350m of wire.

If desired we could then run an other 15 or 30 10m radials, we'll see
how we feel at that point.

Looking at the [results of DH1TW homebrew conductivity
study](http://www.hsfdg.org/wiki/OptimalRadials) I suspect that a good
value for local conductivity is around .001 S/m, but it may well be
a little lower given the top soil remove during construction of my
house.  But if .03 S/m is really good and 0.005 is kinda average then I
think that the value of 0.01 S/m is an adequate start.

[Summary of N4UU and the Maximum-Gain article
above](http://www.hsfdg.org/wiki/OptimalRadials), can help with
calculating the optimum radial length.  So let's try it...

    n = 2.25 * sqrt( sqrt( s * f )) * sqrt(L)

    s is soil conductivity in S/m (average is 0.0045 S/m)
    f is design frequency in MHz
    L is total radial wire length in feet

    n is number of radials to cut into

    n = 2.25 * sqrt( sqrt( 0.01 * 3.9 ) ) * sqrt( 2500 );

    n = 50; 2500 / 50 = 50;

This [3.9MHz Graph on Desmos](://www.desmos.com/calculator/po0lvwwsxa)
shows that it's better to have longer radials at this frequncy (given a
modest amount of wire ~300m).

As you move up an examine the [14.275
Graph](https://www.desmos.com/calculator/enko37folc) and the [29MHz
Graph](https://www.desmos.com/calculator/6vdhj293xy) you can see that a
much higher number of verticals rapidly becomes beneficial.

From [Ground-Mounted Verticals - Slide
Show](http://slideplayer.com/slide/6165940/) I determine that I can
consisder my 'ground' to be pretty good. Conductivity 0.01 and
Dielectric Constant 15.

[Cool mods for 5BTV](http://www.ccars.org/projects/BTV/tech_5btv.htm)

[NEC Tutorial](http://www.qsl.net/4nec2/Tutorial.pdf)

## Get the Antenna Book

So it occured to me that I should look inside the Antennal book that my
friend Aaron lent me to see if it could help with my Ground Plane
questions.  Turns out that there was the information that I
needed.  Section 3.2.3 Wire Ground Systems was exactly what I needed and
included the 'Optimizing Radial Lengths' information that demonstrated
how to optimize for the total amount of wire that we want to put down.

So go buy the antenna book.

## To Model the Ground Radials

I used a sketchup of my lot layout (used over the years for many
projects).  I created a circle centered on a decent position for the
antenna and set it's segment count to 30.  I used the segment junctions
and the center point to draw 30 construction lines.  I then drew in the
radials with the line tool, took the total length and then doubled it
for 60 radials.

## There is a bug in cocoaNEC

If I'm understanding correctly, there is a bug in cocoaNEC that doesn't
turn on radials in the Radiation Pattern (RP) cards correctly.  It will
turn them on in the Ground parameters (GN) card but if they are not
activated in the RP card correctly then they will be ignored.  To turn
them on in the RP card a number 4 must be used in the I1 field.

### Compiling NEC-2 for Mac OSX

Use homebrew gcc and `make CC=gcc-5`


## Transmission Line (AKA Feedline)

[eham discussion on RG Numbers](http://www.eham.net/ehamforum/smf/index.php?topic=96364.0)

[Good discussion on eHam regarding feedline choke](http://www.eham.net/ehamforum/smf/index.php?action=printpage;topic=108887.0)

[Common Mode Choke Designs](http://www.karinya.net/g3txq/chokes/)

[Wireman Coax](http://thewireman.com/coax.html)

I had to stop trying to talk myself into the Super8 213 cable.  But in
the end it's twice the size and twice the cost.  An in the end my
buddies will make fun of me for over optimizing.  And since I already
have to explain away an arguably over-big radial field I'm going to let
this one go.

It's kinda funny.  I've been agonizing over this for hours.  Part of
myself was REALLY trying to talk an other part of myself into getting
Super8.  But now that I've decided on Mini I have a little smirk to
myself.


Amaizing order of 1000' Beldin RG-8X for $1.99 on Amazon... it may not
work but we'll see.

### MaxGain
[7500-8X UHF Male Plug](http://www.mgs4u.com/RF-adapters.htm)
[7511 SO-329 4Hole Panel Socket](http://www.mgs4u.com/RF-adapters.htm)

Using the 7511 at the radial plate.  It will take some extra weather
proofing but it's probably better that an extra bulkhead and plug in the
way.  We'll just go straight to the radial plate with the panel mount
and then use a plug on the ohter side for the antenna pigtail.

## How to suppress Common Mode current on the outside of Coax Shield

Ordered 2 [FT-240-31 Ferrite Toroids from JPM Supply](http://www.jpmsupply.com/Toroid-Core-FT240-31-Ferrite-p/38022.htm)

I'll use 8 turns around this at the feed point and just before the
house.

Using Coax-Seal for exposed joints.
