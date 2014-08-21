<?php

namespace Front\Controller;

use Zend\Mvc\Controller\AbstractActionController,
    Zend\View\Model\ViewModel;

class PortfolioController extends AbstractActionController
{

    protected $entityManager;

    public function indexAction()
    {
        $config = $this->modulusConfig()->getConfig('modulus_content');
        $siteRepository = $this->getEntityManager()->getRepository('ModulusContent\Entity\SiteContent');
        $categoryRepository = $this->getEntityManager()->getRepository('ModulusContent\Entity\ContentCategorys');
        $portfolios = $siteRepository->findContent(3,$config['status_publicado'],array('deleted' => false));
        $categorys = $categoryRepository->findCategorysByType(3);

        return new ViewModel(array(
            'portfolios' => $portfolios,
            'categorys' => $categorys,
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
