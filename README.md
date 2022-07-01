## NAME

zr - Enzo's overlay

## DESCRIPTION

Ebuild repo which contains additional packages for my Gentoo system. 

## USAGE

To add, you should have eselect-repository:

```
root # eselect repository add zr git https://git.sr.ht/~nzv/zr
````

For issues and syncing matters, [emaint(1)] could be help:

```
root # emaint sync -r zr
````

## LICENSE

BSD only, see [LICENSE].

Copyright (C) 2022 Enzo Venturi

[emaint(1)]: https://dev.gentoo.org/~zmedico/portage/doc/man/emaint.1.html
[LICENSE]: LICENSE
