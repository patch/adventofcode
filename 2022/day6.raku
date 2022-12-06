# Day 6: Tuning Trouble
# adventofcode.com/2022/day/6

my $in = slurp;

sub detect ($n) {
    $n + $in.index: $in.comb.rotor($n => -$n + 1).first(*.unique == $n).join;
}

# Part 1
say detect(4);

# Part 2
say detect(14);
