<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Http\Requests\CongtrinhAddRequest;
use App\Http\Requests\CongtrinhEditRequest;

use App\Congtrinh;
use DB;


class CongtrinhController extends Controller {
public function getList()
	{
		$congtrinh = DB::table('congtrinh')->get();
		return view('danhmuc.congtrinh.congtrinh', compact('congtrinh'));
	}

	public function getAdd()
	{
		return view('danhmuc.congtrinh.themcongtrinh');
	}

	public function postAdd(CongtrinhAddRequest $request)
	{
		$congtrinh = new Congtrinh;
		$congtrinh->ct_ma = $request->txtMa;
		$congtrinh->ct_ten = $request->txtTen;
		$congtrinh->save();
		return redirect()->route('danhmuc.congtrinh.getList')->with(['flash_level'=>'success','flash_message'=>'Thêm thành công!!!']);
	}


	public function getEdit($id)
	{
		$data = DB::table('congtrinh')->where('id', $id)->first();
		return view('danhmuc.congtrinh.suacongtrinh', compact('data'));
	}

	public function postEdit($id, CongtrinhEditRequest $request)
	{
		DB::table('congtrinh')->where('id',$id)->update([
			'ct_ten' => $request->txtTen
			]);
		return redirect()->route('danhmuc.congtrinh.getList')->with(['flash_level'=>'success','flash_message'=>'Sửa thành công!!!']);
	}

	public function getDelete($id)
	{
		 DB::table('congtrinh')->where('id',$id)->delete();
		return redirect()->route('danhmuc.congtrinh.getList');
	}

}
