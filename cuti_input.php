<?php
   
    include_once("database/connection.php");
    include('Header/header_cuti_input.php');
?>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="container">
                <form action="input_data_cuti.php" method="POST" id="form_cuti" class="form_cuti_karyawan">
                    <div class="form-group">
                        <label for="nik">NIK</label>
                        <input type="text" name="nik" class="form-control" id="nik" placeholder="Contoh : 123456789  " required>
                    </div>
                    <div class="form-group">
                        <label for="namaKaryawan">Nama Karyawan</label>
                        <input type="text" name="nama_karyawan" class="form-control" id="nama_karyawan" placeholder="Contoh : Joni Sutanto " required>
                    </div>
                    <div class="form-group">
                        <label for="derpartment">Department</label>
                        <select class="form-control" name="dpt" id="dpt">
                        <option disabled selected> Pilih Department </option>
                        <?php
                        $namadepertment = mysqli_query($connect, "SELECT * from department");
                        while ($data=mysqli_fetch_array($namadepertment)) {
                            
                            ?>
                        <option value="<?=$data['nama_department']?>"><?=$data['nama_department']?></option>
                        <?php
                        }
                        ?>
                            
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="jabatan">Jabatan</label>
                        
                        <select class="form-control" name="jbtn" id="jbtn">
                        <option disabled selected> Pilih Jabatan </option>
                        <?php
                        $namajabatan = mysqli_query($connect, "SELECT * from jabatan");
                        while ($data=mysqli_fetch_array($namajabatan)) {
                            
                            ?>
                        <option value="<?=$data['nama_jabatan']?>"><?=$data['nama_jabatan']?></option>
                        <?php
                        }
                        ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="mulaicuti">Mulai Cuti</label>
                        <input type="date" name="mulai_cuti" class="form-control" id="mulai_cuti" placeholder="Contoh : yyyy-mm-dd " required>
                    </div>
                    <div class="form-group">
                        <label for="akhircuti">Akhir Cuti</label>
                        <input type="date" name="akhir_cuti" class="form-control" id="akhir_cuti" placeholder="Contoh : yyy-mm-dd " required>
                    </div>
                    <div class="form-group">
                        <label for="jeniscuti">Jenis Cuti</label>
                        <select class="form-control" name="jenis_cuti" id="jenis_cuti">
                        <option disabled selected> Pilih Jenis Cuti </option>
                        <?php
                        $namacuti = mysqli_query($connect, "SELECT * from jenis_cuti");
                        while ($data=mysqli_fetch_array($namacuti)) {
                            
                            ?>
                        <option value="<?=$data['nama_cuti']?>"><?=$data['nama_cuti']?></option>
                        <?php
                        }
                        ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="keterangan">Keterangan</label>
                        <input type="text" name="ket" class="form-control" id="ket" placeholder="Conroh : Menghadiri Pernikahan Keluarga " required>
                    </div>
                    <div class="footer">
                    <a href="cuti_view.php" class="btn btn-primary float-right" >view data cuti karyawan</a>
                    <button type="submit" form="form_cuti" value="Submit" class="btn btn-primary float-right" style="margin-right:10px">Submit</button>
                    </div>
                   
                </form>
                </div>
            </div>
        </div>
    </div>
    
