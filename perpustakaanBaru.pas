Program perpustakaan1;
uses crt;
        type dUser = record
                id_user : string;
                nama_user : string;
                pinjam_buku : integer;
                poin : integer;
        end;
        type dBuku = record
                id_buku : string;
                judul_buku : string;
                tahun_terbit : integer;
                jum_buku : integer;
        end;
        type tabBuk = array of dBuku;
        type tabUs = array of dUser;
var
        i:integer;
        tabelBuku : tabBuk;
        tabelUser : tabUs;

procedure menuUser(var A : tabBuk);forward;
procedure pinjamBuku(var A : tabBuk);forward;
procedure levelPoin(var pil : integer);forward;
//=================================================================================
        function kaliPoin(i:integer):integer;
        begin
            kaliPoin:= tabelUser[i].pinjam_buku*5;
        end;
//==================================================================================
        procedure insertUser();
        {IS. admin menambahkan data user
        FS. tabelUser terisi}
        begin
            i :=length(tabelUser);
            setlength(tabelUser,i+1);
            write('Id                        : ');readln(tabelUser[i].id_user);
            write('Nama                      : ');readln(tabelUser[i].nama_user);
            write('Jumlah Buku yang dipinjam : ');readln(tabelUser[i].pinjam_buku);
            tabelUser[i].poin:=kaliPoin(i);
            write('Poin                      : ',tabelUser[i].poin);
            readln;
        end;
//================================================================================================
        procedure viewUser();
        {IS. terdefinisi
        FS. data yang terisi di tampilkan}
        begin
            clrscr;
                writeln('                              VIEW DATA USER                          ');
                writeln(' ==================================================================== ');
                for i:=0 to length (tabelUser)-1 do
                begin
                    writeln ('Data ke- ',i+1);
                    writeln('Id                                : ',tabelUser[i].id_user);
                    writeln('Nama                              : ',tabelUser[i].nama_user);
                    writeln('Jumlah Buku yang di Pinjam        : ',tabelUser[i].pinjam_buku);
                    writeln('Poin                              : ',tabelUser[i].poin);
                end;
            readln;
        end;
//==================================================================================
        procedure editUser();
        {IS.  terdefinisi
        FS. dapat mengedit data user }
        begin
            i:=1;
            viewUser();
            writeln('data ke?');readln(i);
            i:=i-1;
            writeln ('                      EDIT DATA USER                           : ');
            writeln ('=================================================================');
            write('Id                                : ');readln(tabelUser[i].id_user);
            write('Nama                              : ');readln(tabelUser[i].nama_user);
            write('Jumlah Buku yang di Pinjam        : ');readln(tabelUser[i].pinjam_buku);
            write('Poin                              : ');readln(tabelUser[i].poin);
            write('Data Berhasil Di Edit ');readln;
        end;

//====================================================================================================
        Procedure deleteUser();
        {IS.admin menginputkan data yang ke berapa yang akan di hapus
        FS. admin dapat menghapus data user yang di inputkan }
        var
            ke : integer;
        begin
            writeln('=pilihan delete');
            viewUser();
            readln();
            write ('Hapus Data ke ? ');readln(ke);
            if (ke>0) and (ke<=length(tabelUser)) then
            begin
                if ke=length(tabelUser) then
                    setlength(tabelUser,length(tabelUser)-1)
                else
                begin
                    tabelUser[ke-i]:=tabelUser[length(tabelUser)-1];
                    setlength(tabelUser,length(tabelUser)-1);
                end;
                writeln('Data berhasil ke hapus ');readln();
            end
            else
                writeln('Maaf ada kesalahan');readln;
        end;
//===============================================================================================================
        procedure insertBuku(var A : tabBuk);
        {IS. admin menginputkan data buku
        FS. tabelBuku terisi}
        begin
            clrscr;
            i :=length(A);
            setlength(A,i+1);
            write('Id                                   : ');readln(A[i].id_buku);
            write('Judul Buku                           : ');readln(A[i].judul_buku);
            write('Tahun Terbit                         : ');readln(A[i].tahun_terbit);
            write('Persediaan Buku                      : ');readln(A[i].jum_buku);
            readln;
        end;
//================================================================================================
        procedure viewBuku(var A : tabBuk);
        {IS. terdefinisi
        FS. data yang terisi di tampilkan}
        begin
            clrscr;
                writeln('                              VIEW DATA BUKU                          ');
                writeln(' ==================================================================== ');
                for i:=0 to length (A)-1 do
                begin
                    writeln ('Data ke- ',i+1);
                    writeln('Buku                              : ',A[i].id_buku);
                    writeln('Judul Buku                        : ',A[i].judul_buku);
                    writeln('Tahun Terbit                      : ',A[i].tahun_terbit);
                    writeln('Persediaan Buku                   : ',A[i].jum_buku);
                end;
            readln;
        end;
