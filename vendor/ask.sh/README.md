# Simple interactive incremental configuration for bash scripts

> Note: it feels like something like this should already exist, and yet I
> couldn't find anything that quite fits the bill. I'll be happy to find
> someone elses tool so that I can stop wasting time ;)

To use this library just source it from your bash script and call the API functions:

## Purpose

This library ask user predefined questions, remember results for the next time, allow to
conditionally expecute code blocks based on the answers.

What for? Well, I wrote it to be able to conditionally generate ~/.vim configs
with on/off features for various features.

## Examples

see `examples` directory for examples of usage

## API

### init FILE

you call `init` with path to the file that will store the results.
the results of the previous run will be loaded if the file already exists.

    init .config

### desc DESCRIPTION

call `desc` to set descrition for the next variable

you can also call it with heredoc:

    desc <<END
    some
    heredoc
    END

### ask TYPE NAME PROMPT [DEFAULT]

Valid types:

- `bool[ean]` - case insensitive, acceptable values are y, yes, n, no
- `num[ber]` - number
- `word` - sequence of letters
- `sym[bol]` - sequence of letters, numbers, and '\_'
- `simple` - simple string, basicly symbols with spaces
- `str[ing]` - any non empty string
- `any` - anhitng
