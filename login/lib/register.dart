import 'package:flutter/material.dart';

void main() {
  runApp(Register());
}

// ignore: must_be_immutable
class Register extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nombreController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController cedulaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          backgroundColor: Colors.black87,
          centerTitle: true,
        ),
        body: Container(
          color: const Color.fromARGB(182, 227, 239, 211),
          padding: const EdgeInsets.all(28.0),
          child: Theme(
            data: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: const TextStyle(color: Colors.black87),
                hintStyle: const TextStyle(color: Colors.grey),
                errorStyle: const TextStyle(color: Colors.red),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIconTextField(
                      controller: nombreController,
                      icon: Icons.person,
                      hintText: 'Digite su nombre',
                      labelText: 'Nombre completo*',
                    ),
                    _buildIconTextField(
                      controller: telefonoController,
                      icon: Icons.phone,
                      hintText: 'Digite su telefono',
                      labelText: 'Telefono *',
                      keyboardType: TextInputType.phone,
                    ),
                    _buildIconTextField(
                      controller: cedulaController,
                      icon: Icons.credit_card,
                      hintText: 'Digite su cedula',
                      labelText: 'Cedula *',
                      keyboardType: TextInputType.number,
                    ),
                    _buildIconTextField(
                      controller: emailController,
                      icon: Icons.email,
                      hintText: 'Digite su email',
                      labelText: 'Email *',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    _buildIconTextField(
                      controller: usuarioController,
                      icon: Icons.person,
                      hintText: 'Digite su usuario',
                      labelText: 'Usuario *',
                    ),
                    _buildIconTextField(
                      controller: passwordController,
                      icon: Icons.lock,
                      hintText: 'Digite su contraseña',
                      labelText: 'Contraseña *',
                      obscureText: true,
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.maxFinite, 50.0),
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        _handleButtonPress();
                      },
                      child: const Text('Registrar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconTextField({
    required IconData icon,
    required String hintText,
    required String labelText,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        contentPadding: const EdgeInsets.all(16.0),
        icon: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            icon,
            size: 27,
            color: Colors.white,
          ),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: (String? value) {
        return (value == null || value.isEmpty)
            ? 'Este campo es obligatorio'
            : null;
      },
    ),
  );
}

  void _handleButtonPress() {
    if (_formKey.currentState!.validate()) {
      
      Future.delayed(const Duration(seconds: 3), () {
        nombreController.clear();
        telefonoController.clear();
        cedulaController.clear();
        emailController.clear();
        usuarioController.clear();
        passwordController.clear();
      });
    }
  }
}
