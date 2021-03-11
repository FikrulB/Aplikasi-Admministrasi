// Dom7
var $ = Dom7;

// Init App
var app = new Framework7({
  id: 'lynne',
  name: 'listanto',
  root: '#app',
  theme: 'md',
  routes: routes,
  view: {
    iosDynamicNavbar: false,
  },
});

var mainView = app.views.create('.view-main', {
  url: '/',
  iosDynamicNavbar: false,
})

// button sukses refresh halaman
var sukses_button = app.dialog.create({
  title: '<img src="./img/ofc.png" width="50" class="logo_dialog">',
  text: '<div class="text_dialog">Sukses!</div>',
  buttons: [
    {
      text: '<a class="button button-fill btn_dialog">OK</a>',
      color: '#ff2d55'
    }
  ],
  verticalButtons: true,
  onClick: function () {
    app.views.main.router.refreshPage();
  }
});

// button gagal
var gagal_button = app.dialog.create({
  title: '<img src="./img/ofc.png" width="50" class="logo_dialog">',
  text: '<div class="text_dialog">Gagal!</div>',
  buttons: [
    {
      text: '<a class="button button-fill btn_dialog">OK</a>',
      color: '#ff2d55'
    }
  ],
  verticalButtons: true,
  onClick: function () {
    app.views.main.router.refreshPage();
  }
});

function convertToRupiah(number) {
  
  if (number) {
    
    var rupiah = "";
    
    var numberrev = number
    
    .toString()
    
    .split("")
    
    .reverse()
    
    .join("");
    
    for (var i = 0; i < numberrev.length; i++)
    
    if (i % 3 == 0) rupiah += numberrev.substr(i, 3) + ".";
    
    return (
      
      "Rp " +
      
      rupiah
      
      .split("", rupiah.length - 1)
      
      .reverse()
      
      .join("")
      
      );
      
    } else {
      
      return number;
      
    }
    
  }
  
  // List pencarian Barang
  $(document).on('page:init', function (e) {
    var searchbar = app.searchbar.create({
      el: '.searchbar',
      searchContainer: '.list_barang',
      searchIn: '.item-title',
      on: {
        search(sb, query, previousQuery) {
          console.log(query, previousQuery);
        }
      }
    });
  })
  
  //==================================================================================================//
  //============================    BARANG    ============================//
  //==================================================================================================//
  
  
  // ini tampilan data barang
  $(document).on('page:init', function (e) {
    app.request.json("http://localhost/ws/index.php/barang/barang", function(data){
    var buatDaftar = "";
    for(i=0; i<data.length; i++){
      buatDaftar +=
      `
      <li>
      <a href="#" class="item-link item-content">
      <div class="item-media"><img src="img/bisnis/stok_brg.png" width="100"></div>
      <div class="item-inner">
      <div class="item-title">`+data[i].nama_brg+`</div>
      <div class="item-subtitle">`+data[i].kode_brg+`</div>
      <div class="item-text">`+data[i].hbeli_brg+`</div>
      </div>
      <div class="item-after"><span class="badge">`+data[i].stok_brg+`</span></div>
      </a>
      </li>
      `;
      $(".ul_barang").html(buatDaftar);
    }
  });
})

// Tampilan Chip di Barang
$(document).on('page:init', function (e) {
  app.request.json("http://localhost/ws/index.php/barang/kategori", function(data){
  buatChip = `
  <div class="chip chip-outline color-pink">
  <div class="chip-label" id="all_produk">All Produk</div>
  </div>
  `;
  for(i=0; i<data.length; i++){
    buatChip +=
    `
    <div class="chip chip-outline color-pink">
    <div class="chip-label" id="cip" data-chip=`+data[i].kategori_brg+`>`+data[i].kategori_brg+`</div>
    </div>
    `;
    $(".top_barang").html(buatChip);
  }
})
})



