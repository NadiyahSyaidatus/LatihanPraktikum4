import 'package:flutter/material.dart';
import 'package:latihan_4/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const MaterialColor white = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0, // Jarak antara menu secara horizontal
            mainAxisSpacing: 16.0, // Jarak antara menu secara vertikal
          ),
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    },
                  ),
                );
              },
              child: buildRecipeCard(Recipe.samples[index], screenWidth),
            );
          },
        ),
      ),
    );
  }
}

Widget buildRecipeCard(Recipe recipe, double screenWidth) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth / 2 -
                24, // Setengah dari lebar layar dikurangi padding
            height: screenWidth / 4, // Separuh dari lebar layar
            child: Image(
              image: AssetImage(recipe.imageUrl),
              fit: BoxFit.cover, // Menyesuaikan gambar ke dalam container
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            recipe.label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palationo',
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            recipe.description, // Menampilkan deskripsi resep di bawah namanya
            style: const TextStyle(
              fontSize: 14.0,
              fontFamily: 'Palationo',
            ),
          ),
        ],
      ),
    ),
  );
}

class Recipe {
  String label;
  String imageUrl;
  String description; // Deskripsi resep

  int servings;
  List<Ingredient> ingredients;

  Recipe(this.label, this.imageUrl, this.description, this.servings,
      this.ingredients);

