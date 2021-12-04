# Day 2: Dive!

my @in = lines;

# Part 1
given @in».words.classify(*[0], as => *[1])<forward down up>».sum {
  say .[0] * (.[1] - .[2]);
}

# Part 2
my ($h, $d);
for @in.words -> $k, $v {
  state $a = 0;
  given $k {
    when ‘down’    { $a += $v }
    when ‘up’      { $a -= $v }
    when ‘forward’ { $h += $v; $d += $a * $v }
  }
}
say $h * $d;
