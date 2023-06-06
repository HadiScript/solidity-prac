pragma solidity >=0.5.0 <0.9.0;

struct Student {
    string name;
    uint256 roll;
}

contract Demo {
    Student public si;

    constructor(uint256 _roll, string memory _name) {
        si.name = _name;
        si.roll = _roll;
    }

    function change(uint256 _roll, string memory _name) public {
        // creating new instance in memory not in storage becouse we going
        // copy it into si
        Student memory new_stu = Student({roll: _roll, name: _name});

        si = new_stu;
    }
}
