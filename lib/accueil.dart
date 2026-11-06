import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ireo Soatoavina",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF012113),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Ny fitaizana maha skoto dia mifototra amin'ny soatoavina telo lehibe mampiray antsika.",
                  style: TextStyle(color: Color(0xFF424843)),
                ),
                const SizedBox(height: 20),

                _buildValueCard(
                  icon: 'lib/assets/icons/star5.svg',
                  title: "Andriamanitra",
                  description:
                      "Fanoloran-tena amin’ny finoana sy ny fanajana ny zavaboary ary ny herin’ny Fanahy izay mibaiko antsika.",
                  color: const Color(0xFFE6F2EC),
                  iconBgColor: const Color(0xFF057C43).withValues(alpha: 0.2),
                  textColor: const Color(0xFF057C43),
                ),

                _buildValueCard(
                  icon: 'lib/assets/icons/people.svg',
                  title: "Ny Havana sy ny Namana",
                  description:
                      "Fanampiana ny hafa sy ny firenena. Ny skoto dia naman'ny olona rehetra ary mpirahalahy ho an'ny skoto hafa.",
                  color: const Color(0xFFFFDAD7),
                  textColor: const Color(0xFF64010B),
                  iconBgColor: const Color(0xFF64010B).withValues(alpha: 0.2),
                ),

                _buildValueCard(
                  icon: 'lib/assets/icons/shield.svg',
                  title: "Ny Tenanao",
                  description:
                      "Fandraisana andraikitra amin’ny fivoaran’ny tena manokana eo amin'ny saina sy vatana.",
                  color: const Color(0xFFE6EAF0),
                  iconBgColor: const Color(0xFF002A6D).withValues(alpha: 0.1),
                  textColor: const Color(0xFF002A6D),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 350,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage('lib/assets/images/accueil_img_2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color.fromRGBO(100, 1, 11, 0.9), Colors.transparent],
                stops: const [0.0, 0.8],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF67030D).withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "TONGASOA ETO !",
                    style: TextStyle(
                      color: Color(0xFFEEF0FF),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Manomana ny ampitso, \nHo an'ny Tanindrazana.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF057C43,
                    ).withValues(alpha: 0.4),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  icon: const Text("Hiaraka hanao dia"),
                  label: const Icon(Icons.arrow_forward, size: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValueCard({
    required String icon,
    required String title,
    required String description,
    required Color color,
    required Color iconBgColor,
    Color textColor = Colors.black87,
    Color? iconColor,
  }) {
    final realIconColor = iconColor ?? textColor;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: iconBgColor,
            radius: 25,
            child: SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(realIconColor, BlendMode.srcIn),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 13,
              color: textColor.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
