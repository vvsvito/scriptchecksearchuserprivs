# scriptchecksearchuserprivs
A simple(ish) BASH script that checks system "privs",  searches for a target user account, runs a quick interactive challenge, and records the audit results.

# # # A SAMPLE PROJECT # # #

* note after completion; 
            Wrote Functions First / Along The Way
                    then put everything together
                        *pretty much a main()*

#  This Project Combines: 
    functions, 
    arguments, 
    conditionals, 
    test operators,
    loops,
    and file redirection, into a quick tool, runnable inside terminal.

#   Project: Target User Audit & Security PIN Tool
#       filename:   kali_audit.sh
#   Task:
#   create a bash script that checks system privleges,
#   searches for a target user account,
#   runs a quick interactive challenge,
#   and records the audit results.

# Script REQUIREMENTS:        # 5 Sections      # 1 - 5 # :
 
# Usage Function & Arguement Verification:
*    Define a 'display_usage' function that outputs 
     how to run the script using a heredoc ('cat << EOF)
*    Check if the script was executed with exactly **1 argument** using `$#`. 
     If not (`$# != 1`), call `display_usage` and exit

# Privilege & System Info Check:
*   Check if the script is being executed with root privileges 
    by checking `$UID` (`$UID == 0`)   
*   Output a status line displaying the active `$USER` and `$HOSTNAME`, 
    along with a message confirming whether you have root 
    or standard user privileges.

# User & Directory Audit:
*   Search for the username passed in `$1` 
    inside `/etc/passwd` using `grep -q`
* Combine boolean operators (`&amp;&amp;` / `||`) 
    and file test operators (`-d`) to report:
     -- Whether the target account exists
     -- Whether their home directory (`/home/$1`) exists on the filesystem

# Interactive Secret Number Loop:
*   Generate a random target PIN or number using `$RANDOM`
*   Prompt the user to guess the number using `read -p`
*   Use a `while` loop paired with `if/elif/else` conditionals
    and integer test operators (`-eq`, `-gt`, `-lt`)
    to to hint whether their guess is too high or low
        ;until they guess correctly

# Log File Output
*  creates (if not existing directory) *audit_log.txt*
*  logs results of each #Section.
*   With use of * >> * 
*  ie: result of echo >> audit_log.txt
