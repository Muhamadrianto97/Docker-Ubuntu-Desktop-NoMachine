wget -O zrok.sh https://github.com/kmille36/Docker-Ubuntu-Desktop-NoMachine/raw/main/zrok.sh > /dev/null 2>&1
chmod +x zrok.sh
./zrok.sh

function goto {
    label=$1
    cd
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

: zrok
clear
echo "Go to: https://github.com/openziti/zrok#installation to install Zrok"
read -p "Press Enter when Zrok is installed..."

# Enable Zrok (Only needed for first-time setup)
zrok enable || { echo "Zrok setup failed!"; exit 1; }

clear
echo "Repo: https://github.com/kmille36/Docker-Ubuntu-Desktop-NoMachine"
echo "======================="
echo "Starting Zrok Tunnel for NoMachine..."
echo "======================="

# Start a private TCP tunnel for NoMachine (port 4000)
ZROK_ACCESS=$(zrok share private --backend-mode tcpTunnel 127.0.0.1:4000 | grep "access private" | awk '{print $5}')
if [[ -z "$ZROK_ACCESS" ]]; then
    echo "Zrok Error! Please try again!"
    sleep 1
    goto zrok
fi

# Start NoMachine Docker container
docker run --rm -d --network host --privileged --name nomachine-xfce4 \
    -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=1g \
    thuonghai2711/nomachine-ubuntu-desktop:wine

clear
echo "NoMachine: https://www.nomachine.com/download"
echo "Done! NoMachine Information:"
echo "======================="
echo "🔹 **Akses NoMachine dengan Zrok dari komputer lain:**"
echo ""
echo "1️⃣ Jalankan perintah ini di komputer klien:"
echo "   zrok access private $ZROK_ACCESS"
echo ""
echo "2️⃣ Setelah itu, hubungkan NoMachine ke **127.0.0.1:9191**"
echo ""
echo "======================="
echo "User: user"
echo "Passwd: 123456"
echo "======================="
echo "VM can't connect? Restart Cloud Shell then Re-run script."

# Infinite loop to keep script running
seq 1 43200 | while read i; do 
    echo -en "\r Running .     $i s /43200 s"; sleep 0.1
    echo -en "\r Running ..    $i s /43200 s"; sleep 0.1
    echo -en "\r Running ...   $i s /43200 s"; sleep 0.1
    echo -en "\r Running ....  $i s /43200 s"; sleep 0.1
    echo -en "\r Running ..... $i s /43200 s"; sleep 0.1
    echo -en "\r Running     . $i s /43200 s"; sleep 0.1
    echo -en "\r Running  .... $i s /43200 s"; sleep 0.1
    echo -en "\r Running   ... $i s /43200 s"; sleep 0.1
    echo -en "\r Running    .. $i s /43200 s"; sleep 0.1
    echo -en "\r Running     . $i s /43200 s"; sleep 0.1
done
