<?php

namespace Front\View\Helper;

use Zend\View\Helper\AbstractHelper;
use Zend\View\Model\ViewModel;

class RecentPosts extends AbstractHelper
{
    private $repository;
    private $config;

    public function __construct($repository, $config)
    {
        $this->repository = $repository;
        $this->config = $config;
    }

    public function __invoke($template)
    {
        $posts = $this->repository->findContent(1, $this->config['status_publicado'], array('deleted' => false),array('datePublished'=>'DESC'),4);
        $vm = new ViewModel(array('posts' => $posts));
        $vm->setTemplate($template);

        return $this->getView()->render($vm);
    }

}
