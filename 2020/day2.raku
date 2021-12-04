# Day 2: Password Philosophy

my @in = lines;

# Part 1
say +@in».comb(/\w+/).grep({ .[0] ≤ .[3].match(.[2], :g) ≤ .[1] });
