import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:theable_new/globals/ableui.dart';
import 'package:theable_new/globals/assets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final FocusNode _idFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _idFocusNode.addListener(() => setState(() {}));
    _passFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    _idFocusNode.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                AssetPaths.loginBack,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    AssetPaths.loginGridImage,
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AbleUi.horizPadValue),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetPaths.loginLogo,
                            height: 100,
                          ),
                          const Gap(40),
                          TextFormField(
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.text,
                            focusNode: _idFocusNode,
                            autofocus: false,
                            // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            onChanged: (value) {},
                            controller: _idController,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: '아이디',
                              hintStyle: const TextStyle(color: Colors.white70),
                              counterText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AbleUi.roundRadius),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AbleUi.roundRadius),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AbleUi.roundRadius),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: _idFocusNode.hasFocus ? Colors.white70 : Colors.white30,
                            ),
                            validator: (value) => value == null || value.isEmpty ? "ID should not be empty" : null,
                          ),
                          const Gap(12),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            focusNode: _passFocusNode,
                            autofocus: false,
                            onChanged: (value) {},
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: '비밀번호',
                              hintStyle: const TextStyle(color: Colors.white70),
                              counterText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AbleUi.roundRadius),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AbleUi.roundRadius),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AbleUi.roundRadius),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: _passFocusNode.hasFocus ? Colors.white70 : Colors.white30,
                              // focusColor: Colors.white,
                            ),
                            validator: (value) => value == null || value.isEmpty ? "Password should not be empty" : null,
                          ),
                          const Gap(12),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AbleUi.roundRadius)),
                            ),
                            child: const Text('로그인'),
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ))
                            },
                          ),
                          const Gap(12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  '아이디 찾기',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(2),
                                height: 14,
                                width: 1,
                                color: Colors.white54,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  '비밀번호 찾기',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(2),
                                height: 14,
                                width: 1,
                                color: Colors.white54,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  '회원가입',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
