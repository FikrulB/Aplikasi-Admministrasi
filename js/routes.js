var routes = [
  // Index page
  {
    path: '/',
    url: './index.html',
    name: 'home',
  },
  // Barang
  {
    path: '/barang/',
    url: './pages/barang/barang.html',
  },
  {
    path: '/kategori/',
    url: './pages/barang/kategori.html',
  },
  {
    path: '/tambah_barang/',
    url: './pages/barang/tambah_barang.html',
  },
  // Transaksi
  {
    path: '/transaksi/',
    url: './pages/transaksi/transaksi.html',
  },
  {
    path: '/keranjang/',
    url: './pages/transaksi/keranjang.html',
  },
  {
    path: '/pembayaran/',
    url: './pages/transaksi/pembayaran.html',
  },
  // Laporan
  {
    path: '/laporan_pendapatan/',
    url: './pages/laporan/pendapatan.html',
  },
  {
    path: '/laporan_pengeluaran/',
    url: './pages/laporan/laporan_pengeluaran.html',
  },
  {
    path: '/laporan_transaksi/',
    url: './pages/laporan/laporan_transaksi.html',
  },
  {
    path: '/labarugi/',
    url: './pages/laporan/labarugi.html',
  },
  {
    path: '/laporan/',
    url: './pages/laporan/laporan.html',
  },
  // Pembelian
  {
    path: '/pembelian/',
    url: './pages/pembelian/pembelian.html',
  },
  {
    path: '/pilih_barang/',
    url: './pages/pembelian/pilih_barang.html',
  },
  {
    path: '/next_pembelian/',
    url: './pages/pembelian/next_pembelian.html',
  },
  {
    path: '/done_pembelian/',
    url: './pages/pembelian/done_pembelian.html',
  },

  // Pengeluaran
  {
    path: '/kategori_pengeluaran/',
    url: './pages/pengeluaran/kategori_pengeluaran.html',
  },
  {
    path: '/pengeluaran/',
    url: './pages/pengeluaran/pengeluaran.html',
  },
  
  // Lain
  {
    path: '/kas/',
    url: './pages/lain/kas.html',
  },
  

  // Default route (404 page). MUST BE THE LAST
  {
    path: '(.*)',
    url: './pages/404.html',
  },
];
