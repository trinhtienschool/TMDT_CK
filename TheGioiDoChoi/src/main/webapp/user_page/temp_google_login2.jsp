<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>--%>
<%--<head>--%>
<%--&lt;%&ndash;    <meta charset="UTF-8">&ndash;%&gt;--%>


<%--    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>--%>
<%--    <script src="https://apis.google.com/js/platform.js" async defer></script>--%>

<%--    <meta name="google-signin-scope" content="profile email">--%>
<%--    <meta name="google-signin-client_id" content="838091777445-oa4q61sod4fqgt5arqnk16nddhhak0v8.apps.googleusercontent.com">--%>

<%--    <title>Servlet OAuth example</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>Servlet OAuth example</h2>--%>
<%--<br>--%>

<%--<div id="my-signin2"></div>--%>
<%--<script>--%>

<%--    function onFailure(error) {--%>
<%--        console.log(error);--%>
<%--    }--%>
<%--    function renderButton() {--%>
<%--        gapi.signin2.render('my-signin2', {--%>
<%--            'scope': 'profile email',--%>
<%--            'width': 240,--%>
<%--            'height': 50,--%>
<%--            'longtitle': true,--%>
<%--            'theme': 'dark',--%>
<%--            'onsuccess': onSignIn,--%>
<%--            'onfailure': onFailure--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>

<%--<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>--%>



<%--&lt;%&ndash;<div id="fb-root"></div>&ndash;%&gt;--%>
<%--<script async defer crossorigin="anonymous" src="https://connect.facebook.net/v_VN/sdk.js#xfbml=1&version=v9.0&appId=314699199867660&autoLogAppEvents=1" nonce="R7aMF3NX"></script>--%>
<%--<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>--%>
<%--&lt;%&ndash;<div class="fb-login-button" data-width="500px" style="height: 500px" data-size="small" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false" onlogin="checkLoginState()"></div>&ndash;%&gt;--%>
<%--<div class="fb-login-button" data-login-text="Sign in with FaceBook" data-width="" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false"></div>--%>

<%--&lt;%&ndash;data-onsuccess="onSignIn"&ndash;%&gt;--%>

<%--<script>--%>
<%--    //google callback. This function will redirect to our login servlet--%>
<%--    function onSignIn(googleUser) {--%>
<%--        var profile = googleUser.getBasicProfile();--%>
<%--        console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.--%>
<%--        console.log('Name: ' + profile.getName());--%>
<%--        console.log('Image URL: ' + profile.getImageUrl());--%>
<%--        console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.--%>
<%--        console.log('Given Name: ' + profile.getGivenName());--%>
<%--        console.log('Family Name: ' + profile.getFamilyName());--%>

<%--        var redirectUrl="../handle-google-login";--%>
<%--        var form = $('<form action="' + redirectUrl + '" method="post"'+'style="display:none">'+--%>
<%--            '<input type="text" name="name" value="' +--%>
<%--            profile.getName() + '" />' +--%>
<%--            '<input type="text" name="avatar" value="' +--%>
<%--            profile.getImageUrl() + '" />' +--%>
<%--            '<input type="text" name="email" value="' +--%>
<%--            profile.getEmail() + '" />' +--%>
<%--            '</form>');--%>
<%--        $('body').append(form);--%>
<%--        form.submit();--%>
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

<%--            var redirectUrl="../handle-google-login";--%>
<%--            var form = $('<form action="' + redirectUrl + '" method="post"'+'style="display:none">'+--%>
<%--                '<input type="text" name="name" value="' +--%>
<%--                response.name + '" />' +--%>
<%--                '<input type="text" name="email" value="' +--%>
<%--                response.email + '" />' +--%>
<%--                '</form>');--%>
<%--            $('body').append(form);--%>
<%--            form.submit();--%>

<%--        });--%>
<%--    };--%>

<%--</script>--%>
<%--<script>--%>
<%--    $(document).ready(function(){  console.log("Co thuc hien cai nay")--%>
<%--        var span_tab = document.getElementsByTagName("span");--%>
<%--        console.log(span_tab.length);--%>
<%--        for(var i =0; i<span_tab.length;i++){--%>
<%--            console.log(span_tab[i].innerHTML);--%>
<%--            if(span_tab[i].innerHTML=="Sign in with Google"){--%>
<%--                span_tab[i].innerHTML="??ng nh?p v?i Google";--%>
<%--            }--%>
<%--        } })--%>


<%--</script>--%>
<%--</body>--%>
<%--</html>--%>