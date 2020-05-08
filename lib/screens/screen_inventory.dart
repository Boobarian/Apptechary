import 'package:apptechary/components/textform_rectangular.dart';
import 'package:apptechary/controllers/controller_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InventoryScreen extends StatefulWidget {
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final FirestoreController firestoreController = FirestoreController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
        onPressed: () {
          showModalBottomSheet(context: context, isScrollControlled: true,
            builder: (context) =>
                SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom),
                  child: AddInventoryScreen(),
                ),
          );
        },
      ),
      body: InventoryMessageStream(),
    );
  }
}

class InventoryListViewBuilder extends StatefulWidget {
  @override
  _InventoryListViewBuilderState createState() => _InventoryListViewBuilderState();

}

class _InventoryListViewBuilderState extends State<InventoryListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index){

        });
  }
}

class InventoryMessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('inventories').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final inventory = snapshot.data.documents;
        List<Card> messageWidgets = [];
        for(var drug in inventory) {
          final name = drug.data['name'];
          final quantity = drug.data['quantity'];
          final type = drug.data['type'];

          final drugWidget = Card(
            elevation: 5.0,
            margin: EdgeInsets.only(bottom: 10.0),
            child: ListTile(
              title: Text(name),
              subtitle: Text(type),
              trailing: Text(quantity.toString()),
              leading: Icon(Icons.chevron_right, color: Colors.yellow,),
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

class AddInventoryScreen extends StatefulWidget {
  @override
  _AddInventoryScreenState createState() => _AddInventoryScreenState();
}


class _AddInventoryScreenState extends State<AddInventoryScreen> {
  final _inventoryFormState = GlobalKey<FormState>();
  String _type;
  String _name;
  int _quantity;


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
          key: _inventoryFormState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Update Drug Inventory',
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
              FlatButton(
                child: Text('Add', style: TextStyle(color: Colors.white),),
                color: Colors.lightBlueAccent,
                onPressed: (){
                  if(_inventoryFormState.currentState.validate()){
                    print('writing data!');
                    FirestoreController.writeData(
                        {'type' : _type,
                          'name' : _name,
                          'quantity' : 12
                        }, 'inventories');
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
