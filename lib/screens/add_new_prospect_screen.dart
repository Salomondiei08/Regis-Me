import 'package:flutter/material.dart';
import 'package:mu_shop/providers/prospect.dart';
import 'package:geolocator/geolocator.dart';

class AddNewProspect extends StatefulWidget {
  static const routeName = '/add-new-prospects';

  @override
  _AddNewProspectState createState() => _AddNewProspectState();
}

class _AddNewProspectState extends State<AddNewProspect> {
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _contactFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProspect = Prospect(
      cardNumber: '',
      name: '',
      email: '',
      contact: '',
      imageUrl: '',
      latitude: 0,
      longitude: 0,
      type: TYPE.ENTREPRISE);
  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  void _saveForm() {
    _form.currentState!.save();
  }

  void _updateImageUrl() {
    if (_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
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
        type: _editedProspect.type);
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit a Client'),
        actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'CNI Number'),
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
                      type: _editedProspect.type);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Company Name'),
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
                      type: _editedProspect.type);
                },
              ),
              TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
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
                        type: _editedProspect.type);
                  }),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contact'),
                textInputAction: TextInputAction.next,
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
                      type: _editedProspect.type);
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
                      decoration: InputDecoration(
                        labelText: 'Image URL',
                      ),
                      keyboardType: TextInputType.url,
                      //  textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      // onFieldSubmitted: (_) {
                      //   _saveForm();
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
                            type: _editedProspect.type);
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
                      decoration: InputDecoration(
                        labelText: 'Longitude',
                      ),
                      // textInputAction: TextInputAction.done,
                      // controller: _imageUrlController,
                      // focusNode: _imageUrlFocusNode,
                      // onFieldSubmitted: (_) {
                      //   _saveForm();
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
                            type: _editedProspect.type);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Lattitue',
                      ),
                      // textInputAction: TextInputAction.done,
                      // controller: _imageUrlController,
                      // focusNode: _imageUrlFocusNode,
                      // onFieldSubmitted: (_) {
                      //   _saveForm();
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
                            type: _editedProspect.type);
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
