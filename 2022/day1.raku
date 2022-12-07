# Day 1: Calorie Counting
# adventofcode.com/2022/day/1

given slurp.split("\n\n")».lines».sum.sort {
    # Part 1
    say @_.tail;

    # Part 2
    say @_.tail(3).sum;
}
