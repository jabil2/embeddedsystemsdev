FROM ubuntu:16.04

# apt HTTPS
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https

# Cmake, ninja, lcov, gcovr
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y cmake ninja-build lcov gcovr mc sshfs net-tools nmap

# Yocto required 
RUN apt-get update && DEBIAN_FRONTEND=noninteractive  apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
xz-utils debianutils iputils-ping libsdl1.2-dev xterm

# Yocto required
RUN apt-get update && DEBIAN_FRONTEND=noninteractive  apt-get install -y autoconf libtool libglib2.0-dev libarchive-dev python-git \
sed cvs subversion coreutils texi2html docbook-utils python-pysqlite2 \
help2man make gcc g++ desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev \
mercurial automake groff curl lzop asciidoc u-boot-tools dos2unix mtd-utils pv \
libncurses5 libncurses5-dev libncursesw5-dev libelf-dev zlib1g-dev

# LLVM/clang
RUN printf 'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial main \n\
deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial main \n\
deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-7 main \n\
deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-7 main \n\
deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main \n\
deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main \n\
' > /etc/apt/sources.list.d/llvm.list

# LLVM/clang (depends on wget)
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
 apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y  libllvm-7-ocaml-dev libllvm7 llvm-7 llvm-7-dev llvm-7-doc llvm-7-examples llvm-7-runtime \
clang-7 clang-tools-7 clang-7-doc libclang-common-7-dev libclang-7-dev libclang1-7 clang-format-7 python-clang-7  \
libfuzzer-7-dev lldb-7 lld-7 libc++-7-dev libc++abi-7-dev  libomp-7-dev && \
DEBIAN_FRONTEND=noninteractive apt-get install -y  libllvm-8-ocaml-dev libllvm8 llvm-8 llvm-8-dev llvm-8-doc llvm-8-examples llvm-8-runtime \
clang-8 clang-tools-8 clang-8-doc libclang-common-8-dev libclang-8-dev libclang1-8 clang-format-8 python-clang-8  \
libfuzzer-8-dev lldb-8 lld-8 libc++-8-dev libc++abi-8-dev  libomp-8-dev && \
DEBIAN_FRONTEND=noninteractive apt-get install -y  libllvm-9-ocaml-dev libllvm9 llvm-9 llvm-9-dev llvm-9-doc llvm-9-examples llvm-9-runtime \
clang-9 clang-tools-9 clang-9-doc libclang-common-9-dev libclang-9-dev libclang1-9 clang-format-9 python-clang-9  \
libfuzzer-9-dev lldb-9 lld-9 libc++-9-dev libc++abi-9-dev  libomp-9-dev 

