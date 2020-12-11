<?php
include_once("database/connection.php");
include('Header/header_cuti_view.php') ?>
<div class="container-fluid">
    <table class="table table-hover table-light">
    <tr class="table-primary">
        <th>No</th>
        <th>Nama Karyawan</th>
        <th>Nama Department</th>
        <th>Jabatan</th>
        <th>Mulai Cuti</th>
        <th>Akhir Cuti</th>
        <th>Jenis Cuti</th>
        <th>Keterangan</th>
    </tr>
    <?php
    $no = 1;
    $data_cuti = mysqli_query($connect, "SELECT * FROM transaksi_cuti");
    $row = mysqli_fetch_row($data_cuti);
    while ($d = mysqli_fetch_array($data_cuti)) {
    ?>
    <tbody>
    <tr>
        <td><?php echo $no++;?></td>
        <td><?php echo $d['nama_karyawan']; ?></td>
        <td><?php echo $d['nama_department']; ?></td>
        <td><?php echo $d['nama_jabatan']; ?></td>
        <td><?php echo $d['mulai_cuti']; ?></td>
        <td><?php echo $d['akhir_cuti']; ?></td>
        <td><?php echo $d['nama_cuti']; ?></td>
        <td><?php echo $d['keterangan']; ?></td>

    </tr>
    </tbody>
    <?php }; ?>
    </table>
</div>

<a href="cuti_input.php" class="btn btn-primary float-right" style="margin-right:20px">Kembali Ke Menu Input Cuti</a>
