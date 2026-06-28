// import 'package:flutter/material.dart';
// import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/presentation/controllers/user_profile_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// void main() {
//   runApp(ProviderScope(child: const MyApp()));
// }

// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userState = ref.watch(userProfileProvider);
//     return Scaffold(
//       appBar: AppBar(title: Center(child: Text('Profile screen'))),
//       body: userState.when(
//         data: (user) => Center(child: Text(user.name)),
//         error: (error, stackTrace) => Center(child: Text(error.toString())),
//         loading: () => Center(child: const CircularProgressIndicator()),
//       ),
//     );
//   }
// }
