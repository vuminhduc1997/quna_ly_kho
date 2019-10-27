<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Http\Requests\KhoAddRequest;
use App\Http\Requests\KhoEditRequest;

use App\Kho;
use DB;

class KhoController extends Controller {

	public function getList()
	{
		$kho = DB::table('kho')->get();
		return view('danhmuc.kho.kho', compact('kho'));
	}

	public function getAdd()
	{
		return view('danhmuc.kho.themkho');
	}

	public function postAdd(KhoAddRequest $request)
	{
		$kho = new Kho;
		$kho->kho_ma = $request->txtMa;
		$kho->kho_ten = $request->txtTen;
		$kho->kho_lienhe = $request->txtLienhe;
		$kho->kho_diachi = $request->txtDiachi;
		$kho->kho_sdt = $request->txtSDT;
		$kho->kho_quanly = $request->txtQuanly;
		$kho->kho_ghichu = $request->txtGhichu;
		$kho->save();
		return redirect()->route('danhmuc.kho.getList')->with(['flash_level'=>'success','flash_message'=>'Thêm thành công!!!']);
	}

	public function getEdit($id)
	{
		$data = DB::table('kho')->where('id', $id)->first();
		return view('danhmuc.kho.suakho', compact('data'));
	}

	public function postEdit($id, KhoEditRequest $request)
	{
		DB::table('kho')->where('id',$id)->update([
			'kho_ten' => $request->txtTen,
			'kho_lienhe' => $request->txtLienhe,
			'kho_diachi' => $request->txtDiachi,
			'kho_sdt' => $request->txtSDT,
			'kho_quanly' => $request->txtQuanly,
			'kho_ghichu' => $request->txtGhichu
			]);
		return redirect()->route('danhmuc.kho.getList')->with(['flash_level'=>'success','flash_message'=>'Sửa thành công!!!']);
	}

	public function getDelete($id)
	{
		 DB::table('kho')->where('id',$id)->delete();
		return redirect()->route('danhmuc.kho.getList')->with(['flash_level'=>'success','flash_message'=>'Xóa thành công!!!']);
	}

}
