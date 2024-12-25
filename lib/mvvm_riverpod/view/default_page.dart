import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/providers.dart';

class DefaultPage extends ConsumerWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(defaultPageProvider);
    final viewModel = ref.read(defaultPageProvider.notifier);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model.loadingView
                  ? 'Loading...'
                  : 'Press the button to toggle loading view',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.updateLoadingView(!model.loadingView);
              },
              child: const Text('Toggle Loading'),
            ),
          ],
        ),
      ),
    );
  }
}

