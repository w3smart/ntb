<%@page import="tool.Discriminator"%>
<%@page import="entity.Account"%>
<div id='company'>
    <div id='company-content'>
        <div class='addr'>
            1234 Majapahit Road, Glasgowth, A05 897R.
            <br/>
            Freephone: +1 800 123 456
        </div>
    </div>
</div>
<!-------End Company-AboutCompany ------->
<div id='footer'>
    <div id='footer-content'>
        <div >

            <p>Copyright ©2012 Company. All Rights Reserved . Theme design by hoanvd1210@gmail.com </p>

            <span class="spUser" style="position: relative;float:right;font-size: 16px;"> <% Account account = (Account) session.getAttribute("account");
                if (account != null) {%>
                <div id="effect" style=" width: 140px;
                     height: auto;
                     padding: 0.4em;
                     z-index: 20;
                     background-color:rgb(246, 246, 246);
                     position: absolute;
                     top: -144px;
                     right: -4px;" >
                    <a href="#">My Professional Profile</a>
                    <% if (Discriminator.ADMINISTRATOR.equals(account.getAccountType())) {%>
                    <a href="dashboard.jsp">Dashboard Page</a>
                    <%}%>
                    <a href="#">My Complaints</a>
                    <a href="#">My Setting</a>
                    <a href="#">Activity</a> 
                    <a href="../MantechSite/con?action=logoutSubmit">Logout</a> 
                </div>
                Welcome : <a id="fl" href="/MantechSite/myPage.jsp" style="color:white;"><%=account.getUserName()%></a>
                <%  } else {%>
                <a  href="/MantechSite/login.jsp">Login...</a>
                <% }%> </span>

        </div>
    </div>
    <script>
        $(document).ready(function(){
            $( "#effect" ).hide();
            $("#fl").click(function(){
                //   runEffect();
                $('#effect').toggle('fold',20);
                return false;      
            });
        }); 
    </script>
</div>