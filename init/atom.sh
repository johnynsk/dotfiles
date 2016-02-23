LINK = `curl -s https://api.github.com/repos/atom/atom/releases | grep browser_download_url | grep '64[.]deb' | grep -v 'beta' | head -n 1 | cut -d '"' -f 4`
sudo rm -f /tmp/atom.deb 2>/dev/null
wget "${LINK}" -O /tmp/atom.deb
sudo dpkg -i /tmp/atom.deb
rm -f /tmp/atom.deb
sudo apt-get -f install
