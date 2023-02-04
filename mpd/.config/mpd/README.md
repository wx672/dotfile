This is a backup of the mpd config dir on cs6.
To use mpd@cs6, you have to install a mpd client, such as mpc, on your local machine.
Then, you can try:

```sh
export MPD_HOST=cs6.swfu.edu.cn
mpc listall | mpc add
mpc play
```

`man mpc` for more.
