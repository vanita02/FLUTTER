import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_project/api/todo_api.dart';

class GetApi extends StatefulWidget {
  GetApi({super.key});

  @override
  State<GetApi> createState() => _TodoState();
}

TextEditingController titlecontroller = TextEditingController();
TextEditingController desccontroller = TextEditingController();
ApiServices api = ApiServices();

class _TodoState extends State<GetApi> {

  dynamic showForm(String? id, title, desc) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: titlecontroller,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: desccontroller,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () async {
              Map<String, dynamic> todo = {
                'title': titlecontroller.text,
                'desc': desccontroller.text,
              };

              if (id == null) {
                await api.addData(todo);
              } else {
                await api.editData(id, todo);
              }
              Navigator.pop(context);
              setState(() {});
            },
            child: Text(id == null ? 'Save' : 'Edit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titlecontroller.clear();
          desccontroller.clear();

          showModalBottomSheet(
            context: context,
            builder: (context) {
              return showForm(null, null, null);
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add),
        ),
      ),
      body: FutureBuilder(
        future: api.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading indicator
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> currtodo = snapshot.data![index];

                return ListTile(
                  title: Text(currtodo['title']),
                  subtitle: Text(currtodo['desc']),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              titlecontroller.text = currtodo['title'];
                              desccontroller.text = currtodo['desc'];
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return showForm(currtodo['id'], titlecontroller, desccontroller);
                                },
                              );
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () async {
                             await api.deleteData(currtodo['id']);
                             setState(() {
                               
                             });
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('No data found'),
            );
          }
        },
      ),
    );
  }
}