<?php

class Report_Model extends CI_Model
{

   

    public function getall_report()
    {
        $this->db->select('*');
        $this->db->from('tbl_product');
        //$this->db->join('tbl_order_details', 'tbl_order_details.product_id=tbl_product.product_id');
     
        $result = $this->db->get();
        return $result->result();

        
    }

    

}
