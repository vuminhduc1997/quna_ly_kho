<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

// use Illuminate\Http\Request;

use DB;
use PDF;
use Cart,Request;
use App\Nhapkho;
use App\Chitietnhapkho;
use App\Vattukho;

class NhapkhoController extends Controller {

	public function getDanhsach()
	{
		$data = DB::table('nhapkho')->get();
		return view('chucnang.nhapkho.danhsach',compact('data'));
	}

	public function getList()
	{
		$data = DB::table('nhaphanphoi')->get();
		$data1 = DB::table('vattu')
			->join('donvitinh','donvitinh.id','=','vattu.dvt_id')
			->select('vattu.*','donvitinh.dvt_ten')
			->get();
		$dataKho = DB::table('kho')->get();
		$dataDonvitinh = DB::table('donvitinh')->get();
		$content = Cart::content();
		// Cart::destroy();
		return view('chucnang.nhapkho.nhapkho',compact('data','data1','dataKho','dataDonvitinh','content'));
	}

	public function postList()
	{
		$id_user = Request::input('txtNV');
		$content = Cart::content();
		$total = Cart::total();
		$nhapkho = new Nhapkho;
		$nhapkho->nk_ma = Request::input('txtID');
		$nhapkho->nk_ngaylap = date('Y-m-d');
		$nhapkho->nk_lydo = Request::input('txtLyDo');
		$nhapkho->nk_tongtien = $total;
		$nhapkho->npp_id =  Request::input('state_id') ;
		$nhapkho->nv_id = $id_user;
		$nhapkho->save();
		foreach ($content as  $item) {
			$chitiet = new Chitietnhapkho;
			$chitiet->ctnk_soluong = $item['qty'];
			$chitiet->ctnk_thanhtien = $item['qty']*$item['price'];
			$chitiet->vt_id = $item['id'];
			$chitiet->nk_id = $nhapkho->id;
			$chitiet->save();
			$vt = DB::table('vattukho')
				->where(
					'vt_id',$item['id']
					)
				->where('kho_id',$item->options->idKho
					)
				->first();
			if (!is_null($vt)) {
				DB::table('vattukho')
				->where(
					'vt_id',$item['id']
					)
				->where('kho_id',$item->options->idKho
					)
				->update([
					'sl_nhap' => $vt->sl_nhap + $item['qty'],
					'sl_ton' => $vt->sl_ton + $item['qty'],
					]);
				
			} else {
				$soluong = new Vattukho;
				$soluong->vt_id = $item['id'];
				$soluong->kho_id = $item->options->idKho;
				$soluong->sl_nhap = $item['qty'];
				$soluong->sl_ton = $item['qty'];
				$soluong->sl_xuat = 0;
				$soluong->save();
			}
		}

		Cart::destroy();
		return redirect()->route('chucnang.nhapkho.getList')->with(['flash_level'=>'success','flash_message'=>'Thêm thành công!!!']);
	}

	public function getAdd()
	{

		return view('chucnang.nhapkho.themnhapkho');
	}

	public function getEdit($id)
	{
		$nhaphanphois = DB::table('nhaphanphoi')->get();
		foreach ($nhaphanphois as $key => $val) {
		   $nhaphanphoi[] = ['id' => $val->id, 'name'=> $val->npp_ten];
		  }
		$nhapkho = DB::table('nhapkho')->where('id',$id)->first();
		$chitiet = DB::table('chitietnhapkho')->where('nk_id',$id)->get();
		return view('chucnang.nhapkho.suanhapkho',compact('nhapkho','chitiet','nhaphanphoi'));
	}

	public function postEdit(Request $request, $id)
	{
		DB::table('nhapkho')
			->where('id',$id)
			->update([
				'nk_ngaylap' =>	 Request::input('txtDate'),
				'npp_id'	=>	 Request::input('state_id'),
				'nk_lydo'	=>  Request::input('txtLyDo'),
				]);
		return redirect()->route('chucnang.nhapkho.danhsach');
	}

	public function getDelete($id)
	{
		DB::table('chitietnhapkho')->where('nk_id',$id)->delete();
		DB::table('nhapkho')->where('id',$id)->delete();
		return redirect()->route('chucnang.nhapkho.getVattu');
	}

	public function getVattu()
	{
		$data = DB::table('nhapkho')->get();
		// print_r($data);
		return view('chucnang.nhapkho.xemtheovattu',compact('data'));
	}

	public function postNhaphang()
	{
		if(Request::ajax()) {
            $id = Request::get('id');
            $qty = Request::get('qty');
            $vt = DB::table('vattu')
            	->where('vattu.id',$id)
            	->join('donvitinh','donvitinh.id','=','vattu.dvt_id')
				->select('vattu.*','donvitinh.dvt_ten')
            	->first();
            $idKho = Request::get('idKho');
            $kho = DB::table('kho')->where('id',$idKho)->first();
            Cart::add(['id' => $id, 'name' => $vt->vt_ten, 'qty' => $qty, 'price' => $vt->vt_gia,'options' => ['size' => $vt->dvt_ten,'kho'=>$kho->kho_ten,'idKho'=>$kho->id]]);
            echo "oke";
        }

	}

	public function getEdit1($id)
	{
		$nhaphanphois = DB::table('nhaphanphoi')->get();
		foreach ($nhaphanphois as $key => $val) {
		   $nhaphanphoi[] = ['id' => $val->id, 'name'=> $val->npp_ten];
		  }
		$nhapkho = DB::table('nhapkho')->where('id',$id)->first();
		$chitiet = DB::table('chitietnhapkho')->where('nk_id',$id)->get();
		return view('chucnang.nhapkho.suatheovattu',compact('nhapkho','chitiet','nhaphanphoi'));
	}

	public function getEditPro()
	{	
		if(Request::ajax()) {
            $nkID = Request::get('nkID');
            $qty = Request::get('qty');
            $vtID = Request::get('vtID');
            $vt = DB::table('vattu')
            	->where('vattu.id',$vtID)
            	->first();
            DB::table('chitietnhapkho')
			->where('vt_id',$vtID)
			->where('nk_id',$nkID)
			->update([
					'ctnk_soluong' => $qty,
					'ctnk_thanhtien' => $qty * $vt->vt_gia,
				]);
			$tong = DB::table('chitietnhapkho')
				->where('nk_id',$nkID)
				->sum('ctnk_thanhtien');
			DB::table('nhapkho')
				->where('id',$nkID)
				->update([
					'nk_tongtien' =>$tong
					]);
            echo "oke";
        }
		

	}

	public function getDeletePro($id,$ad)
	{
		DB::table('chitietnhapkho')
			->where('vt_id',$id)
			->where('nk_id',$ad)
			->delete();
		return redirect()->route('chucnang.nhapkho.getEdit1',$ad);
	}

	
	public function getPDF($id)
    {
    	$cty = DB::table('thongtincongty')->where('id',1)->first();
        $nhapkho = DB::table('nhapkho')->where('id',$id)->first();
        $chitiet = DB::table('chitietnhapkho')->where('nk_id',$id)->get();
        $nv = DB::table('nhanvien')->where('id',$nhapkho->nv_id)->first();
        $npp = DB::table('nhaphanphoi')->where('id',$nhapkho->npp_id)->first();
        // print_r($khachhang);
        $pdf = PDF::loadView('chucnang.nhapkho.phieu',compact('nhapkho','chitiet','nv','cty','npp'));
        return $pdf->stream();
    }

}
