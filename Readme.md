## What

(2024-12)

Framework tool. Install/remove all my libraries.

#### Why

Single repository model used by Arduino IDE (and inherited by
`arduino-cli`) is awful.

I develop in code units. Here it means C++ "library". Any of that
"library" is stand-alone repository. And it has dependencies of
other "libraries". Which are also repositories.

Arduino CLI doesn't support this structure. Only if all my "libraries"
were in global repository. Which is not gonna happen.

(I'm spitting on `semver`. I'm laughing at people suffering submitting
"pull requests" when they want to update their library version.
I'm sorry for them if they decide to rename or (oh God!) *remove*
library because they want so.)

I'm suffering too. Say some code I want to free is using "library"
(unit) `[me_Console]` for it's demo example. `[me_Console]` is using
other units like `[me_Uart]` and `[me_String]` in it's implementation.
I have to include all those used units in installation/removal scripts.
That sucks.

#### How

Here I'm providing two scripts: install and remove all my units.

That sucks too because you don't need em all for any project.
But I don't want to suffer by manually writing install scripts for
near two dozen repositories.

## Requirements

  * arduino-cli
  * bash

## Install

Run [Install.sh](Install.sh).


## Remove

Run [Remove.sh](Remove.sh).


## See also

* [My other embedded C++ libraries][Embedded]
* [My other repositories][Repos]

[Embedded]: https://github.com/martin-eden/Embedded_Crafts/tree/master/Parts
[Repos]: https://github.com/martin-eden/contents
