# Run xrdb(1) to query specific resources from it
# I thought xrdb -query would do this, but it doesn't seem to, maybe I'm doing
# it wrong
BEGIN {

    # Separator is a colon followed by a tab
    FS = ":\t"

    # Check we have at least one resource name
    if (ARGC < 2) {
        stderr = "cat >&2"
        print "xrq: Need at least one resource name" | stderr
        close(stderr)
        exit(2)
    }

    # Run `xrdb -query` and search for instances of the requested resource
    xrdb = "xrdb -query"
    found = 0
    while (xrdb | getline)
        for (i in ARGV)
            if ($1 == ARGV[i]) {
                found = 1
                print $2
            }
    close(xrdb)

    # Exit successfully if we found at least one result
    exit(!found)
}
