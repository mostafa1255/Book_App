import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/assets.dart';
import '../../Presentation/Manager/Auth_Cubit/auth_cubit.dart';
import '../Widgets/CustomAuthGoogle.dart';
import '../Widgets/CustomTextFormField.dart';
import '../Widgets/CustomnavigateAuth.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSignSucsess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content:
                  Text('Create Email Sucsessfull , Please Verify your account'),
              backgroundColor: Colors.green,
            ));
            GoRouter.of(context).push(Approuter.loginscreen);
          } else if (state is AuthSignFaliure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errmessage),
              backgroundColor: Colors.red,
            ));
          } else if (state is googleSignSucsess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Create Email Sucsessfull'),
              backgroundColor: Colors.green,
            ));
            GoRouter.of(context).push(Approuter.loginscreen);
          } else if (state is googleSignFaliure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errmessage),
              backgroundColor: Colors.red,
            ));
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
                          children: [
                            SizedBox(
                              height: device.height * 0.1,
                            ),
                            SizedBox(
                              width: device.width * 0.65,
                              child: Image.asset(
                                AssetsData.Logo,
                              ),
                            ),
                            SizedBox(
                              height: device.height * 0.2,
                            ),
                            CustomTextFormField(
                                stringController: nameController,
                                device: device,
                                hinttext: "Name",
                                SecurPass: false),
                            CustomTextFormField(
                                stringController: emailController,
                                device: device,
                                hinttext: "Email",
                                SecurPass: false),
                            CustomTextFormField(
                                stringController: passwordController,
                                device: device,
                                hinttext: "Password",
                                SecurPass: true),
                            GestureDetector(
                              onTap: () {
                                print("Clicked");
                                authcubit.Register(
                                    name: nameController.text,
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
                                  "Sign Up",
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
                                  await authcubit.signInWithGoogle();
                                },
                                device: device,
                                authcubit: authcubit),
                            SizedBox(
                              height: device.height * 0.05,
                            ),
                            CustomnavigateAuth(
                              device: device,
                              screen: "Login",
                              text: "do you have an account",
                              onTap: () {
                                GoRouter.of(context)
                                    .push(Approuter.loginscreen);
                              },
                            )
                          ],
                        ),
                      )),
          );
        },
      ),
    );
  }
}
