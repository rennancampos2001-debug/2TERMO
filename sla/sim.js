const robot = require("robotjs");


setTimeout(() => { robot.moveMouse(150, 850);
    while (true)robot.mouseClick(); }, 200);