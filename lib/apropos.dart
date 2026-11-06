import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mada_scout/s_maitso.dart';
import 'package:mada_scout/s_mavo.dart';
import 'package:mada_scout/s_mena.dart';
import 'package:mada_scout/s_menaFify.dart';

class MombaNavigator extends StatefulWidget {
  const MombaNavigator({super.key});

  @override
  State<MombaNavigator> createState() => _MombaNavigatorState();
}

class _MombaNavigatorState extends State<MombaNavigator> {
  final GlobalKey<NavigatorState> _localNavigationKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final NavigatorState? localNavigator = _localNavigationKey.currentState;
        if (localNavigator != null && localNavigator.canPop()) {
          localNavigator.pop();
        } else {
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Navigator(
        key: _localNavigationKey,
        onGenerateRoute: (RouteSettings setteings) {
          return MaterialPageRoute(
            builder: (_) =>
                const Material(color: Colors.transparent, child: AProposPage()),
          );
        },
      ),
    );
  }
}

class AProposPage extends StatefulWidget {
  const AProposPage({super.key});

  @override
  State<AProposPage> createState() => _AProposPageState();
}

class _AProposPageState extends State<AProposPage> {
  bool _isIntroExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- TITRE PRINCIPAL ---
          const Text(
            "Momba ny Skoto",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0XFF00391B), // Ajuste selon ton thème sombre/clair
            ),
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0XFF1B4332),
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Inona no atao hoe Skoto na Skotisma ?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors
                        .white, // Marron/Rouge pour différencier le sous-titre
                  ),
                ),
                const SizedBox(height: 20),

                // Element 1
                _buildIntroItem(
                  title: "Ny atao hoe Skoto",
                  content:
                      "Hetsika fanabeazana ho an’ny tanora, an-tsitrapo, tsy manao politika ary misokatra ho an’ny rehetra tsy misy ankanavaka, na ara-pihaviana, na ara-pirazanana na ara-pinoana, mifanaraka amin’ny tanjona sy zava-kendrena, ny adidy sy ny fomba fanabeazana arak’izay efa nanorenan’i Baden Powell azy : miorina amin’ny lalàna sy fanekena skoto.",
                  isExpanded: _isIntroExpanded,
                ),

                const SizedBox(height: 20),

                _buildIntroItem(
                  title:
                      "Firaisan’ny Skotisma eto Madagasikara – manabe Zazalahy (FSM-ZL)",
                  content:
                      "Misy firehana 3 no mandrafitra ny Firaisan’ny Skotisma eto Madagasikara – manabe Zazalahy (FSM-ZL) :\n"
                      "  •  Antilin’i Madagasikara : Skoto zazalahy, katolika\n"
                      "  •  Kiadin’i Madagasikara : Skoto zazalahy sy zazavavy, tsy miankina amin’ny finoana\n"
                      "  •  Tily eto Madagasikara : Skoto zazalahy, unioniste",
                  isExpanded: _isIntroExpanded,
                ),

                const SizedBox(height: 20),

                _buildIntroItem(
                  title: "Skotisma Zazavavy Malagasy",
                  content:
                      "Ary mpikambana ao amin’ny Firaisan’ny Skotisma eto Madagasikara, izay ahitana koa :\n"
                      "  •  Fanilon’i Madagasikara : skoto zazavavy, katolika\n"
                      "  •  Kiadin’i Madagasikara : Skoto zazalahy sy zazavavy, tsy miankina amin’ny finoana\n"
                      "  •  Mpanazava eto Madagasikara : skoto zazavavy, unioniste\n"
                      "\n FSM-ZL = Antilin’i Madagasikara + Kiadin’i Madagasikara + Tily eto Madagasikara \n"
                      "\n SZM = Fanilon’i Madagasikara + Kiadin’i Madagasikara + Mpanazava eto Madagasikara \n\n FSM = FSM-ZL + SZM",
                  isExpanded: _isIntroExpanded,
                ),

                const SizedBox(height: 20),

                // Bouton d'action
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isIntroExpanded = !_isIntroExpanded;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFd0b5ba),
                      foregroundColor: const Color(0xFF64010B),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      _isIntroExpanded ? "Hakatona" : "Hamaky bebe kokoa",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),

          const Text(
            "Ireo Sampana",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(
                0xFF64010B,
              ), // Marron/Rouge pour différencier le sous-titre
            ),
          ),

          const SizedBox(height: 5),

          // --- SOUS-TITRE DESCRIPTION ---
          const Text(
            "Ato amin'ny Skoto dia misy fizarana antsoina hoe sampana izay voafaritra arakaraky ny taonan'ny beazina. Miisa 4 izy ireo, ka na hoan'ny Tily (skoto zazalahy) na hoan'ny Mpanazava (skoto zazavavy) dia mitovy ihany ireo afatsy ny sampana menafify izay natokana hoan'ny Tily.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
              height: 1.4,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 25),

          // --- LISTE DES BRANCHES ---
          _buildBranchCard(
            branchName: "Sampana Mavo",
            ageRange: "6-11 taona",
            title: "The Foundation",
            description:
                "Ny Sampana Mavo no zandriny indrindra amin'ny salan-taonam-panabeazana, manomboka amin'ny faha-6 taona hatramin'ny faha-11 taona.",
            badgeColor: const Color(0xFFFFD81B), // Jaune scout
            cardBgColor: const Color(0xFAFFEFC8), // Fond beige très léger
            buttonColor: const Color(0xFFFFD81B),
            buttonTextColor: Colors.black87,
            imagePath:
                'lib/assets/images/branch_mavo(1).png', // Remplace par ton image
            onTapHijery: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SampanaMavoPage(),
                ),
              );
            },
          ),

          _buildBranchCard(
            branchName: "Sampana Maitso",
            ageRange: "12-15 taona",
            title: "The Exploration",
            description:
                "Ny Sampana Maitso no sampana faharoa izay anabeazana ireo ankizy 12 ka hatramin'ny 15 taona.",
            badgeColor: const Color(0xFF057C43), // Ton vert principal
            cardBgColor: const Color(0xFFDAF7D0), // Fond vert très léger
            buttonColor: const Color(0xFF057C43),
            buttonTextColor: Colors.white,
            imagePath: 'lib/assets/images/branch_maintso.png',
            onTapHijery: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SampanaMaitsoPage(),
                ),
              );
            },
          ),

          _buildBranchCard(
            branchName: "Sampana Mena",
            ageRange: "16-19 taona",
            title: "The Enterprise",
            description:
                "Ny Sampana Mena no sampana fahatelo ary natao hanabeazan ireo tanora 17 taona hatramin'ny 19 taona.",
            badgeColor: const Color(0xFFd10c0c), // Rouge bordeaux
            cardBgColor: const Color(0xFFfedada), // Fond rouge très léger
            buttonColor: const Color(0xFFd10c0c),
            buttonTextColor: Colors.white,
            imagePath: 'lib/assets/images/branch_mena.png',
            onTapHijery: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SampanaMenaPage(),
                ),
              );
            },
          ),

          _buildBranchCard(
            branchName: "Sampana Menafify (Tily)",
            ageRange: "19-25 taona",
            title: "The Commitment",
            description:
                "Ny Sampana Menafify no zokiny indrindra amin’ny salan-taonam-panabeazana Tily (aorian’ny faha-19 taona hatramin’ny fahafenoan’ny faha-25 taona ).",
            badgeColor: const Color(0xFF591f2a), // Rouge très sombre / Cramoisi
            cardBgColor: const Color(
              0xFF9c8589,
            ), // Fond sombre pour la dernière carte
            buttonColor: const Color(0xFF591f2a),
            buttonTextColor: Colors.white,
            imagePath: 'lib/assets/images/branch_menafify.png',
            onTapHijery: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SampanaMenafifyPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIntroItem({
    required String title,
    required String content,
    required bool isExpanded,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color:
                Colors.white24, // La fine ligne verticale à gauche de l'image
            width: 1.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(
                0xFFcde9d7,
              ), // Teinte dorée/chair claire pour les sous-titres
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            // C'est ici qu'on limite à un seul paragraphe / ligne si non étendu
            maxLines: isExpanded ? null : 2,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF99bca6),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET CARTE RÉUTILISABLE ---
  Widget _buildBranchCard({
    required String branchName,
    required String ageRange,
    required String title,
    required String description,
    required Color badgeColor,
    required Color cardBgColor,
    required Color buttonColor,
    required Color buttonTextColor,
    required String imagePath,
    required VoidCallback onTapHijery,
    bool isDarkCard = false,
  }) {
    final mainTextColor = isDarkCard ? Colors.white : Colors.black87;
    final subTextColor = Colors.black87;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
        border: isDarkCard
            ? null
            : Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      clipBehavior: Clip
          .antiAlias, // Important pour que l'image respecte les bords arrondis
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Haut de la carte : Image avec fondu/dégradé vers le bas
          SizedBox(
            height: 160,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(imagePath, fit: BoxFit.cover),
                // Dégradé pour fondre l'image dans la couleur de la carte
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        cardBgColor.withOpacity(0.5),
                        cardBgColor,
                      ],
                    ),
                  ),
                ),
                // Petit badge de couleur (ex: Mavo, Maitso...)
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isDarkCard
                          ? const Color(0xFF3A0005)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: badgeColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          branchName,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: mainTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Contenu textuel de la carte
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Âge
                Row(
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/ai-sand-timer.svg',
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        subTextColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      ageRange,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: subTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Description
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: subTextColor,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                // Bouton Learn More
                OutlinedButton(
                  onPressed: onTapHijery,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: buttonColor,
                    side: isDarkCard
                        ? const BorderSide(color: Colors.white30)
                        : const BorderSide(color: Colors.black12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Hijery",
                        style: TextStyle(
                          color: buttonTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: buttonTextColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
