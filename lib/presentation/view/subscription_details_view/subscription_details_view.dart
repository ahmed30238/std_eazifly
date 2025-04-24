import 'package:flutter/material.dart';

class SubscriptionDetailsView extends StatelessWidget {
  const SubscriptionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Details'),
      ),
      body: const Center(
        child: Text('Subscription Details View'),
      ),
    );
  }
}