// Tampilan data barang berdasarkan chip all produk
$(document).on('click', '#all_produk', function (e) {
  app.request.json("http://localhost/ws/index.php/barang/barang", function(data){
  buatTampil = "";
  for(i=0; i<data.length; i++){
    
    buatTampil +=
    `
    <li>
    <a href="#" class="item-link item-content">
    <div class="item-media"><img src="img/bisnis/stok_brg.png" width="100"></div>
    <div class="item-inner">
    <div class="item-title">`+data[i].nama_brg+`</div>
    <div class="item-subtitle">`+data[i].kode_brg+`</div>
    <div class="item-text">`+data[i].hbeli_brg+`</div>
    </div>
    <div class="item-after"><span class="badge">`+data[i].stok_brg+`</span></div>
    </a>
    </li>
    `;
    $(".ul_barang").html(buatTampil);
  }
})
})


// Tampilan data barang berdasarkan chip kategori
$(document).on('click', '#cip', function (e) {
  var kd_chip = $(this).data("chip");
  app.request.json("http://localhost/ws/index.php/barang/cariKategoriBarang?kategori_brg="+kd_chip, function(data){
  buatTampil = "";
  if (data == 0) {
    buatTampil +=
    `
    <div class="kosong">Belum Ada Data Barang</div>
    `;
    $(".ul_barang").html(buatTampil);
  }else{
    for(i=0; i<data.length; i++){
      
      buatTampil +=
      `
      <li>
      <a href="#" class="item-link item-content">
      <div class="item-media"><img src="img/bisnis/stok_brg.png" width="100"></div>
      <div class="item-inner">
      <div class="item-title">`+data[i].nama_brg+`</div>
      <div class="item-subtitle">`+data[i].kode_brg+`</div>
      <div class="item-text">`+data[i].hbeli_brg+`</div>
      </div>
      <div class="item-after"><span class="badge">`+data[i].stok_brg+`</span></div>
      </a>
      </li>
      `;
      $(".ul_barang").html(buatTampil);
    }
  }
})
})


// Tambah Barang
$(document).on('page:init', function (e) {
  $(".simpan_barang").click(function () {
    var nama = $('#nama_brg').val();
    var kode = $('#kode_brg').val();
    var kategori = $('#kategori_brg').val();
    var stok = $('#stok_brg').val();
    var hbeli = $('#hbeli_brg').val();
    var hjual = $('#hjual_brg').val();
    app.request({
      url: "http://localhost/ws/index.php/barang/tambahBarang",
      type: "POST",
      data : {
        "nama_brg": nama,
        "kode_brg": kode,
        "stok_brg": stok,
        "kategori_brg": kategori,
        "hbeli_brg": hbeli,
        "hjual_brg": hjual
      },
      success: function(data){
        app.dialog.create({
          title: '<img src="./img/ofc.png" width="50" class="logo_dialog">',
          text: '<div class="text_dialog">Sukses!</div>',
          buttons: [
            {
              text: '<a class="button button-fill btn_dialog">OK</a>',
              color: '#ff2d55'
            }
          ],
          verticalButtons: true,
          onClick: function () {
            app.views.main.router.navigate('/barang/');
          }
        }).open();
      }
    });
  })
})

//==================================================================================================//
//============================    TRANNSAKSI    ============================//
//==================================================================================================//

// ini tampilan data barang di transaksi
$(document).on('page:init', function (e) {
  app.request.json("http://localhost/ws/index.php/barang/barang", function(data){
  var buatDaftar = "";
  console.log(data);
  for(i=0; i<data.length; i++){
    var hjual = convertToRupiah(data[i].hjual_brg);
    buatDaftar +=
    `
    <li>
    <a href="#" id="transaksi_li" data-barang="`+data[i].id_brg+`" class="item-link item-content">
    <div class="item-media"><img src="https://cdn.framework7.io/placeholder/people-160x160-1.jpg"
    width="50" /></div>
    <div class="item-inner">
    <div class="item-title">`+data[i].nama_brg+`</div>
    <div class="item-subtitle">`+hjual+`</div>
    </div>
    <div id="item-after`+data[i].id_brg+`" class="item-after"></div>
    </a>
    </li>
    `;
    $(".ul_transaksi").html(buatDaftar);
  }
});
})

