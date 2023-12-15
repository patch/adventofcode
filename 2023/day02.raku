# Day 2: Cube Conundrum
# adventofcode.com/2023/day/2

my @in = lines;

# Part 1
my %c = red=>12, green=>13, blue=>14;
say @in.grep(
    *.match(/ (\d+) \s (@(%c.keys)) /, :g).map({ .[0] ≤ %c{.[1]} }).all
)».match(/\d+/).sum;

# Part 2
say @in.map({
    my %m;
    %m{.[1]} max= +.[0] for .match(/ (\d+) \s (\w+) /, :g);
    [*] %m.values
}).sum;
