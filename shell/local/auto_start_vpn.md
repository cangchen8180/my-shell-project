# ubuntu添加自动执行脚本的两种方式
## 方式一、编辑rc.local脚本
rc.local脚本是一个ubuntu开机后会自动执行的脚本，我们可以在该脚本内添加命令行指令。
该脚本位于/etc/路径下，需要root权限才能修改。该脚本具体格式如下：

```bash
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

exit 0
```

注意: 一定要将命令添加在 exit 0之前

## 方式二、添加一个开机启动脚本
上面的方法虽然奏效，但是将所有不同的脚本指令写入同一个文件不是一个好的style。我们可以自己写一个run.sh,然后让系统在开机时自动执行。

以下是基本步骤

1. 建立自己的脚本
    首先，我们需要写一个需要执行的脚本。在这里我们已一个开启vpn的脚本为例：auto_start_vpn.sh
    
2. 修改脚本权限   
    一定要让脚本具备可执行权限，可以执行如下指令：
    
    ```bash
    $ sudo chmod 755 auto_start_vpn.sh
    ```
    
3. 将脚本放置在启动路径下
    将run_server.sh移动到/etc/init.d路径下，可以直接拷贝，也可以链接过去
    
    ```bash
    $ sudo cp auto_start_vpn.sh /etc/init.d/
    ```
    
4. 将脚本添加到启动脚本。
    执行如下指令，在这里90表明一个优先级，越高表示执行的越晚
    
    ```bash
    $ cd /etc/init.d/
    $ sudo update-rc.d auto_start_vpn.sh defaults 90
    ```
    
5. 如何移除该脚本
    很简单，执行如下指令：
    
    ```bash
    $ sudo update-rc.d -f auto_start_vpn.sh remove
    ```
    
