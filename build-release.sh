rm -rf llvm-project
git clone -b llvmorg-14.0.0 --single-branch --depth=1 https://github.com/llvm/llvm-project.git
rm -rf llvm-build
mkdir llvm-build
cd llvm-build/
CC=clang CXX=clang++ cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../llvm-release -DLLVM_TARGET_ARCH=arm -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=ARM -DLLVM_TARGETS_TO_BUILD=ARM -DLLVM_DEFAULT_TARGET_TRIPLE=aarch64-apple-darwin -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt" -G "Unix Makefiles" ../llvm-project/llvm
make -j4
make install
cd ..
tar cJf llvm-release.tar.xz llvm-release/

# llvm-13.0.1-arm64-apple-darwin.tar.xz
