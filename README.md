This is the website of [Filestash](https://www.filestash.app).

run the dev server:
```
python3 -m http.server --directory _site/
```

create a build:
```
docker run --rm --volume="$PWD:/srv/jekyll" -p 4000:4000 -ti ruby:2.7 bash
cd srv/jekyll
bundle install
JEKYLL_ENV=production bundle exec jekyll build
make deploy
```

todo:
- [ ] migrate ruby
- [ ] upgrade jekyll
