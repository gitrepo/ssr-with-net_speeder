# SSR-with-net_speeder for docker

Quit start:

Expose 22/tcp 8388/tcp 8388/udp 3000/tcp
Set environment variable ROOT_PASS and SSR_PASS

    docker run -d -p 8388:8388/tcp -p 8388:8388/udp suifeng/ssr-with-net_speeder -s 0.0.0.0 -p 8388 -k $SSR_PASS -m chacha20-ietf -o tls1.2_ticket_auth -P auth_aes128_sha1

In default,the root passwd is random.If you want to use a preset password instead of a random generated one, you can set the environment variable ROOT_PASS to your specific password when running the container:

    docker run -d -p 8388:8388/tcp -p 8388:8388/udp -e ROOT_PASS="mypass" suifeng/ssr-with-net_speeder -s 0.0.0.0 -p 8388 -k $SSR_PASS -m chacha20-ietf -o tls1.2_ticket_auth -P auth_aes128_sha1

