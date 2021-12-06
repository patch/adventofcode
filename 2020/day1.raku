# Day 1: Report Repair
# adventofcode.com/2020/day/1

my @in = lines;

# Part 1
say [*] @in.combinations(2).first(*.sum == 2020);

# Part 2
say [*] @in.combinations(3).first(*.sum == 2020);
