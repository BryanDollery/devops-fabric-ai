# Devops and Software Engineering patterns

These patterns have been carefully created by a senior engineer to help in his own day to day work. They all setup a context of being a very senior engineer with great communication skills, and they expect you to be the same.

You can use these patterns any way you please, but I've included a bunch of functions that, I think, makes Fabric that much more useful.

What I've done is cached your requests and resopnses, in a journal like structure. Quite useful for seeing what you've been doing and performing other analysis, and also quite useful for just basic caching. I've written two files -- one a full md file, the other just a copy of the raw output, which is more useful for piping into other commands.

These function use the environment variable BRAIN to indicate where they should store their output:

```
export BRAIN=$HOME/git/brain
```

The basic functionality is really easy to use:

```
script "show me how associative arrays work in bash"
```

or 

```
tool "rpi5 less but with markdown support"
```

Or

```
installit "glow, the bash md renderer, for the rpi5" | bash
```

The output is shockingly good, and it's all cached in your 2nd brain and indexed in daily digests.

Wonderful
