
# The Shell

[This web site](http://linuxcommand.org/lc3_learning_the_shell.php) 
explains basic linux shell commands.


A shell is an interface to the operating system. The shell can be accessed through a terminal emulator.
The most used shell on Linux is the `bash` shell.


`pwd`

:   print working directory

`cd`

:   change directory (without arguments: home dir; with `-`: previous directory)

`ls`

:   list files (use `-a` to also show hidden files/files starting with `.`; use `-l` for long format; also takes multiple paths as arguments)

`less`

:   displaying file text

`file`

:   determines the type of file

`ln`

:   symbolic link to another file (allows e.g. an application name to switch between various versions of that application)


`mv`

:   rename


`cp`

:   copy (`-i`: interactive (asks before overwriting), `-R`: recursive (any subdirectories are copied too))

`rm`

:   remove (or move files/directory to a directory)

`mkdir`

:   create a directory

`type`

:   type of command (shell built-in, alias, shell script or executable)

`which`

:   determines the location of an executable

`help`

:   bash help page for a given command

`man` 

:   `man` page for a given command

`zless`

:   `less` command that allows viewing contents of `gzip`-compressed text files



## Linux directory tree

+-----------------+--------------------------------------------------------------+
| /boot           | contains bootloader scripts and kernel (`vmlinuz`)           |
+-----------------+--------------------------------------------------------------+
| /etc            | contains configuration files                                 |
|                 | *   /etc/passwd contains user info                           |
|                 | *   /etc/fstab contains mounted devices                      |
|                 | *   /etc/hosts contains network host names and IP addresses  |
|                 | *   /etc/init.d contains startup scripts for services        |
+-----------------+--------------------------------------------------------------+
| /bin, /usr/bin  | contains applications needed by system, users                |
+-----------------+--------------------------------------------------------------+
| /sbin, /usr/sbin| contains applications for the system administrator           |
+-----------------+--------------------------------------------------------------+
| /usr            | utilities to support user applications                       |
|                 | *   /usr/share/X11 support files for X window system         |
|                 | *   /usr/share/dict spell check dictionaries                 |
|                 | *   /usr/share/doc documentation files                       |
|                 | *   /usr/share/man man pages                                 |
|                 | *   /usr/src source code files                               |
+-----------------+--------------------------------------------------------------+
| /usr/local      | Software not part of the original distro goes here           |
+-----------------+--------------------------------------------------------------+
| /var            | Files that change as the system is running                   |
|                 | *   /var/log log files                                       |
|                 | *   /var/spool queued files from local email or print jobs   |
+-----------------+--------------------------------------------------------------+
| /lib            | shared libraries                                             |
+-----------------+--------------------------------------------------------------+
| /home           | where users store their personal work                        |
+-----------------+--------------------------------------------------------------+
| /root           | super user home dir                                          |
+-----------------+--------------------------------------------------------------+
| /tmp            | where programs can store temporary files                     |
+-----------------+--------------------------------------------------------------+
| /dev            | devices available to the system, represented in file format  |
+-----------------+--------------------------------------------------------------+
| /proc           | virtual representation of processes and configurations       |
+-----------------+--------------------------------------------------------------+
| /media, /mnt    | mount points for attaching physical storage devices          |
|                 | (mnt is for manually mounted devices such as cdrom)          |
+-----------------+--------------------------------------------------------------+


## I/O redirection

`>`

:   redirect standard output to file

`>>`

:   append redirected output to file 

`<`

:   redirect standard input from a file

`|`

:   standard output of one command is fed into standard input of another (e.g. `ls -l | less` to make any command use scrolling output)


## Filters

Common programs that act as filters: `sort`, `uniq`, `grep`, `fmt`, `pr`, `head`, `tail`, `tr`, `sed`, `awk`.


## Expansions

Use the `echo` command to find out how wildcards etc are expanded

*   arithmetic expansion: `echo $((math expression))`. `/` can be used for integer division, `%` for the integer remainder. `bash` only works with integers!

*   brace expansion: `echo Front-{1..2}-back` gives multiple text strings each containing consecutive elements inside the braces

*   parameter expansion: `echo $USER` takes variable USER and expands to its value (or empty string if it does not exist). Use `printenv | less` to view a list of available parameters

*   command substitution: uses the output of a command as an expansion (`ls -l $(which cp)` returns the contents of the directory in which the `cp` command is located). For functions that do not accept standard input, arguments can be passed using command substitution. See [this](http://unix.stackexchange.com/a/122730) StackExchange answer.


## Quotes

*   double quotes suppress special meanings, expansions and word splitting, except for characters `$`, `\` and back-ticks

*   double quotes protect whitespace: `echo $(cal)` does not keep embedded whitespace, `echo "$(cal)"` keeps e.g. newlines

*   single quotes suppress all expansions

*   suppress individual characters using escape character `\`. Commands can be spread over multiple lines by escaping the newline using `\`.

*   backslashes can be used to insert special characters ("backslash escape characters"): `\n`, `\t`, `\a`, `\\`.


## Permissions

Linux is a multi-user Operating System, with multiple users being able to connect to a single computer.

chmod

:   change permissions of a file or directory (may be used with octal specifiers, e.g. 600 or 777)

chown

:   change ownership of a file or directory (`sudo chown target_user myfile`)

chgrp

:   change group ownership of a file or directory (`chgrp target_group myfile`). Only the file owner can perform this action.



## Job control

Linux is also a multi-tasking operating system, with each processor working on multiple processes (although not at the same time).

bg

:   put a suspended program in the background (suspend a program using `Ctrl-z`). A program can be put in the background directly when starting it by adding a `&`; e.g. `xload &`. Putting a program in the background will give you the command prompt back.

ps, jobs

:   list processes started from the terminal, list your own processes

kill

:   sends signal to a process (by default termination signal `SIGTERM`); the process is identified with the process id (PID) or job number (use a percentage sign as a prefix)


Processes listen for signals from the operating system and should react appropriately and gracefully when they receive a signal. Signals other than `SIGTERM` include

*   `SIGINT`, which interrupts processes (can also be activated by `Ctrl-c`)
*   `SIGKILL`, which immediately terminates a process (programs cannot listen for this signal)

These signals can be used as arguments to the `kill` command: `kill -SIGKILL 1234`, or equivalently `kill -9 1234`



