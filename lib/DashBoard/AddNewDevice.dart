import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/Shopping/Product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'HomePage.dart';

class AddNewDevice extends StatefulWidget {
  static const id = 'AddNewDevice';
  @override
  _AddNewDeviceState createState() => _AddNewDeviceState();
}

class _AddNewDeviceState extends State<AddNewDevice> {
  final _form = GlobalKey<FormState>();
  TextEditingController _AddMajorcontroller = TextEditingController();


  String _submit() {
    final form = _form.currentState;
    if (form.validate()) {
      return 'OK';
    }
  }
  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    AddMajor();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Major'),
        backgroundColor:  Color(0xff03989E),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.home),
          //   onPressed: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => Admin()));
          //   },
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _AddMajorcontroller,
                decoration: InputDecoration(labelText: 'Major'),
                textInputAction: TextInputAction.next,
                //   border: OutlineInputBorder(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter a Major.';
                  }
                  return null;
                },

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text("Send", style: TextStyle(color: Colors.white),),
                  color: Color(0xff03989E),
                  onPressed: () async {
                    print('Saving Data');
                    _saveForm();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future AddMajor() async {
    final majorId = FirebaseFirestore.instance.collection('AddMajor').doc().id;
    await FirebaseFirestore.instance.collection('AddMajor').doc(majorId).set({
      'Major': _AddMajorcontroller.text,
      'Majo_id':majorId,

    }).then((value) {});
    _AddMajorcontroller.clear();

  }
}

class AddProductMaj extends StatefulWidget {
  static const id = 'AddProductMaj';
  @override
  _AddProductMajState createState() => _AddProductMajState();
  AddProductMaj({this.majorID});
  final String majorID;
}

class _AddProductMajState extends State<AddProductMaj> {
  final _form = GlobalKey<FormState>();

  TextEditingController _modelNamecontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();
  TextEditingController _descrptioncontroller = TextEditingController();
  TextEditingController _othecontroller = TextEditingController();
  TextEditingController _networkcontroller = TextEditingController();
  TextEditingController _colorCapcitycontroller = TextEditingController();
  TextEditingController   _Storecontroller = TextEditingController();
  TextEditingController _quantitycontroller = TextEditingController();
  FocusNode _descriptionNode;
  var market;
  var type;
  var majorType;




  final _auth = FirebaseAuth.instance;
  File logo;

/*
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
 */

  String _submit() {
    final form = _form.currentState;
    if (form.validate()) {
      return 'OK';
    }
  }

