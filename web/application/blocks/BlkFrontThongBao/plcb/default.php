<h5>Thông báo mới</h5>               

<div class="main-content-box">                     
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th style="width: 20px;">STT</th>
                <th>Tiêu đề</th>
                <th style="width: 100px;">Ngày</th>
                <th style="width: 100px;">Chức năng</th>
            </tr>
        </thead>
        <tbody>

            <?php
            if (!sizeof($list_thong_bao)) {
                echo '<tr><td colspan="4">Không có thông báo mới</td></tr>';
            } else {
                $i = 0;
                foreach ($list_thong_bao as $thong_bao) {
                    $i++;
                    echo '<tr>
                            <td>' . $i . '</td>
                            <td><a href="' . $view->baseUrl('canhan/thongbao/view/id/' . $thong_bao->tb_id) . '">' . $thong_bao->tb_tieu_de . '</a></td>
                            <td>' . date('d-m-Y', strtotime($thong_bao->tb_date_added)) . '</td>
                            <td>
                                <a class="btn btn-mini" href="' . $view->baseUrl('canhan/thongbao/view/id/' . $thong_bao->tb_id) . '" title="Xem"><i class="icon-play"></i></a>
                                <a class="btn btn-mini" href="' . $view->baseUrl('canhan/thongbao/delete/id/' . $thong_bao->tb_id . '/page/1') . '" title="Xóa"><i class="icon-trash"></i></a>
                            </td>
                        </tr>';
                }
            }
            ?>             
        </tbody>
    </table>
</div> 