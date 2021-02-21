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


// List pencarian
$(document).on('page:init', function (e) {
  var searchbar = app.searchbar.create({
    el: '.searchbar',
    searchContainer: '.list',
    searchIn: '.item-header',
    on: {
      search(sb, query, previousQuery) {
        console.log(query, previousQuery);
      }
    }
  });
})

// Suksues membuat pengeluaran
$(document).on('page:init', function (e) {
  $('#sukses_pengeluaran').on('click', function () {
    app.dialog.create({
        title: '<img src="./img/ofc.png" width="50" class="logo_kategori">',
        text: '<div class="text_kategori">Sukses!</div>',
        buttons: [
        {
          text: '<a class="button button-fill btn_kategori">OK</a>',
          color: '#ff2d55'
        }
        ],
        verticalButtons: true,
      }).open();
  });
})


// Tombol Sukses Membuat Kategori Pengeluaran
$(document).on('page:init', function (e) {
  $('.buat_kategori_pengeluaran').on('click', function () {
    app.dialog.prompt('Nama Kategori','Tambah Kategori', function (name) {
      app.dialog.create({
        title: '<img src="./img/ofc.png" width="50" class="logo_kategori">',
        text: '<div class="text_kategori">Sukses!</div>',
        buttons: [
        {
          text: '<a class="button button-fill btn_kategori">OK</a>',
          color: '#ff2d55'
        }
        ],
        verticalButtons: true,
      }).open();
    });
  });
})

// ini tampilan data barang
$(document).on('page:init', function (e) {
  app.request.json("http://localhost/ws/index.php/barang/barang", function(data){
    var buatDaftar = "<li>";
    for(i=0; i<data.length; i++){
      buatDaftar +=
      `
      <li>
      <div class="item-content">
      <div class="item-inner">
      <div class="item-title">
      <div class="item-header"><font size="4">`+data[i].nama_brg+`</font></div>
      <div class="item-footer"><font size="2">Rp. `+data[i].hjual_brg+` </font></div>
      </div>
      <div class="item-after">
      <span class="badge color-pink">`+data[i].stok_brg+`</span>
      </div>
      </div>
      </div>
      </li>
      `;
      $("#isi").html(buatDaftar);
    }
  });
})

// ini button simpan di kategori
$(document).on('page:init', function (e) {
  $("#tambahKategori").click(function () {
    var kategori = $("#kate").val();
    app.request({
      url: "http://localhost/ws/index.php/barang/simpanKategori",
      type: "POST",
      data : {
        "kategori": kategori
      },
      success: function(data){
        app.dialog.alert("Naise");
        $("#kate").val("");
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
  })
})

// tampilan kategori
$(document).on('page:init', function (e) {
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

// tampilan pembelian barang
$(document).on('page:init', function (e) {
  app.request.json("http://localhost/ws/index.php/barang/barang", function(data){
    var buatBeli = "<li>";
    for(i=0; i<data.length; i++){
      buatBeli +=
      `
      <li id="tmbhBadge" data-beli="`+data[i].kode_brg+`">
      <div class="item-content">
      <div class="item-inner">
      <div class="item-title-row">
      <div class="item-title"><font size="4.5">`+data[i].nama_brg+`</font></div>
      <div class="item-after" id="badgeJml`+data[i].kode_brg+`">
      </div>
      </div>
      <div class="item-subtitle" id="hargaBeli`+data[i].kode_brg+`"></div>
      </div>
      </div>
      </li>
      `;
      $("#isiBeli").html(buatBeli);
    }
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

// Event button Bayar Pembelian
$(document).on('click', '#bayarBeli', function (e) {
  var no = $("#sampah").val();
  console.log(no);
})