import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:untorneo_mobile/core/constants/lotti_assets.dart';
import 'package:untorneo_mobile/core/validators/text_form_validator.dart';
import 'package:untorneo_mobile/features/home/ui/home_index_screen.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const route = '/login';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Lottie.asset(LottieAssets.header, height: 200)],
                ),
                const Text(
                  'Bienvenido deportista!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Inicia sesión para continuar',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _onLogin,
                    child: const Text('Iniciar sesión'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: _onRegister,
                    child: const Text('¿Aún no haces parte de UNTorneo?'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onLogin() {
    GoRouter.of(context).go(IndexHomeScreen.route);
    if (!_formKey.currentState!.validate()) return;
  }

  void _onRegister() {}
}
