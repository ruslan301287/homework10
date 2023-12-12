import 'dart:io';

void main() {
  Employee vlad = Employee(name: 'eldar', salary: 700);
  Manager sasha = Manager(bonus: 600, name: 'abai', salary: 600);
  Developer aidar = Developer(language: 'Flutter', name: 'rus', salary: 1500);
  List employeers = [vlad, sasha, aidar];
  double salaryes = getToralSalary(employeers);
  print('Обшая зарплата сотрудников $salaryes');
  Shape shape = Shape();
  Rectangle rectangle = Rectangle(a: 10, b: 15);
  Circle circle = Circle(r: 12);
  List totalAreas = [rectangle, circle];
  double areasSum = totalCalculateArea(totalAreas);
  print('Сумма площадей фигур: $areasSum');
  BankAccount one = BankAccount(accountNumber: '123456', balance: 6000);
  SavingsAccount two = SavingsAccount(balance: 4000, accountNumber: '645987');
  CheckingAccount three = CheckingAccount(
      overdraftLimit: 500, accountNumber: '798456', balance: 8000);
  List accounts = [one, two, three];
  double summBalance = getTotalBalance(accounts);
}

//task 1
class Employee {
  String name;
  double salary;
  Employee({required this.name, required this.salary});
  double Salary() {
    return salary;
  }
}

class Manager extends Employee {
  double bonus;
  Manager({required this.bonus, required String name, required double salary})
      : super(name: name, salary: salary);
  @override
  double Salary() {
    return salary + bonus;
  }
}

class Developer extends Employee {
  String language;
  Developer(
      {required this.language, required String name, required double salary})
      : super(name: name, salary: salary);
  @override
  double Salary() {
    return salary;
  }
}

double getToralSalary(employeers) {
  double employeersSalary = 0;
  for (int i = 0; i < employeers.length; i++) {
    employeersSalary += employeers[i].Salary();
  }
  return employeersSalary;
}

//task 2
class Shape {
  double calculateArea() {
    return 0;
  }
}

class Rectangle extends Shape {
  double a;
  double b;
  Rectangle({required this.a, required this.b});
  @override
  double calculateArea() {
    double s = a * b;
    return s;
  }
}

class Circle extends Shape {
  double r;
  Circle({required this.r});
  @override
  double calculateArea() {
    double s = 3.14 * r * r;
    return s;
  }
}

double totalCalculateArea(totalAreas) {
  double sumAreas = 0;
  for (int i = 0; i < totalAreas.length; i++) {
    sumAreas += totalAreas[i].calculateArea();
  }
  return sumAreas;
}

//task 3
class BankAccount {
  String accountNumber;
  double balance;
  BankAccount({required this.accountNumber, required this.balance});
  double deposit(double popolnenie) {
    balance += popolnenie;
    return balance;
  }

  double withdraw(double snyatie) {
    balance -= snyatie;
    return balance;
  }
}

class SavingsAccount extends BankAccount {
  SavingsAccount({required super.balance, required super.accountNumber});
  double interestRate() {
    balance = balance * 1.1;
    return balance;
  }
}

class CheckingAccount extends BankAccount {
  double overdraftLimit;
  CheckingAccount(
      {required this.overdraftLimit,
      required super.accountNumber,
      required super.balance});
}

double getTotalBalance(accounts) {
  double summBalances = 0;
  for (int j = 0; j < accounts.lenght; j++) {
    summBalances += accounts[j].balance;
    return summBalances;
  }
}
