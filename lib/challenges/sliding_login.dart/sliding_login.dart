import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SlidingLoginPage extends StatefulWidget {
  const SlidingLoginPage({super.key});

  @override
  State<SlidingLoginPage> createState() => _SlidingLoginPageState();
}

class _SlidingLoginPageState extends State<SlidingLoginPage>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> loginSize;
  late AnimationController loginController;
  late AnimatedOpacity opacityAnimation;
  late Duration animationDuration = const Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);

    loginController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    opacityAnimation = AnimatedOpacity(
      opacity: 0.0,
      duration: animationDuration,
    );
  }

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  Widget _buildLoginWidgets() {
    return Container(
      padding: const EdgeInsets.only(bottom: 62, top: 16),
      width: MediaQuery.of(context).size.width,
      height: loginSize.value,
      decoration: const BoxDecoration(
        color: Color(0XFF2a3ed7),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(190),
          bottomRight: Radius.circular(190),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedOpacity(
          opacity: loginController.value,
          duration: animationDuration,
          child: GestureDetector(
            onTap: isLogin
                ? null
                : () {
                    loginController.reverse();

                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
            child: Text(
              'LOG IN'.toUpperCase(),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginComponents() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Visibility(
          visible: isLogin,
          child: Padding(
            padding: const EdgeInsets.only(left: 42, right: 42),
            child: Column(
              children: <Widget>[
                const TextField(
                  style: TextStyle(color: Colors.white, height: 0.5),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: TextField(
                    style: TextStyle(color: Colors.white, height: 0.5),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key, color: Colors.white),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 40,
                  margin: const EdgeInsets.only(top: 32),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Color(0XFF2a3ed7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegistercomponents() {
    return Padding(
      padding: const EdgeInsets.only(left: 42, right: 42, top: 32, bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text(
              'Sign Up'.toUpperCase(),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0XFF2a3ed7),
              ),
            ),
          ),
          const TextField(
            style: TextStyle(color: Colors.black, height: 0.5),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
              ),
              hintText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16, top: 16),
            child: TextField(
              style: TextStyle(color: Colors.black, height: 0.5),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
              ),
            ),
          ),
          const TextField(
            style: TextStyle(color: Colors.black, height: 0.5),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key),
              hintText: 'Confirm Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              width: 200,
              height: 40,
              margin: const EdgeInsets.only(top: 32),
              decoration: const BoxDecoration(
                color: Color(0XFF2a3ed7),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: const Center(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double defaultLoginSize = MediaQuery.of(context).size.height / 1.6;

    loginSize = Tween<double>(begin: defaultLoginSize, end: 200).animate(
      CurvedAnimation(parent: loginController, curve: Curves.linear),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              opacity: isLogin ? 0.0 : 1.0,
              duration: animationDuration,
              child: Container(child: _buildRegistercomponents()),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: isLogin && !loginController.isAnimating
                  ? Colors.white
                  : Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: defaultLoginSize / 1.5,
              child: Visibility(
                visible: isLogin,
                child: GestureDetector(
                  onTap: () {
                    loginController.forward();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Center(
                    child: Text(
                      'Sign Up'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF2a3ed7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: loginController,
            builder: (context, child) {
              return _buildLoginWidgets();
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(child: _buildLoginComponents()),
            ),
          )
        ],
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