$(document).on('click', '#transaksi_li', function (e) {
  var id = $(this).attr('data-barang');
  var itemAfter = $('#item-after'+id);
  itemAfter.addClass('active');
  app.request.json("http://localhost/ws/index.php/barang/cariId?id_brg="+id, function(data){
  var id_brg = data[0].id_brg;
  var nama_brg = data[0].nama_brg;
  var kode_brg = data[0].kode_brg;
  var harga_brg = data[0].hjual_brg;
  var jumlah = 1;
  var sub = parseInt(harga_brg) * jumlah;
  app.request.json("http://localhost/ws/index.php/barang/cariIdOrderDetail?id_brg="+id_brg, function(data){
  if (data.length !== 0) {
    var jml = parseInt(data[0].jml_brg) + 1;
    var subTotal = jml * parseInt(data[0].harga_brg);
    itemAfter.removeClass('active');
    app.request({
      url: "http://localhost/ws/index.php/barang/updateOrderDetail",
      type: "PUT",
      data: {
        "id_brg": id_brg,
        "jml_brg": jml,
        "sub_total": subTotal
      }
    });
  }else{
    itemAfter.removeClass('active');
    app.request({
      url: "http://localhost/ws/index.php/barang/tambahOrderDetail",
      type: "POST",
      data : {
        'id_brg': id_brg,
        'nama_brg': nama_brg,
        'kode_brg' : kode_brg,
        'harga_brg': harga_brg,
        'jml_brg': jumlah,
        'sub_total': sub,
      }
    });
    
  }
});
});
})

// Button Lanjut di Transaksi
$(document).on('click', '#btnTransaksi', function (e) {
  app.request.json("http://localhost/ws/index.php/barang/orderDetail", function(data){
  var database = data.length;
  if (database > 0) {
    app.views.main.router.navigate('/keranjang/');
  }else{
    app.dialog.create({
      title: '<img src="./img/ofc.png" width="50" class="logo_dialog">',
      text: '<div class="text_dialog">Belum ada barang, silahkan pilih barang!</div>',
      buttons: [
        {
          text: '<a class="button button-fill btn_dialog">OK</a>',
          color: '#ff2d55'
        }
      ],
      verticalButtons: true,
    }).open();
  }
});

})


//==================================================================================================//
//============================    KERANJANG    ============================//
//==================================================================================================//

// Tampilan Keranjang
$(document).on('page:init','.page[data-name="keranjang"]', function (e) {
  app.request.json("http://localhost/ws/index.php/barang/orderDetail", function(data){
  var buatDetail = "";
  var jml_krjg = 0;
  var biaya_krjg  = 0;
  for(i=0; i<data.length; i++){
    var harga = convertToRupiah(data[i].harga_brg);
    var sub_total = convertToRupiah(data[i].sub_total);
    buatDetail +=
    `
    <li>
    <a href="#" id="edit_orderdetail" data-order-detail="`+data[i].id_brg+`" class="item-link item-content">
    <div class="item-media"><img src="https://cdn.framework7.io/placeholder/people-160x160-1.jpg"
    width="50" /></div>
    <div class="item-inner">
    <div class="item-title">`+data[i].nama_brg+`</div>
    <div class="item-subtitle">`+harga+` x `+data[i].jml_brg+`</div>
    </div>
    <div class="item-after">
    <i class="fas fa-pencil-alt fa-1x"></i>
    <div class="sub_total">`+sub_total+`</div>
    </div>
    </a>
    </li>
    `;
    $(".ul_orderdetail").html(buatDetail);
    jml_krjg+=parseInt(data[i].jml_brg);
    biaya_krjg+=parseInt(data[i].sub_total);
    $(".jumlah_keranjang").html(jml_krjg + " Barang");
    $(".biaya_keranjang").html(convertToRupiah(biaya_krjg));
  }
});
})

