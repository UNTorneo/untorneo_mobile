import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:untorneo_mobile/core/constants/lotti_assets.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/validators/text_form_validator.dart';
import 'package:untorneo_mobile/features/auth/models/login_model.dart';
import 'package:untorneo_mobile/features/auth/state/auth_provider.dart';
import 'package:untorneo_mobile/features/auth/ui/sign_up_screen.dart';
import 'package:untorneo_mobile/widgets/loading/loading_widget.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const route = '/login';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController(text: 'juan@gmail.com');
  final _passwordController = TextEditingController(text: '12345');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
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
                  child: authState.authModel.isLoading
                      ? const FilledButton(
                          onPressed: null,
                          child: LoadingWidget(),
                        )
                      : FilledButton(
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
    if (!_formKey.currentState!.validate()) return;
    final user = LoginModel(_emailController.text, _passwordController.text);
    ref.read(authProvider.notifier).login(user);
  }

  void _onRegister() {
    GoRouter.of(context).push(SignUpScreen.route);
  }
}
