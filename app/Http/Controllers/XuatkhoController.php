<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

// use Illuminate\Http\Request;

use DB;
use App\Xuatkho;
use App\Chitietxuatkho;
use Cart,Request;

class XuatkhoController extends Controller {

	public function getList()
	{
		$data = DB::table('congtrinh')->get();
		$data1 = DB::table('vattu')
			->join('donvitinh','donvitinh.id','=','vattu.dvt_id')
			->select('vattu.*','donvitinh.dvt_ten')
			->get();
		$dataKho = DB::table('kho')->get();
		$content = Cart::content();
		return view('chucnang.xuatkho.xuatkho',compact('data','data1','dataKho','content'));
	}

	public function postList()
	{
		$id_user = Request::input('txtNV');
		$content = Cart::content();
		$total = Cart::total();
		$xuatkho = new Xuatkho;
		$xuatkho->xk_ma = Request::input('txtID');
		$xuatkho->xk_ngaylap = date('Y-m-d');
		$xuatkho->xk_lydo = Request::input('txtLyDo');
		$xuatkho->xk_diachi = Request::input('txtDC');
		$xuatkho->xk_tongtien = $total;
		$xuatkho->ct_id =  Request::input('selCT') ;
		$xuatkho->nv_id = $id_user;
		$xuatkho->save();
		foreach ($content as  $item) {
			$chitiet = new Chitietxuatkho;
			$chitiet->ctxk_soluong = $item['qty'];
			$chitiet->ctxk_thanhtien = $item['qty']*$item['price'];
			$chitiet->vt_id = $item['id'];
			$chitiet->xk_id = $xuatkho->id;
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
					'sl_xuat' => $vt->sl_xuat + $item['qty'],
					'sl_ton' => $vt->sl_ton - $item['qty'],
					]);
				
			} 
		}

		Cart::destroy();
		// echo "string";
		return redirect()->route('chucnang.xuatkho.getList')->with(['flash_level'=>'success','flash_message'=>'Thêm thành công!!!']);
	}

	public function getAdd()
	{
		return view('chucnang.xuatkho.themxuatkho');
	}

	public function getEdit($id)
	{
		$congtrinhs = DB::table('congtrinh')->get();
		foreach ($congtrinhs as $key => $val) {
		   $congtrinh[] = ['id' => $val->id, 'name'=> $val->ct_ten];
		  }
		$xuatkho = DB::table('xuatkho')->where('id',$id)->first();
		$chitiet = DB::table('chitietxuatkho')->where('xk_id',$id)->get();
		return view('chucnang.xuatkho.suaxuatkho',compact('congtrinh','xuatkho','chitiet'));
	}

	public function postEdit($id)
	{
		DB::table('xuatkho')
			->where('id',$id)
			->update([
				'xk_ngaylap' =>	 Request::input('txtDate'),
				'ct_id'	=>	 Request::input('selCT'),
				'xk_lydo'	=>  Request::input('txtLyDo'),
				'xk_diachi'	=>  Request::input('txtDC'),
				]);
		return redirect()->route('chucnang.xuatkho.getChungtu');
	}

	public function getVattu()
	{

		$data = DB::table('xuatkho')->get();
		// print_r($data);
		return view('chucnang.xuatkho.xemtheovattu',compact('data'));
	}

	public function getChungtu()
	{
		$data = DB::table('xuatkho')->get();
		return view('chucnang.xuatkho.xemtheochungtu',compact('data'));
	}

	public function postXuathang()
	{
		if(Request::ajax()) {
			$idKho = Request::get('idKho');
            $id = Request::get('id');
            $qty = Request::get('qty');
            $vt = DB::table('vattu')
            	->where('vattu.id',$id)
            	->join('donvitinh','donvitinh.id','=','vattu.dvt_id')
				->select('vattu.*','donvitinh.dvt_ten')
            	->first();
            $kho = DB::table('kho')->where('id',$idKho)->first();
            $vtkho = DB::table('vattukho')
            	->where('vt_id',$id)
            	->where('kho_id',$idKho)
            	->first();
            if ($vtkho->sl_ton >= $qty) {
            	Cart::add(['id' => $id, 'name' => $vt->vt_ten, 'qty' => $qty, 'price' => $vt->vt_gia,'options' => ['size' => $vt->dvt_ten,'kho'=>$kho->kho_ten,'idKho'=>$kho->id]]);
            	 echo "oke";
            } else {
            	echo "<script>
            		alert('Số lượng xuất lớn hơn số lượng tồn trong kho!');
            	</script>";
            }
            
            
           
        }

	}

	public function getDelete($id)
	{
		DB::table('chitietxuatkho')->where('xk_id',$id)->delete();
		DB::table('xuatkho')->where('id',$id)->delete();

		// print_r($i);
		return redirect()->route('chucnang.xuatkho.xemtheochungtu');
	}

	public function getEdit1($id)
	{
		$congtrinhs = DB::table('congtrinh')->get();
		foreach ($congtrinhs as $key => $val) {
		   $congtrinh[] = ['id' => $val->id, 'name'=> $val->ct_ten];
		  }
		$xuatkho = DB::table('xuatkho')->where('id',$id)->first();
		$chitiet = DB::table('chitietxuatkho')->where('xk_id',$id)->get();
		return view('chucnang.xuatkho.suatheovattu',compact('xuatkho','chitiet','congtrinh'));
	}

	public function getEditPro()
	{	
		if(Request::ajax()) {
            $xkID = Request::get('xkID');
            $qty = Request::get('qty');
            $vtID = Request::get('vtID');
            $vt = DB::table('vattu')
            	->where('vattu.id',$vtID)
            	->first();
            DB::table('chitietxuatkho')
			->where('vt_id',$vtID)
			->where('xk_id',$xkID)
			->update([
					'ctxk_soluong' => $qty,
					'ctxk_thanhtien' => $qty * $vt->vt_gia,
				]);
			$tong = DB::table('chitietxuatkho')
				->where('xk_id',$xkID)
				->sum('ctxk_thanhtien');
			DB::table('xuatkho')
				->where('id',$xkID)
				->update([
					'xk_tongtien' =>$tong
					]);
            echo "oke";
        }
		

	}

	public function getDeletePro($id,$ad)
	{
		DB::table('chitietxuatkho')
			->where('vt_id',$id)
			->where('xk_id',$ad)
			->delete();
		return redirect()->route('chucnang.xuatkho.suatheovattu',$ad);
	}


}
