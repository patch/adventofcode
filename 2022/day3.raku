# Day 3: Rucksack Reorganization
# adventofcode.com/2022/day/3

my @in = lines;
my %p = ("a".."z", "A".."Z").flat Z=> 1..52;

# Part 1
say @in.map({
    my $c = .chars / 2;
    %p{ [∩] (.substr(^$c), .substr($c..*))».comb }
}).sum;

# Part 2
say @in.rotor(3).map({ %p{ [∩] $_».comb } }).sum;
