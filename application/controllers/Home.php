<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {



	public function index()
	{

		$this->load->view('home/index');
   		$this->load->view('common/header');
           $this->load->view('common/footer');
	}
    public function products(){
       // $this->load->model('products');
    }
}