// Fungsi klik pada barang yang di order detail
$(document).on('click', '#edit_orderdetail', function (e) {
  var id_detail = $(this).attr('data-order-detail');
  app.request.json("http://localhost/ws/index.php/barang/cariIdOrderDetail?id_brg="+id_detail, function(data){
  console.log(data);
  app.dialog.create({
    title: data[0].nama_brg,
    text: `
    <div class="list no-hairlines-md">
    <ul>
    <li class="item-content item-input item-input-outline">
    <div class="item-inner">
    <div class="item-input-wrap">
    <input id="valBarang" type="number" value="`+data[0].jml_brg+`" autocomplete="off"/>
    </div>
    </div>
    </li>
    </ul>
    </div>
    `,
    buttons: [
      {
        text: '<a class="button button-fill" style="color:white;">Hapus</a>',
        cssClass: 'btn',
        color: 'blue',
        onClick: function(){
          app.request({
            url: "http://localhost/ws/index.php/barang/hapusOrderDetail",
            type: "POST",
            data : {
              'id_brg': data[0].id_brg
            },
            cache: false,
            success: function (data) {
              app.request.json("http://localhost/ws/index.php/barang/orderDetail", function(data){
              if (data.length !== 0) {
                var buatDetail = "";
                var jml_krjg = 0;
                var biaya_krjg  = 0;
                for(i=0; i<data.length; i++){
                  var hg = convertToRupiah(data[i].harga_brg);
                  var sub_total = convertToRupiah(data[i].sub_total);
                  buatDetail +=
                  `
                  <li>
                  <a href="#" id="edit_orderdetail" data-order-detail="`+data[i].id_brg+`" class="item-link item-content">
                  <div class="item-media"><img src="https://cdn.framework7.io/placeholder/people-160x160-1.jpg"
                  width="50" /></div>
                  <div class="item-inner">
                  <div class="item-title">`+data[i].nama_brg+`</div>
                  <div class="item-subtitle">`+hg+` x `+data[i].jml_brg+`</div>
                  </div>
                  <div class="item-after">
                  <i class="fas fa-pencil-alt fa-1x"></i>
                  <div class="sub_total">`+sub_total+`</div>
                  </div>
                  </a>
                  </li>
                  `;
                  $(".ul_orderdetail").html(buatDetail);
                  jml_krjg+=parseInt(data[i].jml_brg);
                  biaya_krjg+=parseInt(data[i].sub_total);
                  $(".jumlah_keranjang").html(jml_krjg + " Barang");
                  $(".biaya_keranjang").html(convertToRupiah(biaya_krjg));
                }
              }else{
                app.views.main.router.back('/transaksi/', {force: true});
              }
            });
          }
        });
      }
    },
    {
      text:'<a class="button button-fill" style="color:white;">Simpan</a>',
      cssClass: 'btn',
      color: 'green',
      onClick: function(){
        var jml = $('#valBarang').val();
        var subtot = parseInt(data[0].harga_brg) * jml;
        app.request({
          url: "http://localhost/ws/index.php/barang/updateOrderDetail",
          type: "PUT",
          data : {
            'id_brg': data[0].id_brg,
            'nama_brg': data[0].nama_brg,
            'kode_brg':data[0].kode_brg,
            'harga_brg':data[0].harga_brg,
            'jml_brg': jml,
            'sub_total': subtot,
          },
          cache: false,
          success: function (data) {
            app.request.json("http://localhost/ws/index.php/barang/orderDetail", function(data){
            var buatDetail = "";
            var biaya_krjg = 0;
            var jml_krjg = 0;
            for(i=0; i<data.length; i++){
              var hg = convertToRupiah(data[i].harga_brg);
              var sub_total = convertToRupiah(data[i].sub_total);
              buatDetail +=
              `
              <li>
              <a href="#" id="edit_orderdetail" data-order-detail="`+data[i].id_brg+`" class="item-link item-content">
              <div class="item-media"><img src="https://cdn.framework7.io/placeholder/people-160x160-1.jpg"
              width="50" /></div>
              <div class="item-inner">
              <div class="item-title">`+data[i].nama_brg+`</div>
              <div class="item-subtitle">`+hg+` x `+data[i].jml_brg+`</div>
              </div>
              <div class="item-after">
              <i class="fas fa-pencil-alt fa-1x"></i>
              <div class="sub_total">`+sub_total+`</div>
              </div>
              </a>
              </li>
              `;
              $(".ul_orderdetail").html(buatDetail);
              jml_krjg+=parseInt(data[i].jml_brg);
              biaya_krjg+=parseInt(data[i].sub_total);
              $(".jumlah_keranjang").html(jml_krjg + " Barang");
              $(".biaya_keranjang").html(convertToRupiah(biaya_krjg));
            }
          });         
        },
        error: function(e){
          console.log(e);
        }
      });
    }
  },
  {
    text:'<a class="button button-fill" style="color:white;">Cancel</a>',
    cssClass: 'btn',
    color: 'red',
    onClick: function(){
      console.log("Cancel");
    }
  },
],

}).open();
});  
})

