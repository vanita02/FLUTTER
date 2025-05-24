class Animal{
  late String name;
  void anmalSound(){
    print('bhau... bhau...');
  }
}
class Cat extends Animal{
  @override
  void animalSound(){
    print('miau...miau...');
  }
}

void main(){
  Animal a = new Animal();
  Cat c = new Cat();
  a.anmalSound();
  c.animalSound();
}