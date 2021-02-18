var routes = [
  // Index page
  {
    path: '/',
    url: './index.html',
    name: 'home',
  },
  // Components
  {
    path: '/transaksi/',
    url: './pages/transaksi.html',
  },
  {
    path: '/laporan_pendapatan/',
    url: './pages/pendapatan.html',
  },
  {
    path: '/pembayaran/',
    url: './pages/pembayaran.html',
  },
  {
    path: '/laporan_pengeluaran/',
    url: './pages/pengeluaran.html',
  },
  {
    path: '/laporan_transaksi/',
    url: './pages/laporan_transaksi.html',
  },
  {
    path: '/keranjang/',
    url: './pages/keranjang.html',
  },
  {
    path: '/labarugi/',
    url: './pages/labarugi.html',
  },
  {
    path: '/laporan/',
    url: './pages/laporan.html',
  },
  {
    path: '/barang/',
    url: './pages/barang.html',
  },
  {
    path: '/tambah_barang/',
    url: './pages/tambah_barang.html',
  },
  {
    path: '/kategori/',
    url: './pages/kategori.html',
  },
  {
    path: '/pembelian/',
    url: './pages/pembelian.html',
  },
  


  // Default route (404 page). MUST BE THE LAST
  {
    path: '(.*)',
    url: './pages/404.html',
  },
];
