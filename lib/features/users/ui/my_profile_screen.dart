import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/validators/text_form_validator.dart';
import 'package:untorneo_mobile/widgets/text_field/date_text_field.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class MyProfileScreen extends ConsumerStatefulWidget {
  const MyProfileScreen({super.key});

  static const route = '/myprofile';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends ConsumerState<MyProfileScreen> {
  final _usernameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Row(
                  children: <Widget>[
                    Expanded(
                      child: CircleAvatar(
                      radius: 60,
                      child: Text('PHOTO'),
                    )
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Valentina Colmenares',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Clan del Usuario',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.account_circle_rounded,
                        color: Colors.redAccent,
                        size: 40.0,
                      ),
                      const VerticalDivider(),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: CustomTextField(
                          label: 'Nombre de usuario',
                          controller: _usernameController,
                          keyboardType: TextInputType.text,
                          validator: TextFormValidator.textValidator,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.cake_rounded,
                        color: Colors.redAccent,
                        size: 40.0,
                      ),
                      const VerticalDivider(),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: CustomTextField(
                          label: 'Fecha de nacimiento',
                          controller: _birthdayController,
                          keyboardType: TextInputType.text,
                          validator: TextFormValidator.textValidator,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.mail_outline_rounded,
                        color: Colors.redAccent,
                        size: 40.0,
                      ),
                      const VerticalDivider(),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: CustomTextField(
                          label: 'Correo electrónico',
                          controller: _emailController,
                          keyboardType: TextInputType.text,
                          validator: TextFormValidator.textValidator,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.map_rounded,
                        color: Colors.redAccent,
                        size: 40.0,
                      ),
                      const VerticalDivider(),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: CustomTextField(
                          label: 'País',
                          controller: _countryController,
                          keyboardType: TextInputType.text,
                          validator: TextFormValidator.textValidator,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.location_city_rounded,
                        color: Colors.redAccent,
                        size: 40.0,
                      ),
                      const VerticalDivider(),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: CustomTextField(
                          label: 'Ciudad',
                          controller: _cityController,
                          keyboardType: TextInputType.text,
                          validator: TextFormValidator.textValidator,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    child: const Text('Actualizar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
