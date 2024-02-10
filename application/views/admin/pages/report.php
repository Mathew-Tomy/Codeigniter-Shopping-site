

   
        <!-- end: Favicon -->




<!-- start: Content -->
<div id="content" class="span10">


    <ul class="breadcrumb">
        <li>
            <i class="icon-home"></i>
            <a href="<?php echo base_url('dashoard')?>">Home</a> 
            <i class="icon-angle-right"></i>
        </li>
        <li><a href="#">Dashboard</a></li>
    </ul>

   	

	
   
    <div class="row-fluid">	

      

        <a class="quick-button metro green span3">
            <i class="icon-barcode"></i>
            <h1><?php $query = $this->db->query('SELECT * FROM tbl_product'); echo $query->num_rows();?></h1>
            <h4>Total Products</h4>
        </a>

        <?php 
                        $i=0;
                           
                               
                            
                        ?>
                      <div class="box-content">
                <table class="table table-striped table-bordered bootstrap-datatable datatable" id="maintable">
                    <thead>
                        <tr>
                            <th>Sr.</th>
                            <th>Product Name</th>
                            <th>Total Quantity</th>
                            <th>Total Purchased</th>
                            <th>Total balance</th>
                          
                        </tr>
                    </thead>   
                    <tbody>
                        <?php 
                        $i=0;
                        foreach($reports as $total_report){
                            $id=$total_report->product_id;
                           $quantity=$total_report->product_quantity;
                           echo $id;
                            $sql=$this->db->query("select * from tbl_order_details where order_id='$id' ");
                          
    $count=$sql->num_rows();

                            
                        ?>
                        <tr>
                            <td><?php echo $i;?></td>
                            <td class="center"><?php echo $total_report->product_title;?></td>
                            <td class="center"><?php echo $total_report->product_quantity;?></td>

                            <td class="center"><?php echo $count; ?></td>
                            <td class="center"><?php echo $quantity-$count; ?></td>
                                
                        </tr>
                            <?php }?>
                    </tbody>
                </table>            
            </div>
        </div><!--/span-->

    </div><!--/row-->

        <?php  ?>


</div><!--/.fluid-container-->

<!-- end: Content -->

<script>

$(document).ready(function() {

    $('#maintable').DataTable(

        {

            responsive: true,

  

            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],     // page length options

 

            "dom": 'Bfrtip',

            "buttons": ['excel','pageLength'],    // adds the excel button

          } );

} );

</script>