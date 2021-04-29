import 'package:flutter/material.dart';
import 'package:mobdev_practice/services/auth.dart';
import 'package:mobdev_practice/widgets/widgets.dart';

class Login extends StatefulWidget {
  
  final Function toggleForm;
  Login({Key key,this.toggleForm}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isobscure = true;
  final _emailcontroller = TextEditingController();
  final  _passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Authenticate auth = Authenticate();
  bool isloading = false;

  @override
  void initState(){
    super.initState();
    _emailcontroller.addListener(()=> setState((){}));
  }
  
  Widget build(BuildContext context) {
    return isloading? showLoading(): Scaffold(
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/assets/4.png'),fit: BoxFit.cover)),
          child: Container(
            color: Color(0xff15191b).withOpacity(0.95),
            child: Center(
            child: SingleChildScrollView(
                child: Container(
                padding: EdgeInsets.only(top:100,left: 35,right: 35),
                height: 560,
                child: Form(
                  key: _formKey,
                    child: Column(
                    children: [
                      Center(child: Text('SIGN IN',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w400,color: Colors.grey),),),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller:_emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          suffixIcon: _emailcontroller.text.isEmpty ? 
                          Container(width: 0):
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => _emailcontroller.clear(),
                          )
                        ),
                        validator: (value){
                          final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                          final regExp = RegExp(pattern);

                          if (value.isEmpty) {
                            return 'Enter an email';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Enter a valid email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: _passwordcontroller,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(fontSize: 20),
                        decoration:  InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton( icon: Icon( isobscure ? Icons.visibility: Icons.visibility_off), onPressed: ()=>setState((){isobscure = !isobscure;})),
                        ),
                        obscureText: isobscure,
                        validator: (value){
                          if (value.length < 7) {
                            return 'Password must be at least 7 characters long';
                          } else {
                            return null;
                          }
                        },
                      ),
                       SizedBox(height: 10),
                      Center(child: Text(auth.errorM,style: TextStyle(fontSize: 14,color: Colors.red),),),
                      SizedBox(height: 20),
                      OutlinedButton(
                      style: OutlinedButton.styleFrom(side: BorderSide(width: 1,color: Colors.white),minimumSize: Size(400,60)),
                      onPressed: () async{
                         if (_formKey.currentState.validate()) {
                           setState(()=>isloading = !isloading );
                            _formKey.currentState.save();
                            await auth.signIn(_emailcontroller.text,_passwordcontroller.text);
                            setState(() => isloading = !isloading);
                         }
                      },
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.login,color: Colors.white,),
                          Text(" Login",style: TextStyle(fontSize: 21,color: Colors.white),)
                        ],
                      ),
                        ),
                      SizedBox(height: 7),
                      Center(child: TextButton(child: Text('Forgot Password?',style: TextStyle(fontSize: 18,color: Colors.white70),),onPressed: (){},),),
                      SizedBox(height: 20),
                      Center(child: TextButton(child: Text('Create Account? Sign Up',style: TextStyle(fontSize: 18.5,color: Colors.white),),onPressed: (){widget.toggleForm();})),
                    ],
                  ),
                ),
                ),
            ),
            ),
          ),
        )
    );
  }
}

