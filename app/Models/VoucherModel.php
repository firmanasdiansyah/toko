<?php

namespace App\Models;

use CodeIgniter\Model;

class VoucherModel extends Model
{
  protected $table = 'diskon';
  protected $primaryKey = 'id';
  protected $allowedFields = [
    'kode_voucher', 'tanggal_mulai_berlaku', 'tanggal_akhir_berlaku', 'besar_diskon', 'aktif'
  ];
  protected $returnType = 'App\Entities\Voucher';
  protected $useTimestamps = false;
}
