<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Http\Requests\NhomvattuAddRequest;
use App\Http\Requests\NhomvattuEditRequest;

use App\Nhomvattu;
use DB;


class NhomvattuController extends Controller {

	public function getList()
	{
		$nhomvattu = DB::table('nhomvattu')->get();
		return view('danhmuc.nhomvattu.nhomvattu', compact('nhomvattu'));
	}

	public function getAdd()
	{
		return view('danhmuc.nhomvattu.themnhomvattu');
	}

	public function postAdd(NhomvattuAddRequest $request)
	{
		$nhomvattu = new Nhomvattu;
		$nhomvattu->nvt_ma = $request->txtMa;
		$nhomvattu->nvt_ten = $request->txtTen;
		$nhomvattu->save();
		return redirect()->route('danhmuc.nhomvattu.getList')->with(['flash_level'=>'success','flash_message'=>'Thêm thành công!!!']);
	}


	public function getEdit($id)
	{
		$data = DB::table('nhomvattu')->where('id', $id)->first();
		return view('danhmuc.nhomvattu.suanhomvattu', compact('data'));
	}

	public function postEdit($id, NhomvattuEditRequest $request)
	{
		DB::table('nhomvattu')->where('id',$id)->update([
			'nvt_ma' => $request->txtMa,
			'nvt_ten' => $request->txtTen
			]);
		return redirect()->route('danhmuc.nhomvattu.getList')->with(['flash_level'=>'success','flash_message'=>'Sửa thành công!!!']);
	}

	public function getDelete($id)
	{
		 DB::table('nhomvattu')->where('id',$id)->delete();
		return redirect()->route('danhmuc.nhomvattu.getList')->with(['flash_level'=>'success','flash_message'=>'Xóa thành công!!!']);
	}

}
