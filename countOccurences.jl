#!/usr/local/bin/julia

# get all data from stdin, find out how often each items occurs

input = read(stdin, String)

occurences = Dict()

lines = split(input, "\n")

for item in lines
    if item == ""
        break
    end

    # increment the value associated with this key by one
    # or fill in 0 as a default
    occurences[item] = get(occurences, item, 0)+1
end

# set of unique words
words = keys(occurences) |> collect

sort(words, by= key -> occurences[key])

println("identifier,count")

for word in words
    print(word)
    print(',')
    println(occurences[word])
end

