# Prepend z appropriately to occurrences of s, in order to make fun of bezrend
s,^s,zs,g
s,^S\([a-z]\),Zs\1,g
s,^s,ZS,g
s,\([^zZ]\)s,\1zs,g
s,\([^zZ]\)S\([a-z]\),\1Zs\2,g
s,\([^zZ]\)S,\1ZS,g
