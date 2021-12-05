# Day 1: Sonar Sweep
# https://adventofcode.com/2021/day/1

my @in = lines;

# Part 1
say +@in.rotor(2 => -1).grep({ [<] @_ });

# Part 2
say +@in.rotor(3 => -2)».sum.rotor(2 => -1).grep({ [<] @_ });
