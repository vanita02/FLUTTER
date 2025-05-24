import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Crud_Demo extends StatefulWidget{
  @override
  State<Crud_Demo> createState() => _CrudState();
}

class _CrudState extends State<Crud_Demo> {
  List<String> nameList = [];
  List<String> filterList = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  bool isEdit = false;
  int? editIdx;
  void add_update(){
    //add
    if(_key.currentState!.validate() && editIdx == null){
      setState(() {
        if(nameController.text.isNotEmpty){
          nameList.add(nameController.text);
          filterList = List.from(nameList);
        }
      });
      nameController.clear();
    }
    //update
    else{
      if(_key.currentState!.validate()){
        setState(() {
          nameList[editIdx!] = nameController.text;
          filterList = List.from(nameList);
          isEdit = false;
          editIdx = null;
        });
      }
      nameController.clear();
    }
  }
  void edit(int idx){
    isEdit = true;
    nameController.text = nameList[idx];

  }
  void search(String? query){

    if(query == null){
      filterList = List.from(nameList);
    }
    else{
      setState(() {
        filterList = nameList.where((name)=>name.toLowerCase().contains(query.toLowerCase())).toList();

      });
    }
  }

  @override
  void initState(){
    super.initState();
    filterList = List.from(nameList);
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text('User List',style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                onChanged: (value){
                  search(value);
                },
                controller: searchController,
                decoration: InputDecoration(
                  hintText:'Search',
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 100,),
              TextFormField(
                controller: nameController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please Enter Name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText:'Enter Name',
                    labelText: 'Enter Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    labelStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
                ),
              ),
              Expanded(
                child: ListView.builder(itemBuilder: (context,index){
                  return Card(
                    color: Colors.blue,
                    child: ListTile(
                      leading: Text('${filterList[index]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      trailing: SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (){
                                editIdx = index;
                                edit(editIdx!);
                              },
                              child: Icon(Icons.edit),
                            ),
                            InkWell(
                                onTap: (){
                                  setState(() {
                                    nameList.removeAt(index);

                                  });
                                },
                                child: Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ),
                  );
                },itemCount: filterList.length,),
              ),
              ElevatedButton(onPressed: (){
                if(_key.currentState!.validate()){
                  setState(() {
                    add_update();
                  });
                }
              }, child: Text(isEdit?'Edit':'Add'))
            ],
          ),
        ),
      ),
    );
  }
}