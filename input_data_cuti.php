<?php
include_once("database/connection.php");


$nik = $_POST["nik"];
$nama = $_POST["nama_karyawan"];
$dpt = $_POST['dpt'];
$jbtn = $_POST['jbtn'];
$mulaicuti = $_POST["mulai_cuti"];
$akhircuti = $_POST["akhir_cuti"];
$jeniscuti = $_POST['jenis_cuti'];
$ket = $_POST["ket"];

$input_data_cuti = mysqli_query($connect, "INSERT INTO transaksi_cuti (NIK,nama_karyawan,nama_department,nama_jabatan,mulai_cuti,akhir_cuti,nama_cuti,keterangan) 
VALUES ('$nik', '$nama', '$dpt', '$jbtn', '$mulaicuti', '$akhircuti', '$jeniscuti', '$ket')");
 echo "<script>
 alert('Permohonan Cuti Berhasil Dikirim');
 window.location.href='cuti_input.php';
</script>";
?>