
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/base_state.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/widget_adapter.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/widget_mixture.dart';

class Register extends BaseStatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends BaseState<Register> with WidgetToolMixture {

  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false; //密码是否显示明文
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = false;

  Widget _nameWidget () {
    return  TextFormField(
        autofocus: false,
        controller: _unameController,
        decoration: InputDecoration(
          labelText: "用户名",
          hintText: "用户名",
          prefixIcon: Icon(Icons.person),
        ),
        // 校验用户名（不能为空）
        validator: (v) {
          return v.trim().isNotEmpty ? null : "用户不能为空";
        });
  }

  Widget _passwordWidget () {
    return  TextFormField(
      controller: _pwdController,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "密码",
          hintText: "密码",
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
                pwdShow ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                pwdShow = !pwdShow;
              });
            },
          )),
      obscureText: !pwdShow,
      //校验密码（不能为空）
      validator: (v) {
        return v.trim().isNotEmpty ? null : "密码不能为空";
      },
    );
  }

  Widget _btnWidget () {

   return  Padding(
     padding: const EdgeInsets.only(top: 25),
     child: ConstrainedBox(
       constraints: BoxConstraints.expand(height: 55.0),
       child: RaisedButton(
         color: Theme.of(context).primaryColor,
         onPressed: _onLogin,
         textColor: Colors.white,
         child: Text("注册"),
       ),
     ),
   );
  }

  void _onLogin() async {
     endEditing();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    addSubView(WidgetAdapter(
        widgetEl:_nameWidget));

    addSubView(WidgetAdapter(
        widgetEl:_passwordWidget));

    addSubView(WidgetAdapter(
        widgetEl:_btnWidget));
  }

  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {

  Widget widgetBody = bodyWidgetBychildbodyWidgetBlock((List<Widget> widgets) {

      return  Container(
          child:  SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child:  Form(
                key: _formKey,
                autovalidate: true,
                child: Column(
                  children:widgets,
                )
            ),
          )
      );
    });

    return Scaffold(
      appBar: AppBar(
        title:Text("注册"),
      ),
      body: widgetBody,
    );
  }

//  @override
//  Widget build(BuildContext context) {
////    var gm = GmLocalizations.of(context);
//
//    return Scaffold(
//      appBar: AppBar(title: Text("登录")),
//      body: Padding(
//        padding: const EdgeInsets.all(16.0),
//        child: Form(
//          key: _formKey,
//          autovalidate: true,
//          child:SingleChildScrollView(child: Column(
//            children: <Widget>[
//              TextFormField(
//                  autofocus: _nameAutoFocus,
//                  controller: _unameController,
//                  decoration: InputDecoration(
//                    labelText: "",
//                    hintText: "",
//                    prefixIcon: Icon(Icons.person),
//                  ),
//                  // 校验用户名（不能为空）
//                  validator: (v) {
//                    return v.trim().isNotEmpty ? null : "";
//                  }),
//              TextFormField(
//                controller: _pwdController,
//                autofocus: !_nameAutoFocus,
//                decoration: InputDecoration(
//                    labelText: "",
//                    hintText: "",
//                    prefixIcon: Icon(Icons.lock),
//                    suffixIcon: IconButton(
//                      icon: Icon(
//                          pwdShow ? Icons.visibility_off : Icons.visibility),
//                      onPressed: () {
//                        setState(() {
//                          pwdShow = !pwdShow;
//                        });
//                      },
//                    )),
//                obscureText: !pwdShow,
//                //校验密码（不能为空）
//                validator: (v) {
//                  return v.trim().isNotEmpty ? null : "";
//                },
//              ),
//              TextFormField(
//                controller: _pwdController,
//                autofocus: !_nameAutoFocus,
//                decoration: InputDecoration(
//                    labelText: "",
//                    hintText: "",
//                    prefixIcon: Icon(Icons.lock),
//                    suffixIcon: IconButton(
//                      icon: Icon(
//                          pwdShow ? Icons.visibility_off : Icons.visibility),
//                      onPressed: () {
//                        setState(() {
//                          pwdShow = !pwdShow;
//                        });
//                      },
//                    )),
//                obscureText: !pwdShow,
//                //校验密码（不能为空）
//                validator: (v) {
//                  return v.trim().isNotEmpty ? null : "";
//                },
//              ),
//              Padding(
//                padding: const EdgeInsets.only(top: 25),
//                child: ConstrainedBox(
//                  constraints: BoxConstraints.expand(height: 55.0),
//                  child: RaisedButton(
//                    color: Theme.of(context).primaryColor,
//                    onPressed: _onLogin,
//                    textColor: Colors.white,
//                    child: Text(""),
//                  ),
//                ),
//              ),
//            ],
//          )),
//        ),
//      ),
//    );
//  }


}