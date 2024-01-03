import 'package:explained_full/app/pages/exercise/exercise_page.dart';
import 'package:explained_full/app/pages/favorites/favorites_page.dart';
import 'package:explained_full/app/pages/home/home_page.dart';
import 'package:explained_full/app/pages/auth/login/login_page.dart';
import 'package:explained_full/app/pages/meditation/meditation_page.dart';
import 'package:explained_full/app/pages/music/music_page.dart';
import 'package:explained_full/app/pages/auth/register/register_page.dart';
import 'package:explained_full/app/pages/tips/tips_page.dart';
import 'package:go_router/go_router.dart';

// Getter function to access the private router
GoRouter get router => _router;

final GoRouter _router = GoRouter(initialLocation: '/login', routes: [
  GoRoute(
    path: '/login',
    builder: (context, state) {
      return Login();
    },
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) {
      return Register();
    },
  ),
  GoRoute(
    path: '/',
    builder: (context, state) {
      return Home();
    },
  ),
  GoRoute(
    path: '/meditation',
    builder: (context, state) {
      return MeditationPage();
    },
  ),
  GoRoute(
    path: '/tips',
    builder: (context, state) {
      return TipsPage();
    },
  ),
  GoRoute(
    path: '/exercise',
    builder: (context, state) {
      return ExercisePage();
    },
  ),
  GoRoute(
    path: '/music',
    builder: (context, state) {
      return MusicPage();
    },
  ),
  GoRoute(
    path: '/favorites',
    builder: (context, state) {
      return FavoritesPage();
    },
  ),
]);
