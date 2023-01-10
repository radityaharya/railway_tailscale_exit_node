#!/bin/sh


echo "   __ ___ __  ____                 ___       _ __                ";
echo "  / // (_) / / __/______  __ _    / _ \___ _(_) /    _____ ___ __";
echo " / _  / /_/ / _// __/ _ \/  ' \  / , _/ _ \`/ / / |/|/ / _ \`/ // /";
echo "/_//_/_(_) /_/ /_/  \___/_/_/_/ /_/|_|\_,_/_/_/|__,__/\_,_/\_, / ";
echo "                                                          /___/  ";
echo " "
echo "Starting Tailscale..."


/app/tailscaled  --tun=userspace-networking &
until /app/tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=railway-app --advertise-exit-node

# sleep indefinitely to prevent the container from exiting
do
    sleep 5
done

sleep infinity

