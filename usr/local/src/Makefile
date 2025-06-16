# Variables
ctrl = DEBIAN/control
aptly_dir = /home/wx672/.aptly
publish = aptly publish update sid

# List of packages
packages = dingtalk wechat wx672conf wx672cli wx672tmux wx672tmate wx672qutebrowser wx672xorg wx672emacs wx672texmf wx672kmscon wx672font wx672-mandatory

# Pattern rule for building packages
$(packages): %: %/$(ctrl)
	dpkg-deb --root-owner-group -b $@
	aptly repo remove wx672repo $@ 
	$(publish)

# Phony targets
.PHONY: aptly cs6

aptly:
	aptly repo add -remove-files wx672repo *.deb
	$(publish)

cs6:
	rsync -av $(aptly_dir)/public/ cs6:/var/www/debian
