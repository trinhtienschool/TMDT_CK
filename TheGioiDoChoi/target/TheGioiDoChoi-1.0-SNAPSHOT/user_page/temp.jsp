
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <meta charset="UTF-8">
<%--    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">--%>
<%--    <script src="https://apis.google.com/js/api:client.js"></script>--%>
<%--    <script>--%>
<%--        var googleUser = {};--%>
<%--        var startApp = function() {--%>
<%--            gapi.load('auth2', function(){--%>
<%--                // Retrieve the singleton for the GoogleAuth library and set up the client.--%>
<%--                auth2 = gapi.auth2.init({--%>
<%--                    client_id: '838091777445-oa4q61sod4fqgt5arqnk16nddhhak0v8.apps.googleusercontent.com',--%>
<%--                    cookiepolicy: 'single_host_origin',--%>
<%--                    // Request scopes in addition to 'profile' and 'email'--%>
<%--                    scope: 'profile email'--%>
<%--                });--%>
<%--                attachSignin(document.getElementById('customBtn'));--%>
<%--            });--%>
<%--        };--%>

<%--        function attachSignin(element) {--%>
<%--            console.log(element.id);--%>
<%--            auth2.attachClickHandler(element, {},--%>
<%--                function(googleUser) {--%>
<%--                    var profile = googleUser.getBasicProfile();--%>
<%--                    console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.--%>
<%--                    console.log('Name: ' + profile.getName());--%>
<%--                    console.log('Image URL: ' + profile.getImageUrl());--%>
<%--                    console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.--%>
<%--                    console.log('Given Name: ' + profile.getGivenName());--%>
<%--                    console.log('Family Name: ' + profile.getFamilyName());--%>
<%--                    $('#name').val(profile.getName());--%>
<%--                    $('#email').val(profile.getEmail());--%>
<%--                    $('#form').submit();--%>
<%--                }, function(error) {--%>
<%--                    alert(JSON.stringify(error, undefined, 2));--%>
<%--                });--%>
<%--        }--%>


<%--        //FACEBOOK--%>
<%--        function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().--%>
<%--            console.log('statusChangeCallback');--%>
<%--            console.log(response);                   // The current login status of the person.--%>
<%--            if (response.status === 'connected') {   // Logged into your webpage and Facebook.--%>
<%--                testAPI();--%>
<%--            } else {                                 // Not logged into your webpage or we are unable to tell.--%>
<%--                document.getElementById('status').innerHTML = 'Please log ' +--%>
<%--                    'into this webpage.';--%>
<%--            }--%>
<%--        }--%>


<%--        function checkLoginState() {               // Called when a person is finished with the Login Button.--%>
<%--            FB.getLoginStatus(function(response) {   // See the onlogin handler--%>
<%--                statusChangeCallback(response);--%>
<%--            });--%>
<%--        }--%>


<%--        window.fbAsyncInit = function() {--%>
<%--            FB.init({--%>
<%--                appId      : '314699199867660',--%>
<%--                cookie     : true,                     // Enable cookies to allow the server to access the session.--%>
<%--                xfbml      : true,                     // Parse social plugins on this webpage.--%>
<%--                version    : 'v9.0'           // Use this Graph API version for this call.--%>
<%--            });--%>
<%--            FB.AppEvents.logPageView();--%>

<%--            FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.--%>
<%--                statusChangeCallback(response);        // Returns the login status.--%>
<%--            });--%>
<%--        };--%>