  static List<Recipe> samples = [
    Recipe(
      'RAWON',
      'assets/rawon.jpg',
      'Rawon adalah masakan sup daging sapi berkuah hitam bercitarasa khas Indonesia. Bumbu utama rawon adalah kluwek yang telah dihaluskan yang memberikan warna hitam pekat pada kuah rawon.',
      5,
      [
        Ingredient(500, 'gram',
            ' daging sapi (bagian sandung lamur atau bagian paha yang berlemak)'),
        Ingredient(150, 'gram', ' kacang tanah, sangrai dan haluskan'),
        Ingredient(3, 'lembar', ' daun salam'),
        Ingredient(2, 'batang', ' serai, memarkan'),
        Ingredient(3, 'cm', ' lengkuas, memarkan'),
        Ingredient(5, 'lembar', ' daun jeruk'),
        Ingredient(2, 'cm', ' jahe, memarkan'),
        Ingredient(2, 'cm', ' kunyit, memarkan'),
        Ingredient(3, 'sdm', ' minyak untuk menumis'),
        Ingredient(2, 'liter', ' air'),
        Ingredient(4, 'sdt', ' garam'),
        Ingredient(1, 'blok', ' Gula merah'),
        Ingredient(10, 'butir', ' bawang merah'),
        Ingredient(5, 'siung', ' bawang putih'),
        Ingredient(3, 'buah', ' cabai merah besar (sesuai selera)'),
        Ingredient(3, 'buah', ' cabai rawit (sesuai selera)'),
        Ingredient(1, 'sdt', ' terasi bakar'),
      ],
    ),
    Recipe(
      'RUJAK CINGUR',
      'assets/rujak.jfif',
      'Rujak cingur adalah makanan khas Surabaya yang berbahan dasar daging cingur yang dimasak dan sayuran segar. Rujak cingur memiliki rasa yang unik karena disajikan dengan sambal kacang.',
      3,
      [
        Ingredient(
            200, 'gram', ' cingur (hidung sapi), rebus dan potong-potong'),
        Ingredient(200, 'gram', ' tauge (kecambah tauge), bersihkan'),
        Ingredient(1, 'buah', ' mentimun, potong dadu'),
        Ingredient(1, 'buah', ' bengkuang, kupas dan potong dadu'),
        Ingredient(1, 'buah', ' mangga muda, potong dadu'),
        Ingredient(2, 'buah', ' tahu goreng, potong-potong'),
        Ingredient(2, 'buah', ' tempe goreng, potong-potong'),
        Ingredient(2, 'buah', ' telur rebus, belah dua'),
        Ingredient(150, 'gram', ' gula merah, sisir halus'),
        Ingredient(100, 'ml', ' air'),
        Ingredient(50, 'gram', ' kacang tanah, sangrai dan haluskan'),
        Ingredient(3, 'buah', ' cabai merah besar (sesuai selera)'),
        Ingredient(2, 'siung', ' bawang putih'),
        Ingredient(2, 'cm', ' kencur'),
        Ingredient(4, 'sdt', ' garam'),
      ],
    ),
    Recipe(
      'TAHU CAMPUR',
      'assets/Tahu campur.jfif',
      'Tahu campur adalah makanan khas Jawa Timur yang terdiri dari tahu goreng yang disajikan dengan irisan kol, taoge, dan soun. Tahu campur disajikan dengan kuah kental yang gurih dan pedas.',
      5,
      [
        Ingredient(500, 'gram', ' tahu putih, potong kotak kecil'),
        Ingredient(200, 'gram', ' tauge (kecambah tauge), bersihkan'),
        Ingredient(200, 'gram', ' kol, iris tipis'),
        Ingredient(2, 'batang', ' daun bawang, iris halus'),
        Ingredient(7, 'sdm', ' minyak'),
        Ingredient(3, 'sdt', ' garam'),
        Ingredient(4, 'siung', ' awang putih'),
        Ingredient(3, 'buah', ' cabai merah besar (sesuai selera)'),
        Ingredient(3, 'buah', ' cabai rawit (sesuai selera)'),
        Ingredient(1, 'cm', ' kencur'),
        Ingredient(200, 'gram', ' kacang tanah, sangrai dan haluskan'),
        Ingredient(2, 'siung', ' bawang putih, haluskan'),
        Ingredient(3, 'sdm', ' gula merah, sisir halus'),
        Ingredient(1, 'sdm', ' petis udang'),
        Ingredient(3, 'sdt', ' garam'),
        Ingredient(200, 'ml', ' air'),
      ],
    ),
    Recipe(
      'LONTONG BALAP',
      'assets/Lontong Balap.jfif',
      'Lontong Balap adalah hidangan khas dari Surabaya. Hidangan ini memiliki cita rasa yang khas dan disajikan dengan kuah yang gurih.',
      5,
      [
        Ingredient(300, 'gram', ' tauge (kecambah tauge), bersihkan'),
        Ingredient(300, 'gram', ' lontong, potong-potong'),
        Ingredient(200, 'gram', ' tahu goreng, potong-potong'),
        Ingredient(2, 'batang', ' daun seledri, iris halus'),
        Ingredient(150, 'gram', ' kacang tanah, sangrai dan haluskan'),
        Ingredient(3, 'siung', ' bawang putih, haluskan'),
        Ingredient(5, 'buah', ' cabai rawit (sesuai selera)'),
        Ingredient(2, 'blok', ' gula merah'),
        Ingredient(2, 'sdt', ' garam'),
        Ingredient(200, 'ml', ' air'),
      ],
    ),
    Recipe(
      'TAHU TEK',
      'assets/Tahu Tek.jfif',
      'Tahu Tek adalah hidangan khas dari Surabaya yang terdiri dari potongan-potongan tahu goreng dengan beragam bahan tambahan. Tahu Tek biasanya disiram dengan bumbu kacang yang gurih dan sedikit pedas',
      8,
      [
        Ingredient(500, 'gram', ' tahu putih, potong kotak kecil'),
        Ingredient(100, 'gram', ' auge (kecambah tauge)'),
        Ingredient(2, 'batang', ' seledri, iris halus'),
        Ingredient(2, 'batang', ' daun bawang, iris halus'),
        Ingredient(2, 'butir', ' telur, rebus dan iris bulat tipis'),
        Ingredient(100, 'gram',
            ' kentang, potong dadu kecil dan goreng hingga crispy'),
        Ingredient(100, 'gram', ' bihun, rendam air panas hingga lembut'),
        Ingredient(2, 'sdm', ' bawang goreng, untuk taburan'),
      ],
    ),
    Recipe(
      'NASI KRAWU',
      'assets/Nasi Krawu.jfif',
      'Nasi Krawu adalah hidangan tradisional dari daerah Gresik yang terdiri dari daging sapi, Hidangan ini memiliki aroma yang khas dan disajikan dengan pelengkap seperti sambal dan irisan mentimun.',
      4,
      [
        Ingredient(500, 'gram',
            ' daging sapi (sandung lamur atau paha bagian belakang)'),
        Ingredient(500, 'ml', ' antan kelapa kental'),
        Ingredient(500, 'ml', ' kaldu sapi'),
        Ingredient(300, 'gram', ' beras, cuci bersih dan tiriskan'),
        Ingredient(4, 'lembar', ' daun salam'),
        Ingredient(3, 'batang', ' serai, memarkan'),
        Ingredient(3, 'cm', ' lengkuas, memarkan'),
        Ingredient(5, 'lembar', ' daun jeruk'),
        Ingredient(2, 'batang', 's ereh, memarkan'),
        Ingredient(2, 'cm', ' jahe, memarkan'),
        Ingredient(3, 'cm', ' kunyit, memarkan'),
        Ingredient(2, 'sdt', ' garam'),
        Ingredient(3, 'sdt', ' gula'),
        Ingredient(6, 'sdm', ' minyak untuk menumis'),
        Ingredient(10, 'butir', ' bawang merah'),
        Ingredient(5, 'siung', ' bawang putih'),
        Ingredient(5, 'buah', ' kemiri, sangrai'),
        Ingredient(1, 'sendok teh', ' ketumbar'),
        Ingredient(1 / 2, 'sendok teh', ' jintan'),
      ],
    ),
    Recipe(
      'SOTO AYAM LAMONGAN',
      'assets/soto.jfif',
      'Soto Ayam Lamongan adalah hidangan khas dari Lamongan. Hidangan ini memiliki kuah yang gurih dan disajikan dengan pelengkap seperti bawang goreng, irisan daun bawang, dan kerupuk.',
      12,
      [
        Ingredient(1, 'ekor', ' ayam, potong menjadi bagian-bagian'),
        Ingredient(2, 'liter', ' air'),
        Ingredient(3, 'batang', ' serai, memarkan'),
        Ingredient(5, 'lembar', ' daun jeruk'),
        Ingredient(5, 'lembar', ' daun salam'),
        Ingredient(3, 'cm', ' lengkuas, memarkan'),
        Ingredient(5, 'siung', ' bawang putih, memarkan'),
        Ingredient(5, 'siung', ' bawang merah, memarkan'),
        Ingredient(2, 'cm', ' jahe, memarkan'),
        Ingredient(2, 'cm', ' kunyit, memarkan'),
        Ingredient(2, 'sendok makan', ' minyak untuk menumis'),
        Ingredient(3, 'sdt', ' garam'),
        Ingredient(1, 'sdt', ' merica bubuk'),
        Ingredient(2, 'sdt', ' gula pasir'),
        Ingredient(1 / 4, 'butir', ' jeruk nipis untuk penyajian'),
        Ingredient(5, 'butir', ' kemiri, sangrai'),
        Ingredient(1, 'sendok teh', ' ketumbar'),
        Ingredient(1 / 2, 'sendok teh', ' jintan'),
      ],
    ),
    Recipe(
      'LONTONG KUPANG',
      'assets/Lontong kupang.jfif',
      'Lontong Kupang adalah hidangan khas dari Sidoarjo. Hidangan ini memiliki cita rasa yang khas dan disajikan dengan lontong dan kuah yang gurih.',
      3,
      [
        Ingredient(400, 'gram', ' kupang (kerang hijau)'),
        Ingredient(2, 'batang', ' serai, memarkan'),
        Ingredient(3, 'lembar', ' daun jeruk'),
        Ingredient(3, 'lembar', ' daun salam'),
        Ingredient(2, 'lembar', ' daun kunyit'),
        Ingredient(2, 'buah', ' cabai merah besar, iris tipis'),
        Ingredient(2, 'cm', ' jahe, memarkan'),
        Ingredient(2, 'cm', ' Lengkuas, memarkan'),
        Ingredient(1, 'liter', ' air'),
        Ingredient(5, 'buah', ' cabai merah keriting'),
        Ingredient(3, 'buah', ' cabai rawit merah (sesuai selera)'),
        Ingredient(5, 'siung', ' bawang merah'),
        Ingredient(3, 'siung', ' bawang putih'),
        Ingredient(2, 'cm', ' kunyit'),
        Ingredient(2, 'cm', ' jahe'),
        Ingredient(1, 'sdt', ' terasi bakar'),
      ],
    ),
    Recipe(
      'ES DAWET SIWALAN',
      'assets/Es Dawet.jfif',
      'Dawet Siwalan adalah minuman tradisional asli Jawa Timur. Siwalan adalah buah dari pohon siwalan yang tumbuh di daerah tropis. Minuman ini memiliki rasa yang segar dan manis.',
      1,
      [
        Ingredient(350, 'ml', ' santan'),
        Ingredient(5, 'buah', ' siwalan'),
        Ingredient(150, 'gram', ' Gula Merah'),
        Ingredient(2, 'lembar', ' Daun pandan'),
        Ingredient(2, 'sdm', ' gula pasir'),
        Ingredient(1 / 4, 'sdt', ' garam'),
      ],
    ),
    Recipe(
      'WEDANG ANGSLE',
      'assets/angsle.jfif',
      'Wedang Angsle adalah minuman tradisional dari Jawa Timur. Minuman ini disajikan hangat dan memiliki rasa yang manis dengan aroma rempah yang khas.',
      8,
      [
        Ingredient(200, 'gram', ' Beras Ketan'),
        Ingredient(100, 'gram', ' sagu mutiara'),
        Ingredient(100, 'gram', ' kacang hijau'),
        Ingredient(4, 'lembar', ' Roti Tawar'),
        Ingredient(1, 'liter', ' santan'),
        Ingredient(150, 'gram', ' Gula Pasir'),
        Ingredient(2, 'ruas', ' Jahe'),
        Ingredient(1, 'sdt', ' garam'),
        Ingredient(2, 'lembar', ' daun pandan'),
      ],
    ),
  ];
}

class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(this.quantity, this.measure, this.name);
}
