<?php

class Controller404 extends Controller {
    public function action_index()
    {
        $data = array("title" => "Страница не найдена");
        $this->view->generate("view_404.php", $data );
    }
}