// Dom7
var $ = Dom7;

// Init App
var app = new Framework7({
  id: 'lynne',
  name: 'listanto',
  root: '#app',
  theme: 'md',
  routes: routes,
});

var mainView = app.views.create('.view-main', {
  url: '/'
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

//==================================================================================================//
      //============================    BARANG    ============================//
//==================================================================================================//

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

//==================================================================================================//
      //============================    TRANNSAKSI    ============================//
//==================================================================================================//

// ini tampilan data barang di transaksi
$(document).on('page:init', function (e) {
 app.request.json("http://localhost/ws/index.php/barang/barang", function(data){
  var buatDaftar = "";
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
    var harga_brg = data[0].hjual_brg;
    var jumlah = 1;
    var sub = parseInt(harga_brg) * 1;
    app.request({
      url: "http://localhost/ws/index.php/barang/tambahOrderDetail",
      type: "POST",
      data : {
        'id_brg': id_brg,
        'nama_brg': nama_brg,
        'harga_brg': harga_brg,
        'jml_brg': jumlah,
        'sub_total': sub,
      },
      cache: false,
      success: function (data) {

      }
    });
  });
  
})

// Tampilan Keranjang
$(document).on('page:init', function (e) {
  app.request.json("http://localhost/ws/index.php/barang/orderDetail", function(data){
    var buatDetail = "";
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
    }
  });
})

$(document).on('click', '#edit_orderdetail', function (e) {
  var id_detail = $(this).attr('data-order-detail');
  app.request.json("http://localhost/ws/index.php/barang/cariIdOrderDetail?id_brg="+id_detail, function(data){
    app.dialog.create({
      title: data[0].nama_brg,
      text: `
      <div class="list no-hairlines-md">
      <ul>
      <li class="item-content item-input item-input-outline">
      <div class="item-inner">
      <div class="item-input-wrap">
      <input id="val" type="number" value="`+data[0].jml_brg+`" autocomplete="off"/>
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
                var buatDetail = "";
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
          var jml = $('#val').val();
          var sub_total = parseInt(data[0].harga_brg) * jml;
          app.request({
            url: "http://localhost/ws/index.php/barang/updateOrderDetail",
            type: "PUT",
            data : {
              'id_brg': data[0].id_brg,
              'nama_brg': data[0].nama_brg,
              'harga_brg': data[0].harga_brg,
              'jml_brg': jml,
              'sub_total': sub_total,
            },
            cache: false,
            success: function (data) {
              app.request.json("http://localhost/ws/index.php/barang/orderDetail", function(data){
                var buatDetail = "";
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
                }
              });         
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
      }).open();
    });
  });
})

// tabel pengeluaran
app.request.json("http://localhost/ws/index.php/barang/pengeluaran", function(data){
  buat = "<tr>";
  console.log(data);
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

















// Event ketika salah satu list di Klik pada Pembelian barang
$(document).on('click', '#tmbhBadge', function (e) {
  var kode = $(this).data("beli");
  app.request.json("http://localhost/ws/index.php/barang/cariKode/kode_brg/"+kode, function(data){
    app.dialog.create({
      title: data[0].nama_brg,
      text: `<input type="number" placeholder="Jumlah" id="jmlBeli`+kode+`" autocomplete="off" autofocus>`,
      closeByBackdropClick: 'true',
      buttons: [
      {
        text: 'Batal',
        color: 'pink',
      },
      {
        text: 'Tambah',
        onClick: function () {
          var jml = $("#jmlBeli"+kode).val();
          var parse = parseInt(data[0].hbeli_brg);
          var jmlParse = jml * parse;
          var span = `<span class="badge color-pink" id="sampah">`+jml+`</span>`;
          var jmlHarga = `<font size="2">`+jml+` x `+data[0].hbeli_brg+` = `+jmlParse+`</font>`;
          if (jml > 0) {
            $("#badgeJml"+kode).html(span);
            $("#hargaBeli"+kode).html(jmlHarga);
          }
        },
        color: 'pink',
      },
      ],
    }).open();
  });
})
