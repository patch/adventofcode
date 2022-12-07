# Day 7: No Space Left on Device 
# adventofcode.com/2022/day/7

my %fs;

for slurp.comb: / <?after '$ '> .+? <?before [ \n\$ | $ ]> / {
    state @dir = '/';

    when /^ cd \s (.+) $/ {
        if $0 eq '..' {
            @dir.pop;
        }
        else {
            @dir.push($_);
        }
    }
    when /^ ls \n (.+) / {
        for $0.comb(/\d+/) X ^@dir -> ($size, $i) {
            %fs{ @dir[0..$i].join('/') } += $size;
        }
    }
}

# Part 1
say %fs.values.grep(* ≤ 100000).sum;

# Part 2
say %fs.values.sort.first: * ≥ %fs</> - 40000000;
