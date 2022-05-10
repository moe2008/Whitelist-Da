const { ethers } = require("hardhat");

async function main() {

    // With contract factory we get an instance of our smart contract
    const whitelistContract = await ethers.getContractFactory("Whitelist");

    // we deploy our smart contract with a max of 10 whitelist places
    const deployedWhitelistContract = await whitelistContract.deploy(10);

    // we wait until our contract is deployed
    await deployedWhitelistContract.deployed();

    // to show our contract address
    console.log("Whitelist Contract Address:", deployedWhitelistContract);
}

// We call our main function to start the proccess and catch errors if there are errors
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });