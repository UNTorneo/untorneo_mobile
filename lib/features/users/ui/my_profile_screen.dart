import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/validators/text_form_validator.dart';
import 'package:untorneo_mobile/features/auth/state/auth_provider.dart';
import 'package:untorneo_mobile/features/error/error_screen.dart';
import 'package:untorneo_mobile/widgets/loading/screen_loading_widget.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class MyProfileScreen extends ConsumerStatefulWidget {
  const MyProfileScreen({super.key});

  static const route = '/myprofile';

  @override
  createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends ConsumerState<MyProfileScreen> {
  bool buttonenabled = false;
  final _usernameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _usernameController.text =
        ref.watch(authProvider).authModel.data!.user.username;
    _birthdayController.text =
        ref.watch(authProvider).authModel.data!.user.birthday;
    _emailController.text = ref.watch(authProvider).authModel.data!.user.email;
    _countryController.text =
        ref.watch(authProvider).authModel.data!.user.countryId.toString();
    _cityController.text =
        ref.watch(authProvider).authModel.data!.user.cityId.toString();
    final userState = ref.watch(authProvider);
    return userState.authModel.when(
      onError: (error) => ErrorScreen(error: error.message),
      onInitial: () => const Scaffold(body: ScreenLoadingWidget()),
      onLoading: () => const Scaffold(body: ScreenLoadingWidget()),
      onData: (userDetail) => Scaffold(
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
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${userDetail.user.name} ${userDetail.user.lastName}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
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
                  canUpdateUser()
                      ? SizedBox(
                          width: double.infinity,
                          child: FilledButton.tonal(
                            onPressed: () {},
                            child: const Text('Actualizar'),
                          ),
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            autofocus: true,
                            onPressed: () {
                              setState(() {
                                //setState to refresh UI
                                if (canUpdateUser()) {
                                  buttonenabled = false;
                                  //if buttonenabled == true, then make buttonenabled = false
                                } else {
                                  buttonenabled = true;
                                  //if buttonenabled == false, then make buttonenabled = true
                                }
                              });
                            },
                            child: const Text('Actualizar'),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool canUpdateUser() {
    if (_usernameController.text ==
            ref.watch(authProvider).authModel.data!.user.username &&
        _birthdayController.text ==
            ref.watch(authProvider).authModel.data!.user.birthday &&
        _emailController.text ==
            ref.watch(authProvider).authModel.data!.user.email &&
        _countryController.text ==
            ref.watch(authProvider).authModel.data!.user.countryId.toString() &&
        _cityController.text ==
            ref.watch(authProvider).authModel.data!.user.cityId.toString()) {
      return false;
    }
    return true;
  }

  /*void updateUser(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read()
    })
  }*/
}
