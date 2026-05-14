import 'package:flutter/material.dart';
import '../models/category_model.dart';

final List<CategoryModel> dummyCategories = [
  CategoryModel(
    id: '1', 
    name: 'Gigi Anak', 
    icon: Icons.child_care,
    imageUrl: 'https://images.unsplash.com/photo-1555252333-9f8e92e65df9?q=80&w=800&auto=format&fit=crop',
    description: 'Panduan lengkap seputar kesehatan gigi anak, pertumbuhan, dan cara merawatnya sejak dini.',
    contentSections: [
      CategorySection(
        title: 'Pengertian Gigi Anak',
        content: 'Gigi anak atau gigi susu adalah sekumpulan gigi pertama yang tumbuh pada bayi dan anak-anak sebelum digantikan oleh gigi permanen. Gigi ini sangat penting untuk fungsi mengunyah, berbicara, dan memberikan ruang bagi gigi permanen nantinya.'
      ),
      CategorySection(
        title: 'Jenis Gigi Anak',
        content: 'Gigi susu berjumlah 20 buah yang terdiri dari:\n- 8 Gigi Seri (Incisor): Memotong makanan.\n- 4 Gigi Taring (Canine): Merobek makanan.\n- 8 Gigi Geraham (Molar): Menggiling dan menghaluskan makanan.'
      ),
      CategorySection(
        title: 'Jadwal Tumbuh Gigi Berdasarkan Umur',
        content: 'Pertumbuhan gigi susu umumnya dimulai pada usia 6 bulan hingga 3 tahun:\n- 6-12 bulan: Gigi seri tengah dan samping bawah/atas.\n- 13-19 bulan: Gigi geraham pertama.\n- 16-22 bulan: Gigi taring.\n- 25-33 bulan: Gigi geraham kedua.'
      ),
      CategorySection(
        title: 'Cara Merawat Gigi Anak',
        content: 'Perawatan harus dimulai bahkan sebelum gigi pertama muncul dengan mengelap gusi menggunakan kain basah yang bersih. Setelah gigi tumbuh, gunakan sikat gigi berbulu lembut khusus anak dan pasta gigi berfluoride seukuran biji beras.'
      ),
      CategorySection(
        title: 'Kebiasaan Buruk yang Merusak Gigi',
        content: 'Beberapa kebiasaan yang perlu dihindari:\n- Minum susu botol saat tidur (bottle caries).\n- Mengisap jempol atau dot terlalu lama.\n- Terlalu banyak mengonsumsi makanan/minuman manis dan lengket.'
      ),
      CategorySection(
        title: 'Tips Menjaga Gigi Anak Tetap Sehat',
        content: 'Biasakan anak menyikat gigi 2 kali sehari (pagi setelah sarapan dan malam sebelum tidur), batasi camilan manis, dan jadwalkan kunjungan pertama ke dokter gigi saat anak berusia 1 tahun atau saat gigi pertama tumbuh.'
      ),
    ]
  ),
  CategoryModel(
    id: '2', 
    name: 'Gigi Dewasa', 
    icon: Icons.person,
    imageUrl: 'https://images.unsplash.com/photo-1606811841689-23dfddce3e95?q=80&w=800&auto=format&fit=crop',
    description: 'Informasi komprehensif mengenai fungsi, perawatan, dan pencegahan masalah pada gigi orang dewasa.',
    contentSections: [
      CategorySection(
        title: 'Pengertian Gigi Dewasa',
        content: 'Gigi dewasa atau gigi permanen adalah gigi yang tumbuh menggantikan gigi susu dan dirancang untuk bertahan seumur hidup jika dirawat dengan baik. Gigi ini lebih besar, lebih kuat, dan memiliki warna sedikit lebih kekuningan dibanding gigi susu.'
      ),
      CategorySection(
        title: 'Jenis dan Fungsi Gigi Dewasa',
        content: 'Orang dewasa normal memiliki 32 gigi permanen:\n- 8 Gigi Seri: Memotong makanan.\n- 4 Gigi Taring: Merobek makanan.\n- 8 Gigi Premolar (Geraham Kecil): Menghancurkan makanan.\n- 12 Gigi Molar (Geraham): Menggiling makanan, termasuk 4 gigi bungsu.'
      ),
      CategorySection(
        title: 'Cara Menjaga Kesehatan Gigi Dewasa',
        content: 'Kunci kesehatan gigi dewasa adalah konsistensi: menyikat gigi 2 kali sehari dengan teknik yang benar, menggunakan benang gigi (flossing) setidaknya sekali sehari, dan menggunakan obat kumur jika diperlukan.'
      ),
      CategorySection(
        title: 'Makanan yang Baik untuk Gigi',
        content: 'Konsumsi makanan kaya kalsium dan fosfor (susu, keju, kacang-kacangan), buah-buahan renyah dan sayuran yang merangsang produksi air liur (apel, wortel, seledri), serta perbanyak minum air putih.'
      ),
      CategorySection(
        title: 'Penyebab Kerusakan Gigi Dewasa',
        content: 'Faktor utama meliputi penumpukan plak akibat kurang menjaga kebersihan, konsumsi gula tinggi, merokok, mulut kering, dan penyakit asam lambung yang mengikis email gigi.'
      ),
      CategorySection(
        title: 'Cara Perawatan Gigi Dewasa',
        content: 'Selain perawatan mandiri di rumah, sangat disarankan untuk melakukan pemeriksaan rutin ke dokter gigi setiap 6 bulan sekali untuk pembersihan karang gigi (scaling) dan deteksi dini masalah gigi.'
      ),
    ]
  ),
  CategoryModel(
    id: '3', 
    name: 'Pencegahan', 
    icon: Icons.shield,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/d/d9/Dental_Hygienist.jpg',
    description: 'Langkah-langkah preventif untuk melindungi kesehatan gigi dan mulut Anda dari berbagai penyakit.',
    contentSections: [
      CategorySection(
        title: 'Cara Mencegah Karang Gigi',
        content: 'Karang gigi terbentuk dari plak yang mengeras. Cegah dengan menyikat gigi 2x sehari, menggunakan pasta gigi pengontrol tartar, flossing setiap hari, dan tidak merokok.'
      ),
      CategorySection(
        title: 'Cara Mencegah Gigi Berlubang',
        content: 'Gigi berlubang (karies) terjadi akibat asam dari bakteri. Pencegahannya meliputi mengurangi makanan/minuman manis, menggunakan pasta gigi berfluoride, dan terapi fluoride di dokter gigi jika diperlukan.'
      ),
      CategorySection(
        title: 'Cara Mencegah Sakit Gusi',
        content: 'Radang gusi (gingivitis) bisa dicegah dengan kebersihan mulut yang ketat, terutama di sepanjang garis gusi. Gunakan sikat gigi berbulu lembut dan lakukan flossing teratur.'
      ),
      CategorySection(
        title: 'Cara Menjaga Napas Tetap Segar',
        content: 'Bau mulut sering disebabkan oleh sisa makanan dan bakteri. Bersihkan lidah Anda menggunakan pembersih lidah atau sikat gigi, pastikan hidrasi tubuh cukup dengan banyak minum air, dan kunyah permen karet tanpa gula untuk merangsang air liur.'
      ),
      CategorySection(
        title: 'Tips Pola Hidup Sehat untuk Kesehatan Gigi',
        content: 'Hindari kebiasaan merokok dan konsumsi alkohol berlebih. Jika berolahraga kontak fisik, gunakan pelindung mulut (mouthguard). Jangan gunakan gigi sebagai alat (misalnya membuka botol atau merobek plastik).'
      ),
    ]
  ),
  CategoryModel(
    id: '4', 
    name: 'Perawatan', 
    icon: Icons.medical_services,
    imageUrl: 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5?q=80&w=800&auto=format&fit=crop',
    description: 'Panduan merawat kebersihan dan kesehatan gigi yang tepat untuk setiap jenjang usia.',
    contentSections: [
      CategorySection(
        title: 'Cara Merawat Gigi Anak',
        content: 'Dampingi anak saat menyikat gigi hingga usia 7-8 tahun. Pastikan mereka tidak menelan pasta gigi berfluoride. Berikan edukasi dengan cara yang menyenangkan, seperti menyikat gigi bersama atau menggunakan lagu.'
      ),
      CategorySection(
        title: 'Cara Merawat Gigi Dewasa',
        content: 'Lakukan sikat gigi 2 kali sehari selama 2 menit. Gunakan teknik sikat gigi yang mengarah dari gusi ke gigi (sudut 45 derajat). Jangan lupakan flossing untuk membersihkan celah antar gigi.'
      ),
      CategorySection(
        title: 'Cara Merawat Gigi Lansia',
        content: 'Seiring bertambahnya usia, risiko mulut kering dan penyakit gusi meningkat. Lansia dengan gigi palsu harus membersihkan gigi palsunya setiap hari dan melepasnya saat tidur. Tetap sikat gusi dan lidah secara lembut.'
      ),
      CategorySection(
        title: 'Waktu Menyikat Gigi yang Benar',
        content: 'Waktu paling krusial adalah Pagi hari setelah sarapan dan Malam hari sebelum tidur. Tunggu 30 menit setelah makan makanan asam sebelum menyikat gigi untuk menghindari abrasi email.'
      ),
      CategorySection(
        title: 'Penggunaan Benang Gigi dan Mouthwash',
        content: 'Gunakan benang gigi (dental floss) sebelum menyikat gigi agar sisa makanan terangkat dan fluoride dari pasta gigi bisa masuk ke sela gigi. Obat kumur (mouthwash) digunakan sebagai tambahan, bukan pengganti sikat gigi.'
      ),
      CategorySection(
        title: 'Perawatan Rutin ke Dokter Gigi',
        content: 'Kunjungan rutin minimal 6 bulan sekali sangat penting untuk melakukan scaling (pembersihan karang gigi), pemeriksaan gigi berlubang dini, dan aplikasi fluoride profesional.'
      ),
    ]
  ),
  CategoryModel(
    id: '5', 
    name: 'Gusi', 
    icon: Icons.sick,
    imageUrl: 'https://images.unsplash.com/photo-1579684385127-1ef15d508118?q=80&w=800&auto=format&fit=crop',
    description: 'Kesehatan gigi tidak lengkap tanpa gusi yang sehat. Pelajari cara merawat dan mencegah penyakit gusi.',
    contentSections: [
      CategorySection(
        title: 'Pengertian Kesehatan Gusi',
        content: 'Gusi (gingiva) yang sehat berwarna merah muda, kencang, dan menutupi akar gigi dengan baik. Gusi berfungsi sebagai penyangga dan pelindung jaringan periodonsium di bawahnya.'
      ),
      CategorySection(
        title: 'Penyebab Gusi Sakit',
        content: 'Penyebab utamanya adalah penumpukan plak bakteri. Faktor lain termasuk menyikat gigi terlalu keras, perubahan hormonal (seperti saat hamil), kekurangan vitamin C, atau penyakit diabetes.'
      ),
      CategorySection(
        title: 'Cara Mencegah Radang Gusi',
        content: 'Gingivitis atau radang gusi dapat dicegah dengan membersihkan plak secara menyeluruh setiap hari, melakukan flossing, dan menghindari produk tembakau.'
      ),
      CategorySection(
        title: 'Cara Meredakan Sakit Gusi',
        content: 'Jika gusi bengkak ringan, Anda bisa berkumur dengan air garam hangat, mengompres dingin dari luar pipi, dan memperbaiki kebersihan mulut. Jika pendarahan atau nyeri berlanjut, segera temui dokter gigi.'
      ),
      CategorySection(
        title: 'Makanan yang Baik untuk Gusi',
        content: 'Vitamin C sangat krusial untuk kesehatan jaringan gusi (jeruk, stroberi, brokoli). Sayuran hijau berserat dan teh hijau juga terbukti dapat membantu menyehatkan gusi.'
      ),
      CategorySection(
        title: 'Tips Menjaga Gusi Tetap Sehat',
        content: 'Jangan menyikat gigi dengan arah horizontal atau maju-mundur secara keras. Gunakan gerakan melingkar dan sikat berbulu lembut. Lakukan pembersihan karang gigi rutin di klinik.'
      ),
    ]
  ),
  CategoryModel(
    id: '6', 
    name: 'Karang Gigi', 
    icon: Icons.cleaning_services,
    imageUrl: 'https://images.unsplash.com/photo-1609840114035-3c981b782dfe?q=80&w=800&auto=format&fit=crop',
    description: 'Pahami bahaya karang gigi dan pentingnya scaling untuk kebersihan mulut yang optimal.',
    contentSections: [
      CategorySection(
        title: 'Pengertian Karang Gigi',
        content: 'Karang gigi (kalkulus) adalah plak gigi yang telah mengeras dan mengalami mineralisasi. Karang gigi biasanya berwarna kekuningan, cokelat, hingga kehitaman dan menempel kuat di permukaan gigi atau di bawah garis gusi.'
      ),
      CategorySection(
        title: 'Penyebab Munculnya Karang Gigi',
        content: 'Jika plak (lapisan lengket berisi bakteri) tidak dibersihkan dengan sikat gigi dan flossing, plak tersebut akan bercampur dengan mineral dari air liur dan mengeras menjadi karang gigi dalam waktu 24-72 jam.'
      ),
      CategorySection(
        title: 'Bahaya Karang Gigi',
        content: 'Karang gigi menjadi tempat bersarangnya bakteri yang memicu peradangan gusi (gingivitis), bau mulut (halitosis), kerusakan tulang penyangga gigi (periodontitis), hingga menyebabkan gigi goyah dan tanggal.'
      ),
      CategorySection(
        title: 'Cara Membersihkan Karang Gigi',
        content: 'Berbeda dengan plak, karang gigi TIDAK BISA dibersihkan hanya dengan sikat gigi. Pembersihannya harus dilakukan oleh dokter gigi menggunakan prosedur yang disebut Scaling dengan alat ultrasonic scaler.'
      ),
      CategorySection(
        title: 'Cara Mencegah Karang Gigi',
        content: 'Sikat gigi 2 kali sehari menggunakan pasta gigi yang mengandung pyrophosphates atau zinc citrate (kontrol tartar), gunakan benang gigi setiap hari, dan hindari rokok.'
      ),
      CategorySection(
        title: 'Edukasi Scaling Gigi',
        content: 'Scaling adalah perawatan non-bedah untuk menghilangkan karang gigi. Proses ini tidak merusak email gigi, meski terkadang membuat gigi ngilu sementara. Sangat disarankan dilakukan tiap 6 bulan sekali.'
      ),
    ]
  ),
  CategoryModel(
    id: '7', 
    name: 'Sikat Gigi', 
    icon: Icons.brush,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/c/c3/Toothbrush_20050716_004.jpg',
    description: 'Teknik dan pemilihan alat yang tepat adalah kunci keberhasilan dalam menjaga kebersihan gigi.',
    contentSections: [
      CategorySection(
        title: 'Cara Menyikat Gigi yang Benar',
        content: 'Tempatkan sikat gigi pada sudut 45 derajat terhadap gusi. Sikat permukaan luar, dalam, dan kunyah setiap gigi dengan lembut. Jangan lupa sikat bagian dalam gigi depan dengan gerakan vertikal.'
      ),
      CategorySection(
        title: 'Gerakan Menyikat Gigi yang Baik',
        content: 'Gunakan gerakan melingkar atau memutar yang pendek. Hindari gerakan maju-mundur atau menggergaji dengan keras karena dapat mengikis email gigi dan melukai gusi.'
      ),
      CategorySection(
        title: 'Waktu Terbaik Menyikat Gigi',
        content: 'Minimal 2 kali sehari: Pagi setelah sarapan dan Malam sebelum tidur. Durasi yang direkomendasikan adalah 2 menit.'
      ),
      CategorySection(
        title: 'Jenis Sikat Gigi yang Baik',
        content: 'Selalu pilih sikat gigi dengan bulu yang LEMBUT (Soft). Kepala sikat sebaiknya kecil agar mudah menjangkau bagian belakang mulut. Ganti sikat gigi setiap 3-4 bulan atau saat bulunya sudah mekar.'
      ),
      CategorySection(
        title: 'Penggunaan Pasta Gigi Fluoride',
        content: 'Fluoride adalah mineral alami yang memperkuat email gigi dan mencegah lubang. Pastikan pasta gigi Anda mengandung fluoride. Untuk anak-anak, gunakan takaran sebesar biji beras atau kacang polong sesuai usianya.'
      ),
      CategorySection(
        title: 'Kesalahan Umum Saat Menyikat Gigi',
        content: 'Menyikat gigi terlalu keras, tidak cukup lama (kurang dari 2 menit), melewatkan bagian dalam gigi, dan langsung menyikat gigi setelah minum atau makan yang sangat asam.'
      ),
    ]
  ),
];