  var _editedProduct = Product(
    idd: null,
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
    capicty: "",
    network: "",
    other: "",
  );

/*
  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }
  @override
  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }
 */
  void initState() {
    super.initState();
    //  getCurrentUser();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    saveProductData();
    print(_editedProduct.title);
    print(_editedProduct.description);
    print(_editedProduct.price);
    print(_editedProduct.imageUrl);
    print(_editedProduct.capicty);
    print(_editedProduct.count);
    print(_editedProduct.other);
    print(_editedProduct.network);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.home),
          //   onPressed: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => Admin()));
          //   },
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              ListTile(
                // leading: Icon(
                //   Icons.place,
                //   color: Colors.orange[300],
                // ),
                title: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextFormField(
                    enabled: false,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_descriptionNode);
                    },
                    //controller: _eventLocationController,
                    decoration: InputDecoration(
                      labelText: (market != null) ? "$market" : 'Market',
                      labelStyle:
                      TextStyle(color: Colors.black, fontSize: 15),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: DropdownButton(
                    hint: Text('Choose'),
                    // // Not necessary for Option 1
                    //value: city,
                    onChanged: (newValue) {
                      setState(() {
                        market = newValue;
                      });
                    },
                    items: [
                      "samsung",
                      "huawei",
                      "apple"
                    ].map((cities) {
                      return DropdownMenuItem(
                        child: Center(child: Text(cities)),
                        value: cities,
                      );
                    }).toList(),
                  ),
                  //child: Text('نشر', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18.0),),
                ),
              ),
              ListTile(
                // leading: Icon(
                //   Icons.devices,
                //   color: Colors.orange[300],
                // ),
                title: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextFormField(
                    enabled: false,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_descriptionNode);
                    },
                    //controller: _eventLocationController,
                    decoration: InputDecoration(
                      labelText: (type != null) ? "$type" : 'Type',
                      labelStyle:
                      TextStyle(color: Colors.black, fontSize: 15),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.orange),
                      //),
                    ),
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: DropdownButton(
                    hint: Text('Choose'),
                    // // Not necessary for Option 1
                    //value: city,
                    onChanged: (newValue) {
                      setState(() {
                        type = newValue;
                      });
                    },
                    items: [
                      "mobile",
                      "laptop",
                      "tablet"
                    ].map((cities) {
                      return DropdownMenuItem(
                        child: Center(child: Text(cities)),
                        value: cities,
                      );
                    }).toList(),
                  ),
                  //child: Text('نشر', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18.0),),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  dropDown(),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              TextFormField(
                controller: _modelNamecontroller,
                decoration: InputDecoration(labelText: 'Model Name'),
                textInputAction: TextInputAction.next,
                //   border: OutlineInputBorder(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: value,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                    capicty: _editedProduct.capicty,
                    network: _editedProduct.network,
                    count: _editedProduct.count,
                    other: _editedProduct.other,
                    idd: null,
                  );
                },
              ),
              TextFormField(
                controller: _pricecontroller,
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    price: double.parse(value),
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                    capicty: _editedProduct.capicty,
                    network: _editedProduct.network,
                    count: _editedProduct.count,
                    other: _editedProduct.other,
                    idd: null,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Color & Capacity'),
                controller: _colorCapcitycontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                    capicty: value,
                    network: _editedProduct.network,
                    count: _editedProduct.count,
                    other: _editedProduct.other,
                    idd: null,
                  );
                },
              ),

              TextFormField(
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.multiline,
                controller: _quantitycontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter the quantity.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                    capicty: _editedProduct.capicty,
                    network: value,
                    count: _editedProduct.count,
                    other: _editedProduct.other,
                    idd: null,
                  );
                },
              ),

              TextFormField(
                decoration: InputDecoration(labelText: 'Other Description'),
                keyboardType: TextInputType.multiline,
                controller: _othecontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a description.';
                  }
                  if (value.length < 5) {
                    return 'Should be at least 5 characters long.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                    capicty: _editedProduct.capicty,
                    network: _editedProduct.network,
                    count: _editedProduct.count,
                    other: value,
                    idd: null,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Store'),
                keyboardType: TextInputType.multiline,
                controller: _Storecontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a description.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                    capicty: _editedProduct.capicty,
                    network: _editedProduct.network,
                    count: _editedProduct.count,
                    other: value,
                    idd: null,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                //    onFieldSubmitted: (_) {
                //     FocusScope.of(context).requestFocus(_capictyFocusNode);
                //    },
                controller: _descrptioncontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a description.';
                  }
                  if (value.length < 5) {
                    return 'Should be at least 5 characters long.';
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    description: value,
                    imageUrl: _editedProduct.imageUrl,
                    capicty: _editedProduct.capicty,
                    network: _editedProduct.network,
                    count: _editedProduct.count,
                    other: _editedProduct.other,
                    idd: null,
                  );
                },
              ),

              Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    child: Text('Upload Image' , ),
                    color: Colors.teal,
                    onPressed: () => uploadImageToFB(context).then((value) async {
                      //   String MajorId = FirebaseFirestore.instance.collection('AddMajor').doc().id;
                      final deviceId = FirebaseFirestore.instance.collection('device').doc().id;

                      await FirebaseFirestore.instance.collection('devices').doc(deviceId).set({
                        'deviceId': deviceId,
                        'market': market,
                        'type': type,
                        'model': _modelNamecontroller.text,
                        'majorType': majorType,
                        'quantity': int.parse(_quantitycontroller.text),
                        'price': int.parse(_pricecontroller.text),
                        'description': _descrptioncontroller.text,
                        'color.capacity': _colorCapcitycontroller.text,
                        'other': _othecontroller.text,
                        'imageUrl': value,
                        'store': _Storecontroller.text,

                      }).then((value) async {
                        final docId = FirebaseFirestore.instance.collection(market.toString()).doc(type.toString())
                            .collection('model').doc().id;
                        await FirebaseFirestore.instance.collection(market.toString())
                            .doc(type.toString()).collection('model').doc(docId).set(
                            {
                              'color.capacity': _colorCapcitycontroller.text,
                              'store': _Storecontroller.text,
                              'market': market,
                              'type': type,
                              'model': _modelNamecontroller.text,
                              'docId': docId
                            }).then((value)  {
                          FirebaseFirestore.instance.collection('Model').doc(market.toString()).
                          collection(type.toString()).doc(_modelNamecontroller.text)
                              .set({
                            'model': _modelNamecontroller.text,
                          });
                        }).then((value) {
                          FirebaseFirestore.instance.collection('Model').doc(market.toString())
                              .collection(type.toString()).doc(_modelNamecontroller.text).collection('color.capacity')
                              .doc(_colorCapcitycontroller.text).set({
                            'color.capacity': _colorCapcitycontroller.text,
                          });
                        });
                        print('Device Added');
                      });
                      _colorCapcitycontroller.clear();
                      _descrptioncontroller.clear();
                      _modelNamecontroller.clear();
                      _othecontroller.clear();
                      _pricecontroller.clear();
                      _quantitycontroller.clear();
                      _Storecontroller.clear();

                    }),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  child: Icon(Icons.save_alt_rounded, size: 30,),
                  backgroundColor: Colors.teal,
                  onPressed: () async {
                    print('Saving Data');
                    _saveForm();
                    _showMaterialDialog();

                  },
                  heroTag: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) =>
        new AlertDialog(
          title: new Text("Thanks"),
          content: new Text("The Product has been Added!"),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok '),
              onPressed: () {
                Navigator.push(context ,
                    MaterialPageRoute(builder:(context) => HomePage()));
              },
            ),
            FlatButton(
              child: Text('Add another peoduct '),
              onPressed: () {
                Navigator.of(context).pop();
              },

            )
          ],
        ));
  }
  /*
  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;
    //Check Permissions
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);
      if (image != null) {
        //Upload to Firebase
        var snapshot = await _storage.ref()
            .child(image.path + '.jpg')
            .putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        print('url $downloadUrl');
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }
   */

  Future <String> uploadImageToFB(BuildContext context) async {
    var url;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      setState(() {
        logo = File(pickedFile.path);
      });
      if (logo!=null){
        String fileName = path.basename(logo.path);
        Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
        UploadTask uploadTask = firebaseStorageRef.putFile(logo);
        TaskSnapshot taskSnapshot = await uploadTask;
        final ref = FirebaseStorage.instance.ref().child(fileName);
        url = await ref.getDownloadURL();
      } else {
        print('Error Uploading Logo...............');
      }
    }else{
      print('Image is not valid, Please try again');
    }
    return url;
  }


  Future saveProductData() async {

  }

  dropDown() {
    // method for select user
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('AddMajor')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('loading');
        } else {
          List<DropdownMenuItem> addToList = [];
          for (int i = 0; i < snapshot.data.docs.length; i++) {
            DocumentSnapshot snap = snapshot.data.docs[i];
            addToList.add(DropdownMenuItem(
              child: Text(
                snap.data()['Major'],
              ),
              value:
              '${snap.data()['Majo_id']}', // the value is user id when i select i will select user name
            ));
          }
          return DropdownButton(
            isDense: false,
            isExpanded: false,
            hint: new Text(
              'Choose major',
              style: TextStyle(fontSize: 25.0),
            ),
            items: addToList,
            onChanged: (value) {
              setState(() {
                majorType = value;
              });
            },
            value: majorType,
          );
        }
      },
    );
  }
}