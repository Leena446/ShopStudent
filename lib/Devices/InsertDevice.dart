import 'dart:io';
import 'package:electro_mania_afnan/homePage/round.dart';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InsertDevice extends StatefulWidget {
  static const String id = 'InsertDevice';
  @override
  _InsertDeviceState createState() => _InsertDeviceState();
}

class _InsertDeviceState extends State<InsertDevice> {
  final _form = GlobalKey<FormState>();
  TextEditingController _DeviceModelControll = TextEditingController();
  TextEditingController _DeviceBrandControll = TextEditingController();
  TextEditingController _DeviceTypeControll = TextEditingController();


  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    Device();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Device'),
        backgroundColor: Color(0xff03989E),
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
                controller: _DeviceBrandControll,
                decoration: InputDecoration(labelText: 'Device Brand'),
                textInputAction: TextInputAction.next,
                //   border: OutlineInputBorder(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter a Device Brand';
                  }
                  return null;
                },

              ),
              TextFormField(
                controller: _DeviceModelControll,
                decoration: InputDecoration(labelText: 'Device Model'),
                textInputAction: TextInputAction.next,
                //   border: OutlineInputBorder(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter a Device Model';
                  }
                  return null;
                },

              ),
              TextFormField(
                controller: _DeviceTypeControll,
                decoration: InputDecoration(labelText: 'Device Type'),
                textInputAction: TextInputAction.next,
                //   border: OutlineInputBorder(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter a Device Type';
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

  Future Device() async {
    final DevicesId = FirebaseFirestore.instance
        .collection('Devices')
        .doc()
        .id;
    await FirebaseFirestore.instance.collection('Devices')
        .doc(DevicesId)
        .set({
      'Device Model': _DeviceModelControll.text,
      'Device Brand': _DeviceBrandControll.text,
      'Device Type': _DeviceTypeControll.text,
      "DevicesId": DevicesId,

    })
        .then((value) {});
    // _DeviceModelControll.clear();
    // _DeviceBrandControll.clear();
    // _DeviceTypeControll.clear();
  }
}
class ChosseBrand extends StatefulWidget {
  @override
  _ChosseBrandState createState() => _ChosseBrandState();
}