//==================================================================================================
        procedure editBuku(var A : tabBuk);
        {IS.  terdefinisi
        FS. dapat mengedit data user }
        begin
            i:=1;
            viewBuku(A);
            write('Data ke ? :  ');readln(i);
            i:=i-1;
            writeln ('                      EDIT DATA USER                           : ');
            writeln ('=================================================================');
            write('Buku                              : ');readln(A[i].id_buku);
            write('Judul Buku                        : ');readln(A[i].judul_buku);
            write('Tahun Terbit                      : ');readln(A[i].tahun_terbit);
            write('Persediaan Buku                   : ');readln(A[i].jum_buku);
            write('Data Berhasil Di Edit ');readln;
        end;
//====================================================================================================
        Procedure deleteBuku(var A : tabBuk);
        {IS.admin menginputkan data yang ke berapa yang akan di hapus
        FS. admin dapat menghapus data buku yang di inputkan }
        var
            ke : integer;
        begin
            writeln('=pilihan delete');
            viewBuku(A);
            readln();
            write ('Hapus Data ke ? ');readln(ke);
            if (ke>0) and (ke<=length(A)) then
            begin
                if ke=length(A) then
                    setlength(A,length(A)-1)
                else
                begin
                    A[ke-i]:=A[length(A)-1];
                    setlength(A,length(A)-1);
                end;
                writeln('Data berhasil ke hapus ');readln();
            end
            else
                writeln('Maaf ada kesalahan');readln;
        end;
//=============================================================================================================
        procedure pengembalianBUku();
        {IS. -
        FS. menambahkan persediaan buku yang telah dikembalikan}
        var
            n : string;
            bnyk_buku : integer;
            status : boolean;
        begin
            writeln('Masukkan Nama Buku : ');readln(n);
            i:=0;
            bnyk_buku := length(tabelBuku);
            status:=false;
            while i < bnyk_buku do
            begin
                if n = tabelBuku[i].judul_buku then
                begin
                    tabelBuku[i].jum_buku:=tabelBuku[i].jum_buku+1;
                    write('Buku telah kembali');
                end;
            i := i + 1;
            end;
            readln;
        end;
//============================================================================================================
        procedure bubbleShort(var A : tabBuk);
        var
            pass : integer;
            temp : dBuku ;
            status : boolean;
        begin
            pass:=1;
            while pass<= length(A) do
            begin
                i:=0;
                while (i<= length(A)-pass) do
                begin
                    if A[i].id_buku<A[i+1].id_buku then
                    begin
                        temp := A[i];
                        A[i] := A[i+1];
                        A[i+1] := temp;
                    end;
                    i:=i+1;
                end;
                pass:=pass+1;
            end;
        end;
//=============================================================================================================
        procedure selectionSort (var A : tabBuk);
        var 
            pass,i_max : integer;
            temp : dBuku ;
        begin
            pass :=0;
            while pass <= length(A)-2 do
            begin
                i_max:=pass;
                i:=pass+1;
                while i<=length(A)-1 do
                begin
                    if A[i_max].tahun_terbit > A[i].tahun_terbit then
                        i_max:=i;
                    i:=i+1;
                end;
                temp:=A[i_max];
                A[i_max]:=A[pass];
                A[pass]:=temp;
                pass:=pass+1;
            end;
        end;
//=============================================================================================================
        procedure insertionSort(var A : tabBuk);
        var
            pass,tmp : integer;
            temp : dBuku;
        begin
            pass := 1;
            while pass <= length(A)-1 do
            begin
                i:=pass;
                temp:=A[i];
                tmp:=i;
                while (tmp>0) and (A[tmp].jum_Buku < A[tmp-1].jum_Buku) do
                begin
                    A[tmp]:=A[tmp-1];
                    tmp:=tmp-1;
                end;
                A[tmp]:=temp;
                pass:=pass+1;
            end;
        end;    
