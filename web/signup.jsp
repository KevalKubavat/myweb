<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form</title>
        <!--Css-------------->
        <link rel="stylesheet" type="text/css" href="css/asignup11.css">
        
        <script language="javascript">
    function validateForm(){
        //validation for name
    var a=document.forms["Rform"]["name"].value;
    if (a==null || a=="")
      {
      alert("please Enter your Name ");
      return false;
      }
  var d=document.forms["Rform"]["email"].value;
    if (d==null || d==""){
      alert("please Enter Email");
      return false;
      }else{
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if(d.match(mailformat))
        {
        document.Rform.email.focus();
        //return true;
        }
        else
        {
        alert("You have entered an invalid email address!");
        document.Rform.email.focus();
        return false;
        }
      }
      //validation for password
     var b=document.forms["Rform"]["pass"].value;
    if (b==null || b=="")
      {
      alert("please Enter password");
      return false;
      }
      //validation for condfirm password
       var c=document.forms["Rform"]["Rpass"].value;
    if (c==null || c=="")
      {
      alert("please Enter Confirm password");
      return false;
      }
      if(b!=c){
        alert("PassWord Doesn't match..");
        return false;
      }
      //validation for birthdate
      //validation for gender(optional)
      //validation for location
      //validation for mobile number
       var i=document.forms["Rform"]["number"].value;
    if (i==null || i=="")
      {
      alert("please Enter Phone No");
      return false;

      }

       if(isNaN(i)|| i.indexOf(" ")!=-1)
        {
                            alert("Enter numeric value");
                return false;
                    }
                     if (i.length >10)
                {
                                alert("enter 10 characters"); 
                    return false;
                         }
                         
    
        if(document.getElementById('agree').checked)
        {
            alert('Thank you. Form is ready for approval.');
            return true;
        }
        else
        {
            alert('Please accept terms & conditions....');
            return false;
        }
                                        
  }
  
  
        </script>
        
    </head>
    <body onload="document.registration1.name.focus()">
        <!-- outer from -->
        <div id="signup-form">
            
                    <!--Our header image icon-->
                    <div class="clearfix" id="header">
                        

<img title="signup" id="signup-icon" src="imgs/signup.png" width="94" height="88" alt="" />


                  
                    <h1 class="cloudheaden">Sign up to <div class="p1 cloudheaden">My Cloud Drive</div>  FREE Today!</h1>
                    </div>
                    <p class="cloudheaden">Please complete the fields below, ensuring you use a valid email address as you will be sent a validation code which you will need the first time you login to the site.</p>
                    <form id="send" onsubmit="return validateForm()" action ="signupverify"  method="post" name="Rform"  >
            <p>
                <label>Your Name *</label>
                <input title="Enter Your name Here" class="borderlayout textboxwidth"  type="text" name="name" value="" />
            </p>
            <p>
                <label >E-mail *</label>
                <input title="Your Email to Which We will Send The Confirmation Mail." class="borderlayout textboxwidth" type="text" name="email" value="" />
            </p>
            <p>
                <label>Password *</label>
                <input title="Enter Your Password." class="borderlayout textboxwidth" type="password" name="pass" value="" />
            </p>
            <p>
                <label>confirm password *</label>
                <input title="Again Enter Your Password To Confirm It." class="borderlayout textboxwidth" type="password" name="Rpass" value="" />
            </p>
            <p>
                <label>BirthDay</label>
                <input title="Please.. Enter Your BirthDate In DD/MM/YYYY formate." class="borderlayout birthdate2" type="text" name="date"  placeholder="   DD/MM/YYYY "  >
                
            </p> 
                           
            <p>
                <label>Gender</label>
                <input title="If Male." class="input1 radioback"  type="radio" name="gender" value="Male"/>Male
                <input title="If Female." class="input1" type="radio" name="gender" value="Female"/>Female
            </p>
            <p>
                <label>Mobile Number *</label>
                <input title="Enter your mobile number." class="borderlayout textboxwidth" type="text" name="number" value=""  />
            </p>
            <p>
                <label>Location</label>
                <input title="Eneter You Location." class="borderlayout textboxwidth" name = "loc" type="text" value="" />
            </p>
            <p>
                <input class="input1" type="checkbox" id="agree" name="check" value="" title="Accept To Signup And Go For Submit."/>
                I Accept all the term and condition.
            </p>
            <p>
                
                <button class="borderlayout" id="submit" type="submit" title="Submit Your Data And Read Below Given Note. ">Submit</button>
            </p>
        </form>
                 
                <div id="required">
	* Required Fields<br/>
        <p>NOTE: You must activate your account after sign up</p>
                </div>       
        </div>    
        <!-- End of outer form-->
        </body>
</html>
