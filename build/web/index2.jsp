<%-- 
    Document   : index
    Created on : Dec 8, 2012, 10:46:48 PM
    Author     : Hoanvd
--%>

<%@page import="entity.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Our Company</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href='Styles/style.css' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
    <script src="Scripts/jquery-1.8.3.js" type="text/javascript" ></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <script src="Scripts/jquery_002.js" type="text/javascript" ></script>
    <script language='JavaScript'>
        $(document).load(function(){
            Jquery('flexslider').flexslider({
                animation:'slide',
                slideDirection:false,
                controlNav:true
            });
        });
    </script>


</head>
<body >
    <div id="container">
        <%@include  file="Shared/_Header.jsp" %>
        <div id='wrapper'>
            <div id='content'>
                <div id='top-content'>
                    <div id='nvSlider' style="margin-top:26px;">
                        <img style="display:block;float:left;width:100%;" src="Images/fkslider.png" alt="" />
                    </div>
                </div>
                <div id='body-content'>
                    <div id='left-body-content'>
                        <div id='article'>
                            <h1 class='content-title'>
                                We Provide to Challenging Designed and Creativity </h1>
                            <h3 class='content-subtitle'>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam congue nibh sit amet magna sagittis lacinia. 
                            </h3>
                            <p>In neque lectus, lobortis a varius a, hendrerit eget dolor. Fusce scelerisque, sem ut viverra sollicitudin, est turpis blandit lacus, in pretium lectus sapien at est. Integer pretium ipsum sit amet dui feugiat vitae dapibus odio eleifend. Sed dolor velit, malesuada id interdum aliquam, porta vitae arcu. </p>
                        </div>
                        <div id='featured'>
                            <h2 class='content-title'>Featured Update </h2>
                            <div id='featured-left'>
                                <img src='Images/pic1.jpg' alt='' /> 
                                <h3 class='featured-title'>Nullam consequat ornare orci </h3>
                                <span> Donec lectus tortor, aliquam quis sollicitudin vel, scelerisque eu sapien. Mauris dignissim metus in sapien fringilla in tincidunt est mollis.</span>
                                <p><a  class='readmore' href='#'>Read more</a> </p>
                            </div>
                            <div id='featured-right'>
                                <img src='Images/pic2.jpg' alt='' /> 
                                <h3 class='featured-title'>Nullam consequat ornare orci</h3>
                                <span> Donec lectus tortor, aliquam quis sollicitudin vel, scelerisque eu sapien. Mauris dignissim metus in sapien fringilla in tincidunt est mollis.</span>
                                <p><a class='readmore' href='#'>Read more</a> </p>
                            </div>
                            <div id='featured-left'>
                                <img src='Images/pic1.jpg' alt='' /> 
                                <h3 class='featured-title'>Nullam consequat ornare orci </h3>
                                <span> Donec lectus tortor, aliquam quis sollicitudin vel, scelerisque eu sapien. Mauris dignissim metus in sapien fringilla in tincidunt est mollis.</span>
                                <p><a  class='readmore' href='#'>Read more</a> </p>
                            </div>
                            <div id='featured-right'>
                                <img src='Images/pic2.jpg' alt='' /> 
                                <h3 class='featured-title'>Nullam consequat ornare orci</h3>
                                <span> Donec lectus tortor, aliquam quis sollicitudin vel, scelerisque eu sapien. Mauris dignissim metus in sapien fringilla in tincidunt est mollis.</span>
                                <p><a class='readmore' href='#'>Read more</a> </p>
                            </div>
                        </div>
                    </div>
                    <div id='right-body-content'>
                        <%@include  file="Shared/_RightBlog.jsp" %>
                    </div>
                </div>
            </div>
        </div>
        <!-------End Wrapper ------->
        <%@include  file="Shared/_Footer.jsp" %>
    </div>
</body>
</html>