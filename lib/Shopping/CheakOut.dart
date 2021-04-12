import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'EditProduct.dart';
import 'OrdeItem.dart';
import 'OrderItem.dart';
import 'Orders.dart';
import 'cartt.dart' show Cartt;
import 'cart_item.dart' ;
class CheakOut extends StatefulWidget {
  static const String id = 'CheakOut';
  CheakOut(): super();
  final String titile = "cheakout";
  @override
  _CheakOutState createState() => _CheakOutState();
}
class _CheakOutState extends State<CheakOut> {
  int selectedRadio;
  int selectedRadioTitle;

  @override
  void initState() {
    super.initState();
    selectedRadio =0;
    selectedRadioTitle = 0;
  }
  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }
  setSelectedRadioTitle(int val){
    setState(() {
      selectedRadioTitle = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartt>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text("Please Select Payment Method" ,
              style: TextStyle(fontSize: 23),),
            RadioListTile(
              value: 1,
              groupValue: selectedRadioTitle,
              title: Text("Onilne"),
              onChanged: (val){
                print("radio $val");
                setSelectedRadioTitle(val);
              },
              activeColor: Colors.teal,
              secondary: OutlinedButton(
                child: Text("say"),
                onPressed: (){
                  print("say hi");
                },
              ),
              selected: false,
            ),
            RadioListTile(
              value: 2,
              groupValue: selectedRadioTitle,
              title: Text("Cash on Delivery"),
              onChanged: (val){
                print("radio $val");
                setSelectedRadioTitle(val);
              },
              activeColor: Colors.teal,
              secondary: OutlinedButton(
                child: Text("say"),
                onPressed: (){
                  print("say hi");
                },
              ),
              selected: false,
            ),
            Divider(
              height: 20,
              color: Colors.teal,
            ),

        Card(
        margin: EdgeInsets.all(15,
        ),
        child:Padding(padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Total",style: TextStyle(fontSize: 20),),
              Spacer(),
              //    SizedBox(width: 10,),
              Chip(label: Text('\$${cart.totalAmount.toStringAsFixed(2)}', style:
              TextStyle(
                color: Theme.of(context).primaryTextTheme.title.color,
              ),),
                backgroundColor: Colors.teal,),
            ],),),
        ),
              SizedBox(height: 10,),
            TextFormField(decoration: InputDecoration(
              labelText: 'Enter Code', labelStyle: TextStyle(color: Colors.black54),
              prefixIcon: Icon(
                Icons.credit_card_rounded,
                color: Colors.teal,),
            ),
              //   textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              //  focusNode: _priceFocsNode, //خلى كيبورد الارقام يظهربس
              onFieldSubmitted:(_){
                //    FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
            ),
            SizedBox(height: 10,),
            Text("Shopping Bag",style: TextStyle(fontSize: 23),),
              Expanded(child:
              ListView.builder(itemCount: cart.items.length, itemBuilder: (ctx,i)=>
              CartItem(
              cart.items.values.toList()[i].idd,
              cart.items.values.toList()[i].price,
              cart.items.values.toList()[i].quantity,
              cart.items.values.toList()[i].title,
              cart.items.keys.toList()[i],
              ),
              ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Material(
                color: Color(0xff03989E),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child:  FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, EditProduct.id);
                    },
                  textColor: Colors.teal,
                  minWidth: 200.0,
                  height: 50.0,
                  child: Text(
                    'Order Now',
                    style: TextStyle(color: Colors.white),

                  ),),),),
          ],
        ),
      ),
    );

  }
}
