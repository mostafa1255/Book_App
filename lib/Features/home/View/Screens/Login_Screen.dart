import 'package:booklyapp/core/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/assets.dart';
import '../../Presentation/Manager/Auth_Cubit/auth_cubit.dart';
import '../Widgets/CustomAuthGoogle.dart';
import '../Widgets/CustomTextFormField.dart';
import '../Widgets/CustomnavigateAuth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance;
    var device = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSucsess && user.currentUser!.emailVerified) {
          constants.customsnackBar(
              context, "'Login Sucsessfull'", Colors.green);
          GoRouter.of(context).push(Approuter.homeview);
        } else if (user.currentUser?.emailVerified == false) {
          constants.customsnackBar(
              context,
              "Please Click Your Link in your Email to Verify Your Account",
              Colors.yellow);
          user.currentUser!.sendEmailVerification();
        } else if (state is AuthLoginFaliure) {
          constants.customsnackBar(context, state.errmessage, Colors.yellow);
        } else if (state is googleSignUpSucsess) {
          GoRouter.of(context).push(Approuter.homeview);
        } else if (state is googleSignUpFaliure) {
          constants.customsnackBar(context, state.errmessage, Colors.yellow);
        }
      },
      builder: (context, state) {
        var authcubit = BlocProvider.of<AuthCubit>(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Center(
            child: state is LoadingSate
                ? const SpinKitWave(
                    color: Colors.blue,
                    size: 50.0,
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: device.width * 0.65,
                          height: device.height * 0.2,
                          child: Image.asset(
                            AssetsData.Logo,
                          ),
                        ),
                        SizedBox(
                          height: device.height * 0.1,
                        ),
                        CustomTextFormField(
                            stringController: emailController,
                            device: device,
                            hinttext: 'Email',
                            SecurPass: false),
                        CustomTextFormField(
                            stringController: passwordController,
                            device: device,
                            hinttext: 'Password',
                            SecurPass: true),
                        Row(
                          children: [
                            SizedBox(
                              width: device.width * 0.6,
                            ),
                            GestureDetector(
                              onTap: () {
                                authcubit.resetPassword(
                                    email: emailController.text);
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: device.height * 0.015,
                        ),
                        GestureDetector(
                          onTap: () {
                            authcubit.Login(
                                email: emailController.text,
                                password: passwordController.text);
                          },
                          child: Container(
                            height: device.height * 0.07,
                            width: device.width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue),
                            child: const Center(
                                child: Text(
                              "login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.8),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: device.height * 0.03,
                        ),
                        CustomAuthGoogle(
                            googleonPressed: () async {
                              await authcubit.signUpWithGoogle();
                            },
                            device: device,
                            authcubit: authcubit),
                        SizedBox(
                          height: device.height * 0.05,
                        ),
                        CustomnavigateAuth(
                          device: device,
                          text: "do you have not an account",
                          screen: "Sign up",
                          onTap: () => GoRouter.of(context)
                              .push(Approuter.registerscreen),
                        )
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