//==========================================================================================================================
        procedure listBuku(var A : tabBuk);
        var
            pil : integer;
        begin
            clrscr;
            for i := 0 to length(A)-1 do
            begin
                writeln('Id Buku : ', A[i].id_buku ,' | ',' Judul Buku : ', A[i].judul_buku ,' | ' , 'Tahun Terbit : ', A[i].tahun_terbit , '  | ', 'Persediaan Buku : ', A[i].jum_Buku);
                if(i mod 2 = 1) then
                    readln;
            end;
            readln();
            writeln('           Urutkan Berdasarkan :                  ');
            writeln('         1. Id Buku                               ');
            writeln('         2. Tahun Terbit                          ');
            writeln('         3. Persediaan Buku                       ');
            writeln('         0. Back                                  ');
            write  (' Pilih : ');readln(pil);
            case pil of
                1 : bubbleShort(A);
                2 : selectionSort(A);
                3 : insertionSort(A);
            end;
            readln;
        end;
//=============================================================================================================
        procedure cariId(var A : tabBuk);
        var 
            status : boolean;
            bnyk_buku : integer;
            ambil,persetujuan,lagi : string;
        begin
            clrscr;
            write('Masukkan Id Buku : ');readln(id);
            bnyk_buku:=length(A);
            status := false;
            while i< bnyk_buku do
            begin
                if (id= A[i].id_buku)then
                begin
                    writeln('Id              : ', A[i].id_buku);
                    writeln('Judul Buku      : ', A[i].judul_buku);
                    writeln('Tahun Terbit    : ', A[i].tahun_terbit);
                    writeln('Persediaan Buku : ', A[i].jum_Buku);
                    if A[i].jum_Buku > 0 then 
                    begin
                        write('Apakah buku akan di ambil [y/n]?');readln(ambil);
                        if(upcase(ambil) = 'Y') then
                        begin 
                            writeln('Buku akan di pinjam dan di kembalikan maksimal 2 minggu dari hari ini. Setuju[y/n]?');readln(persetujuan);
                            if (upcase(persetujuan)='Y') then
                            begin
                                writeln('Mau Pinjam Lagi?[y/n]');readln(lagi);
                                    if (upcase(lagi)) = 'Y' then
                                        pinjamBuku(A);
                            end;
                            A[i].jum_Buku := A[i].jum_Buku -1;
                        end;
                    end;
                end
                else
                    writeln('Id Tidak Ditemukan');
                i:= i +1;
            end;
            readln();
        end; 
//============================================================================================================
        procedure cariTahunTerbit(var A : tabBuk);
        var
            tahun : integer;
            bnyk_buku : integer;
            status : boolean;
            ambil,persetujuan,lagi : string;
        begin
            clrscr;
            write('Masukkan Tahun Terbit : ');readln(tahun);
            bnyk_buku:=length(A);
            status:=false;
            while i < bnyk_buku do
            begin
                if tahun = A[i].tahun_terbit then
                begin
                    writeln('Id              : ', A[i].id_buku);
                    writeln('Judul Buku      : ', A[i].judul_buku);
                    writeln('Tahun Terbit    : ', A[i].tahun_terbit);
                    writeln('Persediaan BUku : ', A[i].jum_Buku);
                    if A[i].jum_Buku > 0 then 
                    begin
                        write('Apakah buku akan di ambil [y/n]?');readln(ambil);
                        if(upcase(ambil) = 'Y') then
                        begin 
                            writeln('Buku akan di pinjam dan di kembalikan maksimal 2 minggu dari hari ini. Setuju[y/n]?');readln(persetujuan);
                            if (upcase(persetujuan)='Y') then
                            begin
                                writeln('Mau Pinjam Lagi?[y/n]');readln(lagi);
                                    if (upcase(lagi)) = 'Y' then
                                        pinjamBuku(A);
                            end;
                            A[i].jum_Buku := A[i].jum_Buku -1;
                        end;
                    end;
                end
                else
                    writeln('Id Tidak Ditemukan');
                i:= i +1;
            end;
            readln();
        end;
//============================================================================================================
        procedure cariPersediaanBuku(var A : tabBuk);
        var
            persediaan : integer;
            bnyk_buku : integer;
            status : boolean;
            ambil,persetujuan,lagi : string;
        begin
            clrscr;
            write('Masukkan Persediaan Buku : ');readln(persediaan);
            bnyk_buku:=length(A);
            status:=false;
            while i < bnyk_buku do
            begin
                if persediaan = A[i].jum_buku then
                begin
                    writeln('Id              : ', A[i].id_buku);
                    writeln('Judul Buku      : ', A[i].judul_buku);
                    writeln('Tahun Terbit    : ', A[i].tahun_terbit);
                    writeln('Persediaan BUku : ', A[i].jum_Buku);
                    if A[i].jum_Buku > 0 then 
                    begin
                        write('Apakah buku akan di ambil [y/n]?');readln(ambil);
                        if(upcase(ambil) = 'Y') then
                        begin 
                            writeln('Buku akan di pinjam dan di kembalikan maksimal 2 minggu dari hari ini. Setuju[y/n]?');readln(persetujuan);
                            if (upcase(persetujuan)='Y') then
                            begin
                                writeln('Mau Pinjam Lagi?[y/n]');readln(lagi);
                                    if (upcase(lagi)) = 'Y' then
                                        pinjamBuku(A);
                            end;
                            A[i].jum_Buku := A[i].jum_Buku -1;
                        end;
                    end;
                end
                else
                    writeln('Tidak Ditemukan');
                i:=i+1;
            end;
            readln();
        end;
