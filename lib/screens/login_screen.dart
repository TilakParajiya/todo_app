import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_page_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  get _viewPassword => false.obs;
  final String _googleIcon = 'assets/images/icons8-google-48.png';
  final String _facebookIcon = 'assets/images/facebook.png';
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  LoginController loginController = LoginController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void changeViewPassword() {
    _viewPassword.value = !_viewPassword.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign in to your Account',
              softWrap: true,
              overflow: TextOverflow.visible,
              style: TextStyle(fontSize: 40, letterSpacing: 1.2),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Sign in to your Account',
              style:
                  TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.6)),
            ),
          ],
        ),
        toolbarHeight: 225,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Email text-field
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: const EdgeInsets.fromLTRB(5, 30, 5, 10),
              child: TextField(
                controller: _emailController,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            // Password text-field
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(
                style: const TextStyle(fontSize: 18),
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1)),
                  suffixIcon: IconButton(
                    onPressed: () {
                        changeViewPassword();
                    },
                    icon: Obx(()=>Icon(_viewPassword.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined)),
                  ),
                ),
                obscureText: !_viewPassword.value,
              ),
            ),
            // Forgot password button
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.lightGreenAccent.shade700,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            // Login Button
            Container(
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                    loginController.login(_emailController.text.trim(), _passwordController.text.trim());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(20)),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Or login with
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SizedBox(
                  width: 115,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Text(
                  'Or login with',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: 115,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            // Google and Facebook buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black54),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Image(
                        image: AssetImage(_googleIcon),
                        width: 20,
                        height: 20,
                      ),
                      label: const Text('Google',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black54),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        _facebookIcon,
                        width: 20,
                        height: 20,
                      ),
                      label: const Text('Facebook',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            // Don't have an account and Register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                TextButton(
                  onPressed: () {
                      loginController.register(_emailController.text.trim(), _passwordController.text.trim());
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.lightGreen, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
