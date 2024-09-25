Aplikasi Seventeen Fan App

================================

Pendahuluan 

Aplikasi Seventeen Fan App adalah aplikasi mobile berbasis Flutter yang dirancang khusus untuk Carat, yaitu penggemar grup musik Seventeen dari Korea Selatan. 
Aplikasi ini memiliki tema warna ungu dan pink yang identik dengan Seventeen, serta beberapa fitur seperti halaman login, halaman beranda yang dipersonalisasi, dan halaman informasi tentang Seventeen.

================================

Struktur Aplikasi:
1. Splash Screen: Ditampilkan selama 3 detik sebelum ke halaman login.
2. Login Page: Halaman untuk memasukkan nama pengguna dan kata sandi.
3. Home Page: Menampilkan sapaan personal setelah login berhasil.
4. Side Menu: Menu navigasi menuju halaman lain seperti About.
5. About Page: Halaman berisi informasi tentang Seventeen dengan animasi logo yang berputar.

================================

Hal - hal yang ada di dalam aplikasi:
1. Splash Screen: Tampilan pembuka saat aplikasi dibuka, menunjukkan pesan selamat datang selama beberapa detik sebelum dialihkan ke halaman login.
![image](https://github.com/user-attachments/assets/7ca66550-6d74-4219-b636-8c975789c035)

2. Halaman Login: Pengguna harus memasukkan nama pengguna dan kata sandi. Jika data cocok, pengguna dapat mengakses halaman beranda. Ini ditampilkan menu login dan pop-up jika berhasil masuk.

![image](https://github.com/user-attachments/assets/72814db8-c0b0-440a-96e9-611c772801a6)
![image](https://github.com/user-attachments/assets/b022fa62-dadc-48eb-900b-c56d54deb053)


4. Halaman Beranda: Setelah login, pengguna disambut dengan pesan yang dipersonalisasi sesuai nama pengguna.
![image](https://github.com/user-attachments/assets/7fa09460-260b-4e68-956b-d68adb4643f3)


5. Side Menu (Menu Samping): Navigasi menuju halaman lainnya seperti halaman informasi tentang Seventeen.

6. Halaman About (Tentang Seventeen): Berisi informasi singkat tentang Seventeen dan animasi logo SVT yang berputar. Lalu ada button "Shine Bright with SVT!" maka nanti akan muncul tampilan dibawah page tulisan "SVT and Carats are inseparable"
![image](https://github.com/user-attachments/assets/2b766f8c-dfc9-44b2-88ae-b8ec8d7fcb1d)



======================================

Penjelasan Kode per File

**1. main.dart**
File ini adalah titik awal aplikasi dan bertanggung jawab untuk mengatur tema dan alur navigasi awal.

- **`main()`**: Fungsi utama yang menjalankan aplikasi menggunakan `runApp()`. Di sini aplikasi dimulai dengan `MyApp`.
codenya:

      void main() {
        runApp(const MyApp());
      }

- **`MaterialApp`**: Komponen utama Flutter yang digunakan untuk mengatur tema dan halaman awal aplikasi. Aplikasi menggunakan **tema warna ungu** (warna utama) dan **pink** (warna sekunder) yang sesuai dengan identitas Seventeen.
codenya:

      theme: ThemeData(
        colorScheme: ColorScheme(
  
      primary: Colors.purple[800]!,
    
      secondary: Colors.pink[300]!,
    
      // Warna lain juga diatur di sini untuk konsistensi
       ),
  
  
        fontFamily: 'Poppins',

      ),
  
- **Splash Screen**: Setelah splash screen tampil selama 3 detik, pengguna secara otomatis dialihkan ke halaman login menggunakan **`Navigator.pushReplacement`**.
codenya:

      Navigator.pushReplacement(

        context,
  
        MaterialPageRoute(builder: (context) => const LoginPage()),
  
      );



**2. login_page.dart**
Ini adalah halaman login, tempat pengguna memasukkan nama pengguna dan kata sandi.

- **Validasi Login**: Jika nama pengguna adalah `'CaratFan'` dan kata sandi adalah `'ShiningDiamond'`, pengguna dapat login dan diarahkan ke halaman beranda.

codenya:

    if (_usernameController.text == 'CaratFan' &&

     _passwordController.text == 'ShiningDiamond') {
    
    _saveUsername();
  
    _showDialog('Welcome, Carat!', const HomePage());
  
    } else {

      _showDialog('Oops! Wrong Credentials!', const LoginPage());
  
    }


- **Penyimpanan Nama Pengguna**: Menggunakan **SharedPreferences**, nama pengguna disimpan agar bisa diakses di halaman lain.

codenya:

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('username', _usernameController.text);

- **Dialog**: Menampilkan pesan selamat datang jika login berhasil, atau pesan kesalahan jika login gagal.

codenya:

    _showDialog('Welcome, Carat!', const HomePage());


**3. home_page.dart**
Halaman beranda ini menyapa pengguna berdasarkan nama yang sudah disimpan sebelumnya. Nama pengguna diambil dari **SharedPreferences**.

- **Menampilkan Nama Pengguna**: Nama pengguna yang tersimpan ditampilkan sebagai bagian dari pesan sapaan di halaman beranda.

codenya:

    username = prefs.getString('username') ?? 'Carat';


- **Drawer Menu**: Terdapat menu samping (side menu) yang memungkinkan pengguna untuk bernavigasi ke halaman lain, seperti halaman **About Seventeen**.

codenya:

    drawer: const SideMenu(),


**4. sidemenu.dart**
Menu samping (side menu) ini menyediakan navigasi ke halaman **Home** dan **About**.

- **Navigasi ke Halaman Lain**: Pengguna dapat mengklik item di menu untuk berpindah halaman menggunakan **Navigator**.

codenya:

    ListTile(

      leading: const Icon(Icons.home, color: Colors.purple),
  
      title: const Text('Home'),
  
      onTap: () {
  
        Navigator.pushReplacement(
    
          context,
      
          MaterialPageRoute(builder: (context) => const HomePage()),
        
         );
    
      },
      
    ),


**5. about_page.dart**
Halaman ini memberikan informasi tentang Seventeen, serta animasi logo **SVT** yang berputar menggunakan **AnimationController**.

- **Animasi Berputar**: Logo **SVT** akan terus berputar menggunakan **Transform.rotate** dan animasi yang diatur dengan **`_controller`**.

codenya:

    Transform.rotate(

      angle: _controller.value * 2 * pi,
  
      child: child,
  
    );


- **Pesan Info**: Terdapat tombol yang menampilkan pesan bahwa **Carats** (nama fandom Seventeen) selalu bersinar bersama Seventeen.

codenya:

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(
  
        content: Text('SVT and Carats are inseparable! 💎'),
    
        backgroundColor: Colors.purpleAccent,
    
        ),
  
    );


### **Kesimpulan**
Aplikasi **Seventeen App** adalah aplikasi yang mengimplementasikan konsep routes, sidemenu, login, dan local storage. Dibuat dengan tema idol kpop kesukaan dari pembuat maka jadilah aplikasi ini. 
