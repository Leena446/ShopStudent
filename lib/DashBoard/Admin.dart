import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/Shopping/Product.dart';
import 'package:electro_mania_afnan/Shopping/Products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;
import '../login_screen.dart';
import 'HelpStudent.dart';
class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child:Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 350,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/www.png', ),
                            fit: BoxFit.cover)
                    ),
                  ),
                ),
                // Divider(),
                // ListTile(
                //   title: Text('Home' , style: TextStyle(fontSize: 20),),
                //   leading: Icon(
                //     Icons.home,
                //     color: Colors.teal,
                //   ),
                //   onTap: () {
                //     Navigator.push(context ,
                //         MaterialPageRoute(builder:(context) => HomeAdmin()));
                //   },
                // ),
                Divider(),
                ListTile(
                  title: Text('Help',style: TextStyle(fontSize: 20),),
                  leading: Icon(
                    Icons.help,
                    color: Colors.teal,
                  ),
                  onTap: () {
                    Navigator.push(context ,
                        MaterialPageRoute(builder:(context) => HelpStudent()));
                  },
                ),
                Divider(),
                ListTile(
                    title: Text('Logout',style: TextStyle(fontSize: 20), ),
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Color(0xff03989E),
                    ), onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context ,
                      MaterialPageRoute(builder:(context) => LoginScreen()));
                }
                ),
              ],
            ),)),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //modify arrow color from here..
        ),

        title: Text("Admin"),
        backgroundColor: Color(0xff03989E),
      ),

      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Round(
                  title: 'Manage  ',
                  colour: Color(0xff03989E),
                  onPressed: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => AddShop()));
                    //
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Round(
                  title: 'Order ',
                  colour: Color(0xff03989E),
                  // onPressed: () {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => OrderAdmin()));
             //     },
                ),
              ],
            ),
          ],
        ),
      ),);

  }
}
class Round extends StatelessWidget {
  Round({
    this.colour,
    this.onPressed,
    this.title,
  });
  final Color colour;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, top: 5, right: 0),
      child: Material(
        elevation: 20.0,
        color: colour,
        borderRadius: BorderRadius.circular(40.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 300.0,
          height: 150.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
class Brand extends StatefulWidget {
  @override
  _BrandState createState() => _BrandState();
}

class _BrandState extends State<Brand> {
  QuerySnapshot items;
  @override
  void initState() {
    getItemsFromFB();
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('AddBrand').get().then((value) {
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
        title: Text("Brand"),
        backgroundColor: Color(0xff03989E),
        actions: <Widget>[
          // IconButton(
          // icon: const Icon(Icons.add),
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => ()));
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
    if(items==null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }else {
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
                          title: items.docs[i].data()['Title'],
                          colour: Color(0xff03989E),
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => AddProduct()));
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],),
              ),
            ),);
        },

      );

    }
  }

}

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  final _form = GlobalKey<FormState>();
  TextEditingController _Titlecontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();
  TextEditingController _descrptioncontroller = TextEditingController();
  TextEditingController _othecontroller = TextEditingController();
  TextEditingController _networkcontroller = TextEditingController();
  TextEditingController _capcitycontroller = TextEditingController();
  TextEditingController _countcontroller = TextEditingController();
  TextEditingController   _Storecontroller = TextEditingController();


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
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Admin()));
            },
          ),
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
                decoration: InputDecoration(labelText: 'network'),
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
                decoration: InputDecoration(labelText: 'Number of device'),
                keyboardType: TextInputType.multiline,
                controller: _countcontroller,
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
                decoration: InputDecoration(labelText: 'other descrption'),
                keyboardType: TextInputType.multiline,
                controller: _othecontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a description.';
                  }
                  if (value.length < 10) {
                    return 'Should be at least 10 characters long.';
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
                  if (value.length < 10) {
                    return 'Should be at least 10 characters long.';
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
                      final prodId = FirebaseFirestore.instance.collection('Add Product').doc().id;
                      await FirebaseFirestore.instance.collection('Add Product').doc(prodId).set({
                        'Title': _Titlecontroller.text,
                        'Price': int.parse(_pricecontroller.text),
                        'Descrption': _descrptioncontroller.text,
                        'Capicty': _capcitycontroller.text,
                        'Number of Device': int.parse(_countcontroller.text),
                        'Other': _othecontroller.text,
                        'imageUrl': value,
                        'store': _Storecontroller.text,
                        'product_id': prodId,
                      }).then((value) {});
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
                Navigator.pushReplacement(context ,
                    MaterialPageRoute(builder:(context) => Admin()));
              },),
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

class UserProductsScreen extends StatefulWidget {

  @override
  _UserProductsScreenState createState() => _UserProductsScreenState();
}

class _UserProductsScreenState extends State<UserProductsScreen> {
  QuerySnapshot items;
  var _showFavoriteOnly = false;

  @override
  void initState() {
    getItemsFromFB();
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('Add Product').get().then((
        value) {
      setState(() {
        items = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context ,
                  MaterialPageRoute(builder:(context) => Admin()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, i) => Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
