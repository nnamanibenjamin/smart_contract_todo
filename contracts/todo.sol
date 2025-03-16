// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract TodoList {
    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;
    uint public taskCount = 0;

    event TaskCreated(uint id, string content, bool completed);
    event TaskCompleted(uint id, bool completed);

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function completeTask(uint _id) public {
        require(_id > 0 && _id <= taskCount, "Task does not exist");
        Task storage task = tasks[_id];
        task.completed = true;
        emit TaskCompleted(_id, true);
    }

    function getTask(uint _id) public view returns (uint, string memory, bool) {
        require(_id > 0 && _id <= taskCount, "Task does not exist");
        Task memory task = tasks[_id];
        return (task.id, task.content, task.completed);
    }
}
