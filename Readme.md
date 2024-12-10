## What

(2024-12)

Framework tool. Install/remove all my libraries (or repositories).

Install/remove libraries (to `libraries` dir in Arduino IDE. No overhead)
  * [InstallLibs.sh](InstallLibs.sh)
  * [RemoveLibs.sh](RemoveLibs.sh)

Install/remove repositories (to current dir. Git overhead but hey you can develop!)
  * [InstallRepos.sh](InstallRepos.sh)
  * [RemoveRepos.sh](RemoveRepos.sh)

#### Why

Single repository model used by Arduino IDE (and inherited by
`arduino-cli`) is awful.

I'm crafting in code units. Here it means "C++ library". Any of that
"library" is stand-alone repository. And it has dependencies of
other "libraries". Which are also repositories.

Arduino CLI doesn't support this structure. Only if all my "libraries"
were in global repository. Which is not gonna happen.

(I'm spitting on `semver`. I'm laughing at people suffering submitting
"pull requests" when they want to update their library version.
I'm sorry for them if they decide to rename or (oh God!) *remove*
library because they want so.)

I'm suffering too. Say some code I want to publish is using "library"
(unit) `[me_Console]` for it's demo example. `[me_Console]` is using
other units like `[me_Uart]` and `[me_String]` in it's implementation.
I have to include all those used units in installation/removal scripts.
That sucks.

#### How

Here I'm providing scripts to install/remove *all* my units.

That sucks too because likely you don't need em *all* for some project.
Shit, it's like dreaded Microsoft's C# Framework..

But I don't want to suffer by manually maintaining deployment scripts
for near two dozen repositories. And I don't see sane way to do it
in current infrastructure for Arduino IDE libraries.

Solution here is nice and simple.

Three layers: data, driver, callers.

Root data are in [LibrariesList.txt](LibrariesList.txt).
That's line list of core names.

There is code for that data: [LibListTools.sh](LibListTools.sh).
It can augment those data to library names (with `me_` prefix), to
Github's repo name (`Embedded-` prefix), to gh's url, to git `clone`
and to `arduino-cli install`. Plus deinstallation of course.

So main scripts are just two-liners loading that code and calling
needed function.

## Requirements

  * arduino-cli
  * bash

## See also

* [My other embedded C++ libraries][Embedded]
* [My other repositories][Repos]

[Embedded]: https://github.com/martin-eden/Embedded_Crafts
[Repos]: https://github.com/martin-eden/contents
