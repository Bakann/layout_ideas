import 'package:flutter/material.dart';
import 'package:layout_ideas/form/login_form.dart';
import 'package:layout_ideas/form/register_form.dart';

class AdvancedTilePage extends StatefulWidget {
  @override
  _AdvancedTilePageState createState() => _AdvancedTilePageState();
}

class _AdvancedTilePageState extends State<AdvancedTilePage> {
  AccountForm? _form = AccountForm.register;
  final List<Item> _data = [Item(isExpanded: true), Item()];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: _buildPanel());
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            // print("index : $index / isExpanded: $isExpanded");
            if (!_data[index].isExpanded) {
              _data[index].isExpanded = !isExpanded;

              if (index == 0) {
                _form = AccountForm.register;
              } else {
                _form = AccountForm.login;
              }
            }
            if (_data[(index + 1) % 2].isExpanded) {
              _data[(index + 1) % 2].isExpanded = false;
            }
          });
        },
        children: [
          ExpansionPanel(
            isExpanded: _data[0].isExpanded,
            backgroundColor: Colors.orange,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) => Row(
              children: [
                Radio<AccountForm>(
                  value: AccountForm.register,
                  groupValue: _form,
                  onChanged: (AccountForm? value) {
                    setState(() {
                      print("value: $value, isExpanded: $isExpanded");
                      _form = value;
                      if (_form == AccountForm.register) {
                        _data[0].isExpanded = true;
                        _data[1].isExpanded = false;
                      }
                    });
                  },
                ),
                const Text(
                  'Créer un compte. ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const Text(
                  "Nouveau chez Amazon ?",
                  style: TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            ),
            body: Column(
              children: const [RegisterForm()],
            ),
          ),
          ExpansionPanel(
            isExpanded: _data[1].isExpanded,
            backgroundColor: Colors.red,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) => Row(
              children: [
                Radio<AccountForm>(
                  value: AccountForm.login,
                  groupValue: _form,
                  onChanged: (AccountForm? value) {
                    setState(() {
                      _form = value;
                      if (_form == AccountForm.login) {
                        _data[0].isExpanded = false;
                        _data[1].isExpanded = true;
                      }
                    });
                  },
                ),
                Row(
                  children: const [
                    Text('Connexion. '),
                    Text('Déjà client(e) ?'),
                  ],
                ),
              ],
            ),
            body: Column(
              children: const [LoginForm()],
            ),
          ),
        ]);
  }

  ExpansionPanelList buildExpansionPanelList() {
    return ExpansionPanelList.radio(
        expansionCallback: (panelIndex, isExpanded) {
          print("panelIndex: $panelIndex, isExpanded: $isExpanded");
          if (panelIndex == 0 && isExpanded == false) {
            _form = AccountForm.register;
          }
          if (panelIndex == 1 && isExpanded == false) _form = AccountForm.login;
        },
        initialOpenPanelValue: 0,
        children: [
          ExpansionPanelRadio(
            backgroundColor: Colors.orange,
            value: 0,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) => Row(
              children: [
                Radio<AccountForm>(
                  value: AccountForm.register,
                  groupValue: _form,
                  onChanged: (AccountForm? value) {
                    setState(() {
                      print("value: $value, isExpanded: $isExpanded");
                      _form = value;
                    });
                  },
                ),
                const Text(
                  'Créer un compte. ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const Text(
                  "Nouveau chez Amazon ?",
                  style: TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            ),
            body: Column(
              children: const [Text("toto 1")],
            ),
          ),
          ExpansionPanelRadio(
            value: 1,
            backgroundColor: Colors.red,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) => Row(
              children: [
                Radio<AccountForm>(
                  value: AccountForm.login,
                  groupValue: _form,
                  onChanged: (AccountForm? value) {
                    setState(() {
                      _form = value;
                    });
                  },
                ),
                Row(
                  children: const [
                    Text('Connexion. '),
                    Text('Déjà client(e) ?'),
                  ],
                ),
              ],
            ),
            body: Column(
              children: const [Text("toto 2")],
            ),
          ),
        ]);
  }
}

enum AccountForm { register, login }

class Item {
  Item({
    this.isExpanded = false,
  });

  bool isExpanded;
}
