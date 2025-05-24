import 'dart:io';

class Friend {
  String name;
  String phone;
  String email;

  Friend({required this.name, required this.phone, required this.email});

  void showDetails() {
    print('Name: $name');
    print('Phone: $phone');
    print('Email: $email');
  }
}

void main() {
  Map<String, Friend> friendsMap = {
    'riya': Friend(name: 'riya', phone: '1234567890', email: 'a@example.com'),
    'priya': Friend(name: 'priya', phone: '9876543210', email: 'b@example.com'),
    'disha': Friend(name: 'disha', phone: '5556667777', email: 'c@example.com'),
  };

  String searchName = stdin.readLineSync()!;

  if (friendsMap.containsKey(searchName)) {
    print('Friend found:');
    friendsMap[searchName]!.showDetails();
  } else {
    print('Friend not found.');
  }
}
