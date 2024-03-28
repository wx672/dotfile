- Download and install `mihomo` deb package

  - [Github:MetaCubeX/Clash.Meta/releases](https://github.com/MetaCubeX/mihomo/releases)

- To start the `clash (mihomo)` proxy

  1. Download `Country.mmdb` from its releases page.

     - [github/Dreamacro/maxmind-geoip/releases](https://github.com/Dreamacro/maxmind-geoip/releases)

  1. If you have a `config.yaml` file in `~/.config/clash/` directory, you can simply run
     `mihomo` to start the proxy. Or,

  1. If your `yaml` file has another name (e.g. `myclashconfig.yml`), you should start
     your clash proxy as this:

  ```sh
  mihomo -f /path/to/myclashconfig.yml
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
     [clash-dashboard](https://github.com/Dreamacro/clash-dashboard)

  `Code` -> `Download zip`

  2. After unzip, rename the extracted dir to `~/.config/clash/ui`.

  1. add the following line into `config.yaml`:

     ```
     external-ui: /home/USER/.config/clash/ui
     ```

     Change `USER` to your username.

  1. open the dashboard at: http://127.0.0.1:9090/ui

- Free config files

  - [顺丰资源](https://www.youtube.com/@SFZY666/videos)
  - [由零开始Youtube channel](https://www.youtube.com/@blue-Youtube/videos)
