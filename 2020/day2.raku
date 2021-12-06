# Day 2: Password Philosophy
# adventofcode.com/2020/day/2

my @in = lines;

# Part 1
say +@in».comb(/\w+/).grep({ .[0] ≤ .[3].match(.[2], :g) ≤ .[1] });
