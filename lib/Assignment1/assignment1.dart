abstract class Role {
  void displayRole();
}

// Person class implementing Role
class Person implements Role {
  String _name;
  int _age;
  String _address;

  Person(this._name, this._age, this._address);

  // Getters
  String get name => _name;
  int get age => _age;
  String get address => _address;

  @override
  void displayRole() {
    print("Role: Person");
  }

  void displayInfo() {
    print("Name: $_name");
    print("Age: $_age");
    print("Address: $_address");
  }
}

// Student class extending Person
class Student extends Person {
  String studentID;
  String grade;
  List<int> courseScores;

  Student(String name, int age, String address, this.studentID, this.grade, this.courseScores)
      : super(name, age, address);


  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverage() {
    int total = 0;
    for (var score in courseScores) {
      total += score;
    }
    return courseScores.isNotEmpty ? total / courseScores.length : 0.0;
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print("Average Score: ${calculateAverage().toStringAsFixed(2)}");
  }
}

// Teacher class extending Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address);



  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCourses() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }

  @override
  void displayInfo() {
    super.displayInfo();
    displayCourses();
  }
}

// Main System Class
void main() {
  // Student instance
  var student = Student("John Doe", 20, "123 Main St", "S123", "A", [90, 85, 82]);
  print("Student Information:");
  student.displayRole();
  student.displayInfo();

  print("\n");

  // Teacher instance
  var teacher = Teacher("Mrs. Smith", 35, "456 Oak St", "T456", ["Math", "English", "Bangla"]);
  print("Teacher Information:");
  teacher.displayRole();
  teacher.displayInfo();
}
