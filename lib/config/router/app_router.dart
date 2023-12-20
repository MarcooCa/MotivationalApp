

import 'package:go_router/go_router.dart';
import 'package:mi_app/presentation/screens/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      ),

    GoRoute(
      path: '/frasesmo',
      builder: (context, state) => const MotivationalScreen(),
    ),

    GoRoute(
      path: '/perfil',
      builder: (context, state) => const ProfileScreen(),
    )
  ]
);