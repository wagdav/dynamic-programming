# dynamic-programming

Exploring dynamic programming in Haskell

## Build and run

    $ stack build
    $ stack test

The `coin` app will solve the minimum coin exchange problem:

    $ stack exec coin 40
    Just 40

The `justify` program produces justified text of a given width

    $ stack exec justify 20 "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
    ====================
    Lorem          ipsum
    dolor            sit
    amet,    consectetur
    adipiscing     elit.
    ====================


## Benchmark

Run all the benchmarks

    stack bench

Run only the dynamic programming benchmarks and save the output in HTML:

    stack bench --ba '-m prefix dynamic --output output.html'
