#! /bin/sh

case "$1" in
  start)

        sysctl -w net.ipv4.ip_forward=1
      	sudo iptables-restore /etc/iptables.save

        nohup /etc/openvpn/delay-send 2>&1 &
        ;;
  restart|reload|force-reload)
        echo "Error: argument '$1' not supported" >&2
        exit 3
        ;;
  stop|status)
        # No-op
        ;;
  *)
        echo "Usage: $0 start|stop" >&2
        exit 3
        ;;
esac
