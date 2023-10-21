# NixOS configuration with flakes
Not for prying eyes

## My NixOS installation reminder for me, as well as the config

To see a list of partitions, use
```
lsblk
```
By default, NVMe drives use

/dev/nvme0n1 - it will be used in the future

First, let's clean out our drive of the old system and all that stuff
```
sudo wipefs --all /dev/nvme0n1
```
The second step, partitioning the drive

Creating a partition table
```
sudo parted /dev/nvme0n1 -- mklabel gpt
```
The first partition, that's where we'll put the system
```
sudo parted /dev/nvme0n1 -- mkpart primary 512MiB 100%
```
If anything, 100 percent, that's all the space we have on the disk (we'll chew it off for a boot partition later).

The second section of the boot
```
sudo parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 512MiB
```
Set the second partition to be the boot partition
```
sudo parted /dev/nvme0n1 -- set 2 boot on
```
Encrypt the partition where the system will be located
```
sudo cryptsetup luksFormat /dev/nvme0n1p1
```
During the process, we will be asked to enter YES in capital letters first, then enter 2 times the password that will be used to decrypt the partition

Decrypt the section for further work with it
```
sudo cryptsetup open /dev/nvme0n1p1 cryptroot
```
Now, we have the path to the decrypted block device - /dev/mapper/cryptroot

Now, we need to specify the file system, I will use BTRFS (Also, subvolumes will be created as well)
```
sudo mkfs.btrfs /dev/mapper/cryptroot
```
Mount to /mnt
```
sudo mount /dev/mapper/cryptroot /mnt
```
Go to /mnt
```
cd /mnt
```
Creating subvolumes
```
sudo btrfs sub create root
```
```
sudo btrfs sub create nix
```
```
sudo btrfs sub create var
```
```
sudo btrfs sub create home
```
Exit /mnt
```
cd
```
Unmount /mnt
```
sudo umount /mnt
```
Mounting the subvolumes
```
sudo mount -o noatime,subvol=root /dev/mapper/cryptroot /mnt
```
```
sudo mkdir -p /mnt/{home,nix,var,boot}
```
```
sudo mount -o noatime,subvol=home /dev/mapper/cryptroot /mnt/home
```
```
sudo mount -o noatime,subvol=nix /dev/mapper/cryptroot /mnt/nix
```
```
sudo mount -o noatime,subvol=var /dev/mapper/cryptroot /mnt/var
```
Recall the boot section
```
sudo mkfs.fat -F32 /dev/nvme0n1p2
```
```
sudo mount /dev/nvme0n1p2 /mnt/boot
```
Generating the config
```
sudo nixos-generate-config --root /mnt
```
Edit the config at your discretion
```
sudo nano /mnt/etc/nixos/configuration.nix
```
Installing the system
```
sudo nixos-install
```
After the installation
```
reboot
```