<%--        function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.--%>
<%--            console.log('Welcome!  Fetching your information.... ');--%>
<%--            FB.api('/me', 'get', { fields: 'id,name,email,gender,birthday,picture' }, function(response) {--%>
<%--                console.log('Successful login for: ' + response.name);--%>
<%--                console.log('Successful login for: ' + response.email);--%>
<%--                console.log(response.id);--%>
<%--                // document.getElementById('status').innerHTML =--%>
<%--                //     'Thanks for logging in, ' + response.name + '!';--%>

<%--                // var redirectUrl="../handle-google-login";--%>
<%--                // var form = $('<form action="' + redirectUrl + '" method="get"'+'style="display:none">'+--%>
<%--                //     '<input type="text" name="name" value="' +--%>
<%--                //     response.name + '" />' +--%>
<%--                //     '<input type="text" name="email" value="' +--%>
<%--                //     response.email + '" />' +--%>
<%--                //     '</form>');--%>
<%--                // $('body').append(form);--%>
<%--                // form.submit();--%>
<%--                $('#name').val(response.name);--%>
<%--                $('#email').val(response.email);--%>
<%--                $('#form').submit();--%>

<%--            });--%>
<%--        };--%>
<%--    </script>--%>
</head>
<body>
<%--<script>--%>
<%--    var googleUser = {};--%>
<%--    var startApp = function() {--%>
<%--        gapi.load('auth2', function(){--%>
<%--            // Retrieve the singleton for the GoogleAuth library and set up the client.--%>
<%--            auth2 = gapi.auth2.init({--%>
<%--                client_id: '838091777445-oa4q61sod4fqgt5arqnk16nddhhak0v8.apps.googleusercontent.com',--%>
<%--                cookiepolicy: 'single_host_origin',--%>
<%--                // Request scopes in addition to 'profile' and 'email'--%>
<%--                scope: 'profile email'--%>
<%--            });--%>
<%--            attachSignin(document.getElementById('customBtn'));--%>
<%--        });--%>
<%--    };--%>

<%--    function attachSignin(element) {--%>
<%--        console.log(element.id);--%>
<%--        auth2.attachClickHandler(element, {},--%>
<%--            function(googleUser) {--%>
<%--                document.getElementById('name').innerText = "Signed in: " +--%>
<%--                    googleUser.getBasicProfile().getName();--%>
<%--            }, function(error) {--%>
<%--                alert(JSON.stringify(error, undefined, 2));--%>
<%--            });--%>
<%--    }--%>


<%--    //FACEBOOK--%>
<%--    function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().--%>
<%--        console.log('statusChangeCallback');--%>
<%--        console.log(response);                   // The current login status of the person.--%>
<%--        if (response.status === 'connected') {   // Logged into your webpage and Facebook.--%>
<%--            testAPI();--%>
<%--        } else {                                 // Not logged into your webpage or we are unable to tell.--%>
<%--            document.getElementById('status').innerHTML = 'Please log ' +--%>
<%--                'into this webpage.';--%>
<%--        }--%>
<%--    }--%>


<%--    function checkLoginState() {               // Called when a person is finished with the Login Button.--%>
<%--        FB.getLoginStatus(function(response) {   // See the onlogin handler--%>
<%--            statusChangeCallback(response);--%>
<%--        });--%>
<%--    }--%>


<%--    window.fbAsyncInit = function() {--%>
<%--        FB.init({--%>
<%--            appId      : '314699199867660',--%>
<%--            cookie     : true,                     // Enable cookies to allow the server to access the session.--%>
<%--            xfbml      : true,                     // Parse social plugins on this webpage.--%>
<%--            version    : 'v9.0'           // Use this Graph API version for this call.--%>
<%--        });--%>
<%--        FB.AppEvents.logPageView();--%>

<%--        FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.--%>
<%--            statusChangeCallback(response);        // Returns the login status.--%>
<%--        });--%>
<%--    };--%>

<%--    function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.--%>
<%--        console.log('Welcome!  Fetching your information.... ');--%>
<%--        FB.api('/me', 'get', { fields: 'id,name,email,gender,birthday,picture' }, function(response) {--%>
<%--            console.log('Successful login for: ' + response.name);--%>
<%--            console.log('Successful login for: ' + response.email);--%>
<%--            console.log(response.id);--%>
<%--            // document.getElementById('status').innerHTML =--%>
<%--            //     'Thanks for logging in, ' + response.name + '!';--%>

<%--            // var redirectUrl="../handle-google-login";--%>
<%--            // var form = $('<form action="' + redirectUrl + '" method="get"'+'style="display:none">'+--%>
<%--            //     '<input type="text" name="name" value="' +--%>
<%--            //     response.name + '" />' +--%>
<%--            //     '<input type="text" name="email" value="' +--%>
<%--            //     response.email + '" />' +--%>
<%--            //     '</form>');--%>
<%--            // $('body').append(form);--%>
<%--            // form.submit();--%>
<%--            $('#name').val(response.name);--%>
<%--            $('#email').val(response.email);--%>
<%--            $('#form').submit();--%>

<%--        });--%>
<%--    };--%>
<%--</script>--%>
<%--Fb--%>
<form id="form" method="get" style="display: none" action="../handle-google-login" accept-charset="UTF-8">
    <input type="text" name="name" id="name">
    <input type="text" name="email" id="email">