class _ChosseBrandState extends State<ChosseBrand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Brand'),
        backgroundColor: Color(0xff03989E),
      ),
      backgroundColor: Colors.white,
      body:ListView(
        padding: EdgeInsets.only(top: 150),
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  width: double.infinity,
                  height: 200,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ChosseApple()));
                    },
                    elevation: 7.0,
                    padding: EdgeInsets.all(7.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xff03989E),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.smartphone,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Apple',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 22.0,
                            //  fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  width: double.infinity,
                  height: 200,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ChosseHuawei()));
                    },
                    elevation: 7.0,
                    padding: EdgeInsets.all(7.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xff03989E),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.smartphone,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Huawei',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 20.0,
                            //      fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  width: double.infinity,
                  height: 200,
                  child: RaisedButton(
                    // onPressed: () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (BuildContext context) =>
                    //               RemoveMajors()));
                    // },
                    elevation: 7.0,
                    padding: EdgeInsets.all(7.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xff03989E),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.smartphone,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          'Samsung',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            //   fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  width: double.infinity,
                  height: 200,
                  child: RaisedButton(
                    // onPressed: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => RemoveProdMajor()));
                    // },
                    //             MembersPage()));

                    elevation: 7.0,
                    padding: EdgeInsets.all(7.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xff03989E),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.smartphone,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          'Hp',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 22.0,
                            //    fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}

class ChosseHuawei extends StatefulWidget {
  @override
  _ChosseHuaweiState createState() => _ChosseHuaweiState();
}

class _ChosseHuaweiState extends State<ChosseHuawei> {
  QuerySnapshot items;

  @override
  void initState() {
    getItemsFromFB();
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('Devices')
        .where("Device Brand", isEqualTo:"Huawei" )
        .get().then((value) {
      setState(() {
        items = value;
      });
    });
    print(items.docs.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Device"),
        backgroundColor: Color(0xff03989E),
        actions: <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.add),
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => Add()));
          //   },
          // ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: itemsFlowListBrand(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemsFlowListBrand(BuildContext context) {
    if (items == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: items.docs.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Center(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Round(
                          title: items.docs[i].data()['Device Model'],
                          colour: Color(0xff03989E),
                          onPressed: () {
                            print(items.docs[i].id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddDeviceDetalis(
                                      DevicesId: items.docs[i].id,
                                    )));
                          },
                        ),
                        SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}

class ChosseApple extends StatefulWidget {
  @override
  _ChosseAppleState createState() => _ChosseAppleState();
}

class _ChosseAppleState extends State<ChosseApple> {

  @override

  QuerySnapshot items;

  @override
  void initState() {
    getItemsFromFB();
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('Devices')
        .where("Device Brand", isEqualTo:"Apple" )
       .get().then((value) {
      setState(() {
        items = value;
      });
    });
    print(items.docs.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Device"),
        backgroundColor: Color(0xff03989E),
        actions: <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.add),
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => Add()));
          //   },
          // ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: itemsFlowListBrand(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemsFlowListBrand(BuildContext context) {
    if (items == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: items.docs.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).pushNamed(ProudctDetails.id ,
                //              arguments: product.idd );
              },
              child: Center(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Round(
                          title: items.docs[i].data()['Device Model'],
                          colour: Color(0xff03989E),
                          onPressed: () {
                            print(items.docs[i].id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddDeviceDetalis(
                                      DevicesId: items.docs[i].id,
                                    )));
                          },
                        ),
                        SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}

class AddDeviceDetalis extends StatefulWidget {
  @override
  _AddDeviceDetalisState createState() => _AddDeviceDetalisState();
  AddDeviceDetalis({this.DevicesId});
  final String DevicesId;
}

class _AddDeviceDetalisState extends State<AddDeviceDetalis> {
  final _form = GlobalKey<FormState>();

  TextEditingController _screencontroller = TextEditingController();
  TextEditingController _ramcontroller = TextEditingController();
  TextEditingController _brandcontroller = TextEditingController();
  TextEditingController _modelNamecontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();
  TextEditingController _descrptioncontroller = TextEditingController();
  TextEditingController _othecontroller = TextEditingController();
  TextEditingController _colorontroller = TextEditingController();
  TextEditingController  _Storecontroller = TextEditingController();
  TextEditingController _quantitycontroller = TextEditingController();
  TextEditingController _capictycontroll = TextEditingController();
  int Quntity;
  int Total;
  File logo;

  String _submit() {
    final form = _form.currentState;
    if (form.validate()) {
      return 'OK';
    }
  }

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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _brandcontroller,
                decoration: InputDecoration(labelText: 'Brand Name'),
                textInputAction: TextInputAction.next,
                //   border: OutlineInputBorder(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
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
              ),
              TextFormField(
                controller: _capictycontroll,
                decoration: InputDecoration(labelText: 'Capicty'),
                textInputAction: TextInputAction.next,
                //   border: OutlineInputBorder(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
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
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Color '),
                controller: _colorontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,

              ),

              TextFormField(
                controller: _quantitycontroller,
                decoration: InputDecoration(labelText: 'Quantity'),
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
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Other Description'),
                keyboardType: TextInputType.multiline,
                controller: _othecontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a description.';
                  }
                  if (value.length < 3) {
                    return 'Should be at least 3 characters long.';
                  }
                  return null;
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

              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Screen Display'),
                keyboardType: TextInputType.multiline,
                controller: _screencontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter .';
                  }
                  return null;
                },

              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ram'),
                keyboardType: TextInputType.multiline,
                controller: _ramcontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a Ram.';
                  }
                  return null;
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

              ),

              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    child: Text(
                      'Upload Image',
                    ),
                    color: Colors.teal,
                    onPressed: () =>
                        uploadImageToFB(context).then((value) async {
                          //   String MajorId = FirebaseFirestore.instance.collection('AddMajor').doc().id;
                          final ProductId = FirebaseFirestore.instance
                              .collection('DevicesDetails')
                              .doc()
                              .id;
                          await FirebaseFirestore.instance
                              .collection('DevicesDetails')
                              .doc(ProductId)
                              .set({
                            "DeviceBrand":_brandcontroller.text,
                            'DeviceModel': _modelNamecontroller.text,
                            'Quantity': int.parse(_quantitycontroller.text),
                            "Ram":_ramcontroller.text,
                            'Screen Display':_screencontroller.text,
                            "Color":_colorontroller.text,
                            'Capicty':_capictycontroll.text,
                            'Price': int.parse(_pricecontroller.text),
                            'Description': _descrptioncontroller.text,
                            'Other': _othecontroller.text,
                            'imageUrl': value,
                            'Store': _Storecontroller.text,
                            'DevicesId': widget.DevicesId,
                          }).then((value) {
                            print('Device Added');
                          });
                          _modelNamecontroller.clear();
                          _othecontroller.clear();
                          _pricecontroller.clear();
                          _Storecontroller.clear();
                          _screencontroller.clear();
                          _quantitycontroller.clear();
                          _capictycontroll.clear();
                          _brandcontroller.clear();
                          _descrptioncontroller.clear();
                          _ramcontroller.clear();
                          _colorontroller.clear();

                        }),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  child: Icon(
                    Icons.save_alt_rounded,
                    size: 30,
                  ),
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
        builder: (_) => new AlertDialog(
          title: new Text("Thanks"),
          content: new Text("The Product has been Added!"),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok '),
              // onPressed: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => Admin()));
              // },
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

  Future<String> uploadImageToFB(BuildContext context) async {
    var url;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        logo = File(pickedFile.path);
      });
      if (logo != null) {
        String fileName = path.basename(logo.path);
        Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
        UploadTask uploadTask = firebaseStorageRef.putFile(logo);
        TaskSnapshot taskSnapshot = await uploadTask;
        final ref = FirebaseStorage.instance.ref().child(fileName);
        url = await ref.getDownloadURL();
      } else {
        print('Error Uploading Logo...............');
      }
    } else {
      print('Image is not valid, Please try again');
    }
    return url;
  }
  Future saveProductData() async {}
}