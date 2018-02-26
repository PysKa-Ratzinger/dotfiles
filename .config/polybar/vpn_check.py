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

def get_if_addr(ifname):
    """
    Given an interface name, get it's ip address
    """
    try:
        return get_ip_address(ifname)
    except:
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
            if os.path.isfile(vpn_name_file):
                with open(vpn_name_file, "r") as f:
                    vpn_name = f.readlines()[0].split("\n")[0]
            else:
                vpn_name_file = None
                vpn_name = ".".join(file.split(".")[1:-1])
            yield vpn_name_file, vpn_name, vpn_pid_file

    except:
        pass

def main():
    vpns = get_vpn_names("/var/run/")
    for vpn_name_file, vpn_name, vpn_pid_file in vpns:
        if vpn_pid_file:
            print("VPN: %{F-}" + f"{vpn_name} {get_if_addr(b'tun0')}")
            sys.exit(0)
        break
    sys.exit(1)

if __name__ == '__main__':
    main()

