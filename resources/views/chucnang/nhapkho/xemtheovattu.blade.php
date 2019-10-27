@extends('chucnang.chucnang')
@section('header')
<section class="nav nav-page">
    <div class="container">
        <div class="row">
            <div class="span7">
                <header class="page-header">
                    <h3>Quản lý Nhập kho<br/>
                        <small>Xem Theo vật tư</small>
                    </h3>
                </header>
            </div>                      
        </div>
    </div>
</section>
@stop
@section('content')
    <div class="row">
        <div class="span3">
            <div class="box">
                <div class="box-header">
                    <p><b>Chức năng</b></p>
                </div>
                <div class="box-content">
                    <form class="form-inline">
                        <p><b>Nhập kho</b></p>
                            <a href="{!! URL::route('chucnang.nhapkho.getList') !!}"><i class="icon-plus"></i>&nbspNhập kho</a><br><br>
                        <p><b>Bảng kê nhập</b></p>
                            <a href="{!! URL::route('chucnang.nhapkho.getVattu') !!}"><i class="icon-plus"></i>&nbspTheo vật tư</a><br>
                            <a href="{!! URL::route('chucnang.nhapkho.danhsach') !!}"><i class="icon-plus"></i>&nbspTheo chứng từ</a><br>
                    </form>
                </div>
            </div>
        </div>
        <div style="margin-left:-1px" class="span13">
            <div class="box">
                <div class="box-header">
                    <p><b>Bảng kê tổng hợp</b></p>
                </div>
                <div class="box-content">
                    <div class="form-inline">
                        <div class="container">
                            <div class="row">
                                <div id="acct-password-row" class="span13">
                                    <div id="acct-password-row" class="span12">
                                        <!-- <div style="margin-top:5px">
                                            Từ&nbsp<input type="date" name="" class="span3">
                                            Đến&nbsp<input type="date" name="" class="span3">&nbsp&nbsp
                                            <a href="#" class="btn btn-info"><i class="icon-search"></i>Tìm kiếm</a>
                                        </div> -->
                                        <br>
                                        <div>
                                            <table class="table table-bordered table-hover tablesorter" id="sample-table">
                                                <thead style="background:#EFEFEF;">
                                                    <tr>
                                                        <th class="span2">Mã NK</th>
                                                        <th class="span2">Mã VT</th>
                                                        <th class="span3">Vật tư</th>
                                                        <th class="span3">Số lượng</th>
                                                        <th class="span3">ĐVT</th>
                                                        <th class="span3">Thành tiền</th>
                                                        <th class="span3"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                @foreach ($data as $item)
                                                <?php 
                                                    $count = DB::table('chitietnhapkho')->where('nk_id',$item->id)->count();
                                                    $chitiet = DB::table('chitietnhapkho')->where('nk_id',$item->id)->get();
                                                ?>
                                                @foreach ($chitiet as $val)
                                                <?php 
                                                    $vt = DB::table('vattu')->where('id',$val->vt_id)->first(); 
                                                    $dvt = DB::table('donvitinh')->where('id',$vt->dvt_id)->first();
                                                ?>
                                                <tr>
                                                        <td>{!! $item->id !!}</td>
                                                        <td >{!! $val->vt_id !!}</td>
                                                        <td>{!! $vt->vt_ten !!}</td>
                                                        <td>{!! $val->ctnk_soluong !!}</td>
                                                        <td>{!! $dvt->dvt_ten !!}</td>
                                                        <td>{!! number_format("$val->ctnk_thanhtien",0,".",",")  !!} </td>
                                                        
                                                        <td class="td-actions">
                                                            <a href="{!! URL::route('chucnang.nhapkho.getEdit1' ,$item->id) !!}" class="btn btn-small btn-info"><i class="btn-icon-only icon-edit"></i></a>
                                                            <a onclick="return confirmDel('Bạn có chắc muốn xóa dữ liệu này?')"  href="{!! URL::route('chucnang.nhapkho.getDelete',$item->id) !!}" class="btn btn-small btn-danger">
                                                                <i class="btn-icon-only icon-remove"></i>
                                                            </a>
                                                            <a href="{!! URL::route('chucnang.nhapkho.getPDF',$item->id) !!}" class="btn btn-small btn-info" target="_blank"><i class="icon-print" ></i></a>
                                                        </td>
                                                    </tr>
                                                    @endforeach
                                                    @endforeach    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop
