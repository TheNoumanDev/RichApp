import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class WelcomeS extends StatelessWidget {
  const WelcomeS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          IconButton(
            onPressed: () {
              AuthenticationRepository.instance.logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
