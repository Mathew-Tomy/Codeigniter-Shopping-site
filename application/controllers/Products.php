<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Products extends CI_Controller
{

    public function index()
    {
        $this->load->view('admin/pages/login');
    }

    public function add_products()
    {
        $data= array();
        $this->form_validation->set_rules('product_title', 'User Email', 'required|valid_email');
        $this->form_validation->set_rules('product_short_description', 'User Password', 'required');
        $this->form_validation->set_rules('product_long_description', 'User Email', 'required|valid_email');
        $this->form_validation->set_rules('uproduct_short_description', 'User Password', 'required');
        $this->form_validation->set_rules('product_image', 'User Email', 'required|valid_email');
        $this->form_validation->set_rules('product_price', 'User Password', 'required');
        $this->form_validation->set_rules('product_quantity', 'User Email', 'required|valid_email');
        $this->form_validation->set_rules('product_brand', 'User Password', 'required');
        $this->form_validation->set_rules('product_feature', 'User Password', 'required');

        $this->load->view('admin/master');

    }

}