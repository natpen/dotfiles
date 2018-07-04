dotfiles
========

This is my (new, fish-based) collection of [configuration files](http://dotfiles.github.io/).

Usage
-----

Pull the repository, and then create the symbolic links [using GNU
stow](https://www.gnu.org/software/stow/).

```bash
$ git clone git@github.com:natpen/dotfiles2.git ~/dotfiles
$ cd ~/dotfiles
$ stow fish # plus whatever else you'd like
```

The `fish` dotfiles depend on [the fish shell](http://fishshell.com),
so install that first before `stow`ing fish.

License
-------

[MIT](http://opensource.org/licenses/MIT).
