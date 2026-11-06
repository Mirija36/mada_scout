import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class SampanaMavoPage extends StatefulWidget {
  const SampanaMavoPage({super.key});

  @override
  State<SampanaMavoPage> createState() => _SampanaMavoPageState();
}

class _SampanaMavoPageState extends State<SampanaMavoPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      //color: const Color(0XFAffefc8),
      color: Colors.transparent,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                horizontal: 8.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                  ),
                  const Text(
                    "Sampana Mavo",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsetsGeometry.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderCard(),
                    const SizedBox(height: 20),
                    _buildTilyDetailsCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x78e5e7eb),
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 8,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFffd81b),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsetsGeometry.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sampana Mavo",
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF64010B),
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  //"Hatreto aloha dia irery ny Tily no hojerena.\n\n"
                  "Ny Sampana Mavo Tily na Lovitao no anabeazana ireo ankiilahy 6 ka hatramin’ny 11 taona eto amin’ny Tily Eto Madagasikara. Zava-baovao maro no ho hitan’izy ireo mandritra ny fotoana ijanonany ao amin’ny sampana mavo. Amin’ny ankapobeny dia tanterahina amin’ny alalan’ny lalao ny hetsika rehetra izay atao.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: Color(0xFF4a4a4a),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTilyDetailsCard() {
    const sectionTitleStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Color(0xFF5a4a42),
      letterSpacing: 1.2,
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFe5e0da)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFf5f2ee),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'lib/assets/icons/boy.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        Color(0xFF1B4332),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  "Lovitao",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF057C43),
                  ),
                ),
                const Spacer(),
                const Text(
                  "LAHY 6-11",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7a6a62),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 1,
            color: const Color(0xFFede9e4),
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'lib/assets/icons/rule-rounded.svg',
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF64010b),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Lalàna Roa",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0x7d64010b),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '  •  "Manoa ny lehibe ny Lovitao."\n'
                        '  •  "Tsy manaonao foana ny Lovitao."',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFf9f7f4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "lib/assets/icons/diamond.svg",
                    width: 32,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      Color(0xFF002A6D),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Soatoavina skoto",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0x7d002A6D),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Na dia mbola kely aza ny Sampana Mavo (Lovitao) dia miaina sahady ny soatoavina skoto. Manamarika izany ny fanatanterahany ny ",
                              ),
                              TextSpan(
                                text: "Fanekena Lovitao.",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                    " Mandritra io Fanekena io no anambarany fa hiezaka hatrany izy ho tia an’Andriamanitra, hiasa ho an’ny Tanindrazana, hanoa ny Lalànan’ny Lovitao ary hazoto hanampy olona isan’andro.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFf9f7f4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "lib/assets/icons/teamwork.svg",
                    width: 32,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      Color(0xFFffd81b),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Firahalahiana",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0x7dffd81b),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Tsy mandeha irery ny Lovitao fa manana namana maro. Omena sehatra hiaina am-pirahalahiana izy ireo amin’ny fampivondronana azy ireo ao anaty “Enina”. Omena andraikitra ihany koa ny tsirairay ao anatin’ny enina.\n\nNy “Enina” dia vondrona kely iray misy Lovitao miisa 6 eo ho eo. Manana ny ",
                              ),
                              TextSpan(
                                text: "“Zokin’ny Enina”",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                    " ho mpitarika azy izy. Izay zoky indrindra sy matotra kokoa no apetraka ho mpitarika. Ny “Enina” maromaro ao anatin’ny Fivondronana na Fiangonana iray no mitambatra ho “Andiany” ary Mpiandraikitra no mitantana azy.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () => _showUniformDetailsDialog(context),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 20.0,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFf9f7f4),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF057C43).withValues(alpha: 0.1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "lib/assets/icons/checkroom.svg",
                          width: 32,
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            Color(0xFF057C43),
                            BlendMode.srcATop,
                          ),
                          theme: SvgTheme(fontSize: 14),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Fanamiana",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0x7D057C43),
                                ),
                              ),
                              const SizedBox(height: 10),
                              _buildUniformItem(
                                Color(0XFFa1bce6),
                                "Lobaka manga tanora ny ambony.",
                              ),
                              _buildUniformItem(
                                Color(0xFF261c4e),
                                "Kilaoty manga antitra ny ambany.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Divider(
                        color: Color(0xFFEDE9E4), // Ligne grise très discrète
                        thickness: 1,
                        height: 1,
                      ),
                    ),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Centre l'information
                      children: [
                        Expanded(
                          child: const Text(
                            "Tsindrio raha hijery amin'ny antsipiriany",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                              fontStyle: FontStyle.italic,
                            ),
                            // Optionnel : si tu préfères que le texte se centre aussi s'il passe sur 2 lignes
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: Material(
              color: const Color(0xFFf0ece6),
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () => _downloadGuidePdf(),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 14.0,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.picture_as_pdf_rounded,
                        color: Color(0xFFc62828),
                        size: 28,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Torolalana Lovitao.pdf",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF2c2c2c),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Raha mila fanazavana bebe kokoa",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        "lib/assets/icons/file.svg",
                        width: 32,
                        height: 32,
                        colorFilter: ColorFilter.mode(
                          Color(0xFF64010B),
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Container(
            height: 8,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFffd81b),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUniformItem(Color dotColor, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  void _showUniformDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext localContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 12,
          backgroundColor: const Color(0xFFF2EFEA),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // S'adapte au contenu
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- EN-TÊTE DU POPUP ---
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Color(0xFF057C43),
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: const Text(
                        "Antsipirian'ny Fanamiana",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A0E17),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.grey),
                      onPressed: () => Navigator.of(localContext).pop(),
                    ),
                  ],
                ),
                const Divider(color: Color(0xFFE5E0DA), height: 20),

                // --- ZONE DE CONTENU SCROLLABLE ---
                // Flexible permet d'éviter les crashs de dimension si l'image est grande
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ireo zava-dehibe mikasika ny fanamiana Lovitao :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 12),

                        _buildUniformItem(
                          const Color(0XFFa1bce6),
                          "Ambony: Lobaka fohy tanana miloko manga tanora ary manao “V” ny vozony, eo amin’ny lobaka no ametrahana ireo marika mampiavaka azy eo amboniny.",
                        ),
                        _buildUniformItem(
                          const Color(0xFF261c4e),
                          "Ambany: Kilaoty fohy miloko manga antitra.",
                        ),
                        _buildUniformItem(
                          const Color(0xFFFFD81B),
                          "Fehitenda: Miloko mifanaraka amin’ny lokon’ny fivondronana misy azy no anaovan’ireo izay efa nahavita Fanekena Lovitao.",
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "Tahaka ity sary ity ny fanamiana :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // --- L'IMAGE AJOUTÉE ---
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // Coins arrondis harmonieux
                            child: Image.asset(
                              'lib/assets/images/fanamiana_lovitao.jpg', // Remplace par ton chemin exact
                              width: double.infinity,
                              height:
                                  350, // Hauteur fixe contrôlée pour le Dialog
                              fit: BoxFit
                                  .cover, // Adapte l'image sans la déformer
                              // Gestionnaire d'erreur si l'asset est manquant au build
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: double.infinity,
                                  height: 100,
                                  color: Colors.black12,
                                  child: const Center(
                                    child: Icon(
                                      Icons.broken_image,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _downloadGuidePdf() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Eo am-panomanana ny fampidinana ny boky..."),
        duration: Duration(seconds: 2),
      ),
    );

    try {
      final assetPath = "lib/assets/pdfs/Torolalana-lovitao.pdf";
      final byteData = await rootBundle.load(assetPath);

      final directory = await getApplicationDocumentsDirectory();

      final fileName = p.basename(assetPath);
      final fileDestinationPath = p.join(directory.path, fileName);
      final file = File(fileDestinationPath);

      await file.writeAsBytes(
        byteData.buffer.asUint8List(
          byteData.offsetInBytes,
          byteData.lengthInBytes,
        ),
        flush: true,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Tafiditra soa aman-tsara ao amin'ny Documents ny boky !",
            ),
            backgroundColor: const Color(
              0xFF057C43,
            ), // Vert scout en cas de succès
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: "Hidina", // "OK" ou Fermer
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Nisy olana kely : $e"),
            backgroundColor: const Color(0xFFC62828), // Rouge erreur
          ),
        );
      }
    }
  }
}
