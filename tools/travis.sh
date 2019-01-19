set -x
ulimit -n 4096


git submodule update --init


pwsh-preview -c "cd src; ./bootstrap.ps1; ./build.ps1 -framework "netcoreapp2.0" Release; ./build.ps1 -framework "netstandard1.6" Release"
sudo pwsh-preview -c "cd Test;  ./run-tests.ps1 coreclr -nugetApiVersion $1"