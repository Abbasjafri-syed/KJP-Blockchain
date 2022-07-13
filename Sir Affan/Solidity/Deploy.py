#  SC deployment in Ganache using python
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


W3= Web3 (Web3.HTTPProvider('http://0.0.0.0:8545'))
ChainID= 1337
Myaddress= ' '
privatekey = ' '

simplestore = W3.eth.contract(abi = abi, bytecode = bytecode)
# print(simplestore)
