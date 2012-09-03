lj_archiver
===========

Shell script that exports meaningful data from files created by [ljdump](https://www.github.com/ghegill/ljdump)

Instructions:
-------------
1. Download and place lj_archive.sh in the ljdump-1.5.x directory (currently tested with version 1.5.1)
2. Open Terminal
3. Run `./ljdump.py` for your LiveJournal user
4. Run: `./lj_archive.sh`
5. Enter your LiveJournal username (e.g. bartelby)
6. The script can take a while to run, so be patient - parsing 300 entries took about 20 seconds to complete
7. The parsed .txt files will be stored in **ljdump-1.5.x/USERNAME/Entries**, with the date and time of the entry as the file name (e.g. 20120903-005637.txt)