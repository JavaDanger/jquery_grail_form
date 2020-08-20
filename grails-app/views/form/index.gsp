 <%@ page import="formvalid.Country" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<head>
    <title>Add Student</title>
    <script
    src="https://code.jquery.com/jquery-3.5.1.js"
    integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://jqueryvalidation.org/files/demo/site-demos.css">
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<g:javascript library='jquery' />
<script>
      function countryChanged(countryId) { //function for dynamic dropdown
        jQuery.ajax({type:'POST',data:'countryId='+countryId, url:'${createLink(controller:'form',action:'countryChanged')}',success:function(data,textStatus){jQuery('#subContainer').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
    }

    </script>
</head>

<body>
    <br><br>
    <div align = "left">

        <label>Name</label>
        <g:textField name = "name" value = "" id = "name" />
        <br><br>

        <label>Age</label>
        <g:textField name = "age" value = "" id = "age"/>
        <br><br>

        

<div>
    <b>Country:</b>
    <g:select id="country" name="country.id" from="${Country.listOrderByName()}"
    optionKey="id" noSelection="[null: '']"
    onchange="countryChanged(this.value)"
    />

    <b>State</b>
    <span id="subContainer"></span>
</div>
<div>
    <b>State</b>
    <span id="subContainer"></span>
</div>
<div id="form"></div>
<br>

 <div>
        <label><input type="checkbox" name="colorCheckbox" value="check"> Contract Information</label>
    </div>
    <div class="check box">
       <form id="myform">
       <fieldset>
		
		<label for="email">Email Address: </label><br>
		<input class="left" id="email" name="email"><br>
		<label for="phone">Phone Number: </label><br>
		<input class="right" id="mobile" name="mobile">
		<br/>
        </fieldset>
		
	</form><closeform></closeform>
    </div>
    <br><br>

        <button id = "button" name = "button" onClick = "addAjax()" >Add</button>

    <style type="text/css">
        .box {
            color: black;
            display: none;
            margin-top: 20px;
        }

        .check {
            background: #ffffff;
        }
    </style>
     
 <script

 
  type="text/javascript">
        $(document).ready(function() {
            $('input[type="checkbox"]').click(function() {
                var inputValue = $(this).attr("value");
                $("." + inputValue).toggle();
            });
        });
        
        jQuery.validator.setDefaults({
	  debug: true,
	  success: "valid"
	});
    </script>

    <script>
	jQuery.validator.setDefaults({
	  debug: true,
	  success: "valid"
	});
	$( "#myform" ).validate({
	  rules: {
		name: {
		   required: true,
			minlength: 2
		},
		email: {
		  required: true,
		  email: true
		},
		mobile: {
		  required: true,
		  number: true,
		  maxlength: 10
		}
	  }
	});
    
   
    
	</script>
    
    

    </div>
</body>
<script>
 function addAjax() {
     $(document).ready(function() {
         
         var mix_name = $('#name').val(); 
         var name = mix_name.toUpperCase(); //Convert the name in uppercase
         var age = $('#age').val();
        
         var email = $('#email').val();
         var mobile = $('#mobile').val();
            //Check if name field is empty
            if(name == "") {
                alert('Name field is empty');
                return false;
            }
            //Check if name field is empty
            if(age == "") {
                alert('Age field is empty');
                return false;
            }
            var conv_to_num = Number(age);  //Convert age string to number
            //Check if the age is an integer
            if(isNaN(conv_to_num) || !Number.isInteger(conv_to_num))
            {
                alert("Age should be integer");
                return false;
            } 
        var URL="${createLink(controller:'Form',action:'add_Student')}"
        $.ajax({
				url: URL,
                type: "POST",
                datatype: "html",
				data:{name:name, age:age,email:email,mobile:mobile},
				success:function(data)
				{
                    alert(data);
				}
			})        
    })
}
</script>
</html>

