<?php 

require APPPATH . 'libraries/REST_Controller.php';
class Pengarang extends REST_Controller{
	function pengarang_get(){
		$data = $this->db->
		select('pengarang.*,buku.judul')
		->from('pengarang')
		->join('buku','pengarang.kode=buku.pengarang')
		->get()->result_array();
		$this->response($data);
	}

	function find_get(){
		$kode = $this->get('kode');
		$data = $this->db->
		select('pengarang.*,buku.judul')
		->from('pengarang')
		->join('buku','pengarang.kode=buku.pengarang')
		->where('pengarang.kode',$kode)
		->get()->result_array();
		$this->response($data);
	}
}

?>