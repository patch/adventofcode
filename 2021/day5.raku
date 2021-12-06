# Day 5: Hydrothermal Venture
# adventofcode.com/2021/day/5

my @in = lines».split(' -> ')».split(',')».Int;

# Part 1
say +@in.grep({
    .[0;0] == .[1;0] || .[0;1] == .[1;1]
}).map({
    |((.[0;0] ... .[1;0]) X (.[0;1] ... .[1;1]))».join(',')
}).Bag.grep(*.value > 1);

# Part 2
say +@in.map({
    ((.[0;0] ... .[1;0]), (.[0;1] ... .[1;1]))
}).map({
    |(.any == 1 ?? (.[0] X .[1]) !! (.[0] Z .[1]))».join(',')
}).Bag.grep(*.value > 1);
