import 'package:flutter/material.dart';
import 'package:fathiakuis/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String username = "";
  String password = "";

  bool isLogin = false;
  bool isPasswordNotVisible = true;

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, colors: [
            Colors.cyan.shade200,
            Colors.cyan.shade100,
            Colors.cyan.shade50,
          ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Image.asset(
                  'assets/images/book1.png',
                  height: 275,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Selamat Datang Para Pembaca',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 5),
            const Text('Silahkan login untuk membaca buku'),
            const SizedBox(height: 20),
            TextField(
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isPasswordNotVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password ?'),
                ),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const HomePage()));
                  String msg = "";
                  username = usernameController.text;
                  password = passwordController.text.trim();

                  if (username == "fathia" && password == "124210026") {
                    setState(() {
                      msg = "Login Berhasil";
                      isLogin = true;
                    });
                  } else {
                    msg = "Login Gagal";
                    isLogin = false;
                  }
                  //SnackBar
                  var snackBar = SnackBar(
                    content: Text(msg),
                    backgroundColor: (isLogin) ? Colors.green : Colors.red,
                  );
                  //Menampilkan snackbar
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have account ?'),
                TextButton(
                  onPressed: () {},
                  child: const Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
