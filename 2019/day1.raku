# Day 1: The Tyranny of the Rocket Equation
# adventofcode.com/2019/day/1

my @in = lines;

# Part 1
say @in.map({ floor $_ / 3 - 2 }).sum;

# Part 2
say @in.map(sub { $_ + samewith $_ if $_ > 0 given floor $^m / 3 - 2 }).sum;
