Src placement:\
`libvirt/win10-passthrough.xml` -> `/etc/libvirt/qemu` \
`libvirt/qemu.d` -> `/etc/libvirt/hooks/qemu.d`

---

Reset bug arcane workaround:\
`echo 1 | sudo tee /sys/bus/pci/devices/0000:01:00.0/remove && echo 1 | sudo tee /sys/bus/pci/rescan
`\
^^ run twice after every reboot

---

Sunshine config
![sunshine setup](sunshine_setup.png)

