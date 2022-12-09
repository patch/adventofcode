# Day 8: Treetop Tree House
# adventofcode.com/2022/day/8

my @in = lines».comb».Int;
my @xy = ^@in X ^@in[0];

# Part 1
say @xy.grep(-> ($x, $y) {
    @in[$x][$y]
        > @in[$x][$y^...0].all
        | @in[$x][$y^...*].all
        | @in[$x^...0]»[$y].all
        | @in[$x^...*]»[$y].all
}).elems;

# Part 2
sub vis ($a, $b, $x is rw) { $a ≥ $b ?? $x-- !! $x if $x }

say @xy.map(-> ($x, $y) {
    my $n = @in[$x][$y];
    [*] @in[$x][$y^...0].grep({  vis($_, $n, state $ = 1) }),
        @in[$x][$y^...*].grep({  vis($_, $n, state $ = 1) }),
        @in[$x^...0]»[$y].grep({ vis($_, $n, state $ = 1) }),
        @in[$x^...*]»[$y].grep({ vis($_, $n, state $ = 1) });
}).max;
