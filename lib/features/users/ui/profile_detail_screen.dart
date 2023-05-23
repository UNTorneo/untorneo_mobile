import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/error/error_screen.dart';
import 'package:untorneo_mobile/features/users/state/users_provider.dart';
import 'package:untorneo_mobile/widgets/loading/screen_loading_widget.dart';

class ProfileDetailScreen extends ConsumerStatefulWidget {
  const ProfileDetailScreen({super.key, required this.userId});

  final String userId;

  static const route = '/profiles';
  static const routeParams = '/profiles/:id';

  @override
  createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends ConsumerState<ProfileDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(usersProvider.notifier).getUser(id: int.parse(widget.userId));
      ref.read(usersProvider.notifier);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(usersProvider);
    return userState.user.when(
      onError: (error) => ErrorScreen(error: error.message),
      onInitial: () => const Scaffold(body: ScreenLoadingWidget()),
      onLoading: () => const Scaffold(body: ScreenLoadingWidget()),
      onData: (userDetail) => Scaffold(
        appBar: AppBar(title: Text(userDetail.name)),
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
                          '${userDetail.name} ${userDetail.lastName}',
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nombre de usuario',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              userDetail.username,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Fecha de nacimiento',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              userDetail.birthday,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Correo electrónico',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              userDetail.email,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'País',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              userDetail.countryId.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Ciudad',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              userDetail.cityId.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
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
}
