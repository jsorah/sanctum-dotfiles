Ideas
=====

* A wrapper ksw(1df) (kill-switch) that traps SIGINT to kill a called program
  or loop immediately, rather than aborting a loop (is this possible?)
* A wrapper sil(1df) or nec(1df) to turn stty -echo off for the duration of a
  paste?
* I can probably share my psql() completions/shortcuts after sanitizing them a
  bit
* Wouldn't be too hard to add some HTTP BASIC auth to ix(1df) to make pastes
  manageable
* Have eds(1df) accept stdin with the "starting content" for the script
* Convert all the manual pages to mandoc maybe?
  <https://en.wikipedia.org/wiki/Mandoc>
* qmp(1df)--quick man page
* The solution to chn(1df) not running in parallel is probably backgrounded
  processes and mkfifo(1).
* Write something like hcat(1df) or tcat(1df) that includes filename headings
  for each concatenated file.
* I can probably get rid of all that nasty templated shell by writing something
  that wraps around td(1df) and generates shell script to run, and calls that
  via `eval`.
* Ideally, the .awk and/or .sed scripts in the bin and games dirs should be
  syntax-checked or linted. I could at least add some patient application of
  appropriate `gawk --lint` calls for each of the .awk scripts.
