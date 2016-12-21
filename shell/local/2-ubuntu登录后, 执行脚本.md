# 实现开机后启动终端并执行auto_start_vpn.sh的方式<div style="color:red">（系统登录后）</div>
打开终端，执行下面命令,
    
```bash
$ gnome-session-properties：
```
        
会弹出一个“启动应用程序首选项”的菜单，添加一个启动项，
名称，注释随便输入。
命令的地方输入：

```bash
terminator -l jimi_layout -m -x /home/jimi/autorun_jimi/auto_start_vpn.sh
```

**Tip：**terminator配置，参考[这里](https://github.com/cangchen8180/my-docs-project/blob/master/docs/ubuntu/1-terminator%E5%AE%89%E8%A3%85%E5%8F%8A%E9%85%8D%E7%BD%AE.md)    
    