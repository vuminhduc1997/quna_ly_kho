<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Http\Requests\NhasanxuatAddRequest;
use App\Http\Requests\NhasanxuatEditRequest;

use App\Nhasanxuat;
use DB;

class NhasanxuatController extends Controller {
	
	public function getList()
	{
		$nhasanxuat = DB::table('nhasanxuat')->get();
		return view('danhmuc.nhasanxuat.nhasanxuat', compact('nhasanxuat'));
	}

	public function getAdd()
	{
		$khuvucs = DB::table('khuvuc')->get();
		foreach ($khuvucs as $key => $val) {
		   $khuvuc[] = ['id' => $val->id, 'name'=> $val->kv_ten];
		  }
		return view('danhmuc.nhasanxuat.themnhasanxuat', compact('khuvuc'))->with(['flash_level'=>'success','flash_message'=>'Thêm thành công!!!']);
	}

	public function postAdd(NhasanxuatAddRequest $request)
	{
		$nhasanxuat = new Nhasanxuat;
		$nhasanxuat->nsx_ma = $request->txtMa;
		$nhasanxuat->nsx_ten = $request->txtTen;
		$nhasanxuat->kv_id = $request->selKV;
		$nhasanxuat->save();
		return redirect()->route('danhmuc.nhasanxuat.getList');
	}


	public function getEdit($id)
	{
		$khuvucs = DB::table('khuvuc')->get();
		foreach ($khuvucs as $key => $val) {
		   $khuvuc[] = ['id' => $val->id, 'name'=> $val->kv_ten];
		  }
		$nhasanxuat = DB::table('nhasanxuat')->where('id', $id)->first();
		return view('danhmuc.nhasanxuat.suanhasanxuat', compact('nhasanxuat','khuvuc'))->with(['flash_level'=>'success','flash_message'=>'Sửa thành công!!!']);
	}

	public function postEdit($id, NhasanxuatEditRequest $request)
	{
		DB::table('nhasanxuat')->where('id',$id)->update([
			'nsx_ten' => $request->txtTen,
			'kv_id' => $request->selKV,
			]);
		return redirect()->route('danhmuc.nhasanxuat.getList');
	}

	public function getDelete($id)
	{
		 DB::table('nhasanxuat')->where('id',$id)->delete();
		return redirect()->route('danhmuc.nhasanxuat.getList')->with(['flash_level'=>'success','flash_message'=>'Xóa thành công!!!']);
	}

}
