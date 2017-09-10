	
/*	function LoginConfirm(){
		window.open ('login.jsp');
	}*/
	
    function showLogin() {
        var loginDiv = document.getElementById("loginDiv");
        /*alert("header.js");*/
        loginDiv.style.display = "block";
    }
    
   function hidLogin() {
        var loginDiv = document.getElementById("loginDiv");
        loginDiv.style.display = "none";
    }   

   function login(){
	   var txtAccount = $("#txtAccount").val();
	   var txtPassword= $("#txtPassword").val();
	   alert(txtAccount);
	   alert(txtPassword);
	   $.ajax({
		  type:"post",
		  dataType:"json",
		  data:{"userAccount":txtAccount,"userPassword":txtPassword},
		  url:"user/ajaxlogin.htm",
		  successs:function(data){alert("登录成功")},
		  error:function(data){alert("登录失败")}
	   });
   }
/*    function titleMove() {
        var moveable = true;
        var loginDiv = document.getElementById("loginDiv");
        var clientX = window.event.clientX;
        var clientY = window.event.clientY;
        var moveTop = parseInt(loginDiv.style.top);
        var moveLeft = parseInt(loginDiv.style.left);
        document.onmousemove = function MouseMove() {
            if (moveable) {
                var y = moveTop + window.event.clientY - clientY;
                var x = moveLeft + window.event.clientX - clientX;
                if (x > 0 && y > 0) {
                    loginDiv.style.top = y + "px";
                    loginDiv.style.left = x + "px";
                }
            }
        }
        document.onmouseup = function Mouseup() {
            moveable = false;
        }
    }*/