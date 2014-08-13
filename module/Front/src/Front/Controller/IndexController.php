<?php

namespace Front\Controller;

use Zend\Mvc\Controller\AbstractActionController,
    Zend\View\Model\ViewModel;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator as DoctrineAdapter;
use Doctrine\ORM\Tools\Pagination\Paginator as ORMPaginator;
use Zend\Paginator\Paginator;

class IndexController extends AbstractActionController
{

    protected $entityManager;

    public function indexAction()
    {
        $this->getServiceLocator()
            ->get('viewhelpermanager')
            ->get('HeadScript')
            ->appendFile('/front/rs-plugin/js/jquery.themepunch.plugins.min.js')
            ->appendFile('/front/rs-plugin/js/jquery.themepunch.revolution.min.js');

        $this->getServiceLocator()
            ->get('viewhelpermanager')
            ->get('InlineScript')->appendFile('/front/rs-plugin/js/slider.config.js');

        $this->getServiceLocator()
            ->get('viewhelpermanager')
            ->get('headLink')
            ->prependStylesheet('/front/rs-plugin/css/settings.css');

        $config = $this->modulusConfig()->getConfig('modulus_content');
        $repository = $this->getEntityManager()->getRepository('ModulusContent\Entity\SiteContent');
        $expr = $this->getEntityManager()->getExpressionBuilder();
        $query = $repository->createQueryBuilder('posts')
                    ->orderBy("posts.datePublished",  'DESC');
        $query->where($expr->eq('posts.deleted',':deleted'))
                ->setParameter(':deleted',false);
        $query->innerJoin('posts.status','s')
                ->andWhere($expr->eq('s.id',':sid'))
                ->setParameter(':sid' , $config['status_publicado']);

        $query->innerJoin('posts.type','t')
                ->andWhere($expr->eq('t.name',':tname'))
                ->setParameter(':tname' , 'Post');

        $adapter = new DoctrineAdapter(new ORMPaginator($query));
        $paginator = new Paginator($adapter);
        $paginator->setDefaultItemCountPerPage(10);

        $page = (int) $this->params()->fromRoute('page',1);
        if($page) $paginator->setCurrentPageNumber($page);

        return new ViewModel(array(
                'paginator' => $paginator,
                'page' => $page,
            ));

    }

    /**
     *
     * @return EntityManager
     */
    protected function getEntityManager()
    {
        if (null === $this->entityManager)
            $this->entityManager = $this->getServiceLocator()->get('Doctrine\ORM\EntityManager');

        return $this->entityManager;
    }
}
