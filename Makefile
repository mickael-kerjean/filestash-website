deploy:
	rsync -avn --delete _site/ root@rick.kerjean.me:/mnt/me-kerjean-pages/projects/filestash/website/
