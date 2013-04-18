<html xmlns="http://www.w3.org/1999/xhtml">
 
<head id="Head1" >
 
<title>AutoComplete Box with jQuery</title>
 
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css"rel="stylesheet"type="text/css"/>
 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>  

<%--<script type="text/javascript">

    $(document).ready(function () {

        SearchText();

    });

    function SearchText() {

        $(".autosuggest").autocomplete({

            source: function (request, response) {

                $.ajax({

                    type: "POST",

                    contentType: "application/json; charset=utf-8",

                    url: "Default.aspx/GetAutoCompleteData",

                    data: "{'fullname':'" + document.getElementById('txtSearch').value + "'}",

                    dataType: "json",

                    success: function (data) {

                        response(data.d);

                    },

                    error: function (result) {

                        alert("Error");

                    }

                });

            }

        });

    }
 
</script>--%>
<!--
        .content
        {
            margin:50px auto;
            text-align:center;
            width:422px;
        }

        #txtSearch
        {
            padding:10px;
            border:solid 1px #cccccc;
            width:400px;
            color:#555555;
            font: 18pt tahoma;
        }
        .divResult
        {
            position:absolute;
            background-color:#F2F2FF;
            border-style:solid;
            border-width:1px;
            border-color:#999999;
            padding:10px;
            margin:0 auto;
            width:400px;
            text-align:left;
            display:none;
        }
        .img
        {
            width:60px;
            height:60px;
            margin:5px;
            float:left;
        }
        .txtResult
        {
            display:block;
            width:300px;
            height:60px;
            padding:5px;
            margin:5px;
            color:#555555;
            font: 14pt tahoma;
            text-decoration:none;
        }
        .loading
        {
            font: 10pt tahoma;
            text-align:center;
        }
        .record
        {
            margin:2px;
        }

-->

 
</head>
 
<body>


<%-- 
<form id="form1" action="Default.aspx.cs">
 
<div class="demo">
 
<div class="ui-widget">
 
<label for="tbAuto">Enter FullName: </label>
 
<input type="text" id="txtSearch" class="autosuggest" />
 
</div>
</div>
 
</form>--%>

<div class="content">
        <input id="txtSearch" onkeyup="search()" type="text" />
<div class="divResult">
<div class="loading">Loading..</div>
<div class="record"></div>
</div>
</div>
<script src="htt://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function search() {
        if ($("#txtSearch").val() != "") {
            $(".divResult").show(); //show div block that contain on result
            $(".loading").show(); // show loading text while getting result

            //here we will put code that call search function on web service
        }
        else {
            $(".divResult").hide(); //hide div that contain result when the input text is empty
            $(".record").html(""); //also loading text when the input text is empty
        }
    }
</script>

      <script type="text/javascript">

          function search() {
              if ($("#txtSearch").val() != "") {

                  $(".divResult").show(); //show div block that contains on result
                  $(".loading").show(); // show loading text while getting result

                  //call web searvice
                  $.ajax({ type: "POST",
                      url: "WebService.asmx/Search", //function that in web service
                      data: "{txtSearch:'" + $("#txtSearch").val() + "'}", // passing value of txtSearch input
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (response) {
                          //declaer client object and set to it returned result from web sevice function
                          var result = response.d;
                          $(".record").html(""); // clear previous result

                          //looping in 'result' array to get data and fill it inside ".record" div as html
                          $.each(result, function (index, res) {

                              //append img tag inside ".record" div
                              $('<img />', {
                                  src: 'images/' + res.img,
                                  alt: res.Title
                              }).addClass("img").appendTo('.record');

                              //append anchor tag inside ".record" div
                              $('<a></a>', {
                                  href: res.href,
                                  text: res.Title
                              }).addClass("txtResult").appendTo('.record');

                              $(".record").append("<hr />");
                          });
                          //hide loading div when the data was got
                          $(".loading").hide();
                      },
                      error: function (msg) {
                          $(".record").html(msg.d);
                      }

                  });

              }
              else {
                  $(".divResult").hide(); //hide div that contains result when the input text is empty
                  $(".record").html(""); //also loading text when the input text is empty
              }
          }

</script>

 
</body>
 
</html>