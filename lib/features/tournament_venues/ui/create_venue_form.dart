import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/core/validators/text_form_validator.dart';
import 'package:untorneo_mobile/features/tournament_venues/models/venue_model.dart';
import 'package:untorneo_mobile/features/tournament_venues/states/venue_provider.dart';
import 'package:untorneo_mobile/features/tournament_venues/ui/tournament_venues_home_screen.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class CreateVenueFormScreen extends ConsumerStatefulWidget {
  const CreateVenueFormScreen({super.key});

  static const route = '/create_venue';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateVenueFormState();
}

class _CreateVenueFormState extends ConsumerState<CreateVenueFormScreen> {
  final _ubicationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Sede')),
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
                  'Inscribe tu sede',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ubicación',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Dónde está ubicada la sede',
                  controller: _ubicationController,
                  keyboardType: TextInputType.text,
                  validator: TextFormValidator.textValidator,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Descripción',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Cómo es la sede',
                  controller: _descriptionController,
                  keyboardType: TextInputType.text,
                  validator: TextFormValidator.textValidator,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _onAddVenue,
                    child: const Text('Registrarse'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onAddVenue(){
    if (_ubicationController.value.text.isEmpty || _descriptionController.value.text.isEmpty) return;
    final String location = _ubicationController.value.text;
    final String description = _descriptionController.value.text;
    Venue newVenue = Venue(id: 0, location: location, description: description, isActive: true);
    ref.read(venueProvider.notifier).addVenue(
      newVenue,
    );
    GoRouter.of(context).push(
      TournamentVenuesHomeScreen.route,
    );
  }
}