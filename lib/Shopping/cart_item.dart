
import 'package:electro_mania_afnan/Shopping/cartt.dart';
import 'package:electro_mania_afnan/Shopping/mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String idd;
  final double price;
  final int quantity;
  final String title;
  final String producrid;

  const CartItem( this.idd, this.price, this.quantity, this.title, this.producrid) ;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(producrid), // هنا عمل الحذف
      background: Container(color: Theme.of(context).errorColor,
      child: Icon(Icons.delete , color: Colors.white, size: 40,),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),),
      direction: DismissDirection.endToStart,//عشان ما يكون في حاجه بالجهه اليسار
      confirmDismiss: (direction){
        // هنا عمل التاكيد من عمليه الحذف
       return showDialog(
          context: context ,
            builder: (ctx)=>AlertDialog(
              title: Text("Are You Sure"),
              content: Text("Do you want to remove the item",
              ),
          actions: <Widget>[
            FlatButton( child: Text('No'),onPressed: (){
              Navigator.of(ctx).pop(false);
            },),
            FlatButton( child: Text('Yes'),onPressed: (){
              Navigator.of(ctx).pop(true);
            },),
          ],
             ),);
      },
      onDismissed: (direction){
        Provider.of<Cartt>(context,listen: false).removeItem(producrid);
      },
      child: Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
        child: Padding(padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(5),
                child: FittedBox(child: Text('\$$price'),)),),
          title: Text(title),
          subtitle: Text("total: \$${(price * quantity)}"),
          trailing: Text('$quantity x '),

        ),),
      ),
    );
  }
}
