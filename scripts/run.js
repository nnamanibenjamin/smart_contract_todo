const todo = await ethers.getContractAt("TodoList", "0x915C02316624A954Eb5332F092a1a9f0D1E7d10c");
await todo.createTask("Learn Solidity");
await todo.getTask(1);
await todo.completeTask(1);
