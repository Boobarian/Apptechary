import 'dart:math';
import 'package:apptechary/components/textform_rectangular.dart';
import 'package:apptechary/controllers/controller_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String uids;
  bool is_visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(context: context, isScrollControlled: true,
            builder: (context) =>
                SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom),
                  child: AddTransactionScreen(),
                ),
          );
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: TransactionMessageStream()),
          Visibility(
              visible: is_visible,
              child: Image.asset('images/Prediction.png')
          ),
          RaisedButton(
            child: Text(
              'Show current prediction',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.red,
            onPressed: (){
              setState(() {
                is_visible = !is_visible;
              });
            },
          ),
          SizedBox(
            height: 35.0,
          )
        ],
      ),
    );
  }
}



class TransactionListViewBuilder extends StatefulWidget {
  @override
  _TransactionListViewBuilderState createState() => _TransactionListViewBuilderState();

}

class _TransactionListViewBuilderState extends State<TransactionListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index){

        });
  }
}

class TransactionMessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('transactions').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final transaction = snapshot.data.documents;
        List<Card> messageWidgets = [];
        for(var drug in transaction) {
          final name = drug.data['name'];
          final quantity = drug.data['quantity'];
          final date = drug.data['date'];

          final drugWidget = Card(
            elevation: 5.0,
            margin: EdgeInsets.only(bottom: 10.0),
            child: ListTile(
              title: Text(name),
              subtitle: Text(date),
              trailing: Text(quantity.toString()),
              leading: Icon(Icons.chevron_right, color: Colors.green,),
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

class AddTransactionScreen extends StatefulWidget {
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}


class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _transactionFromState = GlobalKey<FormState>();
  String _name;
  String _type;
  int _quantity;
  var _date = new DateTime.now();


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
          key: _transactionFromState,
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
              SizedBox(height: 20.0),
              FlatButton(
                child: Text('Add', style: TextStyle(color: Colors.white),),
                color: Colors.lightBlueAccent,
                onPressed: (){
                  if(_transactionFromState.currentState.validate()){
                    print('writing data!');
                    FirestoreController.writeData(
                        {'name' : _name,
                          'type' : 'test',
                          'quantity' : Random().nextInt(100),
                          'date' : new DateFormat('dd-MM-yyyy').format(_date),
                        }, 'transactions');
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