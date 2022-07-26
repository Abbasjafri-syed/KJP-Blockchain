#  SC deployment in Ganache using python linked with file SC.sol

# importing necessary libraries...
# installing solidity lib and compiler in py
from solcx import compile_standard, install_solc

# json library for formatting ABI of contract
import json

# library for creating and calling environment variable to save sensitive information
import os
from dotenv import load_dotenv

load_dotenv()

# web3 library for python - from is keyword for installing libraries and packages
from web3 import Web3

# with is used to import a file path
# saving a file with file name var
with open("./simplestorage.sol", "r") as file:

    # defining only reading for the imported file and saving in variable for further usage
    simplestoragefile = file.read()
    # print(simplestoragefile)

    # installing solidity in python - specific version
    install_solc("0.8.12")

# Solidity source code to compile data
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
# print(compiled_sol)

# saving compile data into json formatte
with open("compiled_code.json", "w") as file:
    json.dump(compiled_sol, file)

# # getting bytecode of contract
bytecode = compiled_sol["contracts"]["simplestorage.sol"]["storeapp"]["evm"][
    "bytecode"
]["object"]

# print(bytecode)

# getting abi
abi = json.loads(
    compiled_sol["contracts"]["simplestorage.sol"]["storeapp"]["metadata"]
)["output"]["abi"]
# print(abi)

# connecting python with local blockchain[Ganache]
W3 = Web3(Web3.HTTPProvider("http://127.0.0.1:6545"))
ChainID = 1337
Myaddress = "0x0b22Ce7C2B0B0A4EC31c9Dd2508B657fA45C5084"

# calling pvt key by setting environment variable file [.env]
privatekey = os.getenv("pvtkey")
# print(privatekey)

# creating contract in python
simplestore = W3.eth.contract(abi=abi, bytecode=bytecode)
# print(simplestore)

# nonce tracking number of transaction in block
nonce = W3.eth.getTransactionCount(Myaddress)
# print(nonce)

# creating transaction in blocks by passsing params(chainid, gasprice, wallet address[origin] and nonce)
transaction = simplestore.constructor().buildTransaction(
    {
        "chainId": ChainID,
        "from": Myaddress,
        "nonce": nonce,
        "gasPrice": W3.eth.gas_price,
    }
)
# print(transaction)

# signing transaction with private key
signedtransac = W3.eth.account.sign_transaction(transaction, privatekey)
# print(signedtransac)

# sending transaction on local blockchain[Ganache]
txnhash = W3.eth.send_raw_transaction(signedtransac.rawTransaction)
# print(txnhash)
print('Deploying contract...')


# creating reciept for the transactionusing the hash of sent transaction
txnrecpt = W3.eth.wait_for_transaction_receipt(txnhash)
# print(txnrecpt)
print('Deployed')

simplemake = W3.eth.contract(address=txnrecpt.contractAddress, abi=abi)
# print(simplemake)

# printing a function from the imported file[only calling function]
print(simplemake.functions.getval().call())

# # passing value in function [which must have return type defined]
# print(simplemake.functions.setval(12).call())

# same step followed as above for completing a transaction on blockchain
# storing transaction for event through a function - with only build transaction equires the function name to be used
buildtransac = simplemake.functions.setval(12).buildTransaction(
    {
        "chainId": ChainID,
        "from": Myaddress,
        "nonce": nonce + 1,
        "gasPrice": W3.eth.gas_price,
    }
)

signedstore = W3.eth.account.sign_transaction(buildtransac, privatekey)
print('Updating contract...')
txnstore = W3.eth.send_raw_transaction(signedstore.rawTransaction)

storerecpt = W3.eth.wait_for_transaction_receipt(txnstore)
print('Contract Updated')

print(simplemake.functions.getval().call())
