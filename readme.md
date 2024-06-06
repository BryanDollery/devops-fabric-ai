# Devops and Software Engineering patterns

# Fabric
The excellent ![Fabric tool from Daniel Miessler](https://github.com/danielmiessler/fabric) is a game changer for AI utility for me. I'm a software engineer, currently specialising in devops, so I have been making fabric even more useful to me, initially by adding some patterns that can help me with my work, and then by simplifying the use of those patterns and caching the output for later, but in a useful way.

## Patterns
These patterns have been carefully created by a senior engineer to help in his own day to day work. They all setup a context of being a very senior engineer with great communication skills, and they expect you to be the same.

## Functions
You can use these patterns any way you please, but I've included a bunch of functions that, I think, makes Fabric that much more useful.

What I've done is cached your requests and resopnses, in a journal like structure. Quite useful for seeing what you've been doing and performing other analysis, and also quite useful for just basic caching. I've written two files -- one a full md file, the other just a copy of the raw output, which is more useful for piping into other commands.

These function use the environment variable BRAIN to indicate where they should store their output, and you need to source the functions, so start with something like this:

# Usage
## Configuration
```
export BRAIN=$HOME/git/brain
source functions.sh
make
```

The cheeky little `make` I threw in there at the end deploys the custom patterns to the fabric patterns directory. Because of the way fabric works, you will have to do this every time you update the fabric patterns.

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

# Caveats and Future
I've hardcoded some paths in here, and the model

I'm going to keep working on this, because it's really interesting!!!
