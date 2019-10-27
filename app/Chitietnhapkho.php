<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Chitietnhapkho extends Model {

	protected $table = 'chitietnhapkho';

	protected $fillable = ['ctnk_soluong','ctnk_thanhtien','vt_id','nk_id'];

 	public $timestamps = false;

}
