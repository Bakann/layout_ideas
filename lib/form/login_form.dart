import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Create a Form widget.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final _userPasswordController = TextEditingController();

  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _userPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const EmailInput(),
          SubmitButton(formKey: _formKey),
        ],
      ),
    );
  }

}

class PasswordInput extends StatefulWidget {
  const PasswordInput(
      {Key? key})
      : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();

}

class _PasswordInputState extends State<PasswordInput> {

  bool passwordVisible = false;
  final userPasswordController = TextEditingController();

  @override
  void initState() {
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: TextFormField(
          keyboardType: TextInputType.text,
          controller: userPasswordController,
          obscureText: !passwordVisible,
          //This will obscure text dynamically
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Créer un mot de passe',
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Entrez votre mot de passe';
            }
            return null;
          },
        ));
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: 500,
        child: OutlinedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size.fromHeight(47.59)),
            animationDuration: const Duration(milliseconds: 60),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return green, otherwise blue
              if (states.contains(MaterialState.pressed)) {
                return Colors.amber;
              }
              return Colors.amberAccent;
            }),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                )),
            side: MaterialStateProperty.resolveWith<BorderSide>(
                    (Set<MaterialState> states) {
                  final Color color = states.contains(MaterialState.pressed)
                      ? Colors.green
                      : Colors.purple;
                  return BorderSide(color: color, width: 1);
                }),
            textStyle: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return size 40, otherwise 20
              if (states.contains(MaterialState.pressed)) {
                return const TextStyle(fontSize: 17);
              }
              return const TextStyle(fontSize: 15);
            }),
          ),
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
              context.push("/login/password");
            }
          },
          child: const Text('Continuer'),
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        decoration: const InputDecoration(
          // contentPadding: EdgeInsets.fromLTRB(12, 24, 12, 16),
          isDense: false,

          border: OutlineInputBorder(),
          labelText: 'Numéro de téléphone portable ou adresse e-mail',
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Saisissez votre adresse e-mail ou numéro de téléphone portable';
          }
          return null;
        },
      ),
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        decoration: const InputDecoration(
          // contentPadding: EdgeInsets.fromLTRB(12, 24, 12, 16),
          isDense: false,

          border: OutlineInputBorder(),
          labelText: 'Prénom et nom',
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Saisissez votre nom';
          }
          return null;
        },
      ),
    );
  }
}
