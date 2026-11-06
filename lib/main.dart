import 'package:flutter/material.dart';
import 'package:mada_scout/apropos.dart';
import 'accueil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tsiahy',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF057C43),
        useMaterial3: true,
        fontFamily: 'Manrope',
      ),
      // On définit AccueilPage comme la page de démarrage
      home: const MainWrapper(),
    );
  }
}

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  //Liste des pages
  late final List<Widget> _pages = [
    const AccueilPage(),
    const MombaNavigator(),
    const Center(child: Text("Guide")),
    const Center(child: Text("Chants")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- HAUT DE PAGE ---
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(
            'lib/assets/images/scouts_mada_logo.png',
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(
          "SCOUTSMADA",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF1B4332),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {}, //TODO: Logique Menu
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedMenu01,
              color: Color(0xFF1B4332),
            ),
          ),
        ],
      ),

      // --- CONTENU ---
      body: _pages[_currentIndex],

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: const Color(0xFF057C43).withValues(alpha: 0.15),
              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF057C43), // Marine pour l'actif
                  );
                }
                return const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64010B), // Gris pour l'inactif
                );
              }),
              iconTheme: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return const IconThemeData(
                    color: Color(0xFF057C43),
                    size: 28,
                  );
                }
                return IconThemeData(
                  color: Color(0xFF64010B).withValues(alpha: 0.7),
                );
              }),
            ),
            child: NavigationBar(
              selectedIndex: _currentIndex,
              onDestinationSelected: (index) =>
                  setState(() => _currentIndex = index),
              //backgroundColor: const Color(0xFFFDFBF7),
              elevation: 0,
              indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              destinations: [
                NavigationDestination(
                  icon: SvgPicture.asset(
                    'lib/assets/icons/home.svg',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      _currentIndex == 0
                          ? const Color(0xFF1B4332)
                          : Color(0xFF64010B),
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'TRANO',
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    'lib/assets/icons/information.svg',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      _currentIndex == 1
                          ? const Color(0xFF1B4332)
                          : Color(0xFF64010B),
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'MOMBA',
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    'lib/assets/icons/book-open.svg',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      _currentIndex == 2
                          ? const Color(0xFF1B4332)
                          : Color(0xFF64010B),
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'TANTARA',
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    'lib/assets/icons/grids.svg',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      _currentIndex == 3
                          ? const Color(0xFF1B4332)
                          : Color(0xFF64010B),
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'HAFA',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
