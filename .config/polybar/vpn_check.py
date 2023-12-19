#!/usr/bin/env python3

import sys
import socket
import fcntl
import struct
import os


def get_ip_address(ifname):
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    return socket.inet_ntoa(fcntl.ioctl(
        s.fileno(),
        0x8915,  # SIOCGIFADDR
        struct.pack('256s', ifname[:15])
    )[20:24])


def get_if_addr(ifname: str):
    """
    Given an interface name, get it's ip address
    """
    try:
        return get_ip_address(ifname.encode("utf8"))
    except Exception:
        return "no ip"


def get_vpn_names(folder):
    """
    Get all vpn names from folder
    """
    try:
        for file in os.listdir(folder):
            path = os.path.join(folder, file)
            if file.endswith(".vpnname"):
                vpn_name_file = path
                vpn_pid_file = vpn_name_file.split(".vpnname")[0] + ".pid"
            elif file.endswith(".pid") and file.startswith("openvpn"):
                vpn_pid_file = path
                vpn_name_file = path.split(".pid")[0] + ".vpnname"
            else:
                continue

            if not os.path.isfile(vpn_pid_file):
                vpn_pid_file = None

            vpn_name = None
            tun_iface = None

            if os.path.isfile(vpn_name_file):
                with open(vpn_name_file, "rb") as f:
                    content = f.readlines()
                    vpn_name = content[0].decode().split("\n")[0]
                    if len(content) >= 2:
                        tun_iface = content[1].split(b"\n")[0].decode("utf8")
                    else:
                        tun_iface = "tun0"
            else:
                vpn_name_file = None
                tun_iface = "tun0"
                vpn_name = ".".join(file.split(".")[1:-1])
            yield vpn_name, tun_iface, vpn_pid_file

    except Exception:
        pass


def main():
    vpns = get_vpn_names("/var/run/")
    for vpn_name, tun_iface, vpn_pid_file in vpns:
        if vpn_pid_file:
            print("VPN: %{F-}" + f"{vpn_name} {tun_iface} {get_if_addr(tun_iface)}")
            sys.exit(0)
        break
    sys.exit(1)


if __name__ == '__main__':
    main()
