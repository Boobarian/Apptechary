import 'package:apptechary/components/textform_rectangular.dart';
import 'package:apptechary/controllers/controller_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrugScreen extends StatefulWidget {
  @override
  _DrugScreenState createState() => _DrugScreenState();
}

class _DrugScreenState extends State<DrugScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context, isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddDrugScreen(),
            ),
          );
        },
      ),
      body: DrugMessageStream(),
    );
  }
}

class DrugListViewBuilder extends StatefulWidget {
  @override
  _DrugListViewBuilderState createState() => _DrugListViewBuilderState();

}

class _DrugListViewBuilderState extends State<DrugListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index){

        });
  }
}

class DrugMessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('drugs').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final drugs = snapshot.data.documents;
        List<Card> messageWidgets = [];
        for(var drug in drugs) {
          final name = drug.data['name'];
          final type = drug.data['type'];
          final brand = drug.data['brand'];

          final drugWidget = Card(
              elevation: 5.0,
              margin: EdgeInsets.only(bottom: 10.0),
              child: ListTile(
                title: Text(brand),
                subtitle: Text(name),
                trailing: Text(type),
                leading: Icon(Icons.chevron_right, color: Colors.blue,),
            ),
          );
          messageWidgets.add(drugWidget);
        }
        return Container(
          child: ListView(
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

class AddDrugScreen extends StatefulWidget {
  @override
  _AddDrugScreenState createState() => _AddDrugScreenState();
}


class _AddDrugScreenState extends State<AddDrugScreen> {
  final _drugFormState = GlobalKey<FormState>();
  String _name;
  String _type;
  String _brand;


  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Form(
          key: _drugFormState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Add New Drug',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(height: 30.0,),
              RectangularTextFormField(
                hintText: 'Enter Drug Name',
                onChanged: (value){
                  _name = value;
                },
              ),
              SizedBox(height: 20.0,),
              RectangularTextFormField(
                hintText: 'Enter Drug Type',
                onChanged: (value){
                  _type = value;
                },
              ),
              SizedBox(height: 20.0),
              RectangularTextFormField(
                hintText: 'Enter Drug Brand',
                onChanged: (value){
                  _brand = value;
                },
              ),
              SizedBox(height: 20.0),
              FlatButton(
                child: Text('Add', style: TextStyle(color: Colors.white),),
                color: Colors.lightBlueAccent,
                onPressed: (){
                  if(_drugFormState.currentState.validate()){
                    print('writing data!');
                    FirestoreController.writeData(
                        {'name' : _name,
                          'type' : _type,
                          'brand' : _brand
                        }, 'drugs');
                    Navigator.pop(context);
                  }
//                if(newTaskTitle != null){
//                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
//                  Navigator.pop(context);
//                }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

