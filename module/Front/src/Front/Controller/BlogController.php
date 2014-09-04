<?php

namespace Front\Controller;

use Zend\Mvc\Controller\AbstractActionController,
    Zend\View\Model\ViewModel;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator as DoctrineAdapter;
use Doctrine\ORM\Tools\Pagination\Paginator as ORMPaginator;
use Zend\Paginator\Paginator;

class BlogController extends AbstractActionController
{

    protected $entityManager;

    public function indexAction()
    {
        $config = $this->modulusConfig()->getConfig('modulus_content');
        $repository = $this->getEntityManager()->getRepository('ModulusContent\Entity\SiteContent');
        $expr = $this->getEntityManager()->getExpressionBuilder();
        $search = $this->params()->fromQuery('query',false);

        $query = $repository->createQueryBuilder('posts')
                    ->innerJoin('posts.status','s')
                    ->innerJoin('posts.type','t')
                    ->where($expr->eq('posts.deleted',':deleted'))
                    ->andWhere($expr->eq('s.id',':sid'))
                    ->andWhere($expr->eq('t.name',':tname'))
                    ->orderBy("posts.datePublished",  'DESC')
                    ->setParameter(':sid' , $config['status-publicado'])
                    ->setParameter(':tname' , 'Post')
                    ->setParameter(':deleted',false);

        if ($this->params()->fromRoute('category',false)) {
            $category = str_replace('-', ' ', $this->params()->fromRoute('category',false));
            $query->innerJoin('posts.contentCategorys','category')
                    ->andWhere($expr->eq('category.name',':categoryName'))
                    ->setParameter(':categoryName' , $category );
        }

        if ($search) {
            $query->andWhere($expr->orx(
                                $expr->like('posts.title', ':search'),
                                $expr->like('posts.text', ':search')
                            ));
            $query->setParameter(':search' , '%'.$search.'%' );
        }
        $adapter = new DoctrineAdapter(new ORMPaginator($query));
        $paginator = new Paginator($adapter);
        $paginator->setDefaultItemCountPerPage(10);

        $page = (int) $this->params()->fromRoute('page',1);
        if($page) $paginator->setCurrentPageNumber($page);

        return new ViewModel(array(
            'paginator' => $paginator,
            'search' => $search,
            //'categorys' => $categorys,
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
