import 'package:flutter/cupertino.dart';
import '../state_management/HomeScreenState.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}
