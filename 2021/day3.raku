# Day 3: Binary Diagnostic
# adventofcode.com/2021/day/3

my @in = lines;

# Part 1
my $x = (zip @in».comb).map({ +(.sum / @in > 0.5) }).join;
say :2($x) * :2($x.trans: "1" => "0", "0" => "1");

# Part 2
sub f (@x is copy, &op) {
    for ^@x[0].chars -> $i {
        @x.=grep: {
            .substr($i, 1) == @x».substr($i, 1).sum / @x [&op] 0.5
        };
        return :2(@x[0]) if @x == 1;
    }
}
say f(@in, &[≥]) * f(@in, &[<]);
