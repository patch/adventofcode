# Day 4: Giant Squid
# adventofcode.com/2021/day/4

my @n = lines[0].split(',');
my @b = slurp.trim.split("\n\n").map: *.split("\n").map: *.comb(/\d+/).Array;

sub play ($part) {
    my $score;
    for @n -> $n {
        $_ = -1 if $_ == $n for ([X] @b, ^5, ^5).map: { .[0; .[1]; .[2]] };
        for @b.kv -> $i, $b {
            next unless $b.grep({ .all        == -1 })  # rows
                   || (^5).grep({ $b»[$_].all == -1 }); # columns
            $score = $b».grep(* > 0).flat.sum * $n;
            return $score if $part == 1;
            @b.splice($i, 1);
        }
    }
    return $score;
}

say play(1);
say play(2);