</form>
<%--<div id="fb-root"></div>--%>
<%--<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0&appId=314699199867660&autoLogAppEvents=1" nonce="R7aMF3NX"></script>--%>
<%--<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>--%>
<%--<div class="fb-login-button" data-width="500px" style="height: 500px" data-size="small" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false" onlogin="checkLoginState()"></div>--%>
<div class="fb-login-button"  data-width="" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false" onlogin="checkLoginState()"></div>

<!-- In the callback, you would hide the gSignInWrapper element on a
successful sign in -->
<div id="gSignInWrapper">
    <span class="label">Sign in with:</span>
    <div id="customBtn" class="customGPlusSignIn">
        <span class="icon"></span>
        <span class="buttonText">Đăng nhập bằng Google</span>
    </div>
</div>
<%--<div class="fb-login-button" data-width="" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false"></div>--%>
<%--<div id="name"></div>--%>

<script src="https://apis.google.com/js/api:client.js"></script>
<script>
    var googleUser = {};
    var startApp = function() {
        gapi.load('auth2', function(){
            // Retrieve the singleton for the GoogleAuth library and set up the client.
            auth2 = gapi.auth2.init({
                client_id: '838091777445-oa4q61sod4fqgt5arqnk16nddhhak0v8.apps.googleusercontent.com',
                cookiepolicy: 'single_host_origin',
                // Request scopes in addition to 'profile' and 'email'
                scope: 'profile email'
            });
            attachSignin(document.getElementById('customBtn'));
        });
    };

    function attachSignin(element) {
        // console.log(element.id);
        auth2.attachClickHandler(element, {},
            function(googleUser) {
                var profile = googleUser.getBasicProfile();
                // console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
                // console.log('Name: ' + profile.getName());
                // console.log('Image URL: ' + profile.getImageUrl());
                // console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
                // console.log('Given Name: ' + profile.getGivenName());
                // console.log('Family Name: ' + profile.getFamilyName());
                $('#name').val(profile.getName());
                $('#email').val(profile.getEmail());
                $('#form').submit();
            }, function(error) {
                alert(JSON.stringify(error, undefined, 2));
            });
    }


    //FACEBOOK
    window.fbAsyncInit = function() {
        FB.init({
            appId      : '314699199867660',
            cookie     : true,                     // Enable cookies to allow the server to access the session.
            xfbml      : true,                     // Parse social plugins on this webpage.
            version    : 'v9.0'           // Use this Graph API version for this call.
        });

        FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
            statusChangeCallback(response);        // Returns the login status.
        });
    };
    function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
        // console.log('statusChangeCallback');
        // console.log(response);                   // The current login status of the person.
        if (response.status === 'connected') {   // Logged into your webpage and Facebook.
            testAPI();
        }
        // else {                                 // Not logged into your webpage or we are unable to tell.
            // document.getElementById('status').innerHTML = 'Please log ' +
            //     'into this webpage.';
        // }
    }


    function checkLoginState() {               // Called when a person is finished with the Login Button.
        FB.getLoginStatus(function(response) {   // See the onlogin handler
            statusChangeCallback(response);
        });
    }




    function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
        // console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', 'get', { fields: 'id,name,email,gender,birthday,picture' }, function(response) {
            // console.log('Successful login for: ' + response.name);
            // console.log('Successful login for: ' + response.email);
            // console.log(response.id);
            $('#name').val(response.name);
            $('#email').val(response.email);
            $('#form').submit();

        });
    };
    startApp();
</script>
<%--<script></script>--%>
<script src="js/jquery-3.3.1.min.js"></script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0&appId=314699199867660&autoLogAppEvents=1" nonce="R7aMF3NX"></script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
</body>
</html>