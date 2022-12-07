# Day 1: Calorie Counting
# adventofcode.com/2022/day/1

my @in = slurp.split("\n\n")».lines».sum.sort;

# Part 1
say @in.tail;

# Part 2
say @in.tail(3).sum;
