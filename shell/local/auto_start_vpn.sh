#!/usr/bin/expect
# 这一行告诉操作系统脚本里的代码使用那一个shell来执行。这里的expect其实和Linux下的bash、windows下的cmd是一类东西。
# 注意：这一行需要在脚本的第一行。
# +---------------------------------------------+
# |                                             |
# |   执行方式：./auto_start_vpn.sh              |
# |   使用 sh auto_start_vpn.sh 会报expect找不到。|
# |                                             |
# +---------------------------------------------+

cd /etc/openvpn
# spawn是进入expect环境后才可以执行的expect内部命令，
# 如果没有装expect或者直接在默认的SHELL下执行是找不到spawn命令的。
# 所以不要用 “which spawn“之类的命令去找spawn命令。
spawn sudo openvpn client.ovpn

# 可以使用which expect 查看expect 安装的路径
expect "*password for jimi*"
send "jimi\r"

expect "*Private Key Password*"
send "your password"

# 结束方式一：
# 如果没有这一句登录完成后会退出，而不是留在远程终端上。如果你只是登录过去执行
expect eof

# 结束方式二：
# 执行完成后保持交互状态，把控制权交给控制台，这个时候就可以手工操作了。
#interact