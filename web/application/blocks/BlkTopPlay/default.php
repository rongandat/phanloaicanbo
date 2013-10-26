<?php
foreach ($listTopGame as $key => $val) {

    $nameid = str_replace('_', '-', $val['nameid']);
    ?>	

    <li id="<?php echo $val['id']; ?>">



        <div>

            <a href="<?php echo $baseUrl . '/games/info/' . $nameid . '.html' ?>" title="<?php echo $val['name']; ?>">

                <img src="<?php echo $val['source_image']; ?>" alt="<?php echo $val['name']; ?>" class="mod_topmemebrs_avatar">

            </a>

        </div>



        <div>
    <?php
    $name = '';
    $old_name = $val['name'];
    $name = substr($old_name, 0, 12);
    if (strlen($old_name) > 12)
        $name.=' ...';
    ?>															

            <h5><a href="<?php echo $baseUrl . '/games/info/' . $nameid . '.html' ?>"><?php echo $name; ?></a></h5>

        </div>



        <div><small>Plays: <?php echo $val['playcount']; ?></small></div>

        <div style="clear: left;"></div>

    </li>

    <?php
}
?>