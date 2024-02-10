<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->get_user();
    }
    public function index()
    {
        $data                = array();
        $data['maincontent'] = $this->load->view('admin/pages/home', '', true);
        $this->load->view('admin/master', $data);
    }
    public function view_report()
    {
        $data                = array();
        $data['reports']   = $this->report_model->getall_report();
      
        
        $data['maincontent'] = $this->load->view('admin/pages/report', $data, true);
        $this->load->view('admin/masterreport', $data);
    }


    public function get_user()
    {

        $email = $this->session->userdata('user_email');
        $name  = $this->session->userdata('user_name');
        $id    = $this->session->userdata('user_id');

        if ($email == false) {
            redirect('admin');
        }

    }

    public function logout()
    {

        $email = $this->session->unset_userdata('user_email');
        $name  = $this->session->unset_userdata('user_name');
        $id    = $this->session->unset_userdata('user_id');

        if ($email == false) {
            redirect('admin');
        }

    }

}
