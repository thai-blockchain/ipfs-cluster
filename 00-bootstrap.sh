#!/bin/sh
set -ex
ipfs bootstrap rm all
ipfs bootstrap add /dns4/ipfs.blockchain.or.th/tcp/4001/p2p/12D3KooWNmpVawG4e3jgjkDyA8LxSzQWfnpqQZ6Z65BvGnVEhfdx
