import 'package:flutter/material.dart';
import 'package:mu_shop/providers/prospect.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mu_shop/providers/prospects.dart';
import 'package:provider/provider.dart';

class EditNewProspect extends StatefulWidget {
  static const routeName = '/edit-new-prospects';

  @override
  _EditNewProspectState createState() => _EditNewProspectState();
}

class _EditNewProspectState extends State<EditNewProspect> {
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _contactFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();

  var _initValues = {
    "cardNumber": "",
    "name": "",
    "contact": "",
    "email": "",
    "imageUrl": "",
    'longitude': "",
    'latitude': "",
  };
  var _editedProspect = Prospect(
    cardNumber: '',
    name: '',
    email: '',
    contact: '',
    imageUrl: '',
    latitude: 0,
    longitude: 0,
  );

  // var _isInit = true;
  // @override
  // void didChangeDependencies() {
  //   // if (_isInit) {

  // _isInit = false;

  // super.didChangeDependencies();
  // }
  // }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  void _update() {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
      Provider.of<Prospects>(context, listen: false)
          .updateProspect(_editedProspect.cardNumber, _editedProspect);
      Navigator.of(context).pop();
    }
    return;
  }

  void _updateImageUrl() {
    if (_imageUrlFocusNode.hasFocus) {
      if (_imageUrlController.text!.isEmpty &&
          (!_imageUrlController.text.startsWith("http") ||
              !_imageUrlController.text.endsWith("png"))) return;
    }
    setState(() {});
  }

  void getLocation() async {
    // LocationPermission permission = await Geolocator.checkPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position.latitude);
    print(position);

    _editedProspect = Prospect(
      cardNumber: _editedProspect.cardNumber,
      name: _editedProspect.name,
      email: _editedProspect.email,
      contact: _editedProspect.contact,
      longitude: position.longitude,
      latitude: position.latitude,
      imageUrl: _editedProspect.imageUrl,
    );
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _contactFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prospectCardNumber =
        ModalRoute.of(context)!.settings.arguments as String;

    _editedProspect = Provider.of<Prospects>(context, listen: false)
        .findByCardNumber(prospectCardNumber);
    _initValues = {
      "cardNumber": _editedProspect.cardNumber,
      "name": _editedProspect.name,
      "contact": _editedProspect.contact,
      "email": _editedProspect.email,
      //  "imageUrl": _editedProspect.imageUrl,
      'image': '',
      "latitude": _editedProspect.latitude.toString(),
      "longitude": _editedProspect.longitude.toString(),
    };
    _imageUrlController.text = _editedProspect.imageUrl;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit a Client'),
        actions: [IconButton(onPressed: _update, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValues['cardNumber'],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a CNI Number';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'CNI Number', icon: Icon(Icons.badge)),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_nameFocusNode);
                },
                onSaved: (value) {
                  _editedProspect = Prospect(
                    cardNumber: value.toString(),
                    name: _editedProspect.name,
                    email: _editedProspect.email,
                    contact: _editedProspect.contact,
                    longitude: _editedProspect.longitude,
                    latitude: _editedProspect.latitude,
                    imageUrl: _editedProspect.imageUrl,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['name'],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide the name of the company';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Company Name', icon: Icon(Icons.business)),
                textInputAction: TextInputAction.next,
                focusNode: _nameFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
                onSaved: (value) {
                  _editedProspect = Prospect(
                    cardNumber: _editedProspect.cardNumber,
                    name: value.toString(),
                    email: _editedProspect.email,
                    contact: _editedProspect.contact,
                    longitude: _editedProspect.longitude,
                    latitude: _editedProspect.latitude,
                    imageUrl: _editedProspect.imageUrl,
                  );
                },
              ),
              TextFormField(
                  initialValue: _initValues['email'],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide the email of the company';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Email', icon: Icon(Icons.mail)),
                  textInputAction: TextInputAction.next,
                  focusNode: _emailFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_contactFocusNode);
                  },
                  onSaved: (value) {
                    _editedProspect = Prospect(
                      cardNumber: _editedProspect.cardNumber,
                      name: _editedProspect.name,
                      email: value.toString(),
                      contact: _editedProspect.contact,
                      longitude: _editedProspect.longitude,
                      latitude: _editedProspect.latitude,
                      imageUrl: _editedProspect.imageUrl,
                    );
                  }),
              TextFormField(
                initialValue: _initValues['contact'],
                validator: (value) {
                  // ignore: unnecessary_null_comparison
                  if (value!.isEmpty == null) {
                    return 'Please provide the company number';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please provide a valid number';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Contact', icon: Icon(Icons.call)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _contactFocusNode,
                onSaved: (value) {
                  _editedProspect = Prospect(
                    cardNumber: _editedProspect.cardNumber,
                    name: _editedProspect.name,
                    email: _editedProspect.email,
                    contact: value.toString(),
                    longitude: _editedProspect.longitude,
                    latitude: _editedProspect.latitude,
                    imageUrl: _editedProspect.imageUrl,
                  );
                },
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8, right: 10),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.green),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter a URL')
                        : Image.network(
                            _imageUrlController.text,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide an image URL';
                        }
                        if (!value.startsWith("http")) {
                          return 'Please enter a valid Image URL';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Image URL',
                        icon: Icon(Icons.image),
                      ),
                      keyboardType: TextInputType.url,
                      //  textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      // onFieldSubmitted: (_) {
                      //   _update();
                      // },
                      onSaved: (value) {
                        _editedProspect = Prospect(
                          cardNumber: _editedProspect.cardNumber,
                          name: _editedProspect.name,
                          email: _editedProspect.email,
                          contact: _editedProspect.contact,
                          longitude: _editedProspect.longitude,
                          latitude: _editedProspect.latitude,
                          imageUrl: value.toString(),
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _initValues['longitude'],

                      validator: (value) {
                        if (double.tryParse(value!) == null) {
                          return 'Please provide a valid number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Longitude',
                        icon: Icon(Icons.place),
                      ),
                      // textInputAction: TextInputAction.done,
                      // controller: _imageUrlController,
                      // focusNode: _imageUrlFocusNode,
                      // onFieldSubmitted: (_) {
                      //   _update();
                      // },
                      onSaved: (value) {
                        _editedProspect = Prospect(
                          cardNumber: _editedProspect.cardNumber,
                          name: _editedProspect.name,
                          email: _editedProspect.email,
                          contact: _editedProspect.contact,
                          longitude: double.parse(value!),
                          latitude: _editedProspect.latitude,
                          imageUrl: _editedProspect.imageUrl,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: _initValues['latitude'],

                      validator: (value) {
                        if (double.tryParse(value!) == null) {
                          return 'Please provide a valid number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Lattitue',
                        icon: Icon(Icons.place_outlined),
                      ),
                      // textInputAction: TextInputAction.done,
                      // controller: _imageUrlController,
                      // focusNode: _imageUrlFocusNode,
                      // onFieldSubmitted: (_) {
                      //   _update();
                      // },
                      onSaved: (value) {
                        _editedProspect = Prospect(
                          cardNumber: _editedProspect.cardNumber,
                          name: _editedProspect.name,
                          email: _editedProspect.email,
                          contact: _editedProspect.contact,
                          longitude: _editedProspect.longitude,
                          latitude: double.parse(value!),
                          imageUrl: _editedProspect.imageUrl,
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: (500),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Get Current Location'),
                      SizedBox(
                        width: 25,
                      ),
                      Icon(Icons.place),
                    ],
                  ),
                  onPressed: () {
                    getLocation();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
