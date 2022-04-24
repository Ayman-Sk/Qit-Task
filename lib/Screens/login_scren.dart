import 'package:flutter/material.dart';
import 'package:task_for_qit/Api/autharization.dart';
import 'package:task_for_qit/Screens/home_screen.dart';
import 'package:task_for_qit/Theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formkey = GlobalKey();
  bool loading = false;
  Autharization autharization = Autharization();

  Future<bool> _submit(String emailAddress, String password) async {
    setState(() {
      loading = true;
    });
    if (!_formkey.currentState!.validate()) {
      setState(() {
        loading = false;
      });
      return Future.value(false);
    }
    _formkey.currentState!.save();

    return autharization.login(emailAddress, password);
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 16.32,
              left: MediaQuery.of(context).size.width / 14.4,
              right: MediaQuery.of(context).size.width / 14.4),
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 73,
                    fontWeight: FontWeight.w300,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 11),
                const Text(
                  'Please login to your account.',
                  style: TextStyle(color: AppColors.textColor, fontSize: 18),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 16.32),
                _buildForm(),
                SizedBox(height: MediaQuery.of(context).size.height / 81.6),
                Align(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 16.32),
                const Center(
                  child: Text('or login with',
                      style:
                          TextStyle(fontSize: 12, color: AppColors.textColor)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40.8),
                _buildSocialLogin(),
                SizedBox(height: MediaQuery.of(context).size.height / 16.32),
                _buildTextButton(
                    'Don’t have an account?', 'Create new now!', () {}),
                _buildTextButton('By signing up, you are agree with our',
                    'Terms & Conditions', () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(children: [
            _buildTextField(
                controller: emailController,
                inputType: TextInputType.emailAddress,
                hintText: 'Email Address',
                validate: emailValidate,
                suffixIcon: Icons.email_outlined,
                iconPath: 'Images/email.png'),
            const SizedBox(height: 15),
            _buildTextField(
                controller: passwordController,
                inputType: TextInputType.visiblePassword,
                hintText: 'Password',
                validate: passwordValidate,
                suffixIcon: Icons.lock_outline,
                iconPath: 'Images/lock.png'),
            SizedBox(height: MediaQuery.of(context).size.height / 20.4),
            _buildSubmitButton(),
          ]),
        ));
  }

  Widget _buildTextButton(String text, String buttonText, Function onPressed) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
            ),
          ),
          TextButton(
              onPressed: () => onPressed,
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildSocialButton(
    String imagePath,
  ) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        maxRadius: 30,
        backgroundColor: AppColors.textColor,
        child: CircleAvatar(
          maxRadius: 29,
          child: Container(
              padding: const EdgeInsets.all(15), child: Image.asset(imagePath)),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSocialLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton('Images/google.png'),
        _buildSocialButton('Images/facebook.png'),
        _buildSocialButton('Images/twitter.png')
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 16.32,
        child: ElevatedButton(
          child: loading
              ? const CircularProgressIndicator(
                  color: AppColors.focus,
                )
              : const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
                ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
          ),
          onPressed: () async {
            setState(() {
              loading = false;
            });
            bool res;
            res = await _submit(emailController.text, passwordController.text);
            if (res) {
              setState(() {
                loading = false;
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              });
              print('loggggg in succceesadsds');
            }
          },
        ),
      ),
    );
  }

  String? emailValidate(String? text) {
    if (text == null || text.isEmpty) {
      return 'empty email';
    } else if (!text.contains('@')) {
      return 'wrong email';
    }
    return null;
  }

  String? passwordValidate(String? text) {
    if (text == null || text.isEmpty) {
      return 'empty password email';
    }
    if (text.length < 5) {
      return 'short password';
    }
    return null;
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required TextInputType inputType,
      required String hintText,
      required String? Function(String?) validate,
      required IconData suffixIcon,
      required String iconPath}) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: inputType == TextInputType.visiblePassword,
      focusNode: inputType == TextInputType.visiblePassword
          ? passwordFocusNode
          : emailFocusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        suffixIcon: Container(
            padding: const EdgeInsets.only(right: 20),
            width: MediaQuery.of(context).size.width / 21.6,
            child: Image.asset(
              iconPath,
            ) //Icon(suffixIcon, color: AppColors.textColor, size: 30),
            ),
        // suffixIconColor: AppColors.textColor,
        // iconColor: AppColors.textColor,
        hintText: hintText,
        // enabledBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.grey, width: 0.0),
        // ),
        // fillColor: Colors.white,
        // focusColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
      validator: validate,
      onFieldSubmitted: (_) {
        if (inputType == TextInputType.visiblePassword) {
          _submit(emailController.text, passwordController.text);
        }
        FocusScope.of(context).requestFocus(passwordFocusNode);
      },
    );
  }
}
