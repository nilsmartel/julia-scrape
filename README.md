# Julia Scrape

## What is this?

Here I tried to infer what the most important functions in julia are, in order to pick up the language as fast as possible.

## How did I do it?

There is a lot of high quality open source julia code on github, and I wanted to analyze that.
So I wrote a simple script, that fetches the `html` code of github search pages.
The search pages are queried using the restriction, that I only want `julia` code.
Then I extracted all repository names. There might have been an easy to use API, but writing it that way was quite straightforward.
Here's how the code looks (see: `./getAllRepos.sh`):

```shell
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
But you can't really tell, which variables are important functions. It's a mess.

## 

## What are the results?

Julia Programmers test a lot. A lot. This is awesome news! Way to build relyable software!

Also, they love using single character variable names. A practice commonly found in mathematics, which I guess is the source of that habit.

One of the most prominent identifiers in julia source code across many repos seems to be `tf`. My best guess is, that using tensorflow is really common among julia devs.



## Here are the 100 most common identifiers

| identifier     | count |
|:-------------- | -----:|
| test           | 51903 |
| x              | 49398 |
| T              | 40124 |
| m              | 33713 |
| i              | 32904 |
| nothing        | 26963 |
| tf             | 21374 |
| k              | 18073 |
| name           | 17668 |
| convert        | 16906 |
| Base           | 16703 |
| y              | 16309 |
| desc           | 16108 |
| Int            | 16019 |
| f              | 15844 |
| p              | 15634 |
| n              | 15576 |
| a              | 15502 |
| v              | 15217 |
| d              | 14404 |
| A              | 13934 |
| t              | 13777 |
| Cint           | 13434 |
| length         | 13293 |
| u              | 12520 |
| Vector         | 12477 |
| integrator     | 12453 |
| Float64        | 10838 |
| b              | 10671 |
| df             | 10404 |
| j              | 9908  |
| c              | 9817  |
| model          | 9428  |
| Ptr            | 8722  |
| dt             | 8716  |
| s              | 8389  |
| CuPtr          | 8321  |
| Tuple          | 8178  |
| g              | 7888  |
| io             | 7630  |
| N              | 7608  |
| testset        | 7534  |
| Symbol         | 7474  |
| typeof         | 7375  |
| String         | 7307  |
| res            | 7267  |
| r              | 7174  |
| size           | 7064  |
| args           | 6947  |
| grid           | 6731  |
| Type           | 6592  |
| z              | 6523  |
| handle         | 6303  |
| DataFrame      | 5852  |
| Union          | 5760  |
| Bool           | 5593  |
| C              | 5289  |
| state          | 5262  |
| rand           | 5231  |
| Any            | 5183  |
| push!          | 5168  |
| add_input      | 5007  |
| B              | 4941  |
| S              | 4893  |
| value          | 4745  |
| test_throws    | 4690  |
| cache          | 4625  |
| ccall          | 4574  |
| data           | 4530  |
| uprev          | 4528  |
| Dict           | 4410  |
| h              | 4395  |
| include        | 4274  |
| w              | 4160  |
| alg            | 4086  |
| Tensor         | 4074  |
| Real           | 4072  |
| initialize_api | 4028  |
| checked        | 3966  |
| X              | 3910  |
| zero           | 3848  |
| endo           | 3832  |
| dims           | 3766  |
| tmp            | 3734  |
| Array          | 3716  |
| Cvoid          | 3704  |
| node           | 3686  |
| inline         | 3611  |
| eltype         | 3545  |
| D              | 3524  |
| out            | 3492  |
| Float32        | 3461  |
| kwargs         | 3451  |
| eq             | 3383  |
| info           | 3370  |
| Integer        | 3289  |
| map            | 3251  |
| alpha          | 3237  |
| ex             | 3219  |
