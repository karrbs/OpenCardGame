import 'package:flutter/material.dart';
import 'package:ocg/components/avatar.dart';
import 'package:ocg/utils/constants.dart';
import 'package:ocg/widgets/bottom_nav_bar_widget.dart';

class CreateGamePage extends StatefulWidget {
  const CreateGamePage({Key? key}) : super(key: key);

  @override
  State<CreateGamePage> createState() => _CreateGamePageState();
}

class _CreateGamePageState extends State<CreateGamePage> {
  final _gameNameController = TextEditingController();
  final _gameDescriptionController = TextEditingController();
  bool _isLoading = false;
  bool _isNsfw = false;

  String? _userId;
  String? _avatarUrl;

  Future<void> _createGame() async {
    setState(() {
      _isLoading = true;
    });
    final gameName = _gameNameController.text;
    final gameDesc = _gameDescriptionController.text;
    final user = supabase.auth.currentUser;
    setState(() {
      _isLoading = false;
    });
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  Future<void> _onUpload(String imageUrl) async {
    final response = await supabase.from('profiles').upsert({
      'id': _userId,
      'avatar_url': imageUrl,
    }).execute();
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    }
    setState(() {
      _avatarUrl = imageUrl;
    });
    context.showSnackBar(message: 'Updated your profile image!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Card Game'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          Avatar(
            imageUrl: _avatarUrl,
            onUpload: _onUpload,
            type: 'games',
          ),
          const SizedBox(
            height: 18,
          ),
          TextFormField(
            controller: _gameNameController,
            decoration: const InputDecoration(labelText: 'Game Name'),
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: _gameDescriptionController,
            decoration: const InputDecoration(labelText: 'Game Description'),
          ),
          const SizedBox(height: 18),
          CheckboxListTile(
            title: const Text('NSFW/18+'),
            checkColor: Colors.white,
            value: _isNsfw,
            onChanged: (bool? value) {
              setState(() {
                _isNsfw = value!;
              });
            },
          ),
          const SizedBox(height: 18),
          ElevatedButton(
              onPressed: _createGame,
              child: Text(_isLoading ? 'Saving...' : 'Create')),
          const SizedBox(height: 18),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
