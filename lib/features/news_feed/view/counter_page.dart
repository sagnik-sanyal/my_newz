import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CounterView();
    // return Provider(
    // create: (_) => CounterCubit(),
    // child: const CounterView(),
    // );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
    );
  }
}

// class CounterText extends StatelessWidget {
//   const CounterText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final count = context.select((CounterCubit cubit) => cubit.state);
//     return Text('$count', style: theme.textTheme.displayLarge);
//   }
// }