//==========================================================================================================
        procedure pinjamBuku(var A : tabBuk);
        var
            pil : integer;
        begin
            clrscr;
            writeln('---------------------------------------------------');
            writeln('               Cari Berdasarkan :                  ');
            writeln('---------------------------------------------------');
            writeln('               1.Cari Berdasarkan Id Buku          ');
            writeln('               2.Cari Berdasarkan Tahun Terbit     ');
            writeln('               3.Cari Berdasarkan Persediaan Buku  ');
            writeln('               0. Back                             ');
            writeln('---------------------------------------------------');
            write(' Pilih : '); readln(pil);
            if pil<>0 then
            begin
                case pil of
                    1 : cariId(A);
                    2 : cariTahunTerbit(A);
                    3 : cariPersediaanBuku(A);
                end;
            end
            else
                menuUser(A);
        end;
         
//=============================================================================================================
        procedure tiketKuliner();
        var
            pil : integer;
        begin
            clrscr;
            writeln('               Daftar Kuliner                   ');
            writeln('             1. Hoka-hoka Bento                 ');
            writeln('             2. Mc Donald                       ');
            writeln('             3. Sukabirus                       ');
            writeln('             0. Back                            ');
            write ('Pilih : ');readln(pil);
            if pil<>0 then
            begin
                case pil of 
                    1 : 
begin 
    writeln('Selamat anda mendapatkan tiket kuliner di Hoka-hoka Bento'); 
    tabelUser[i].poin := tabelUser[i].poin-50; 
end;
                    2 :
begin
    writeln('Selamat anda mendapatkan tiket kuliner di Mc Donald');
    tabelUser[i].poin:= tabelUser[i].poin-50;
end;
                    3 : 
begin
    writeln('Selamat anda mendapatkan tiket kuliner di Sukabirus');
    tabelUser[i].poin:=tabelUser[i].poin-50;
end;
                end;
            end
            else
                levelPoin(pil);
            readln();
        end;
//=============================================================================================================
        procedure tiketFilm();
        var
            pil : integer;
        begin
            clrscr;
            writeln ('              Daftar Film                     ');
            writeln('            1. Pengabdi Setan                  ');
            writeln('            2. Justice League                  ');
            writeln('            3. One Fine Day                    ');
            writeln('            0. Back                            ');
            write('Pilih : ');readln(pil);
            if pil<>0 then
            begin
                case pil of
                    1 :
begin
    writeln('Selamat anda mendapatkan tiket film Pengabdi Setan');
    tabelUser[i].poin:=tabelUser[i].poin-150;
end;
                    2 : 
begin
    writeln('Selamat anda mendapatkan tiket film Justice League');
    tabelUser[i].poin:=tabelUser[i].poin-150;
end;

                    3 : 
begin
    writeln('Selamat anda mendapatkan tiket film One Fine Day ');
    tabelUser[i].poin:=tabelUser[i].poin-150;
end;
                end;
            end
            else
                levelPoin(pil);
            readln;
        end;
//=============================================================================================================
        procedure diskonHotel();
        var
            pil : integer;
        begin
            clrscr;
            writeln('               Daftar Hotel                    ');
            writeln('            1. The Premieve Hotel              ');
            writeln('            2. Hemangini Hotel                 ');
            writeln('            3. El Royale Hotel                 ');
            writeln('            0. Back                            ');
            write(' Pilih : ');readln(pil);
            if pil<>0 then
            begin
                case pil of 
                    1 :
begin
    writeln('Selamat anda mendapatkan diskon The Premieve Hotel');
    tabelUser[i].poin:=tabelUser[i].poin-300;
end;
                    2 : 
begin
    writeln('Selamat anda mendapatkan diskon Hemangini Hotel');
    tabelUser[i].poin:=tabelUser[i].poin-150;
end;
                    3 : 
begin
    writeln('Selamat anda mendapatkan diskon El Royale Hotel');
    tabelUser[i].poin:=tabelUser[i].poin-300;
