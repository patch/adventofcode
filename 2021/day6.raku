# Day 6: Lanternfish
# adventofcode.com/2021/day/6

my BagHash $fish.=new: lines.first.split(',');
for 1..256 {
    my BagHash $tmp.=new;
    for @$fish {
        if .key {
            $tmp{.key - 1} += .value;
        }
        else {
            $tmp{6} += .value;
            $tmp{8}  = .value;
        }
    }
    $fish = $tmp;
    say $fish.values.sum when any 80, 256;
}
