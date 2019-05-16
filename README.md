# Phorn

Inspired by projects like bubblebabble and proquint, Phorn is a library for generating random wordlike strings.  The algorithm involves progressively appending characters to a string, alternating chunks of consonants and vowels that follow certain combination rules to prohibit awkward combinations.  "Awkward" means words that (in the author's highly subjective opinion) seem difficult to pronounce as written.  There is still some degree of awkwardness, because the more combinations are prohibited, the less randomness is achieved.

The experimentally determined duplication rate for 9-character strings is about 1 out of 240,000.

# Usage

To generate a random 9-character words:  `Phorn.string(9)`

Example result:  `vimdupfus`

To generate a hyphenated triplet of 5-character words:  `Phorn.tuple(3,5)`

Example result:  `qunra-mevku-xigfu`
