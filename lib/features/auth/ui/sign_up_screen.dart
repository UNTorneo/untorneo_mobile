import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/core/validators/text_form_validator.dart';
import 'package:untorneo_mobile/features/auth/models/user_sign_up_model.dart';
import 'package:untorneo_mobile/features/auth/state/auth_provider.dart';
import 'package:untorneo_mobile/features/auth/ui/login_screen.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  static const route = '/signup';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _photoUrlController = TextEditingController();
  final _longitudeController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Regístrate para continuar',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nombres',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Nombres',
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  validator: TextFormValidator.textValidator,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Apellidos',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Apellidos',
                  controller: _lastNameController,
                  keyboardType: TextInputType.text,
                  validator: TextFormValidator.textValidator,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Nombre de usuario',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Nombre de usuario',
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  validator: TextFormValidator.textValidator,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Fecha de nacimiento',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Fecha de nacimiento',
                  controller: _birthdayController,
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Correo electrónico',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Correo electrónico',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: TextFormValidator.emailValidator,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Contraseña',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Contraseña',
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: TextFormValidator.passwordValidator,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                const Text(
                  'País',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'País',
                  controller: _countryController,
                  keyboardType: TextInputType.text,
                  validator: TextFormValidator.textValidator,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Ciudad',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Ciudad',
                  controller: _cityController,
                  keyboardType: TextInputType.text,
                  validator: TextFormValidator.textValidator,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Foto',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Foto',
                  controller: _photoUrlController,
                  keyboardType: TextInputType.text,
                  validator: TextFormValidator.textValidator,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Longitud',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Longitud',
                  controller: _longitudeController,
                  keyboardType: TextInputType.text,
                  validator: TextFormValidator.textValidator,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Latitud',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Latitud',
                  controller: _latitudeController,
                  keyboardType: TextInputType.text,
                  validator: TextFormValidator.textValidator,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _onRegister,
                    child: const Text('Registrarse'),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onRegister() async {
    if (!_formKey.currentState!.validate()) return;
    final userRegistered = UserSignUpModel(
        name: _nameController.text,
        lastName: _lastNameController.text,
        username: _usernameController.text,
        birthday: _birthdayController.text,
        email: _emailController.text,
        password: _passwordController.text,
        countryId: int.parse(_countryController.text),
        cityId: int.parse(_cityController.text),
        photoUrl: _photoUrlController.text,
        longitude: int.parse(_longitudeController.text),
        latitude: int.parse(_latitudeController.text));
    await ref.read(authProvider.notifier).addUser(userRegistered);
    GoRouter.of(context).push(LoginScreen.route);
  }
}
