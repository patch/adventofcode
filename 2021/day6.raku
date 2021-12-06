# Day 6: Lanternfish
# adventofcode.com/2021/day/6

my $fish = BagHash.new: lines.first.split(',');
for 1..256 {
    my $tmp = BagHash.new;
    for $fish.kv -> $k, $v {
        if $k {
            $tmp{$k - 1} += $v;
        }
        else {
            $tmp{6} += $v;
            $tmp{8}  = $v;
        }
    }
    $fish = $tmp;
    say $fish.values.sum when any(80, 256);
}
