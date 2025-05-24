import 'dart:io';

void main(){
  List<String> list= ['mumbai','delhi','bangluru','hyderabad','ahemdabad'];
  print('before$list');
  int n = list.indexOf('ahemdabad');
  list[n]='surat';
  print('after$list');
}