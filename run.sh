mkdir repos
cd repos

# clone all repositories. This will take a while
for repo in `../getAllRepos.sh`
do
    git clone "https://github.com$repo"
done

# 1.) find every single julia file
# 2.) extract all identifiers from it
# 3.) count their respective occurences
# 4.) Save it in the file mostCommonIdentifiers.csv
../findJuliaFiles.sh | \
    ../identifiers.jl | \
    ../countOccurences.jl > ../mostCommonIdentifiers.csv
