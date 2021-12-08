# Day 7: The Treachery of Whales
# adventofcode.com/2021/day/7

given lines[0].split(',').cache {
    # Part 1
    say .minmax.&[…]».&[X-]($_)».abs».sum.min;

    # Part 2
    say .minmax.&[…]».&[X-]($_)».abs.map({ $_* ($_ + 1 ) / 2 })».sum.min;
}
