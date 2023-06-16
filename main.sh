# Clone Upstream
git clone https://gitlab.freedesktop.org/rncbc/qpwgraph -b v0.4.2
rm -rfv ./qpwgraph/debian
cp -rvf ./debian ./qpwgraph/
cd ./qpwgraph

LOGNAME=root dh_make --createorig -y -l -p qpwgraph_0.4.2

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
