- To download the `clash for Linux` binary (gzipped)

  1. [github/Dreamacro/clash](https://github.com/Dreamacro/clash/releases)

  2. `gunzip` the downloaded `gz` file into `/usr/local/bin/`, and better rename it from
	 `clash-linux-amd64-v...` to simply `clash`.

  3. `chmod +x /usr/local/bin/clash`
	
- To start the clash proxy
  1. You need `Country.mmdb` file to work with `clash`. Download it from its releases page.
     - [github/Dreamacro/maxmind-geoip/releases](https://github.com/Dreamacro/maxmind-geoip/releases)

  2. If you have a `config.yaml` file in `~/.config/clash/` directory, you can simply run
	 `clash` to start the proxy. Or,

  3. If your `yaml` file has another name (e.g. `myclashconfig.yml`), you should start
	 your clash proxy as this:

	```sh
	clash -f /path/to/myclashconfig.yml
	```

- Configure qutebrowser to work with proxy

  - In `~/.config/qutebrowser/config.py`, you should have the following lines:
  
	  ```python
	  c.content.proxy = "socks://localhost:7891/"

	  config.bind('<Ctrl-a><Ctrl-s>', 'config-cycle content.proxy none socks://localhost:7891', mode='normal')
	  ```
	  
	  so that you can switch on/off the proxy by typing `Ctrl-a Ctrl-s` in qutebrowser.
	  
  - socks5: `socks://localhost:7891`
  - http: `http://localhost:7890`
  - https: `https://localhost:7890`
  - `/etc/proxychains4.conf`: `socks5	127.0.0.1 7891`

- web-based dashboard

  1. download:
    [clash-dashboard](https://github.com/Dreamacro/clash-dashboard/tree/gh-pages)
	
	`Code` -> `Download zip`
	
  2. After unzip, rename the extracted dir to `~/.config/clash/ui`.
  
  3. add the following line into `config.yaml`:
  
	  ```
	  external-ui: /home/USER/.config/clash/ui
	  ```
	  
	  Change `USER` to your username.
	  
  4. open the dashboard at: http://127.0.0.1:9090/ui

- Free config file update
  - [破解资源君Youtube channel](https://www.youtube.com/channel/UCrGEYuZ1nw3RDj4LDKJmrZw)
  - [阿伟科技Youtube channel](https://www.youtube.com/channel/UCAVXAOB168NaJozwrXT1hkw)


