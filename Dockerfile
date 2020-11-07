
FROM ubuntu:20.04

# https://variwiki.com/index.php?title=Yocto_Build_Release&release=RELEASE_SUMO_V2.5_DART-MX8M-MINI
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y gawk wget git diffstat unzip texinfo gcc-multilib \
build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
xz-utils debianutils iputils-ping libsdl1.2-dev xterm

RUN DEBIAN_FRONTEND=noninteractive  apt-get install -y autoconf libtool libglib2.0-dev libarchive-dev  \
sed cvs subversion coreutils texi2html docbook-utils python-pysqlite2 \
help2man make gcc g++ desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev \
mercurial automake groff curl lzop asciidoc u-boot-tools dos2unix mtd-utils pv \
libncurses5 libncurses5-dev libncursesw5-dev libelf-dev zlib1g-dev bc

RUN curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /bin/repo && chmod a+x /bin/repo

# https://www.acmesystems.it/arm9_toolchain
RUN DEBIAN_FRONTEND=noninteractive  apt-get install -y  libc6-armel-cross libc6-dev-armel-cross binutils-arm-linux-gnueabi libncurses5-dev build-essential bison flex libssl-dev bc
RUN DEBIAN_FRONTEND=noninteractive  apt-get install -y  gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
RUN DEBIAN_FRONTEND=noninteractive  apt-get install -y  gcc-arm-linux-gnueabi g++-arm-linux-gnueabi

# ARM 64
RUN DEBIAN_FRONTEND=noninteractive  apt-get install -y  gcc-aarch64-linux-gnu g++-aarch64-linux-gnu

