# Type like a young black metal enthusiast

# Pad the start and end of the line temporarily to work around GNU sed(1) not
# respecting POSIX word boundaries, leaving us with no compatible options
s/^/~/
s/$/~/

# Lowercase to capitals
y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/

# All numbers become 666
s,[0-9][0-9]*,666,g

# Various words for KVLT
s,\([^A-Z]\)ASSOCIATION\([^A-Z]\),\1KVLT\2,g
s,\([^A-Z]\)BUSINESS\([^A-Z]\),\1KVLT\2,g
s,\([^A-Z]\)CHURCH\([^A-Z]\),\1KVLT\2,g
s,\([^A-Z]\)CLUB\([^A-Z]\),\1KVLT\2,g
s,\([^A-Z]\)COMPANY\([^A-Z]\),\1KVLT\2,g
s,\([^A-Z]\)FOUNDATION\([^A-Z]\),\1KVLT\2,g
s,\([^A-Z]\)GROUP\([^A-Z]\),\1KVLT\2,g
s,\([^A-Z]\)INSTITUTE\([^A-Z]\),\1KVLT\2,g
s,\([^A-Z]\)INSTITUTION\([^A-Z]\),\1KVLT\2,g
s,\([^A-Z]\)ORGANIZATION\([^A-Z]\),\1KVLT\2,g
s,\([^A-Z]\)PARTY\([^A-Z]\),\1KVLT\2,g
s,\([^A-Z]\)RELIGION\([^A-Z]\),\1KVLT\2,g

# Various words for TRUE
s,\([^A-Z]\)AWESOME\([^A-Z]\),\1TRUE\2,g
s,\([^A-Z]\)BEST\([^A-Z]\),\1TRUEST\2,g
s,\([^A-Z]\)EXCELLENT\([^A-Z]\),\1TRUE\2,g
s,\([^A-Z]\)GOOD\([^A-Z]\),\1TRUE\2,g
s,\([^A-Z]\)GREAT\([^A-Z]\),\1TRUE\2,g
s,\([^A-Z]\)NICE\([^A-Z]\),\1TRUE\2,g

# WAR/COOL -> KRIEG
s,\([^A-Z]\)WAR\([^A-Z]\),\1KRIEG\2,g
s,\([^A-Z]\)COOL\([^A-Z]\),\1KRIEG\2,g

# Double-letters are easy
s,CC,KK,g
s,SS,ZZ,g

# CHR -> KHR
s,CHR,KHR,g

# -C[EIY] -> -Z (naïve attempt at finding soft Cs)
s,C\([EIY]\),Z\1,g

# -C[^H] -> -K (so "change" doesn't become "KHANGE")
s,C\([^H]\),K\1,g

# -S[^H] -> Z (so "sharp" doesn't become "ZHARP")
s,S\([^H]\),Z\1,g

# consonant-I-consonant -> -Y-
s,\([B-DF-HJ-NP-TV-XZ]\)I\([B-DF-HJ-NP-TV-XZ]\),\1Y\2,g

# consonant-U-consonant -> -V-
s,\([B-DF-HJ-NP-TV-XZ]\)U\([B-DF-HJ-NP-TV-XZ]\),\1V\2,g

# THE -> DER
s,\([^A-Z]\)THE\([^A-Z]\),\1DER\2,g

# OF -> OV
s,\([^A-Z]\)OF\([^A-Z]\),\1OV\2,g

# AND -> VND
s,\([^A-Z]\)AND\([^A-Z]\),\1VND\2,g

# TRUE -> TRV
s,\([^A-Z]\)TRUE\([^A-Z]\),\1TRV\2,g

# O->0
y/O/0/

# Remove the padding established above
s/^~//
s/~$//