end;
                end;
            end;
            readln;
        end;
//=============================================================================================================
        procedure levelPoin(var pil : integer);
        begin
            writeln('------------------------------------------------');
            writeln('                 Level Poin                     ');
            writeln('------------------------------------------------');
            writeln('                1. Tiket Kuliner[50]            ');
            writeln('                2. Tiket Film [150]             ');
            writeln('                3. Diskon Hotel [300]           ');
            writeln('                0. Back                         ');
            writeln('------------------------------------------------');
            write('Pilih : '); readln(pil);   
        end;
//=============================================================================================================
        procedure tukarPoin();
        var
            nama : string;
            pil : integer;
        begin
            clrscr;
            write('Masukkan Nama : ');readln(nama);
            for i:=0 to length(tabelUser) do
            begin
                if nama = tabelUser[i].nama_user then
                begin
                    write('Jumlah poin ' , tabelUser[i].nama_user, ' : ', tabelUser[i].poin);
                    readln;
                    levelPoin(pil);
                    if pil<>0 then
                    begin
                        if (tabelUser[i].poin >= 50) and (tabelUser[i].poin < 150) and (pil = 1)then
                            tiketKuliner()
                        else if (tabelUser[i].poin >= 150) and (tabelUser[i].poin < 300) and (pil = 2) then
                            tiketFilm()
                        else if(tabelUser[i].poin >= 300) and (pil = 3) then
                            diskonHotel()
                        else
                            writeln('Poin Anda tidak mencukupi....');
                    end;
                    
                end;
            end;
            readln;
        end;
//=============================================================================================================
        procedure menuUser(var A : tabBuk);
        var
            pil : integer;
        begin
            clrscr;
            writeln('------------------------------------------------------');
            writeln('                    Menu User                         ');
            writeln('------------------------------------------------------');
            writeln('                  1. Lihat Buku                       ');
            writeln('                  2. Pinjam Buku                      ');
            writeln('                  3. Tukar Poin                       ');
            writeln('                  0. Back                             ');
            writeln('------------------------------------------------------');
            write (' Pilih : ');readln(pil);
            if pil <>0 then
            begin
                case pil of
                    1 : listBuku(A);
                    2 : pinjamBuku(A);
                    3 : tukarPoin();
                end;
            end;
        end;
//==================================================================================================================
        procedure menuAdmin(var A : tabBuk);
        var
            pil : integer;
        begin
            clrscr;
            writeln('------------------------------------------------------');
            writeln('                    Menu Admin                        ');
            writeln('------------------------------------------------------');
            writeln('                  1. Insert User                      ');
            writeln('                  2. Edit User                        ');
            writeln('                  3. Delete User                      ');
            writeln('                  4. View User                        ');
            writeln('                  5. Insert Buku                      ');
            writeln('                  6. Edit Buku                        ');
            writeln('                  7. Delete Buku                      ');
            writeln('                  8. View Buku                        ');
            writeln('                  9. pengembalian BUku                ');
            writeln('                  0. Back                             ');
            writeln('------------------------------------------------------');
            write (' Pilih : ');readln(pil);
            if pil<>0 then
            begin
                case pil of
                    1 : insertUser();
                    2 : editUser();
                    3 : deleteUser();
                    4 : viewUser();
                    5 : insertBuku(A);
                    6 : editBuku(A);
                    7 : deleteBuku(A);
                    8 : viewBuku(A);
                    9 : pengembalianBUku();
                end;
            end;
            readln;
            end;
//===============================================================================================================
        procedure home(var A : tabBuk);
        var
            pil : integer;
        begin
            clrscr;
            writeln('   ||-||-||-||-||-||-||-||-||-||-||-||-||-||-||-|| ');
            writeln('  |=|                                           |=|');
            writeln('  |=|                  WELCOME TO               |=|');
            writeln('  |=|             EMERALD CITY LIBRARY          |=|');
            writeln('  |=|-------------------------------------------|=|');
            writeln('  |=|                                           |=|');
            writeln('  |=|                 1. User                   |=|');
            writeln('  |=|                 2. Admin                  |=|');
            writeln('  |=|                                           |=|');
            writeln('   ||-||-||-||-||-||-||-||-||-||-||-||-||-||-||-|| ');
            write(' Pilih : ');readln(pil);
            if (pil=1) or (pil=2) then
            begin
                case pil of
                    1 : menuUser(A);
                    2 : menuAdmin(A);
                end;
            end;
            home(A);
        end;
//===============================================   MAIN   =======================================================
var 
    A : tabBuk;
begin
        clrscr;
        home(A);
        readln;
end.
