<?php 

require APPPATH . 'libraries/REST_Controller.php';
class Barang extends REST_Controller{
	function barang_get(){
		//Query
		//$sql = "SELECT * FROM buku a JOIN pengarang b ON a.pengarang=b.kode"; 

		//Query Builder
		$data = $this->db->
		select('barang.*')
		->from('barang')
		->get()->result_array();
		$this->response($data);
	}

	function kategori_get(){
		//Query
		//$sql = "SELECT * FROM buku a JOIN pengarang b ON a.pengarang=b.kode"; 

		//Query Builder
		$data = $this->db->
		select('kategori.*')
		->from('kategori')
		->get()->result_array();
		$this->response($data);
	}

	function pengeluaran_get(){
		//Query
		//$sql = "SELECT * FROM buku a JOIN pengarang b ON a.pengarang=b.kode"; 

		//Query Builder
		$data = $this->db->
		select('pengeluaran.*')
		->from('pengeluaran')
		->get()->result_array();
		$this->response($data);
	}

	function simpanKategori_post(){
		$data = $this->db->insert('kategori',$this->post());
		$this->response($data);
	}

	function hapusKategori_post(){
		$kategori = $this->post('kategori');
		$data = $this->db->where('kategori', $kategori)->delete('kategori');
		$this->response($data);
	}

	function cariKode_get(){
		$kode = $this->get('kode_brg');
		$data = $this->db->	
		select('barang.*')
		->from('barang')
		->where('barang.kode_brg',$kode)
		->get()->result_array();
		$this->response($data);
	}

}

?>