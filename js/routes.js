var routes = [
  // Index page
  {
    path: '/',
    url: './index.html',
    name: 'home',
    options: {
      transition: 'f7-push',
    },
  },
  // Barang
  {
    path: '/barang/',
    url: './pages/barang/barang.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/kategori_barang/',
    url: './pages/barang/kategori_barang.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/tambah_barang/',
    url: './pages/barang/tambah_barang.html',
    options: {
      transition: 'f7-push',
    },
  },
  // Transaksi
  {
    path: '/transaksi/',
    url: './pages/transaksi/transaksi.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/keranjang/',
    url: './pages/transaksi/keranjang.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/pembayaran/',
    url: './pages/transaksi/pembayaran.html',
    options: {
      transition: 'f7-push',
    },
  },
  // Laporan
  {
    path: '/laporan_pendapatan/',
    url: './pages/laporan/laporan_pendapatan.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/laporan_pengeluaran/',
    url: './pages/laporan/laporan_pengeluaran.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/laporan_transaksi/',
    url: './pages/laporan/laporan_transaksi.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/labarugi/',
    url: './pages/laporan/labarugi.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/laporan/',
    url: './pages/laporan/laporan.html',
    options: {
      transition: 'f7-push',
    },
  },
  // Pembelian
  {
    path: '/pembelian/',
    url: './pages/pembelian/pembelian.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/pilih_barang/',
    url: './pages/pembelian/pilih_barang.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/next_pembelian/',
    url: './pages/pembelian/next_pembelian.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/done_pembelian/',
    url: './pages/pembelian/done_pembelian.html',
    options: {
      transition: 'f7-push',
    },
  },

  // Pengeluaran
  {
    path: '/kategori_pengeluaran/',
    url: './pages/pengeluaran/kategori_pengeluaran.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/pengeluaran/',
    url: './pages/pengeluaran/pengeluaran.html',
    options: {
      transition: 'f7-push',
    },
  },
  
  // Lain
  {
    path: '/kas/',
    url: './pages/lain/kas.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/sukses_pembayaran/',
    url: './pages/lain/sukses_pembayaran.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/retur_barang/',
    url: './pages/lain/retur_barang.html',
    options: {
      transition: 'f7-push',
    },
  },

  // Supplier
  {
    path: '/supplier/',
    url: './pages/supplier/supplier.html',
    options: {
      transition: 'f7-push',
    },
  },
  {
    path: '/tambah_supplier/',
    url: './pages/supplier/tambah_supplier.html',
    options: {
      transition: 'f7-push',
    },
  },
  

  // Default route (404 page). MUST BE THE LAST
  {
    path: '(.*)',
    url: './pages/404.html',
    options: {
      transition: 'f7-push',
    },
  },
  ];
