<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Http\Requests\VattuAddRequest;
use App\Http\Requests\VattuEditRequest;
use App\Vattu;
use App\Vattukho;
use DB,PDF;

class VattuController extends Controller {

	public function getList()
	{
		
		$vattu = DB::table('vattu')->get();
		return view('danhmuc.vattu.vattu',compact('vattu'));
	}

	public function getAdd()
	{
		$chatluongs = DB::table('chatluong')->get();
		foreach ($chatluongs as $key => $val) {
		   $chatluong[] = ['id' => $val->id, 'name'=> $val->cl_ten];
		  }
		$donvitinhs = DB::table('donvitinh')->get();
		foreach ($donvitinhs as $key => $val) {
		   $donvitinh[] = ['id' => $val->id, 'name'=> $val->dvt_ten];
		  }
		$nhomvattus = DB::table('nhomvattu')->get();
		foreach ($nhomvattus as $key => $val) {
		   $nhomvattu[] = ['id' => $val->id, 'name'=> $val->nvt_ten];
		  }
		$khos = DB::table('kho')->get();
		foreach ($khos as $key => $val) {
		   $kho[] = ['id' => $val->id, 'name'=> $val->kho_ten];
		  }
		$nhaphanphois = DB::table('nhaphanphoi')->get();
		foreach ($nhaphanphois as $key => $val) {
		   $nhaphanphoi[] = ['id' => $val->id, 'name'=> $val->npp_ten];
		  }
		$nhasanxuats = DB::table('nhasanxuat')->get();
		foreach ($nhasanxuats as $key => $val) {
		   $nhasanxuat[] = ['id' => $val->id, 'name'=> $val->nsx_ten];
		  }
		return view('danhmuc.vattu.themvattu', compact('chatluong','donvitinh','nhomvattu','kho','nhaphanphoi','nhasanxuat'));
	}

	public function postAdd(VattuAddRequest $request)
	{
		$vattu = new Vattu;
		$vattu->vt_ma = $request->txtMa;
		$vattu->vt_ten = $request->txtTen;
		$vattu->dvt_id = $request->selDVT;
		$vattu->nvt_id = $request->selNVT;
		$vattu->cl_id = $request->selCLuong;
		$vattu->nsx_id = $request->selNSX;
		$vattu->npp_id = $request->selNPP;
		$vattu->vt_gia = $request->txtGia;
		$vattu->save();
		$soluong = new Vattukho;
		$soluong->vt_id = $vattu->id;
		$soluong->kho_id = $request->selKho;
		$soluong->sl_nhap = $request->txtSLuong;
		$soluong->sl_ton = $request->txtSLuong;
		$soluong->sl_xuat = 0;
		$soluong->save();
		return redirect()->route('danhmuc.vattu.getList')->with(['flash_level'=>'success','flash_message'=>'Thêm thành công!!!']);
	}


	public function getEdit($id)
	{
		$chatluongs = DB::table('chatluong')->get();
		foreach ($chatluongs as $key => $val) {
		   $chatluong[] = ['id' => $val->id, 'name'=> $val->cl_ten];
		  }
		$donvitinhs = DB::table('donvitinh')->get();
		foreach ($donvitinhs as $key => $val) {
		   $donvitinh[] = ['id' => $val->id, 'name'=> $val->dvt_ten];
		  }
		$nhomvattus = DB::table('nhomvattu')->get();
		foreach ($nhomvattus as $key => $val) {
		   $nhomvattu[] = ['id' => $val->id, 'name'=> $val->nvt_ten];
		  }
		$khos = DB::table('kho')->get();
		foreach ($khos as $key => $val) {
		   $kho[] = ['id' => $val->id, 'name'=> $val->kho_ten];
		  }
		$nhaphanphois = DB::table('nhaphanphoi')->get();
		foreach ($nhaphanphois as $key => $val) {
		   $nhaphanphoi[] = ['id' => $val->id, 'name'=> $val->npp_ten];
		  }
		$nhasanxuats = DB::table('nhasanxuat')->get();
		foreach ($nhasanxuats as $key => $val) {
		   $nhasanxuat[] = ['id' => $val->id, 'name'=> $val->nsx_ten];
		  }
		$vattu = DB::table('vattu')->where('id', $id)->first();
		$khovt = DB::table('vattukho')->where('vt_id',$id)->first();
		return view('danhmuc.vattu.suavattu', compact('vattu','chatluong','donvitinh','nhomvattu','kho','nhaphanphoi','nhasanxuat','khovt'));
	}

	public function postEdit($id, VattuEditRequest $request)
	{
		DB::table('vattu')->where('id',$id)->update([
			'vt_ma' => $request->txtMa,
			'vt_ten' => $request->txtTen,
			'dvt_id' => $request->selDVT,
			'nvt_id' => $request->selNVT,
			'cl_id' => $request->selCLuong,
			'npp_id' => $request->selNPP,
			'nsx_id' => $request->selNSX,
			'vt_gia' => $request->txtGia
			]);
		DB::table('vattukho')->where('vt_id',$id)->update([
			'kho_id' => $request->selKho,
			'sl_nhap' => $request->txtSLuong,
			'sl_ton' => $request->txtSLuong,
			'sl_xuat' => 0,
			
			]);
		return redirect()->route('danhmuc.vattu.getList')->with(['flash_level'=>'success','flash_message'=>'Sửa thành công!!!']);
	}

	public function getDelete($id)
	{
		DB::table('vattukho')->where('vt_id',$id)->delete();
		 DB::table('vattu')->where('id',$id)->delete();
		return redirect()->route('danhmuc.vattu.getList')->with(['flash_level'=>'success','flash_message'=>'Xóa thành công!!!']);
	}

	public function getPDF()
    {
    	
        $vt = DB::table('vattu')
        	->join('donvitinh','donvitinh.id','=','vattu.dvt_id')
        	->join('nhomvattu','nhomvattu.id','=','vattu.nvt_id')
        	->join('nhaphanphoi','nhaphanphoi.id','=','vattu.npp_id')
        	->join('nhasanxuat','nhasanxuat.id','=','vattu.nsx_id')
        	->join('chatluong','chatluong.id','=','vattu.cl_id')
        	->select('vattu.*','donvitinh.dvt_ten','nhomvattu.nvt_ten','nhaphanphoi.npp_ten','nhasanxuat.nsx_ten','chatluong.cl_ten')
        	->get();
        // print_r($khachhang);
        $pdf = PDF::loadView('danhmuc.vattu.phieu',compact('vt'));
        return $pdf->stream();
    }

}
