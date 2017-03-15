# [www.neubloc.com - Polish version](https://neubloc.github.io/www-neubloc-pl/)

---
(this readme is work in progress)
## Environment Setup

```sh
sudo apt-get install ruby-full
sudo gem install jekyll bundler
bundle install

```

## Repository

```sh
www$> git clone  git@github.com:neubloc-poland/www-neubloc-pl.git
www$> cd www-neubloc-pl
www/www-neubloc-pl$> git checkout develop 

# extra setup for  gh_pages
www/www-neubloc-pl$> cd ..
www$> cp -r www-neubloc-pl www-neubloc-pl-site
www$> cd www-neubloc-pl-site
www/www-neubloc-pl-site$> git checkout gh_pages
www$> cd ../www-neubloc-pl
www/www-neubloc-pl$> rm -fr site
www/www-neubloc-pl$> ln -sr ../www-neubloc-pl-site/ site

# now to publish changes to io.github (after build) do
www/www-neubloc-pl$> cd site
www/www-neubloc-pl/site$> git add -A; git commit -au -m "site updates"; git push ; 
www/www-neubloc-pl/site$> cd ..;

```

## Jekyll
```sh
bundle exec jekyll serve -H 127.0.0.1 # will start local server 
# or
# this will generate html under ./site 
# the site folder contents can be uploaded then to gh_pages branch and tested on github pages service
bundle exec jekyll build 
```
---


### Icons + Demo Images:

- [The Noun Project](https://thenounproject.com) -- Garrett Knoll, Arthur Shlain, and [tracy tam](https://thenounproject.com/tracytam)
- [Font Awesome](http://fortawesome.github.io/Font-Awesome/)
- [Unsplash](https://unsplash.com/)

### Other:

- [Jekyll](http://jekyllrb.com/)
- [jQuery](http://jquery.com/)
- [Susy](http://susy.oddbird.net/)
- [Breakpoint](http://breakpoint-sass.com/)
- [Magnific Popup](http://dimsemenov.com/plugins/magnific-popup/)
- [FitVids.JS](http://fitvidsjs.com/)
- Greedy Navigation - [lukejacksonn](http://codepen.io/lukejacksonn/pen/PwmwWV)
- [jQuery Smooth Scroll](https://github.com/kswedberg/jquery-smooth-scroll)
- [Stickyfill](https://github.com/wilddeer/stickyfill)

---

## License

The MIT License (MIT)

Copyright (c) 2016 Michael Rose

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
