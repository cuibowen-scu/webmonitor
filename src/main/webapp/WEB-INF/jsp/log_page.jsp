<%--
  Created by IntelliJ IDEA.
  User: cuibowen5
  Date: 2018/12/24
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>

    <link rel="stylesheet" href="/css/login.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>

</head>
<body>
<script src="/demos/googlegg.js"></script>

<div class="cotn_principal">
    <br><br><br><br>
    <div class="cont_centrar">
        <div class="cont_login">
            <div class="cont_info_log_sign_up">
                <div class="col_md_login">
                    <div class="cont_ba_opcitiy">
                        <h2>LOGIN</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur.</p>
                        <button class="btn_login" onClick="cambiar_login()">LOGIN</button>
                    </div>
                </div>
                <div class="col_md_sign_up">
                    <div class="cont_ba_opcitiy">
                        <h2>SIGN UP</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur.</p>
                        <button class="btn_sign_up" onClick="cambiar_sign_up()">SIGN UP</button>
                    </div>
                </div>
            </div>
            <div class="cont_back_info">
                <div class="cont_img_back_grey"><img src="/images/login.jpg" alt=""/></div>
            </div>

            <div class="cont_forms">
                <div class="cont_img_back_"><img src="/images/login.jpg" alt=""/></div>

                <form action="/user/login.do" method="post">
                    <div class="cont_form_login"><a href="#" onClick="ocultar_login_sign_up()"><i
                            class="material-icons">&#xE5C4;</i></a>
                        <h2>LOGIN</h2>
                        <input type="text" placeholder="Phone" name="phone"/>
                        <input type="password" placeholder="Password" name="password"/>
                        <button class="btn_login" onClick="cambiar_login()">LOGIN</button>
                    </div>
                </form>

                <form action="/user/reg.do" method="post">
                    <div class="cont_form_sign_up"><a href="#" onClick="ocultar_login_sign_up()"><i
                            class="material-icons">&#xE5C4;</i></a>
                        <h2>SIGN UP</h2>
                        <input type="text" placeholder="Phone" name="phone"/>
                        <input type="text" placeholder="Email" name="email"/>
                        <input type="password" placeholder="Password" name="password1"/>
                        <input type="password" placeholder="Confirm Password" name="password2"/>
                        <button class="btn_sign_up" onClick="cambiar_sign_up()">SIGN UP</button>
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>

<script src="/js/login.js"></script>

</body>
</html>