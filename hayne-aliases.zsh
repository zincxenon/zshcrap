
# findPid () { sudo /usr/sbin/lsof -t -c "$@" ; }

# # # to find memory hogs:
# alias mhgtp='top -l 1 -o rsize -n 10'
# alias mhgps='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

# # to find CPU hogs
# alias cpuhg='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

# # continual 'top' listing (every 10 seconds) showing top 15 CPU consumers
# alias topforever='top -l 0 -s 10 -o cpu -n 15'

# # recommended 'top' invocation to minimize resources in thie macosxhints article
# # http://www.macosxhints.com/article.php?story=20060816123853639
# # exec /usr/bin/top -R -F -s 10 -o rsize

# # diskwho: to show processes reading/writing to disk
# alias diskwho='sudo iotop'



# #------------
# # Networking:
# #------------
# # lsock: to display open sockets (the -P option to lsof disables port names)
# alias lsock='sudo /usr/sbin/lsof -i -P'

# # airportMtu: set the MTU on Airport to be a value that makes SMTP to DSL work
# # (I determined the value empirically by using 'ping -s' to the SMTP server)
# alias airportMtu='sudo ifconfig en1 mtu 1364'

# # airport: Apple's command-line tool. For status info, use -I, for help use -h
# # See: http://www.macosxhints.com/article.php?story=20050715001815547
# alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport'
# # Note also the tool that I compiled: airport_info (in my Tools dir)

# # ip_info: to get info on DHCP server, router, DNS server, etc (for en0 or en1)
# alias ip_info='ipconfig getpacket en1'

# # debug_http: download a web page and show info on what took time
# debug_http () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }

# # http_headers: get just the HTTP headers from a web page (and its redirects)
# http_headers () { /usr/bin/curl -I -L $@ ; }

# # Note: 'active_net_iface' is my script that echos the active net interface
# # pkt_trace: for use in the following aliases
# alias pkt_trace='sudo tcpflow -i `active_net_iface` -c'

# # smtp_trace: to show all SMTP packets
# alias smtp_trace='pkt_trace port smtp'

# # http_trace: to show all HTTP packets
# alias http_trace='pkt_trace port 80'

# # tcp_trace: to show all TCP packets
# alias tcp_trace='pkt_trace tcp'

# # udp_trace: to show all UDP packets
# alias udp_trace='pkt_trace udp'

# # ip_trace: to show all IP packets
# alias ip_trace='pkt_trace ip'


# #--------------------------------------------
# # Aliases and this file:
# #--------------------------------------------
# # showa: to remind yourself of an alias (given some part of it)
# showa () { /usr/bin/grep -i -a1 $@ $ZSH_CONFIG/hayne-aliases.zsh | grep -v '^\s*$' ; }

# # sourcea: to source this file (to make changes active after editing)
# alias sourcea='source ~/.aliases.bash'


# #-----------------------
# # Correct common typos:
# #-----------------------
# alias mann='man'

# # The following aliases (save & show) are for saving frequently used directories
# # You can save a directory using an abbreviation of your choosing. Eg. save ms
# # You can subsequently move to one of the saved directories by using cd with
# # the abbreviation you chose. Eg. cd ms  (Note that no '$' is necessary.)
# # (I got this technique from Michael Boyle in the late 1980's at Visual Edge)
# alias sdirs='source ~/.dirs'
# alias show='cat ~/.dirs'
# save () { /usr/bin/sed "/$@/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; }

# # Initialization for the above 'save' facility:
# # source the .sdirs file:

# # set the bash option so that no '$' is required when using the above facility


# # cdf: cd's to frontmost window of Finder
# cdf ()
# {
#     currFolderPath=$( /usr/bin/osascript <<"    EOT"
#         tell application "Finder"
#             try
#                 set currFolder to (folder of the front window as alias)
#             on error
#                 set currFolder to (path to desktop folder as alias)
#             end try
#             POSIX path of currFolder
#         end tell
#     EOT
#     )
#     echo "cd to \"$currFolderPath\""
#     cd "$currFolderPath"
# }


# # rm_DS_Store_files: removes all .DS_Store file from the current dir and below
# alias rm_DS_Store_files='find . -name .DS_Store -exec rm {} \;'

# # zipf: to create a ZIP archive of a file or folder
# zipf () { zip -r "$1".zip "$1" ; }

# # numFiles: number of (non-hidden) files in current directory
# alias numFiles='echo $(ls -1 | wc -l)'

# # showTimes: show the modification, metadata-change, and access times of a file
# showTimes () { stat -f "%N:   %m %c %a" "$@" ; }

# # finderComment: show the SpotLight comment for a file
# finderComment () { mdls "$1" | grep kMDItemFinderComment ; }

# # ff:  to find a file under the current directory
# ff () { /usr/bin/find . -name "$@" ; }
# # ffs: to find a file whose name starts with a given string
# ffs () { /usr/bin/find . -name "$@"'*' ; }
# # ffe: to find a file whose name ends with a given string
# ffe () { /usr/bin/find . -name '*'"$@" ; }