// Hapus Keranjang ketika kembali dari transaksi
$(document).on('click', '.hapus-keranjang', function (e) {
  app.request.json("http://localhost/ws/index.php/barang/orderDetail", function(data){
  if (data.length !== 0) {
    app.dialog.create({
      title: '<img src="./img/ofc.png" width="50" class="logo_dialog">',
      text: '<div class="text_dialog">Keluar akan hapus data di keranjang, yakin?</div>',
      buttons: [
        {
          text: '<a class="button button-fill btn_trans">OK</a>',
          color: '#ff2d55',
          onClick: function () {
            app.request.json("http://localhost/ws/index.php/barang/orderDetail", function(data){
            for (var i=0; i<data.length; i++) {
              var id_all = data[i].id_brg;
              app.request({
                url: "http://localhost/ws/index.php/barang/hapusOrderDetail",
                type: "POST",
                data : {
                  'id_brg': id_all
                },
                cache: false,
                success: function (data) {
                  app.views.main.router.back('/', {force: true});
                }
              });
            }
          });
        },
      },
      {
        text: '<a class="button button-fill btn_trans">Cancel</a>',
        color: '#ff2d55'
      },
    ],
  }).open();
}else{
  app.views.main.router.back('/', {force: true});
}
});
})


//==================================================================================================//
//============================    PEMBAYARAN    ============================//
//==================================================================================================//

// Tampilan di pembayaran
$(document).on('page:init','.page[data-name="pembayaran"]', function (e) {
  // Total Bayar
  app.request.json("http://localhost/ws/index.php/barang/orderDetail", function(data){
  var tot = 0;
  var biaya_krjg = 0; 
  for (i=0; i < data.length; i++) {
    biaya_krjg+=parseInt(data[i].sub_total);
    $(".angka_total").html(convertToRupiah(biaya_krjg));
    
    tot+=parseInt(data[i].jml_brg);
  }
  $(document).on('click','.btnBayar', function (e) {
    if ($('.tombol').hasClass("active")) {
      var text = $('.active').text();
    }else{
      var text = "belum";
    }
    var bayar = $('#bayar').val();
    var caan = $('#catatan').val();
    var kas = $('.setorKe').val();
    
    app.request({
      url: "http://localhost/ws/index.php/barang/tambahTransaksi",
      type: "POST",
      data : {
        'total_biaya' : biaya_krjg,
        'jenis_bayar' : text,
        'setor_ke' : kas,
        'jml_bayar' : bayar,
        'catatan' : caan
      },
      cache: false,
      success: function (data) {
        alert("sukses bos");
      }
    });
  });
});


// Pembayaran via
$('.tombol').click(function () {
  $(".tombol").removeClass("active");
  $(this).addClass("active");
});

// Setor Ke
app.request.json("http://localhost/ws/index.php/barang/kas", function(data){
var kas = "";
for (i=0; i < data.length; i++) {
  kas += `
  <option value="`+data[i].nama_kas+`">`+data[i].nama_kas+`</option>
  `;
  $('.setorKe').html(kas);
}
});
})


//==================================================================================================//
//============================    KAS / BANK    ============================//
//==================================================================================================//

