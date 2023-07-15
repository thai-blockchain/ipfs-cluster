# InterPlanetary File System (IPFS) Service
## Minimum Requirements
* A VM, or bare-metal, with 2 cores of 64-bit processor, 4 GB RAM, 50 GB SSD, 1000 Mbps Internet access with a Public IP Address
* Linux, preferably, Ubuntu LTS
* Docker and Docker Compose
* You need the swarm key join the IPFS swarm.
* You need the cluster secret to join the IPFS Cluster.

## IPFS Cluster and Kubo
Clone the repository
```bash
git clone https://github.com/thai-blockchain/ipfs-cluster.git
cd ipfs-cluster
mkdir ipfs cluster
```

Initialize IPFS/Kubo 
```bash
docker run --rm -v $PWD/ipfs:/data/ipfs ipfs/kubo:release init
sed -i '/Routing/a \    "Type": "dht",' ipfs/config
cp swarm.key ipfs/
```

Edit peer name and secret,
```bash
cp env .env
vi .env
```

Initialize IPFS Cluster, add bootstrap, and deploy configuration
```bash
docker run --rm -v $PWD/cluster/:/data/ipfs-cluster/ ipfs/ipfs-cluster ipfs-cluster-service init
echo "/dns4/ipfs.blockchain.or.th/tcp/9096/p2p/12D3KooW….W5YteF9W" >  cluster/peerstore
cp service.json cluster/
```

Then, run
```bash
docker-compose up -d
```
