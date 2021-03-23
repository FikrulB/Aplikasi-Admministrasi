<?php 
header('Access-Control-Allow-Origin: *');
require APPPATH . 'libraries/REST_Controller.php';
class Barang extends REST_Controller{
	function barang_get(){
		$data = $this->db->
		select('*')
		->from('barang')
		->get()->result_array();
		$this->response($data);
	}
	
	// Tambah Barang
	function tambahBarang_post(){
		$data = $this->db->insert('barang',$this->post());
		$this->response($data);
	}
	
	function kategoriBarang_get(){
		$kode = $this->get('kategori_brg');
		$data = $this->db->
		select('*')
		->from('kategori_barang')
		->get()->result_array();
		$this->response($data);
	}
	
	// Mencari barang berdasarkan kategori
	function cariKategoriBarang_get(){
		$kode = $this->get('kategori_brg');
		$data = $this->db->
		select('barang.*,kategori.kategori_brg')
		->from('barang')
		->join('kategori','kategori.kategori_brg=barang.kategori_brg')
		->where('kategori.kategori_brg',$kode)
		->get()->result_array();
		$this->response($data);
	}
	
	// Daftar Order Detail
	function orderDetail_get(){
		$data = $this->db->
		select('*')
		->from('order_detail')
		->get()->result_array();
		$this->response($data);
	}
	
	// Mencari order detail berdasarkan id barang
	function cariIdOrderDetail_get(){
		$kode = $this->get('id_brg');
		$data = $this->db->
		select('*')
		->from('order_detail')
		->where('order_detail.id_brg',$kode)
		->get()->result_array();
		$this->response($data);
	}
	
	// Tambah Order_detail
	function tambahOrderDetail_post(){
		$data = $this->db->insert('order_detail',$this->post());
		$this->response($data);
	}	
	
	// mengganti order detail sesuai id barang
	function updateOrderDetail_put(){
		$kode = $this->put('id_brg');
		$data = $this->db->where('id_brg', $kode)->update('order_detail',$this->put());
		$this->response($data);
	}	
	
	//menghapus order detail sesuai id barang
	function hapusOrderDetail_post(){
		$kode = $this->post('id_brg');
		$data = $this->db->where('id_brg', $kode)->delete('order_detail');
		$this->response($data);
	}
	
	// cari id untuk transaksi
	function cariId_get(){
		$kode = $this->get('id_brg');
		$data = $this->db->	
		select('barang.*')
		->from('barang')
		->where('barang.id_brg',$kode)
		->get()->result_array();
		$this->response($data);
	}
	
	// Tampilan kategori barang
	function kategori_get(){
		$data = $this->db->
		select('kategori_barang.*')
		->from('kategori_barang')
		->get()->result_array();
		$this->response($data);
	}
	
	// Tambah kategori barang
	function simpanKategori_post(){
		$data = $this->db->insert('kategori_barang',$this->post());
		$this->response($data);
	}
	
	// Hapus kategori barang sesuai ID
	function hapusKategori_post(){
		$id = $this->post('id_kategori_brg');
		$data = $this->db->where('id_kategori_brg', $id)->delete('kategori_barang');
		$this->response($data);
	}
	
	// Tambah di tabel transaksi
	function tambahTransaksi_post(){
		$hari = date('d');
		$bulan = date('m');
		$tahun = date('Y');
		$tgl = date('y' . 'm' . 'd');
		$thn = substr($tahun, 2, 2);
		$voice = getAutoNumber('transaksi','invoice','LN - ' . $bulan . $thn ,13);
		$tambah = array(
			'invoice' => $voice,
			'tgl_transaksi' => $tgl,
			'total_biaya' => $this->input->post('total_biaya'),
			'jenis_bayar' => $this->input->post('jenis_bayar'),
			'setor_ke' => $this->input->post('setor_ke'),
			'jml_bayar' => $this->input->post('jml_bayar'), 
			'catatan' => $this->input->post('catatan'),
		);
		$transaksi = $this->db->insert('transaksi', $tambah);
		
		// Jika berhasil maka menyimpan detail transaksi
		if($transaksi){
			$order = $this->db->get_where('order_detail', array('status' => 'order'));
			$query = $this->db->select('invoice')
			->from('transaksi')
			->order_by('invoice', 'desc')
			->limit(1)->get()->row_array();
			$invoice = $query['invoice'];
			
			foreach ($order->result_array() as $a){
				$send = array(
					'invoice' => $invoice,
					'id_brg' => $a['id_brg'],
					'nama_brg' => $a['nama_brg'],
					'kode_brg' => $a['kode_brg'],
					'harga_brg' => $a['harga_brg'],
					'jml_brg' => $a['jml_brg'],
					'sub_total' => $a['sub_total']
				);
				$detail = $this->db->insert('transaksi_detail', $send);
			}
			$this->response($invoice);
		}
	}
	
	// Tampil Cetak
	function tampilCetak_get(){
		$id = $this->get('invoice');
		$data = $this->db->
		select('*')
		->from('transaksi_detail')
		->join('transaksi','transaksi.invoice=transaksi_detail.invoice')
		->where('transaksi.invoice',$id)
		->get()->result_array();
		$this->response($data);
	}
	
	function laporanTrans_get(){
		$bulan = date('m');
		$tglBulan = $this->get("bulan");
		if ($tglBulan !== "") {
			$data = $this->db->
			select('*')
			->from('transaksi')
			->where('MONTH(tgl_transaksi)', $tglBulan)
			->get()->result_array();
			$this->response($data);	
		}else{
			$data = $this->db->
			select('*')
			->from('transaksi')
			->where('MONTH(tgl_transaksi)', $bulan)
			->get()->result_array();
			$this->response($data);	
		}
	}
	
	function laporanTransaksi_get(){
		$data = $this->db->
		select('*')
		->from('transaksi')
		->get()->result_array();
		$this->response($data);
	}
	
	// Pengurangan stok
	function kurangiStok_put(){
		$brg = $this->put('id_brg');
		$barang = $this->db->get_where('barang', array('id_brg' => $brg));
		foreach ($barang->result_array() as $b){
			$order = $this->db->get_where('order_detail', array('id_brg' => $b['id_brg']));
			foreach ($order->result_array() as $o){
				$jml = $o['jml_brg'];
				$stok = $b['stok_brg'];
				$update = array(
					'stok_brg' => $stok - $jml
				);
				$this->db->where('id_brg', $brg)->update('barang', $update);
			}
		}
	}
	
	
	// Tampilan Kas / Bank
	function kas_get(){
		$data = $this->db->
		select('kas.*')
		->from('kas')
		->get()->result_array();
		$this->response($data);
	}	
	
	// Tampilan pengeluaran
	function pengeluaran_get(){
		$data = $this->db->
		select('*')
		->from('pengeluaran')
		->get()->result_array();
		$this->response($data);
	}
	
}

?>