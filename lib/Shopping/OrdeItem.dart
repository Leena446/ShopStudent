import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'Orders.dart' as ord;
class OrdeItem extends StatefulWidget {
  static const String id = 'OrdeItem';
  final ord.OrderItem order;
  OrdeItem({
    this.order
  });
  @override
  _OrdeItemState createState() => _OrdeItemState();
}

class _OrdeItemState extends State<OrdeItem> {
  @override
  Widget build(BuildContext context) {
    var _expanded = false;
      return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('\$${widget.order.amount}'),
              subtitle: Text(
                DateFormat("dd/MM/yyy/hh:mm").format(widget.order.dateTime),),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            if(_expanded)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                height: min(
                    widget.order.products.length * 20.0 + 10, 100),
                child: ListView(
                  children: widget.order.products.map((prod) =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(prod.title, style:
                          TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),),
                          Text('${prod.quantity}x \$${prod.price}',
                            style: TextStyle(fontSize: 18, color: Colors.grey),)
                        ],
                      )).toList(),
                ),
              ),
          ],
        ),
      );
    }
  }

