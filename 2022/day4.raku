# Day 4: Camp Cleanup
# adventofcode.com/2022/day/4

my @in = lines;

# Part 1
say @in.map({
    my @p = .split(',').map({
        my @x = .split('-')».Int;
        @x[0] .. @x[1]
    });
    @p[0] ⊆ @p[1] || @p[0] ⊇ @p[1]
}).sum;

# Part 2
say @in.map({ ? [∩] .split(',').map({ [...] .split('-')».Int }) }).sum;
