# Julia Scrape

## What is this?
Here I tried to infer what the most important functions in julia are, in order to pick up the language as fast as possible.

## How did I do it?
There is a lot of high quality open source julia code on github, and I wanted to analyze that.
So I wrote a simple script, that fetches the `html` code of github search pages.
The search pages are queried using the restriction, that I only want `julia` code.
Then I extracted all repository names. There might have been an easy to use API, but writing it that way was quite straightforward.
Here's how the code looks (see: `./getAllRepos.sh`):
```zsh
export PAGE_NUMBER=1
curl "https://github.com/search?l=Julia&q=jl&type=Repositories&p=$PAGE_NUMBER" | htmlq '.application-main' '.codesearch-results' '.repo-list' '.text-normal' '.v-align-middle' -a href
```

> Note, you'll need to have `htmlq` installed.

I did that for the first 50 repositories that github shows and fetched the source code of every single one of them.

The next step was to filter out the identifiers from each file of julia code.
By doing that I hoped to get an overview of commonly used function names and variables, that every julia programmer uses often (and therefore should know).

In order to tokenize julia source code, I simply used the Julia Package `Tokenize`.
```julia
using Pkg
Pkg.add("Tokenize")

using Tokenize

tokens = Tokenize.tokenize(input)

return filter(t -> Tokenize.Tokens.kind(t), collect(tokens))
```

I did that for every single file.
Now I just associated the identifiers, with their respective occurence count. Done!


## Did it work?
Not the way I hoped, but it was interesting! You can look at the `csv` yourself.
What you'll find is, that julia programmers are huge fans of single-character variable names.
But you can't really tell, which variables are important functions. It's a mess.


