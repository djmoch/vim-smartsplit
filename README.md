# VIM-SMARTSPLIT

You're lazy. Let Vim decide your split directions.

## Summary

Yeah, you're aware of `split`/`vsplit`, `new`/`vnew` and the like. You
use them because you have to, but you know there must be a better way.
This is it.

Vim, given it's old pedigree, tacitly assumes a standard terminal width
of around 80 characters. In this environment it makes sense for Vim to
assume any command that divides the current window should divide
horizonally. But our monitors are often capable of more than twice the
width of an old terminal, so this doesn't make sense any more.

One sensible option, which this plugin adopts, is to make a best-guess
at the width of the text displayed in the current window (see
`'textwidth'`). Then operations should default to vertical if there is
enough horizonal room to display two splits side-by-side.

This plugin provides `:Help`, `:Split`, `:New`, and `:Buffer` commands
to replace their lower-case counterparts. It also sets `'diffopt'` to
split in either a horizontal or vertical direction, again depending on
the horizontal space available.

## Installation

It's 2019, and the only sensible option for package management in Vim's
built-in manager. If you've never used it before, here's the summary
(adapted from `:help packages`).

```
cd .vim
mkdir -p pack/foo/start
cd pack/foo/start
git clone https://git.danielmoch.com/vim-smartsplit.git
```

If you're stuck on an old version of Vim without support for packages,
then I recommend using [Pathogen](https://github.com/tpope/vim-pathogen)
to fill the gap, in which case the installation is the same.

## Usage

There aren't any tricks here. Just use `:Help`, `:Split`, `:Buffer`, and
`:New` instead of their lower-case counterparts.

## License

This plugin is made available under the same license as Vim itself.

## Contributing

This plugin will never do anything more fancy than it already does, but
the current maintainer is prone to stupid mistakes, so if you find any
bugs feel free to submit patches via email to the address listed in
`:help vim-smartsplit`.

If you're unfamiliar with the Git email workflow, I recommend
[git-send-mail.io](https://git-send-email.io/) as a good place to learn
the basics.
