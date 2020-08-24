# Project: Gathering Platform [WIP]

Welcome to Project: Gathering Platform - a platformer about gathering resources and using it to purchase player abilities, level modifiers and more!

The gameloop is as following; You spawn in at a local tavern. Here you have several options, which is explained below, but eventuality you will enter the portal and the journey of gathering resources has started. You then run, jump and glide through a level collecting resources and one way or the other end up back at the tavern. Here you spend the collected resources and then enter a now more difficult and rewarding level. The game currently contains no final win condition.

## Tavern

![IMAGE OF TAVERN](https://github.com/judo347/Project-GatheringPlatform/blob/master/GIFS/img/homebase.PNG)

The tavern is your home. It is where you start and where you end up after finishing a *Level*. The tavern provides benches, used to upgrade the character and level, several characters to choose from, and a portal which leads to the *Level* where resources is collected.

![GIF OF PORTAL](https://github.com/judo347/Project-GatheringPlatform/blob/master/GIFS/portalGif.gif)

### Benches

Benches are where you convert the gathered resources into skill points and where skill points are spend. These can be used to purchase upgrades which changes the *Level* or gives the character additional abilities.

![IMAGE OF bench Converter](https://github.com/judo347/Project-GatheringPlatform/blob/master/Project-Gathering%20Platform/resources/01/BenchConverter001.png)

The *Converter* bench, is used to convert gathered resources into skill points, which can be spend on upgrades at the other benches.

![IMAGE OF bench Unique Abilities](https://github.com/judo347/Project-GatheringPlatform/blob/master/Project-Gathering%20Platform/resources/01/BenchUniqueAbilities001.png)

The *Unique Ability* bench, is used to unlock perks which changes the gameplay. These are *No Death Penalty*, which prevents lose of resources on death, and the *Flip World* ability, which flips the *Level* upside-down and thereby reversing gravity.

![IMAGE OF bench Level mod](https://github.com/judo347/Project-GatheringPlatform/blob/master/Project-Gathering%20Platform/resources/01/BenchLevelMod001.png)

The *Level Modification* bench, is used to add/increased modifiers to the *Level*. These modifiers are: danger, material yield and player movement speed. Spending skill points on these will modify and ultimately increase the resource yield of the *Level*.

![IMAGE OF bench Char mod](https://github.com/judo347/Project-GatheringPlatform/blob/master/Project-Gathering%20Platform/resources/01/CharModBench001.png)

The *Character Modification* bench, is used to unlock and give the player new abilities, such as: double jump and slide.

### Characters

![IMAGE OF CHAR01](https://github.com/judo347/Project-GatheringPlatform/blob/master/Project-Gathering%20Platform/resources/01/Character001.png)![IMAGE OF CHAR02](https://github.com/judo347/Project-GatheringPlatform/blob/master/Project-Gathering%20Platform/resources/01/Character002.png)![IMAGE OF CHAR03](https://github.com/judo347/Project-GatheringPlatform/blob/master/Project-Gathering%20Platform/resources/01/Character003.png)

The game contains three characters to freely choose from. You can change to any of them in the tavern. They currently have no differences, but this will be implemented in the future.

## The Level

![IMAGE OF LEVEL](https://github.com/judo347/Project-GatheringPlatform/blob/master/GIFS/img/level02.PNG)

![IMAGE OF MAT01](https://github.com/judo347/Project-GatheringPlatform/blob/master/Project-Gathering%20Platform/resources/01/Material001.png)![IMAGE OF MAT02](https://github.com/judo347/Project-GatheringPlatform/blob/master/Project-Gathering%20Platform/resources/01/Material002.png)![IMAGE OF MAT03](https://github.com/judo347/Project-GatheringPlatform/blob/master/Project-Gathering%20Platform/resources/01/Material003.png)![IMAGE OF PODIUM](https://github.com/judo347/Project-GatheringPlatform/blob/master/Project-Gathering%20Platform/resources/01/LevelPodium001.png)

The *Level* is where resources is collected. The *Level* contains a series of platforms where resources are placed and has to be traversed with the goal of reaching the podium.

The *Level* is generated based on several factors like the players jump height, abilities and other modifiers unlocked through benches in the tavern.

The player will exit the *Level* in two ways resulting in being teleported back to the tavern. Either by falling off a platform into the abyss or by touching the podium located at the end of the *Level*. If the player falls of the platforms he will loose some percent of the resources collected - if the *No Death Penalty* has not been purchased.

The *Level* gets harder each time the player completes it by reaching the podium. 



## Outro

Project: Gathering Platform was started with the aim of learning to develop games. Everything in the game is made by me - even the music. The game is made with Godot using their GDScript language. This engine was chosen since it is the competitor to Unity and I wanted to try something other than Unity.
The project at first, was made with LibGdx and Java, and since ported to Godot and GDScript.