<?php

namespace Front\View\Helper;

use Zend\View\Helper\AbstractHelper;
use Zend\View\Model\ViewModel;

class SidebarCategorys extends AbstractHelper
{
    private $repository;

    public function __construct($repository)
    {
        $this->repository = $repository;
    }

    public function __invoke()
    {
        $categorys = $this->repository->findCategorysAndCountByType(1);
        $vm = new ViewModel(array('categorys' => $categorys));
        $vm->setTemplate('front/blog/partials/sidebar-categorys');

        return $this->getView()->render($vm);
    }

}
