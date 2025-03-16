const hre = require("hardhat");

const main = async () => {
    const TodoList = await hre.ethers.getContractFactory("TodoList");
    const todoList = await TodoList.deploy();

    await todoList.waitForDeployment();
    console.log("Contract deployed to:", await todoList.getAddress());
};

main().catch((error) => {
    console.error(error);
    process.exit(1);
});
