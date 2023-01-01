```
  _____ __ 
 |_  / '__|
  / /| |   
 /___|_| /var/db/repos/zr
```

Gentoo overlay can supply general needs for us in default. And even if not, we are allowed to 
enhance our package ecosystem adding external overlays (e.g, zr):

```
root # eselect repository add zr git https://github.com/nnzv/zr
```

For issues and syncing matters, emaint(1) could be help:

```
root # emaint sync -r zr
```
