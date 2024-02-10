<!DOCTYPE HTML>
<head>
    <title>Store Website</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="<?php echo base_url() ?>assets/web/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="<?php echo base_url() ?>assets/web/css/menu.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="<?php echo base_url() ?>assets/web/js/jquerymain.js"></script>
    <script type="text/javascript" src="<?php echo base_url() ?>assets/web/js/jquery-1.7.2.min.js"></script> 
    <script type="text/javascript" src="<?php echo base_url() ?>assets/web/js/nav.js"></script>
    <script type="text/javascript" src="<?php echo base_url() ?>assets/web/js/move-top.js"></script>
    <script type="text/javascript" src="<?php echo base_url() ?>assets/web/js/easing.js"></script> 
    <script type="text/javascript" src="<?php echo base_url() ?>assets/web/js/nav-hover.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Monda' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Doppio+One' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" />
 
    <script src="jquery-ui/jquery/jquery.min.js"></script>

<!-- jQueryUI library -->
<link rel="stylesheet" href="jquery-ui/jquery-ui.css">
<script src="jquery-ui/jquery-ui.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style>
 .box
 {
  width:100%;
  max-width: 650px;
  margin:0 auto;
 }
 </style>


 <!-- Bootstrap Css -->


 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
    <script type="text/javascript">
        $(document).ready(function ($) {
            $('#dc_mega-menu-orange').dcMegaMenu({rowItems: '4', speed: 'fast', effect: 'fade'});
        });
    </script>
 
</head>
<body>

    <div class="wrap">
        <div class="header_top">
            <div class="logo">
              
            </div>
            <div class="header_top_right">
                <div class="search_box">
 
         
            <form method="get" action="<?php echo base_url('search')?>">
                        <input type="text" placeholder="Search for Products" name="search" id="user-input"  autocomplete="on">
                        <input type="submit" value="SEARCH">
                        				
           
                    </form>
         
                    <div id="result_div"></div>
                </div>

                <div class="row">
        <div class="col-md-3">

        </div>
        <!-- <div class="col-md-6">
        <input id="searchInput" placeholder="Enter member name..." autocomplete="on">
 
<input type="hidden" id="userID" name="userID" value=""/>
        </div> -->
        <div class="col-md-3">

        </div>
      </div>
    </div>
                <div class="shopping_cart">
                    <div class="cart">
                        <a href="<?php echo base_url('cart');?>" title="View my shopping cart" rel="nofollow">
                            <span class="cart_title">Cart</span>
                            <span class="no_product">(<?php echo $this->cart->total_items();?> Items)</span>
                        </a>
                    </div>
                </div>
                
        
                 
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="menu">
            <ul id="dc_mega-menu-orange" style="float:left" class="dc_mm-orange">
                <li class="<?php
                if ($this->uri->uri_string() == '') {
                    echo "active";
                }
                ?>"><a href="<?php echo base_url('/'); ?>">Home</a></li>
                <li class="<?php
                if ($this->uri->uri_string() == 'product') {
                    echo "active";
                }
                ?>"><a href="<?php echo base_url('/product'); ?>">Products</a> </li>
                    <?php if ($this->cart->total_items()) { ?>
                    <li class="<?php
                    if ($this->uri->uri_string() == 'cart') {
                        echo "active";
                    }
                    ?>"><a href="<?php echo base_url('/cart'); ?>">Cart</a></li>
                    <?php } ?>
              
                
                <?php if(!$this->session->userdata('customer_id')){?>
                
                <li class="<?php
                if ($this->uri->uri_string() == 'customer/login') {
                    echo "active";
                }
                ?>"><a href="<?php echo base_url('/customer/login'); ?>">Login</a> </li>
                <li class="<?php
                if ($this->uri->uri_string() == 'customer/register') {
                    echo "active";
                }
                ?>"><a href="<?php echo base_url('/customer/register'); ?>">Register</a> </li>
                
                <?php }?>
                
            </ul>
            <div class="clear"></div>
        </div>
        <style>
            .header{
                color:red;}
            </style>

<script>

    $("#user-input").autocomplete({
 source: function(request, response) {
   $.ajax({
     url: "<?php echo base_url(); ?>ajaxpro",
     data: request,
     dataType: "json",
     type: "GET",
     success: function(data) {
       response(data);
     }
   });
},
 minLength: 1,
 delay: 500
});
    </script>

<script>  
         $(function() {  
           $( "#searchInput" ).autocomplete({  
             source: function( request, response ) {  
              $.ajax({  
                url: "<?php echo base_url('ajaxpros'); ?>",
                dataType: "json",  
                data: {  
                    term: request.term  
                },  
                success: function( data ) {  
                    response( $.map( data.results, function( result ) {  
                        return {  
                            label: result.id + " - " + result.label,  
                            value: result.id,  
                            imgsrc: result.image  
                        }  
                    }));  
                }  
            });  
             }  
           }).data( "ui-autocomplete" )._renderItem = function( ul, item ) {  
               return $( "<li></li>" )  
                   .data( "item.autocomplete", item )  
                   .append( "<a>" + "<img style='width:25px;height:25px' src='" + item.imgsrc + "' /> " + item.label+ "</a>" )  
                   .appendTo( ul );  
           };  
         });  
      </script> 


<script>

</script>

</body>
</html>