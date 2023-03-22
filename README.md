The script is made as a part of Server Technologies course in Tampere University of Applied Sciences

# Tip of the day

To enable "Tip of the day" feature with this very solution, it is necessary to create folder _tips_ in home directory (i.e. path must be _~/tips_), to put there ten tips (one tip into one file) and to name them with numbers from 1 to 10, e.g. 1.txt, 2.txt .. 10.txt.

Also, it is needed to add the script path into _~/.bashrc_ file, so that it looks, e.g., _~/linux-tips.sh_, in order to initiate it.
Need to remember to give the script file necessary permissions (e.g. chmod 755 ~/linux-tips.sh).

The tips folow each other one by one. When tip #10 is shown, then it starts all over again from the tip #1.

When an user types _disable_ when asked to continue or to disable functionality, _tip of the day_ will be disabled for all or for certain user, depending on chosen option. The functionality for all can be restored by just uncommenting the script path in the _~/.bashrc_ file.

## Example of how script works:

    Tip of the day:
    Tip number 2

    The cat(1) command copies its stdin to its stdout. This means that both standard streams can be redirected in the same command. Commands that let both their standard input and standard output to be redirected are called filters. For example to copy a file with the cat(1) command, you can use either of these choices:

      $ cat < file-source > file-destination
            |             |
            |             Shell connects STDOUT
            Shell connects STDIN


      $ cat file-source      > file-destination
            |                |
            cat open FILE    Shell connects STDOUT

    Show next tip or disable totd functionality?(y/n/disable): y

    Tip number 3
    The find command is similar to Windows graphical search, except that it is much more powerful. In other systems there may be commands like locate(1) and glimpse(1) to help searching files faster by using pre-gnerated index database files. However the find(1) command is the only one that comes standard in all systems.
    Find all text files recursively starting from current directory:

        $ find . -name "*.txt" -print
             |
             Where to start finding.
             "." = From current directory

    Find files that haven't been accessed/modified for more than 10 days:

      $ find $HOME -atime +10 -print
      $ find $HOME -mtime +10 -print

    By default the find command scans the whole file system, regardless of the files, devices or directories. You can limit the search to certain types. See more types in find(1) manual page.

    Show next tip or disable totd functionality?(y/n/disable): n


    yuloz@Yulo:~$