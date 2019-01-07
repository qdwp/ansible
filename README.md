# Ansible 简单应用

## 示例

### 本地主控机 ping 远程受控机

```
ansible short -m ping

"""
linux | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
baidu | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
"""
```

### 在远程受控机执行命令

```
ansible short -m shell -a "ip address"

"""
linux | CHANGED | rc=0 >>
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:87:55:42 brd ff:ff:ff:ff:ff:ff
    inet 10.105.199.196/18 brd 10.105.255.255 scope global eth0
       valid_lft forever preferred_lft forever
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default
    link/ether 02:42:80:db:2f:52 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 scope global docker0
       valid_lft forever preferred_lft forever
5: vethc544f8d@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default
    link/ether 62:94:f2:9d:aa:c2 brd ff:ff:ff:ff:ff:ff link-netnsid 0

baidu | CHANGED | rc=0 >>
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether fa:16:3e:15:ea:09 brd ff:ff:ff:ff:ff:ff
    inet 172.16.0.4/20 brd 172.16.15.255 scope global noprefixroute eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::f816:3eff:fe15:ea09/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default
    link/ether 02:42:fd:07:65:72 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 scope global docker0
       valid_lft forever preferred_lft forever

"""
```

### 在远程受控机执行本机脚本

```
ansible short -m script -a "./script/cmd.sh"

"""
# 输出为脚本执行结果
"""
```

## 工具模块


1. command [执行远程命令，可用 shell 替换]

    `ansible testservers -m command -a 'uname -n'`

2. shell   [执行远程主机的 shell/python 脚本]

    `ansible testservers -m shell -a 'bash /root/test.sh'`

3. script  [在远程主机执行主控端的 shell/python 脚本，使用相对路径]

    `ansible testservers -m script -a '/etc/ansible/test.sh`

4. raw     [类似于 command 模块、支持管道传递]

    `ansible testservers -m raw -a "ifconfig eth0 |sed -n 2p |awk '{print \$2}' |awk -F: '{print \$2}'"`








