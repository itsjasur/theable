import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:theable_new/globals/ableui.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("계정 생성"),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                //padding coloumn
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AbleUi.horizPadValue),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      // big text
                      const Center(
                        child: Text(
                          "아이디와 비밀번호를 입력해주세요",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Gap(20),

                      // ID field
                      const Text(
                        '아이디',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                        ),
                      ),
                      const Gap(5),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {},
                        controller: _idController,
                        decoration: const InputDecoration(
                          hintText: '아이디를 입력해 주세요',
                          counterText: null,
                          // focusColor: Colors.white,
                        ),
                        maxLength: 20,
                        validator: _validateId,
                      ),
                      const Gap(20),

                      // Password field
                      const Text(
                        '비밀번호',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                        ),
                      ),
                      const Gap(5),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {},
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: '8~16자리 이내 영문자, 숫자 조합',
                          counterText: "",
                        ),
                        validator: _validatePassword,
                      ),
                      const Gap(20),

                      // Password reentry field
                      const Text(
                        '비밀번호 확인',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                        ),
                      ),
                      const Gap(5),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {},
                        controller: _passwordController2,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: '8~16자리 이내 영문자, 숫자 조합',
                          counterText: "",
                        ),
                        validator: _validatePasswordRentry,
                      ),
                      const Gap(20),

                      // Email field
                      const Text(
                        '이메일',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                        ),
                      ),
                      const Gap(5),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {},
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: '이메일을 입력해 주세요',
                          counterText: "",
                        ),
                        validator: _validateEmail,
                      ),
                      const Gap(20),

                      // Referal code field
                      const Text(
                        '추천인 코드',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                        ),
                      ),
                      const Gap(5),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {},
                        controller: _referralCodeController,
                        decoration: const InputDecoration(
                          hintText: '추천인 코드가 있다면 입력해 주세요',
                          counterText: "",
                        ),
                      ),
                      const Gap(100),
                    ],
                  ),
                ),

                SizedBox(
                  height: AbleUi.buttonHeight,
                  child: ElevatedButton(

                      // disabling the button if any of the required fields is empty
                      onPressed: _idController.text.isEmpty || _passwordController.text.isEmpty || _passwordController2.text.isEmpty || _emailController.text.isEmpty
                          ? null
                          : () {
                              if (_formKey.currentState?.validate() == true) {}
                            },
                      child: const Text('로그인')

                      // onPressed: () {
                      //   // Navigator.push(context, MaterialPageRoute(builder: (context)=> ))
                      // },
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validateId(String? value) {
    final idRegex = RegExp(r'^[A-Za-z0-9]+$');
    if (value == null) {
      return "id는 필수 입력입니다.";
    }
    if (!idRegex.hasMatch(value)) {
      return "영어로 입력해주세요.";
    }

    return null;
  }

//password validator
  String? _validatePassword(String? value) {
    value = value?.replaceAll('/', '');

    final passwordRegex = RegExp(r"^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*()_+\-={}\[\]\\|:;'<>,.?/~`]{8,}$");

    if (value == null || !passwordRegex.hasMatch(value)) {
      return "올바르지 않은 비밀번호입니다.";
    }
    return null;
  }

  //re entered password validator
  String? _validatePasswordRentry(String? value) {
    value = value?.replaceAll('/', '');

    final passwordRegex = RegExp(r"^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*()_+\-={}\[\]\\|:;'<>,.?/~`]{8,}$");

    if (value == null || !passwordRegex.hasMatch(value)) {
      return "올바르지 않은 비밀번호입니다.";
    }

    if (_passwordController.text != _passwordController2.text) {
      return "비밀번호가 일치하지 않습니다.";
    }
    return null;
  }

  // email validator
  String? _validateEmail(String? value) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

    if (value == null || !emailRegex.hasMatch(value)) {
      return '올바르지 않은 이메일 형식입니다.';
    }

    return null;
  }
}
