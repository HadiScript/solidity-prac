// STORAGE AND MEMORY DIFFERENCE

pragma solidity ^0.4.17;

contract Numbers {
    int256[] public numbers;

    function Numbers() public {
        numbers.push(20);
        numbers.push(21);

        // it resolve the warning
        // int[] storage  myArray = numbers;
        // now myArray ref to the numbers array just
        // becouse of storge keyword
        // myArray point to the numbers, now

        // myArray[0] = 1;

        // now number array
        // numbers[0] will be 1;
        // numbers[1] will be 21;

        // so output will be the [1, 21]

        // int[] memory  myArray = numbers;
        // now myArray not point to the numbers
        // but now its a copy of numbers

        //  myArray[0] = 1;

        //  numbers[0] will be the 20
        //  numbers[1] will be the 21

        //
        changeArr(numbers);
    }

    // function changeArr(int256[] memory myArray) private {
    //     myArray[0] = 1;
    //     // thi will not change the numbers array
    //     // becouse in the constructor we are coping of numbers
    //     // it assume you are working on the memory if we dont mention

    // numbers[0] = 20;
    // }

    function changeArr(int256[] storage myArray) private {
        myArray[0] = 1;
        // thi will change the numbers array
        // numbers[0] = 1;
        // now its changed becouse we mention here storage
    }
}
