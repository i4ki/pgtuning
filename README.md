# pgtuning

*smashing the database for fun and profit*

Crazy and simple idea: Automate the steps below:

- Build a Linux kernel tuned for AWS EC2, EBS and postgres for an
  specific workload.
- Build a minimalist linux distro
- Build a static optimized postgres
- Create an AWS AMI
- Create VPC, Subnet, etc, required network
- Create EBSs
- Start an instance
- Setup the RAID
- Install postgres
- Run pgbench and output reports

# UI Design

I've the following usage in mind:

```sh
λ> cd pgtuning
λ> make KERNEL=4.7.2 DISTRO=archlinux PG=9.2 RAID=10 instance=r3.2xlarge
Downloading kernel 4.7.2...
<building kernel>
Downloading archlinux rootfs...
Downloading postgres 9.2...
Building postgres...
Creating AMI...
Creating aws network (vpc, subnets, ...)
Creating EBS0, EBS1, EBS2, ...
Starting instance r3.2xlarge
Installing postgres...
Running pgbench...
<report>
```

Sounds crazy, but why not?
