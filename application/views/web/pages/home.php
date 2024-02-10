<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<!-- <script type="text/javascript" src="<?php echo base_url() ?>assets/web/js/scripts.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.js">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <br><br><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <div class="search_boxs">
                      <input type="text" name="searchs" id="searchs" class="search-box_search_input Location " placeholder="search products" required="required" type="search" />
                     
                     
                    
                </div>
<div class="displayz" id="suggestions">
<div class="main" >
    <div class="content">
        <div class="content_top">
            <div class="heading">
                <h3>Feature Products</h3>
            </div>
            <div class="clear"></div>
        </div>
        <div class="section group">

            <?php
            foreach ($all_featured_products as $single_feature_product) {
                ?>
                <div class="grid_1_of_4 images_1_of_4">
                    <a href="<?php echo base_url('single/' . $single_feature_product->product_id); ?>"><img style="width:250px;height:250px" src="<?php echo base_url('uploads/' . $single_feature_product->product_image) ?>" alt="" /></a>
                    <h2><?php echo $single_feature_product->product_title; ?> </h2>
                    <p><?php echo word_limiter($single_feature_product->product_short_description, 10) ?></p>
                    <p><span class="price">Rs.<?php echo $this->cart->format_number($single_feature_product->product_price); ?></span></p>
                    <div class="button"><span><a href="<?php echo base_url('single/' . $single_feature_product->product_id); ?>" class="details">Details</a></span></div>
                    <div class="button"><span><a href="<?php echo base_url('single/'.$single_feature_product->product_id);?>">Add to cart</a></span></div>
                </div>
               
            <?php } ?> 
         
                     
                    
               
           
        </div>
        <br><br>
        <div class="content_bottom">
            <div class="heading">
                <h3>New Products</h3>
            </div>
            <div class="clear"></div>
        </div>
        <div class="section group">
            <?php foreach ($all_new_products as $single_new_product) { ?>
                <div class="grid_1_of_4 images_1_of_4">
                    <a href="<?php echo base_url('single/' . $single_new_product->product_id); ?>"><img style="width:250px;height:250px" src="<?php echo base_url('uploads/' . $single_new_product->product_image) ?>" alt="" /></a>
                    <h2><?php echo $single_new_product->product_title; ?></h2>
                    <p><?php echo word_limiter($single_new_product->product_short_description, 10) ?></p>
                    <p><span class="price">Rs.<?php echo $this->cart->format_number($single_new_product->product_price); ?></span></p>
                    <div class="button"><span><a href="<?php echo base_url('single/' . $single_new_product->product_id); ?>" class="btn btn-primary">Details</a></span>
                                    <div class="button" class="btn btn-info"><span><a href="<?php echo base_url('single/'.$single_new_product->product_id);?>">Add to cart</a></span></div>
                </div>
                </div>
            <?php } ?>
        </div>
    </div>
</div>
            </div>

            <script>
function fill(Value) {
   //Assigning value to "search" div in "search.php" file.
   $('#searchs').val(Value);
   //Hiding "display" div in "search.php" file.
   $('#result').hide();
}
$(document).ready(function() {
   //On pressing a key on "Search box" in "search.php" file. This function will be called.
   $("#searchs").keyup(function() {
       //Assigning search box value to javascript variable named as "name".
       var name = $('#searchs').val();
       //Validating, if "name" is empty.
       if (name == "") {
           //Assigning empty value to "display" div in "search.php" file.
          
           
           $("#result").html("");
           $('#suggestions').show();
       }
       //If name is not empty.
       else {
           //AJAX is called.
           $.ajax({
               //AJAX type is "Post".
               type: "GET",
               //Data will be sent to "ajax.php".
               url: "<?php echo base_url(); ?>searchs",
               //Data, that will be sent to "ajax.php".
               data: {
                   //Assigning value of "name" into "search" variable.
                   searchs: name
               },
               //If result found, this funtion will be called.
               success: function(html) {
                   //Assigning result to "display" div in "search.php" file.
                   $("#result").html(html).show();
                   $('#suggestions').html(html).hide();
               }
           });
       }
   });
});
</script>

<div class="mainz" id="result">


</div>
<style>
.content_pagi{padding:20px;border: 1px solid #EBE8E8;border-radius: 3px;}
.pagination{}
.pagination ul{}
.pagination ul li{float: left}
.pagination ul li a{color: #000;padding: 7px 12px;border: 1px solid #ddd;font-size: 18px;}
.pagination ul li a:hover{background:#ddd;}
.pagiactive a{background:#ddd;}

</style>