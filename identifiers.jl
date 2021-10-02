#!/usr/local/bin/julia
#   Script to grab all identifiers from a julia file

# using Pkg
# Pkg.add("Tokenize")
using Tokenize

filenames = read(stdin, String)

files = split(filenames, "\n")

for file in files
	if file == ""
        break
    end

    open(file) do io
		input = read(io, String)

        tokens = Tokenize.tokenize(input)

        kind = Tokenize.Tokens.kind

        isIdent = (n) -> kind(n) == Tokenize.Tokens.IDENTIFIER

        idents = filter(isIdent, collect(tokens))

        for ident in idents
            println(ident)
        end
	end
end
