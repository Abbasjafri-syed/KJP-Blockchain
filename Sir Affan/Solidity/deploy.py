from solcx import compile_standard, install_solc
import json
from web3 import Web3

with open("./simplestorage.sol", "r") as file:
    simplestoragefile = file.read()
    # print(simplestoragefile)

    install_solc("0.8.12")

# Solidity source code
compiled_sol = compile_standard(
    {
        "language": "Solidity",
        "sources": {"simplestorage.sol": {"content": simplestoragefile}},
        "settings": {
            "outputSelection": {
                "*": {
                    "*": ["abi", "metadata", "evm.bytecode", "evm.bytecode.sourceMap"]
                }
            }
        },
    },
    solc_version="0.8.12",
)

print(compiled_sol)

with open("compiled_code.json", "w") as file:
    json.dump(compiled_sol, file)

# get bytecode
bytecode = compiled_sol["contracts"]["simplestorage.sol"]["storeapp"]["evm"][
    "bytecode"
]["object"]

# get abi
abi = json.loads(
    compiled_sol["contracts"]["simplestorage.sol"]["storeapp"]["metadata"]
)["output"]["abi"]


W3 = Web3(Web3.HTTPProvider("http://127.0.0.1:8545"))
ChainID = 1337
Myaddress = "0x7DaFa28241506c4c3C9e2b0A6e9208f3bEAd3Ebd"
privatekey = "0x32ba65087b64fc93b59dcab117a715c219a7059f1e21c673891f4bc34cb2af39"

simplestore = W3.eth.contract(abi=abi, bytecode=bytecode)
# print(simplestore)
