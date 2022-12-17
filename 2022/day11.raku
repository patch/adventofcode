# Day 11: Monkey in the Middle
# adventofcode.com/2022/day/11

my @in = slurp.split("\n\n").map({
    $_ ~~ /
        'Starting items: '         [ $<items> = \d**2 ]+ % ', ' $$ \s+
        'Operation: new = old '      $<op>    = <[+*]>             \s
                                   [ $<num>   = \d+ | old ]     $$ \s+
        'Test: divisible by '        $<div>   = \d+             $$ \s+
        'If true: throw to monkey '  $<true>  = \d              $$ \s+
        'If false: throw to monkey ' $<false> = \d
    /;
    my ($num, $div, $true, $false) = $<num div true false>;
    {
        items1 => $<items>».Int,
        items2 => $<items>».Int,
        op     => $<op> eq '+' ?? { $_ + $num } !! { $_ * ($num // $_) },
        div    => $div,
        test   => { $_ %% $div ?? $true !! $false },
    }
});

my $lcm = [lcm] @in»<div>;
my (@counts1, @counts2);

for 1..10000 -> $round {
    for @in.kv -> $i, $monkey {
        while $monkey<items2>.shift -> $item is copy {
            @counts2[$i]++;
            $item = $monkey<op>($item) mod $lcm;
            @in[ $monkey<test>($item) ]<items2>.push($item);
        }

        next if $round > 20;

        while $monkey<items1>.shift -> $item is copy {
            @counts1[$i]++;
            $item = $monkey<op>($item) div 3;
            @in[ $monkey<test>($item) ]<items1>.push($item);
        }
    }
}

# Part 1
say [*] @counts1.sort.tail(2);

# Part 2
say [*] @counts2.sort.tail(2);
