import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/Shopping/Product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class LastProduct extends StatefulWidget {
  @override
  _LastProductState createState() => _LastProductState();
}

class _LastProductState extends State<LastProduct> {

  final _form = GlobalKey<FormState>();

  TextEditingController _Titlecontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();
  TextEditingController _descrptioncontroller = TextEditingController();
  TextEditingController _othecontroller = TextEditingController();
  TextEditingController _networkcontroller = TextEditingController();
  TextEditingController _capcitycontroller = TextEditingController();
  TextEditingController   _Storecontroller = TextEditingController();
  TextEditingController   _Colorcontroller = TextEditingController();



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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _Titlecontroller,
                decoration: InputDecoration(labelText: 'Title'),
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
                decoration: InputDecoration(labelText: 'Capicty'),
                controller: _capcitycontroller,
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
                decoration: InputDecoration(labelText: 'Network'),
                keyboardType: TextInputType.multiline,
                controller: _networkcontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter a network.';
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
                decoration: InputDecoration(labelText: 'Color'),
                keyboardType: TextInputType.multiline,
                controller: _Colorcontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a Color.';
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
                    count: int.parse(value),
                    other: _editedProduct.other,
                    idd: null,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Other Descrption'),
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
                      await FirebaseFirestore.instance.collection('LastProduct').doc().set({
                        'Title': _Titlecontroller.text,
                        'Price': int.parse(_pricecontroller.text),
                        'Descrption': _descrptioncontroller.text,
                        'Capicty': _capcitycontroller.text,
                        'Color': _Colorcontroller.text,
                        'Other': _othecontroller.text,
                        'imageUrl': value,
                        'store': _Storecontroller.text,
                        //   'Major_id':MajorId,
                      }).then((value) {
                        print('Device Added');
                      });
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
              // onPressed: () {
              //   Navigator.push(context ,
              //       MaterialPageRoute(builder:(context) => Admin()));
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
}
