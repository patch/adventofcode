# Day 1: Trebuchet?!
# adventofcode.com/2023/day/1

my @in = lines;

# Part 1
say @in.map(*.match(/\d/, :g)[0, *-1].join).sum;

# Part 2
my %d = <one two three four five six seven eight nine> Z=> 1..9;

say @in.map(
    *.match(/ \d | @(%d.keys) /, :ov)[0, *-1].map({ %d{$_} // $_ }).join
).sum;
