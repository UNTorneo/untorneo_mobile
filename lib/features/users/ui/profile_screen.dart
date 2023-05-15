import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {

  const ProfileScreen({super.key, required this.userId});

  final String userId;

  static const route = '/profile';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('juanito2504')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: CircleAvatar(
                      radius: 60,
                      child: Text('PHOTO'),
                    )
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Juan Contreras',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Clan del Usuario',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_circle_rounded,
                        color: Colors.redAccent,
                        size: 40.0,
                      ),
                      VerticalDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nombre de usuario',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'juanito2504',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.cake_rounded,
                        color: Colors.redAccent,
                        size: 40.0,
                      ),
                      VerticalDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fecha de nacimiento',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '2000-04-25',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.mail_outline_rounded,
                        color: Colors.redAccent,
                        size: 40.0,
                      ),
                      VerticalDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Correo electrónico',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'juan@contreras.com',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.map_rounded,
                        color: Colors.redAccent,
                        size: 40.0,
                      ),
                      VerticalDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'País',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Colombia',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_city_rounded,
                        color: Colors.redAccent,
                        size: 40.0,
                      ),
                      VerticalDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ciudad',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Ibagué',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
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
    );
  }
}
