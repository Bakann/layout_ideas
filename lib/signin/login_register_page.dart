import 'package:flutter/material.dart';

import '../expansion/advanced_tile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AccountForm? _form = AccountForm.register;

  UniqueKey keyTile = UniqueKey();
  bool isExpanded = false;

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey(); // creates an ExpansionTile from scratch
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FlutterLogo(),
      ),
      body: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        elevation: 2,
        margin: const EdgeInsets.all(12.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AdvancedTilePage(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        ExpansionTile(
          key: keyTile,
          initiallyExpanded: _form == AccountForm.register,
          onExpansionChanged: ((newState) {
            if (newState) {
              setState(() {
                _form = AccountForm.register;
              });
            } else {
              setState(() {
                _form = AccountForm.login;
              });
            }
          }),
          leading: Radio<AccountForm>(
            value: AccountForm.register,
            groupValue: _form,
            onChanged: (AccountForm? value) {
              isExpanded ? shrinkTile() : expandTile();
              setState(() {
                _form = value;
              });
            },
          ),
          backgroundColor: Colors.white,
          title: Row(
            children: const [
              Text(
                'Créer un compte. ',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(
                "Nouveau chez Amazon ?",
                style: TextStyle(fontWeight: FontWeight.w400),
              )
            ],
          ),
          trailing: const SizedBox(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const <Widget>[
                  Icon(Icons.person),
                  SizedBox(
                    width: 10,
                  ),
                  Text("ABC"),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const <Widget>[
                  Icon(Icons.check),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Bike"),
                ],
              ),
            )
          ],
        ),
        ExpansionTile(
          onExpansionChanged: ((newState) {
            if (newState) {
              setState(() {
                _form = AccountForm.login;
              });
            } else {
              setState(() {
                _form = AccountForm.register;
              });
            }
          }),
          leading: Radio<AccountForm>(
            value: AccountForm.login,
            groupValue: _form,
            onChanged: (AccountForm? value) {
              setState(() {
                _form = value;
              });
            },
          ),
          title: Row(
            children: const [
              Text('Connexion. '),
              Text('Déjà client(e) ?'),
            ],
          ),
          subtitle: const Text('Trailing expansion arrow icon'),
          children: const <Widget>[
            ListTile(title: Text('This is tile number 1')),
          ],
        ),
      ],
    );
  }
}

enum AccountForm { register, login }