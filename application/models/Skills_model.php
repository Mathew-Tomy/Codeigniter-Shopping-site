<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Skills_model extends CI_Model {

  public function getUsers($postData)
  {
      $response = array();

      $this->db->select('*');

      if($postData['search'] )
      {
        $this->db->from('tbl_product');
          $this->db->where("product_title like '%".$postData['search']."%' ");
          //$result = $this->db->get('tbl_product')->result();
          $result = $this->db->get();
          
          foreach($result as $row )
          {
              $response[] = array("label"=>$row->product_title);
          }
      }

      return $response;
  }
  public function get_all_product()
  {
      $this->db->select('*');
      $this->db->from('tbl_product');
      $this->db->join('tbl_category', 'tbl_category.id=tbl_product.product_category');
      $this->db->join('tbl_brand', 'tbl_brand.brand_id=tbl_product.product_brand');
      $this->db->order_by('tbl_product.product_id', 'DESC');
      $this->db->where('tbl_product.publication_status', 1);
      $info = $this->db->get();
      return $info->result();
  }
  function search($term)
  {   
    $this->db->select('*');
    $this->db->from('tbl_product');
    $this->db->join('tbl_category', 'tbl_category.id=tbl_product.product_category');
    $this->db->join('tbl_brand', 'tbl_brand.brand_id=tbl_product.product_brand');
    $this->db->join('tbl_user', 'tbl_user.user_id=tbl_product.product_author');
    $this->db->order_by('tbl_product.product_id', 'DESC');
    $this->db->where('tbl_product.publication_status', 1);
    $this->db->like('tbl_product.product_title', $term, 'both');
    $this->db->or_like('tbl_product.product_short_description', $term, 'both');
    $this->db->or_like('tbl_product.product_long_description', $term, 'both');
    $this->db->or_like('tbl_category.category_name', $term, 'both');
    $this->db->or_like('tbl_brand.brand_name', $term, 'both');
    $info = $this->db->get();
    return $info->result();
}
}