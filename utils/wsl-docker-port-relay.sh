#!/bin/sh
# Re-export Docker's published ports onto the ports Windows actually uses.
#
# WSL2 mirrored networking mirrors ordinary WSL listeners onto the Windows
# loopback but not Docker's published ports: Docker forwards them with its own
# userspace proxy, which the mirrored stack does not surface. Verified in one
# session with two listeners up at once, a plain WSL listener answered on
# 127.0.0.1 from Windows while a container published on 127.0.0.1 did not.
#
# socat is an ordinary process, so its listeners do mirror. This script keeps one
# socat per port in the foreground group so systemd can supervise them together.
#
# The compose override publishes the two localhost-only services on internal host
# ports (16800/18080); 6800 and 8080 are what applications use. BitTorrent's
# 51413 is not relayed because LAN peers connect to it on its real port.
set -u

socat TCP-LISTEN:6800,bind=127.0.0.1,reuseaddr,fork TCP:127.0.0.1:16800 &
RPC_PID=$!

socat TCP-LISTEN:8080,bind=127.0.0.1,reuseaddr,fork TCP:127.0.0.1:18080 &
WEB_PID=$!

# Exit as soon as either relay dies so systemd restarts the whole pair.
wait -n "$RPC_PID" "$WEB_PID" 2>/dev/null || wait "$RPC_PID"

kill "$RPC_PID" "$WEB_PID" 2>/dev/null
exit 1