// Tampilan Kas / Bank
$(document).on('page:init','.page[data-name="kas"]', function (e) {
  app.request.json("http://localhost/ws/index.php/barang/kas", function(data){
  var kas = "";
  var saldo = convertToRupiah(data[0].saldo_kas);
  for (i=0; i < data.length; i++) {
    kas += `
    <li>
    <a href="#" class="item-link item-content">
    <div class="item-inner">
    <div class="item-title">`+data[i].nama_kas+`</div>
    <div class="item-after">`+saldo+`</div>
    </div>
    </a>
    </li>
    `;
    $('.ul_kas').html(kas);
  }
});
})


//==================================================================================================//
//============================    KATEGORI    ============================//
//==================================================================================================//


// ini button simpan di kategori
$(document).on('page:init', function (e) {
  $(".btn_kategori_brg").click(function () {
    var kategori = $("#kate").val();
    if (kategori !== "") {
      app.request({
        url: "http://localhost/ws/index.php/barang/simpanKategori",
        type: "POST",
        data : {
          "kategori_brg": kategori
        },
        success: function(data){
          sukses_button.open();
        }
      });
    }else{
      gagal_button.open();
    }
  })
})

// tampilan kategori barang
$(document).on('page:init', function (e) {
  app.request.json("http://localhost/ws/index.php/barang/kategori", function(data){
  buatKategori = "<li>";
  for(i=0; i<data.length; i++){
    buatKategori +=
    `
    <li>
    <div class="item-content">
    <div class="item-inner">
    <div class="item-title">`+data[i].kategori_brg+`</div>
    <div class="item-after">
    <i class="fas fa-pencil-alt fa-1x"></i>
    </div>
    </div>
    </div>
    </li>
    `;
    $("#isiKategori").html(buatKategori);
  }
})
})

// untuk hapus kategori
$(document).on('click', '#hapusKategori', function (e) {
  var kategori = $(this).data("kategori");
  app.request({
    url: "http://localhost/ws/index.php/barang/hapusKategori",
    type: "POST",
    data : {
      kategori: kategori
    },
    success: function(data){
      app.dialog.alert("Naise");
      app.request.json("http://localhost/ws/index.php/barang/kategori", function(data){
      buatKategori = "<li>";
      for(i=0; i<data.length; i++){
        buatKategori +=
        `
        <li>
        <div class="item-content">
        <div class="item-inner">
        <div class="item-title">`+data[i].kategori+`</div>
        <div class="item-after" id="hapusKategori" data-kategori="`+data[i].kategori+`">
        <i class="icon f7-icons if-not-md">delete_forever</i>
        <i class="icon material-icons md-only">delete_forever</i>
        </div>
        </div>
        </div>
        </li>
        `;
        $("#isiKategori").html(buatKategori);
      }
    })
  }
});
});



//==================================================================================================//
//============================    PENGELUARAN    ============================//
//==================================================================================================//


// Tombol Sukses Membuat Kategori Pengeluaran
$(document).on('page:init', function (e) {
  $('.buat_kategori_pengeluaran').on('click', function () {
    app.dialog.prompt('Nama Kategori','Tambah Kategori', function (name) {
      app.dialog.create({
        title: '<img src="./img/ofc.png" width="50" class="logo_dialog">',
        text: '<div class="text_dialog">Sukses!</div>',
        buttons: [
          {
            text: '<a class="button button-fill btn_dialog">OK</a>',
            color: '#ff2d55'
          }
        ],
        verticalButtons: true,
      });
    }).open();
  });
})

// tabel pengeluaran
app.request.json("http://localhost/ws/index.php/barang/pengeluaran", function(data){
buat = "<tr>";
for(i=0; i<data.length; i++){
  buat +=
  `
  <td class="label-cell">`+data[i].tgl_pengeluaran+`</td>
  <td class="label-cell">`+data[i].ket_pengeluaran+`</td>
  <td class="numeric-cell">`+data[i].nilai_pengeluaran+`</td>
  </tr>
  `;
  $("#contoo").html(buat);
  
}
})

// Sukses membuat pengeluaran
$(document).on('page:init', function (e) {
  $('#sukses_pengeluaran').on('click', function () {
    sukses_button.open();
  });
})